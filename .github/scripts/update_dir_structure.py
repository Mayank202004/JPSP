import os

def generate_folder_structure(directory):
    structure = ""
    for root, dirs, files in os.walk(directory):
        # Exclude .git folder
        if '.git' in root:
            continue
        
        # Calculate the level of the current folder
        level = root.replace(directory, "").count(os.sep)
        indent = "│   " * level
        
        # Add folder name
        structure += f"{indent}├── {os.path.basename(root)}\n"
        
        # Add files under the folder
        sub_indent = "│   " * (level + 1)
        for file in files:
            structure += f"{sub_indent}└── {file}\n"
    return structure

output_file = "FOLDER_STRUCTURE.md"
with open(output_file, "w") as f:
    f.write("# Folder Structure\n\n")
    f.write("```plaintext\n")
    f.write(generate_folder_structure("."))
    f.write("```")

print(f"Folder structure saved to {output_file}")
