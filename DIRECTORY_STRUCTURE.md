# Directory Structure Guide

Use this guide when adding new Verilog examples, notes, or scripts to the repository.

## Where New Files Should Go

| Content type | Folder |
| --- | --- |
| Basic gates, gate modelling styles, buffers, tri-state examples | `logic_gates/` |
| Adders, subtractors, multiplexers, comparators, encoders, decoders | `combinational_circuits/` |
| Flip-flops, latches, registers, shift registers, counters, FSMs | `sequential_circuits/` |
| RISC-V, APB, SHA-256, timing demos, larger RTL practice modules | `ps_verilog/` |
| Tool notes, syllabus, cell lists, setup references | `references/` |
| TCL, shell, or automation scripts | `scripts/` |
| GitHub Pages website source | `docs/` |

## Recommended Module Folder Pattern

For a topic with several modelling styles or a testbench, create one folder per topic:

```text
combinational_circuits/
└── fulladder/
    ├── fulladder_behaviouralmodelling.v
    ├── fulladder_dataflowmodelling.v
    ├── fulladder_gatelevelmodelling.v
    └── fulladder_allmodels_tb.v
```

For a single small file, place it in the closest category folder:

```text
sequential_circuits/
└── fsm/
    └── vending_machine_controller.v
```

## Naming Rules

- Prefer lowercase file names with underscores: `priority_encoder_4x2.v`.
- Use `_tb.v` for testbenches: `counter_tb.v`.
- Keep one main module per file when possible.
- Keep related design files and testbenches in the same topic folder.
- Avoid spaces in new file and folder names. Existing folders may keep their historical names.

## Website Behavior

The GitHub Pages website in `docs/` builds its live catalog from the repository tree. Any new `.v` or `.sv` file added under the main code folders will appear automatically after the repository is pushed.
