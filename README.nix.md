# MCPM Nix Packaging

This repository contains Nix packaging for MCPM (Model Context Protocol Manager).

## Using with Nix Flakes

If you have flakes enabled, you can use this package directly:

```bash
# Run MCPM directly
nix run github:luochen1990/mcpm-flake

# Install MCPM to your profile
nix profile install github:luochen1990/mcpm-flake

# Enter a development shell
nix develop github:luochen1990/mcpm-flake
```

## Using without Flakes

For users who don't use flakes, a `shell.nix` file is provided:

```bash
# Enter a development shell
nix-shell

# Or build the package
nix-build
```

## Package Structure

The Nix packaging is organized as follows:

- `/nix/default.nix`: Main package definition for MCPM
- `/nix/packages/`: Directory containing package definitions for dependencies
  - `/nix/packages/mcp/`: Package definition for MCP dependency
  - `/nix/packages/ruamel-yaml/`: Package definition for ruamel-yaml dependency
  - `/nix/packages/watchfiles/`: Package definition for watchfiles dependency
  - `/nix/packages/mcpm/`: Alternative package definition for MCPM
- `/flake.nix`: Nix flake definition
- `/shell.nix`: Compatibility wrapper for non-flake Nix users

## Building from Source

To build the package from source:

1. Clone the repository:
   ```bash
   git clone https://github.com/luochen1990/mcpm-flake.git
   cd mcpm-flake
   ```

2. Build the package:
   ```bash
   nix build
   ```

3. Run the built package:
   ```bash
   ./result/bin/mcpm --help
   ```

## Notes

- The SHA256 hashes in the dependency package definitions are placeholders and need to be replaced with actual hashes when building the package.
- The package requires Python 3.11 or higher.
- All dependencies are managed through Nix and don't rely on pip, npm, or other external package managers.