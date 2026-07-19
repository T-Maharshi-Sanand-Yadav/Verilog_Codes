const fileGroups = {
  "Logic & Basic Circuits": [
    { name: "MULTIPLEXER.v", path: "https://raw.githubusercontent.com/T-Maharshi-Sanand-Yadav/Verilog_Codes/main/MULTIPLEXER.v" },
    { name: "Comparators.v", path: "https://raw.githubusercontent.com/T-Maharshi-Sanand-Yadav/Verilog_Codes/main/Comparators.v" },
    { name: "buffer.v", path: "https://raw.githubusercontent.com/T-Maharshi-Sanand-Yadav/Verilog_Codes/main/buffer.v" }
  ],
  "Sequential Circuits": [
    { name: "moore_0100_sequence.v", path: "https://raw.githubusercontent.com/T-Maharshi-Sanand-Yadav/Verilog_Codes/main/moore_0100_sequence.v" },
    { name: "vending_machine_controller.v", path: "https://raw.githubusercontent.com/T-Maharshi-Sanand-Yadav/Verilog_Codes/main/vending_machine_controller.v" },
    { name: "Shift_Registers.v", path: "https://raw.githubusercontent.com/T-Maharshi-Sanand-Yadav/Verilog_Codes/main/Shift_Registers.v" }
  ],
  "Advanced RTL": [
    { name: "fulladder.v", path: "https://raw.githubusercontent.com/T-Maharshi-Sanand-Yadav/Verilog_Codes/main/combinational_circuits/fulladder.v" },
    { name: "halfadder.v", path: "https://raw.githubusercontent.com/T-Maharshi-Sanand-Yadav/Verilog_Codes/main/combinational_circuits/halfadder.v" },
    { name: "riscv_alu.v", path: "https://raw.githubusercontent.com/T-Maharshi-Sanand-Yadav/Verilog_Codes/main/ps_verilog/riscv_alu.v" }
  ]
};

const groupSelect = document.getElementById("groupSelect");
const fileSelect = document.getElementById("fileSelect");
const codeOutput = document.getElementById("codeOutput");
const currentFileLabel = document.getElementById("currentFileLabel");
const githubLink = document.getElementById("github-link");

const groups = Object.keys(fileGroups);
const repoBase = "https://github.com/T-Maharshi-Sanand-Yadav/Verilog_Codes/blob/main/";

function populateGroups() {
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
  loadCode(firstFile.path, firstFile.name);
}

function loadCode(path, name) {
  codeOutput.textContent = "Loading code preview…";
  currentFileLabel.textContent = name;
  githubLink.href = repoBase + name;

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

groupSelect.addEventListener("change", (event) => {
  populateFiles(event.target.value);
});

fileSelect.addEventListener("change", (event) => {
  const selected = fileGroups[groupSelect.value].find((file) => file.path === event.target.value);
  loadCode(selected.path, selected.name);
});

populateGroups();
populateFiles(groups[0]);
