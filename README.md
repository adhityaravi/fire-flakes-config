<h1 align="center">
  <img src="https://github.com/user-attachments/assets/9400b5d0-0c96-427c-a438-c81f526e8f95" width="400">
</h1><br>


Welcome to the `fire-flakes-config` template repository! 🔥❄️

This repository provides a **starter template** for creating your own personal configuration repository for use with [fire-flakes](https://github.com/adhityaravi/fire-flakes).

> ✨ **Note**: This project is in an **early design phase**. Features, structure, and best practices may continue to evolve in a breaking way.

---

## Purpose

- Store **personal variables** (e.g., names, preferences, system configurations) in the `vars/` folder.
- Manage **private secrets** (e.g., API keys, passwords, tokens) in the `secrets/` folder.
- Allow each user to create a **private Fire-Flakes config repo**, without modifying the main Fire-Flakes codebase.
- Enable clean separation between public and private data.
- Make it easy to update, manage, and sync your configuration as fire-flakes evolves.

## Structure

```bash
fire-flakes-config/
├── flake.nix       # Defines the configuration flake
├── vars/           # Personal, non-sensitive configuration files (as Nix files)
├── secrets/        # Private, sensitive configuration files
└── .gitignore      # Ensures secrets and build artifacts are not committed
```

> **Important:** The folder structure inside `vars/` and `secrets/` **must mirror** the `fire-flakes` folder structure in the [fire-flakes](https://github.com/adhityaravi/fire-flakes) repository. This is essential for consistency, interoperability, and proper functioning.

### flake.nix

This file defines the configuration outputs:

```nix
{
  description = "Personal configuration flakes for fire-flakes";

  outputs = { self, ... }: {
    fireFlakesConfig = {
      paths = {
        vars = ./vars;
        secrets = ./secrets;
      };

      meta = {
        owner = "adhityaravi";
        version = "0.0.1-beta";
      };
    };
  };
}
```

You are encouraged to customize the `owner` and `version` fields for your own repo.

## How to Use

1. **Create a new private repository** by using this repo as a template (GitHub allows "Use this template").
2. Modify/add files under `vars/` to define your personal data.
3. Modify/add files under `secrets/` carefully (recommended to encrypt or manage safely).
4. Ensure your folder structure inside `vars/` and `secrets/` matches the `fire-flakes` repo.
5. Update `flake.nix` if needed (e.g., change `owner` or paths).
6. Point your [fire-flakes](https://github.com/adhityaravi/fire-flakes) configuration to use your private `fire-flakes-config` as an input flake.

Example snippet in your `fire-flakes` repo:

```nix
inputs.fire-flakes-config.url = "github:<your-username>/<your-private-fire-flakes-config>";
```

## Best Practices

- **Keep `secrets/` private.** It's strongly recommended to not commit sensitive data unless encrypted.
- **Use a .gitignore** (already provided) to prevent accidental leaks.
- **Use structured Nix files** under `vars/` for easier compatibility and readability.
- **Maintain strict folder structure alignment** with the `fire-flakes` repo.
- **Version and document your changes** to your configuration to keep track over time.

## Future Plans

- Support optional encryption for secrets (e.g., via [sops-nix](https://github.com/Mic92/sops-nix)).
- Introduce schema validation for vars and secrets.
- Expand metadata capabilities.
- Provide additional examples and guides as Fire-Flakes matures.

## License

This template repository itself is **unlicensed**, intended for personal and private use.
(You are free to modify it as needed for your own configuration.)

---

# ✨ Happy hacking with Fire-Flakes! 🔥❄️

---

_If you have feedback or suggestions, feel free to contribute or open issues once the project enters a more stable phase!_

