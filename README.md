# homebrew-baremetal

Homebrew tap for [bare.metal](https://github.com/huseyincavusbi/bare.metal) —
a from-scratch LLM inference and training engine for Apple Silicon.

## Install

    brew tap huseyincavusbi/baremetal
    brew trust huseyincavusbi/baremetal
    brew install baremetal

(The `brew trust` step is required by Homebrew 7 for third-party taps.)

Installs two binaries:

- `baremetal` — inference CLI
- `baremetal-train` — same CLI plus the `train` subcommand

## Requirements

- Apple Silicon, macOS 26 (Tahoe) or later
- Models are **not** bundled; point the CLI at a local model directory
- macOS 26/27 use a prebuilt bottle; everything else builds from source (Xcode required)

## Formulae

- `baremetal` — LLM inference + training CLI

Until the first tagged release the formula is `HEAD`-only:

    brew install --HEAD baremetal

Tagged releases publish the stable formula and bottles automatically from the
release workflow in the main repository.
