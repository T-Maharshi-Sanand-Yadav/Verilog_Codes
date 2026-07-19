const repoBase = "https://github.com/T-Maharshi-Sanand-Yadav/Verilog_Codes/blob/main/";
const rawBase = "https://raw.githubusercontent.com/T-Maharshi-Sanand-Yadav/Verilog_Codes/main/";
const treeApiUrl = "https://api.github.com/repos/T-Maharshi-Sanand-Yadav/Verilog_Codes/git/trees/main?recursive=1";
let fileGroups = {};

const groupSelect = document.getElementById("groupSelect");
const fileSelect = document.getElementById("fileSelect");
const codeOutput = document.getElementById("codeOutput");
const currentFileLabel = document.getElementById("currentFileLabel");
const githubLink = document.getElementById("github-link");
const pageTitle = document.getElementById("pageTitle");
const searchInput = document.getElementById("searchInput");
const categoryGrid = document.getElementById("categoryGrid");

function toDisplayGroup(path) {
  const top = path.split('/')[0];
  if (top === 'logic_gates') return 'Logic Gates';
  if (top === 'combinational_circuits') return 'Combinational Circuits';
  if (top === 'ps_verilog') return 'PS Verilog';
  if (path.includes('Flip Flops Positive Edge Trigger If-Else.v')) return 'Sequential Circuits';
  if (path.startsWith('combinational_circuits/')) return 'Combinational Circuits';
  if (path.startsWith('logic_gates/')) return 'Logic Gates';
  return 'Top Level Examples';
}

function loadRepositoryTree() {
  fetch(treeApiUrl)
    .then((res) => {
      if (!res.ok) throw new Error('Unable to load repository tree');
      return res.json();
    })
    .then((data) => {
      const files = data.tree.filter((item) => {
        const isSourceFile = /\.(v|sv)$/i.test(item.path);
        const isAllowedPath = !item.path.startsWith('docs/') && !item.path.startsWith('.github/') && !item.path.startsWith('.git/');
        return isSourceFile && isAllowedPath;
      });

      fileGroups = {};

      files.forEach((item) => {
        const group = toDisplayGroup(item.path);
        const name = item.path.split('/').pop();
        if (!fileGroups[group]) fileGroups[group] = [];

        fileGroups[group].push({
          name,
          path: `${rawBase}${item.path}`,
          githubPath: `${repoBase}${item.path}`
        });
      });

      Object.keys(fileGroups).forEach((group) => {
        fileGroups[group].sort((a, b) => a.name.localeCompare(b.name));
      });

      populateGroups();
      renderCategoryCards();
      const firstGroup = Object.keys(fileGroups)[0];
      if (firstGroup) populateFiles(firstGroup);

      groupSelect.addEventListener("change", (event) => {
        populateFiles(event.target.value);
      });

      fileSelect.addEventListener("change", (event) => {
        const selected = fileGroups[groupSelect.value].find((file) => file.path === event.target.value);
        if (selected) loadCode(selected.path, selected.name, selected.githubPath);
      });

      searchInput.addEventListener("input", (event) => {
        const query = event.target.value.toLowerCase();
        renderCategoryCards(query);
        const matchingGroups = Object.keys(fileGroups).filter((group) => {
          const matches = fileGroups[group].some((file) => file.name.toLowerCase().includes(query));
          return matches;
        });
        if (matchingGroups.length > 0) {
          populateGroups(matchingGroups);
        } else {
          populateGroups(Object.keys(fileGroups));
        }
      });
    })
    .catch(() => {
      if (codeOutput) {
        codeOutput.textContent = 'The repository catalog could not be loaded right now. Please refresh the page.';
      }
    });
}

function populateGroups(filteredGroups = Object.keys(fileGroups)) {
  groupSelect.innerHTML = "";
  filteredGroups.forEach((group) => {
    const option = document.createElement("option");
    option.value = group;
    option.textContent = group;
    groupSelect.appendChild(option);
  });

  const selectedGroup = filteredGroups[0];
  if (selectedGroup) populateFiles(selectedGroup);
}

function renderCategoryCards(query = "") {
  if (!categoryGrid) return;
  categoryGrid.innerHTML = "";

  const normalized = query.trim().toLowerCase();
  const groups = Object.keys(fileGroups);

  groups.forEach((group) => {
    const matchingFiles = fileGroups[group].filter((file) => file.name.toLowerCase().includes(normalized));
    if (normalized && matchingFiles.length === 0) return;

    const card = document.createElement("button");
    card.className = "category-card";
    card.type = "button";
    card.innerHTML = `<strong>${group}</strong><span>${matchingFiles.length || fileGroups[group].length} files</span>`;
    card.addEventListener("click", () => {
      populateFiles(group);
      groupSelect.value = group;
    });
    categoryGrid.appendChild(card);
  });
}

function populateFiles(group) {
  fileSelect.innerHTML = "";
  fileGroups[group].forEach((file) => {
    const option = document.createElement("option");
    option.value = file.path;
    option.textContent = file.name;
    fileSelect.appendChild(option);
  });

  const firstFile = fileGroups[group][0];
  if (firstFile) {
    loadCode(firstFile.path, firstFile.name, firstFile.githubPath);
  }
}

function loadCode(path, name, githubPath) {
  codeOutput.textContent = "Loading code preview…";
  currentFileLabel.textContent = name;
  if (githubLink) githubLink.href = githubPath;
  if (pageTitle) pageTitle.textContent = name;

  fetch(path)
    .then((res) => {
      if (!res.ok) throw new Error("Unable to load file");
      return res.text();
    })
    .then((text) => {
      codeOutput.textContent = text;
      if (window.hljs) {
        codeOutput.innerHTML = `<code class="verilog">${escapeHtml(text)}</code>`;
        window.hljs.highlightElement(codeOutput.querySelector("code"));
      }
    })
    .catch(() => {
      codeOutput.textContent = "This file could not be loaded from the website at the moment.";
    });
}

function escapeHtml(text) {
  return text
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;");
}

function initViewer() {
  if (!groupSelect || !fileSelect) return;
  loadRepositoryTree();
}

initViewer();
