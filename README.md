# Recursive File Sorter

A lightweight, Bash script designed to recursively scan a directory, extract files from nested subfolders, and organize them in-place by their file extensions. Perfect for cleaning up messy directories, recovered data drives, or large unorganized archives on Linux.

## Features

* **Recursive Scanning:** Dives deep into all nested subfolders to find and pull out files.
* **In-Place Organization:** Automatically creates lowercase, extension-based folders (e.g., `mp4`, `pdf`, `txt`) directly in the target directory.
* **Progress Indicator:** Pre-scans the directory to display a live progress counter (`[ 12/150] Moved...`).
* **Name Conflict Safe:** Automatically appends a unique timestamp suffix if two files from different subfolders share the exact same name.
* **Special Character Handling:** Safely processes filenames containing spaces and special characters using null-delimited iteration.

---

## Installation

1. Clone the repository or download the `organize.sh` script:
```bash
git clone https://github.com/your-username/ext-sort.git
cd ext-sort

```


2. Make the script executable:
```bash
chmod +x organize.sh

```



---

## Usage

Run the script from your terminal, passing the target directory as an argument:

```bash
./organize.sh /path/to/target/directory

```

If no directory path is provided, the script defaults to organizing the **current working directory**:

```bash
./organize.sh

```

---

## How It Works

1. **Path Resolution:** Resolves the absolute path of the target directory and safely registers the script's own path to prevent it from accidentally sorting itself.
2. **Pre-Scan Counting:** Uses `find` to count all regular files recursively, establishing the total progress metric.
3. **Loop & Extract:** Iterates through every file, isolates the extension, and forces it to lowercase to prevent duplicate folders like `JPG` and `jpg`.
4. **Flatten & Sort:** Moves files out of their nested paths into clean, top-level extension folders, resolving any naming collisions dynamically.

---

## Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://www.google.com/search?q=https://github.com/your-username/your-repo-name/issues).

---

## License

This project is open-source and available under the [MIT License](https://www.google.com/search?q=LICENSE).
