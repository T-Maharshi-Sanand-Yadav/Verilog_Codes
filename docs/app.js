const repoBase = "https://github.com/T-Maharshi-Sanand-Yadav/Verilog_Codes/blob/main/";
const rawBase = "https://raw.githubusercontent.com/T-Maharshi-Sanand-Yadav/Verilog_Codes/main/";
const treeApiUrl = "https://api.github.com/repos/T-Maharshi-Sanand-Yadav/Verilog_Codes/git/trees/main?recursive=1";

let fileGroups = {};
let allSourceFiles = [];

const groupSelect = document.getElementById("groupSelect");
const fileSelect = document.getElementById("fileSelect");
const codeOutput = document.getElementById("codeOutput");
const currentFileLabel = document.getElementById("currentFileLabel");
const currentFileMeta = document.getElementById("currentFileMeta");
const githubLink = document.getElementById("github-link");
const singleViewerLink = document.getElementById("singleViewerLink");
const pageTitle = document.getElementById("pageTitle");
const searchInput = document.getElementById("searchInput");
const categoryGrid = document.getElementById("categoryGrid");
const totalFiles = document.getElementById("totalFiles");
const testbenchCount = document.getElementById("testbenchCount");
const categoryCount = document.getElementById("categoryCount");
const visibleFileCount = document.getElementById("visibleFileCount");

const queryParams = new URLSearchParams(window.location.search);
const selectedGroupParam = queryParams.get("group");
const selectedFileParam = queryParams.get("file");
const isBrowsePage = Boolean(groupSelect && fileSelect);
const isViewerPage = Boolean(codeOutput && currentFileLabel && githubLink && !isBrowsePage);

function normalizeGroupName(value) {
  return decodeURIComponent(value || "").trim();
}

function toDisplayGroup(path) {
  const top = path.split("/")[0];
  const lowerPath = path.toLowerCase();
  const fileName = path.split("/").pop().toLowerCase();

  if (top === "logic_gates") return "Logic Gates";
  if (top === "combinational_circuits") return "Combinational Circuits";
  if (top === "ps_verilog") return "PS Verilog";
  if (lowerPath.includes("flip flop") || lowerPath.includes("shift_register") || lowerPath.includes("counter") || lowerPath.includes("sequence") || lowerPath.includes("vending")) {
    return "Sequential Circuits";
  }
  if (fileName.includes("_tb") || fileName.includes("tb.")) return "Testbenches";
  return "Top Level Examples";
}

function niceFileName(path) {
  return path.split("/").pop();
}

function buildFileRecord(item) {
  const name = niceFileName(item.path);
  const group = toDisplayGroup(item.path);

  return {
    name,
    group,
    repoPath: item.path,
    path: `${rawBase}${encodeURI(item.path)}`,
    githubPath: `${repoBase}${encodeURI(item.path)}`,
  };
}

function loadRepositoryTree() {
  fetch(treeApiUrl)
    .then((res) => {
      if (!res.ok) throw new Error("Unable to load repository tree");
      return res.json();
    })
    .then((data) => {
      allSourceFiles = data.tree
        .filter((item) => {
          const isSourceFile = /\.(v|sv)$/i.test(item.path);
          const isAllowedPath = !item.path.startsWith("docs/") && !item.path.startsWith(".github/") && !item.path.startsWith(".git/");
          return item.type === "blob" && isSourceFile && isAllowedPath;
        })
        .map(buildFileRecord)
        .sort((a, b) => a.repoPath.localeCompare(b.repoPath));

      fileGroups = allSourceFiles.reduce((groups, file) => {
        if (!groups[file.group]) groups[file.group] = [];
        groups[file.group].push(file);
        return groups;
      }, {});

      Object.keys(fileGroups).forEach((group) => {
        fileGroups[group].sort((a, b) => a.name.localeCompare(b.name) || a.repoPath.localeCompare(b.repoPath));
      });

      renderRepositoryStats();

      if (isBrowsePage) {
        initializeBrowsePage();
      }

      if (isViewerPage) {
        initializeViewerPage();
      }
    })
    .catch(() => {
      renderLoadError();
    });
}

function renderRepositoryStats() {
  const groups = Object.keys(fileGroups);
  const testbenches = allSourceFiles.filter((file) => /(^|[_-])tb(\.|_|-)|testbench/i.test(file.name));

  if (totalFiles) totalFiles.textContent = String(allSourceFiles.length);
  if (testbenchCount) testbenchCount.textContent = String(testbenches.length);
  if (categoryCount) categoryCount.textContent = String(groups.length);
  if (visibleFileCount) visibleFileCount.textContent = `${allSourceFiles.length} files`;
}

function initializeBrowsePage() {
  renderCategoryCards();
  populateGroups();

  const requestedGroup = normalizeGroupName(selectedGroupParam);
  const firstGroup = Object.keys(fileGroups)[0];
  const preferredGroup = requestedGroup && fileGroups[requestedGroup] ? requestedGroup : firstGroup;

  if (preferredGroup) {
    groupSelect.value = preferredGroup;
    populateFiles(preferredGroup);

    const selectedFile = findFileByQuery(selectedFileParam, preferredGroup);
    if (selectedFile) {
      fileSelect.value = selectedFile.repoPath;
      loadCode(selectedFile);
    }
  }

  groupSelect.addEventListener("change", (event) => {
    populateFiles(event.target.value);
  });

  fileSelect.addEventListener("change", (event) => {
    const selected = fileGroups[groupSelect.value].find((file) => file.repoPath === event.target.value);
    if (selected) loadCode(selected);
  });

  if (searchInput) {
    searchInput.addEventListener("input", (event) => {
      const query = event.target.value.toLowerCase().trim();
      const matchingFiles = filterFiles(query);
      const matchingGroups = uniqueGroups(matchingFiles);

      renderCategoryCards(query);
      populateGroups(matchingGroups.length > 0 ? matchingGroups : Object.keys(fileGroups));
      if (visibleFileCount) visibleFileCount.textContent = `${matchingFiles.length} files`;

      if (matchingGroups.length > 0) {
        groupSelect.value = matchingGroups[0];
        populateFiles(matchingGroups[0], query);
      }
    });
  }
}

function initializeViewerPage() {
  const selectedFile = findFileByQuery(selectedFileParam);
  if (selectedFile) {
    loadCode(selectedFile);
    return;
  }

  if (codeOutput) {
    codeOutput.textContent = "Add ?file=filename.v to the URL, or choose a file from the browse page.";
  }
}

function findFileByQuery(fileParam, preferredGroup) {
  if (!fileParam) return null;

  const decoded = decodeURIComponent(fileParam);
  const candidates = preferredGroup ? fileGroups[preferredGroup] || [] : allSourceFiles;

  return candidates.find((file) => file.repoPath === decoded)
    || candidates.find((file) => file.name === decoded)
    || allSourceFiles.find((file) => file.repoPath === decoded)
    || allSourceFiles.find((file) => file.name === decoded)
    || null;
}

function filterFiles(query) {
  if (!query) return allSourceFiles;
  return allSourceFiles.filter((file) => {
    return file.name.toLowerCase().includes(query)
      || file.repoPath.toLowerCase().includes(query)
      || file.group.toLowerCase().includes(query);
  });
}

function uniqueGroups(files) {
  return [...new Set(files.map((file) => file.group))];
}

function populateGroups(filteredGroups = Object.keys(fileGroups)) {
  if (!groupSelect) return;
  groupSelect.innerHTML = "";

  filteredGroups.forEach((group) => {
    const option = document.createElement("option");
    option.value = group;
    option.textContent = `${group} (${fileGroups[group].length})`;
    groupSelect.appendChild(option);
  });
}

function populateFiles(group, query = "") {
  if (!fileSelect || !fileGroups[group]) return;
  fileSelect.innerHTML = "";

  const files = query
    ? fileGroups[group].filter((file) => {
      return file.name.toLowerCase().includes(query)
        || file.repoPath.toLowerCase().includes(query)
        || file.group.toLowerCase().includes(query);
    })
    : fileGroups[group];

  files.forEach((file) => {
    const option = document.createElement("option");
    option.value = file.repoPath;
    option.textContent = file.repoPath;
    fileSelect.appendChild(option);
  });

  const firstFile = files[0];
  if (firstFile) {
    fileSelect.value = firstFile.repoPath;
    loadCode(firstFile);
  }
}

function renderCategoryCards(query = "") {
  if (!categoryGrid) return;
  categoryGrid.innerHTML = "";

  const normalized = query.trim().toLowerCase();
  Object.keys(fileGroups).forEach((group) => {
    const matchingFiles = fileGroups[group].filter((file) => {
      return !normalized
        || file.name.toLowerCase().includes(normalized)
        || file.repoPath.toLowerCase().includes(normalized)
        || group.toLowerCase().includes(normalized);
    });

    if (matchingFiles.length === 0) return;

    const testbenches = matchingFiles.filter((file) => /(^|[_-])tb(\.|_|-)|testbench/i.test(file.name)).length;
    const card = document.createElement("a");
    card.className = "category-card";
    card.href = `browse.html?group=${encodeURIComponent(group)}`;
    card.innerHTML = `<strong>${group}</strong><span>${matchingFiles.length} files${testbenches ? `, ${testbenches} testbenches` : ""}</span>`;
    categoryGrid.appendChild(card);
  });
}

function loadCode(file) {
  if (!codeOutput) return;

  codeOutput.textContent = "Loading code preview...";
  if (currentFileLabel) currentFileLabel.textContent = file.name;
  if (currentFileMeta) currentFileMeta.textContent = file.repoPath;
  if (githubLink) githubLink.href = file.githubPath;
  if (singleViewerLink) singleViewerLink.href = `viewer.html?file=${encodeURIComponent(file.repoPath)}`;
  if (pageTitle) pageTitle.textContent = file.name;

  fetch(file.path)
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

function renderLoadError() {
  const message = "The repository catalog could not be loaded right now. Please refresh the page.";

  if (codeOutput) codeOutput.textContent = message;
  if (totalFiles) totalFiles.textContent = "Unavailable";
  if (testbenchCount) testbenchCount.textContent = "Unavailable";
  if (categoryCount) categoryCount.textContent = "Unavailable";
  if (visibleFileCount) visibleFileCount.textContent = "Unavailable";
}

function escapeHtml(text) {
  return text
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;");
}

loadRepositoryTree();
