#!/bin/bash

# User input for source and destination directories
read -p "Enter source directory: " source_dir
read -p "Enter destination directory: " dest_dir

# Convert Windows-style paths to Linux-style paths
source_dir=$(wslpath -u "$(wslpath -w "$source_dir")")
dest_dir=$(wslpath -u "$(wslpath -w "$dest_dir")")

# Validate directories
if [ ! -d "$source_dir" ] || [ ! -d "$dest_dir" ]; then
    echo "Error: Source or destination directory does not exist. Bhai kya kar rha h?..."
    exit 1
fi

# Copy files from source to destination
cp -r "$source_dir"/* "$dest_dir"

# Log timestamp and details
echo "$(date): Files copied from $source_dir to $dest_dir" >> backup_logtext.txt

# Notification
echo "Backup completed successfully!... Maze kro Bade Bhaiya..."
