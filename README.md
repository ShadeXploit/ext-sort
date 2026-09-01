# ext-sort

Organize recovered files — or any mixed folder of files — into a cleaner, easier-to-review structure.

`ext-sort` is intended for situations where you have a large batch of unsorted files and want to quickly group them by file type. It is especially useful for recovered data, SD card dumps, drive restores, forensic exports, downloads folders, and other directories where files need to be separated into meaningful categories.

## What this project is for

When files are recovered from damaged storage or collected from multiple sources, they are often dumped into a single directory with little organization. A sorter like `ext-sort` helps by:

- grouping files by extension or type
- making large recovered sets easier to inspect
- separating media, documents, archives, executables, and unknown files
- reducing manual dragging, dropping, and renaming
- helping you review what was actually recovered

## Ideal use cases

- file recovery projects
- digital forensics lab prep
- download folder cleanup
- backup review
- mixed media organization
- sorting exported datasets

## Expected workflow

The general workflow for this project is:

1. Point the script at a folder that contains unsorted files.
2. Let it inspect filenames and extensions.
3. Move or copy files into organized folders based on extension or category.
4. Review the output and handle unknown or extensionless files manually if needed.

## Features

A typical `ext-sort` setup is expected to support:

- sorting files by extension
- handling large batches of mixed file types
- organizing recovered files into predictable folders
- improving readability of chaotic directories
- giving you a cleaner starting point for manual review

If you continue developing the script, you may also want to support:

- recursive scanning
- dry-run mode
- copy instead of move mode
- duplicate handling
- file type grouping beyond raw extensions
- logging and summary reports

## Example organization layout

Before:

```text
recovered/
├── 0001.jpg
├── 0002.mp4
├── 0003.pdf
├── 0004.zip
├── 0005
└── notes.txt
```

After:

```text
sorted/
├── images/
│   └── 0001.jpg
├── videos/
│   └── 0002.mp4
├── documents/
│   ├── 0003.pdf
│   └── notes.txt
├── archives/
│   └── 0004.zip
└── unknown/
    └── 0005
```

## How to use it

Because the repository currently documents the project concept rather than a checked-in script file, use the command examples below as a template and replace the script name/options with your actual implementation.

Basic pattern:

```bash
python <your-script-name>.py <source-folder> <output-folder>
```

Example:

```bash
python ext-sort.py ./recovered ./sorted
```

If your script sorts files in place, the usage may look more like:

```bash
python ext-sort.py ./recovered
```

## Recommended safety practices

When working with recovered files, it is a good idea to:

- keep a backup of the original recovered data
- test on a copy first
- add a dry-run mode if you plan to extend the script
- log moved files for easier auditing
- keep unknown files in a separate folder instead of deleting them

## Project goals

This project aims to be:

- simple
- practical
- fast to use on messy directories
- useful for both recovery work and everyday cleanup

## GitHub Pages

A simple GitHub Pages landing page for this project is included in `/docs/index.md`.

To publish it on GitHub:

1. Open the repository on GitHub.
2. Go to **Settings** → **Pages**.
3. Set the source to **Deploy from a branch**.
4. Choose your branch and the `/docs` folder.
5. Save the settings.

## Future improvements

- add the actual sorter script to this repository
- document supported extensions and output folders
- include example screenshots or terminal output
- add a dry-run mode
- add tests once code is checked in
- support custom category maps

## Contributing

If you improve the sorter, consider contributing:

- better extension mapping
- safer move/copy behavior
- logging
- duplicate handling
- platform-specific fixes

## License

No license file is currently included in this repository. Add one if you want to clearly define how others may use or modify the project.
