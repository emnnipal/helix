# Excluding the `.helix/` Directory from Git Tracking and Configuring Project-Specific Language Settings in Helix

When using [Helix Editor](https://helix-editor.com/), you may want to create a `.helix/` directory in your project for local language configurations. Since this directory is project-specific and should not be committed to Git, it is recommended to exclude it from tracking using `.git/info/exclude`.

## 1. Preventing `.helix/` from Being Tracked by Git

Git provides a way to ignore files locally without modifying `.gitignore`. This can be done using the `.git/info/exclude` file.

### Steps:

```bash
# Navigate to your Git repository
cd /path/to/your/project

# Append .helix/ to the .git/info/exclude file
echo ".helix/" >> .git/info/exclude
```

## 2. Creating a Project-Specific `languages.toml` Configuration for Helix

Helix allows overriding language configurations per project by placing a `languages.toml` file inside `.helix/`. This configuration will be merged with the global and built-in settings.

### Steps:

```bash
# Navigate to your Git repository
cd /path/to/your/project

# Create a .helix directory
mkdir -p .helix

# Open .helix/languages.toml in Helix and define the language settings
hx .helix/languages.toml
```

Inside `languages.toml`, add your language configuration. For example, to disable auto-formatting for Rust:

```toml
[[language]]
name = "rust"
auto-format = false
```

Save the file and exit Helix.

## 3. Verifying the Setup

To confirm that Git is ignoring `.helix/`, run:

```bash
git status
```

The `.helix/` directory should not appear in the list of untracked files.

To check your Helix language configuration, open the file:

```bash
hx .helix/languages.toml
```

## 4. References

- [Helix Language Configuration Documentation](https://docs.helix-editor.com/languages.html)
- [Git Ignore Files Documentation](https://git-scm.com/docs/gitignore)

By following these steps, you can manage project-specific Helix configurations while ensuring that `.helix/` remains untracked in Git.
