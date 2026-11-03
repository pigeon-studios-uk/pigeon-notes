// Pigeon Notes: the notepad and reading a note.
//
// client/main.lua sends:
//   { type: 'write', styles: [{ key, label, maxLength, colour }], style, allowSigning, text }
//   { type: 'read', id, text, name, colour, created, strings }
//   { type: 'removable', id, allowed }   once the server has said whether this player can take it down
//   { type: 'close' }                    the note was taken down while it was open
// and gets back write { text, style, signed }, remove { id } and close.
//
// Everything a player wrote is put on the page with textContent, never as HTML.

const resource = typeof GetParentResourceName === 'function' ? GetParentResourceName() : 'pigeon-notes';
const $ = (id) => document.getElementById(id);
const writer = $('writer');
const reader = $('reader');
let styles = [];
let style = null;
let readingId = null;

function post(name, data) {
    return fetch(`https://${resource}/${name}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify(data || {}),
    }).catch(() => {});
}

function chosen() {
    return styles.find((s) => s.key === style) || styles[0];
}

// Characters, not bytes, the same way the server counts them.
function length(text) {
    return [...text].length;
}

function updateCounter() {
    const max = chosen() ? chosen().maxLength : 300;
    const used = length($('text').value.trim());
    $('counter').textContent = `${used} / ${max}`;
    $('counter').classList.toggle('over', used > max);
    $('place').disabled = used === 0 || used > max;
}

function chooseStyle(key) {
    style = key;
    writer.style.setProperty('--page', chosen().colour || '#f6f1e4');
    for (const button of $('styles').children) button.classList.toggle('chosen', button.dataset.key === key);
    updateCounter();
}

function openWriter(data) {
    const text = data.text || {};
    styles = data.styles || [];
    $('writeHeading').textContent = text.write_heading || 'Write a note';
    $('text').placeholder = text.write_placeholder || '';
    $('signLabel').textContent = text.write_sign || 'Sign it';
    $('place').textContent = text.write_place || 'Place it';
    $('cancel').textContent = text.write_cancel || 'Cancel';
    $('signRow').hidden = !data.allowSigning;
    $('signed').checked = false;
    $('text').value = '';

    const holder = $('styles');
    holder.replaceChildren();
    for (const s of styles) {
        const button = document.createElement('button');
        button.type = 'button';
        button.dataset.key = s.key;
        button.textContent = s.label;
        button.style.setProperty('--swatch', s.colour || '#fff');
        button.addEventListener('click', () => chooseStyle(s.key));
        holder.appendChild(button);
    }
    holder.hidden = styles.length < 2;

    reader.hidden = true;
    writer.hidden = false;
    chooseStyle(data.style || (styles[0] && styles[0].key));
    $('text').focus();
}

function openReader(data) {
    const text = data.strings || {};
    readingId = data.id;
    reader.style.setProperty('--page', data.colour || '#f6f1e4');
    $('readText').textContent = data.text || '';
    $('readName').textContent = data.name ? `- ${data.name}` : (text.read_unsigned || 'Unsigned');
    $('readDate').textContent = data.created ? new Date(data.created * 1000).toLocaleDateString() : '';
    $('close').textContent = text.read_close || 'Close';
    $('remove').textContent = text.read_remove || 'Take it down';
    $('remove').hidden = true;
    writer.hidden = true;
    reader.hidden = false;
}

function closeAll() {
    writer.hidden = true;
    reader.hidden = true;
    readingId = null;
}

$('text').addEventListener('input', updateCounter);
$('place').addEventListener('click', () => {
    const text = $('text').value;
    closeAll();
    post('write', { text, style, signed: $('signed').checked });
});
$('cancel').addEventListener('click', () => { closeAll(); post('close'); });
$('close').addEventListener('click', () => { closeAll(); post('close'); });
$('remove').addEventListener('click', () => {
    const id = readingId;
    closeAll();
    post('remove', { id });
});

document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape' && (!writer.hidden || !reader.hidden)) {
        closeAll();
        post('close');
    }
});

window.addEventListener('message', (event) => {
    const data = event.data || {};
    if (data.type === 'write') openWriter(data);
    else if (data.type === 'read') openReader(data);
    else if (data.type === 'removable' && data.id === readingId) $('remove').hidden = !data.allowed;
    else if (data.type === 'close') closeAll();
});
