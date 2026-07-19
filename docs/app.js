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

function toDisplayGroup(path) {
  const top = path.split('/')[0];
  if (top === 'logic_gates') return 'Logic Gates';
  if (top === 'combinational_circuits') return 'Combinational Circuits';
  if (top === 'ps_verilog') return 'PS Verilog';
  if (top === 'logic_gates') return 'Logic Gates';
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
      const firstGroup = Object.keys(fileGroups)[0];
      if (firstGroup) populateFiles(firstGroup);

      groupSelect.addEventListener("change", (event) => {
        populateFiles(event.target.value);
      });

      fileSelect.addEventListener("change", (event) => {
        const selected = fileGroups[groupSelect.value].find((file) => file.path === event.target.value);
        if (selected) loadCode(selected.path, selected.name, selected.githubPath);
      });
    })
    .catch(() => {
      if (codeOutput) {
        codeOutput.textContent = 'The repository catalog could not be loaded right now. Please refresh the page.';
      }
    });
}

function populateGroups() {
  const groups = Object.keys(fileGroups);
  groupSelect.innerHTML = "";
  groups.forEach((group) => {
    const option = document.createElement("option");
    option.value = group;
    option.textContent = group;
    groupSelect.appendChild(option);
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
    })
    .catch(() => {
      codeOutput.textContent = "This file could not be loaded from the website at the moment.";
    });
}

function initViewer() {
  if (!groupSelect || !fileSelect) return;
  loadRepositoryTree();
}

initViewer();
