const repoBase = "https://github.com/T-Maharshi-Sanand-Yadav/Verilog_Codes/blob/main/";
const fileDataUrl = "file-data.json";
let fileGroups = {};

const groupSelect = document.getElementById("groupSelect");
const fileSelect = document.getElementById("fileSelect");
const codeOutput = document.getElementById("codeOutput");
const currentFileLabel = document.getElementById("currentFileLabel");
const githubLink = document.getElementById("github-link");
const pageTitle = document.getElementById("pageTitle");

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
    loadCode(firstFile.path, firstFile.name);
  }
}

function loadCode(path, name) {
  codeOutput.textContent = "Loading code preview…";
  currentFileLabel.textContent = name;
  if (githubLink) githubLink.href = repoBase + name;
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

  fetch(fileDataUrl)
    .then((res) => res.json())
    .then((data) => {
      fileGroups = data;
      populateGroups();
      populateFiles(Object.keys(fileGroups)[0]);

      groupSelect.addEventListener("change", (event) => {
        populateFiles(event.target.value);
      });

      fileSelect.addEventListener("change", (event) => {
        const selected = fileGroups[groupSelect.value].find((file) => file.path === event.target.value);
        if (selected) loadCode(selected.path, selected.name);
      });
    });
}

initViewer();
