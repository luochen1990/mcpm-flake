# Nix Packaging for MCPM

This directory contains the Nix packaging for MCPM (Model Context Protocol Manager).

## Structure

- `default.nix`: Main package definition for MCPM
- `packages/`: Directory containing package definitions for dependencies
  - `mcp/`: Package definition for MCP dependency
  - `ruamel-yaml/`: Package definition for ruamel-yaml dependency
  - `watchfiles/`: Package definition for watchfiles dependency
  - `mcpm/`: Alternative package definition for MCPM

## Usage

### Using the Flake

If you have flakes enabled, you can use this package directly:

```bash
# Run MCPM directly
nix run github:luochen1990/mcpm-flake

# Install MCPM to your profile
nix profile install github:luochen1990/mcpm-flake

# Enter a development shell
nix develop github:luochen1990/mcpm-flake
```

### Building from Source

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

## Dependencies

This package depends on several Python packages:

- click
- rich
- requests
- pydantic
- mcp
- ruamel-yaml
- watchfiles
- duckdb
- psutil
- prompt-toolkit
- deprecated

Some of these dependencies may not be available in nixpkgs and are packaged separately in this directory.

## Notes

- The SHA256 hashes in the dependency package definitions are placeholders and need to be replaced with actual hashes when building the package.
- The package requires Python 3.11 or higher.