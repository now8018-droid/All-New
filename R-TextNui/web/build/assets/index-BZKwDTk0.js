const app = document.getElementById('app');
const entries = new Map();
const EXIT_ANIMATION_MS = 220;

function getTypeClass(typeShow) {
    return Number(typeShow) === 2 ? 'type-2' : 'type-1';
}

function createEntryElement(entry) {
    const row = document.createElement('div');
    row.className = `text-nui-item d-flex align-items-center ${getTypeClass(entry.type_show)}`;
    row.dataset.id = entry.id;

    const keyBox = document.createElement('div');
    keyBox.className = Number(entry.type_show) === 2
        ? 'box_bottom_2 d-flex align-items-center justify-content-center'
        : 'box_bottom d-flex align-items-center justify-content-center';

    const keySpan = document.createElement('span');
    keySpan.textContent = entry.keybind;
    keyBox.appendChild(keySpan);

    const textBox = document.createElement('div');
    textBox.className = Number(entry.type_show) === 2
        ? 'box_text_2 d-flex align-items-center align-self-stretch justify-content-center'
        : 'box_text_1 d-flex align-items-center align-self-stretch justify-content-center';

    const textSpan = document.createElement('span');
    textSpan.textContent = entry.label;
    textBox.appendChild(textSpan);

    row.appendChild(keyBox);
    row.appendChild(textBox);

    requestAnimationFrame(() => {
        row.classList.add('is-visible');
    });

    return row;
}

function renderRoot() {
    if (!app) {
        return null;
    }

    let container = app.querySelector('.containerNa');
    if (container) {
        return container;
    }

    container = document.createElement('div');
    container.className = 'containerNa';
    container.style.bottom = '10%';
    app.appendChild(container);
    return container;
}

function upsertEntry(data) {
    const container = renderRoot();
    if (!container) {
        return;
    }

    const existing = entries.get(data.id);
    if (existing?.removeTimer) {
        clearTimeout(existing.removeTimer);
    }

    const nextEntry = {
        id: data.id,
        label: data.label,
        keybind: data.keybind,
        type_show: data.type_show,
        element: existing?.element || null,
        removeTimer: null,
    };

    if (nextEntry.element) {
        nextEntry.element.className = `text-nui-item d-flex align-items-center ${getTypeClass(nextEntry.type_show)}`;
        const keyBox = nextEntry.element.children[0];
        const textBox = nextEntry.element.children[1];
        keyBox.className = Number(nextEntry.type_show) === 2
            ? 'box_bottom_2 d-flex align-items-center justify-content-center'
            : 'box_bottom d-flex align-items-center justify-content-center';
        textBox.className = Number(nextEntry.type_show) === 2
            ? 'box_text_2 d-flex align-items-center align-self-stretch justify-content-center'
            : 'box_text_1 d-flex align-items-center align-self-stretch justify-content-center';
        keyBox.querySelector('span').textContent = nextEntry.keybind;
        textBox.querySelector('span').textContent = nextEntry.label;
        requestAnimationFrame(() => {
            nextEntry.element.classList.add('is-visible');
        });
    } else {
        nextEntry.element = createEntryElement(nextEntry);
        container.appendChild(nextEntry.element);
    }

    entries.set(nextEntry.id, nextEntry);
}

function removeEntry(id) {
    const entry = entries.get(id);
    if (!entry || !entry.element) {
        return;
    }

    entry.element.classList.remove('is-visible');
    entry.element.classList.add('is-leaving');

    entry.removeTimer = setTimeout(() => {
        if (entry.element?.parentNode) {
            entry.element.parentNode.removeChild(entry.element);
        }

        entries.delete(id);
    }, EXIT_ANIMATION_MS);
}

window.addEventListener('message', (event) => {
    const message = event.data || {};

    switch (message.action) {
        case 'addText':
            if (message.id != null) {
                upsertEntry(message);
            }
            break;
        case 'delete_data':
            if (message.id != null) {
                removeEntry(message.id);
            }
            break;
        default:
            break;
    }
});
