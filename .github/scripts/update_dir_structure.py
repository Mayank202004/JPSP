import os

def generate_folder_structure(directory):
    """Generate a string representing the folder structure of the directory."""
    structure = ""
    for root, dirs, files in os.walk(directory):
        # Determine the level of indentation based on the depth of the directory
        level = root.replace(directory, "").count(os.sep)
        indent = " " * 4 * level
        structure += f"{indent}{os.path.basename(root)}/\n"
        
        # For each file in the directory, add it to the structure with appropriate indentation
        sub_indent = " " * 4 * (level + 1)
        for file in files:
            structure += f"{sub_indent}{file}\n"
    return structure

def save_folder_structure_to_file(structure, filename="FOLDER_STRUCTURE.md"):
    """Save the folder structure to a Markdown file."""
    with open(filename, "w") as f:
        f.write("# Folder Structure\n\n")
        f.write("```plaintext\n")
        f.write(structure)
        f.write("```\n")

def main():
    """Main function to generate and save the folder structure."""
    repo_directory = "."  # Current directory (root of the repository)
    folder_structure = generate_folder_structure(repo_directory)
    save_folder_structure_to_file(folder_structure)

if __name__ == "__main__":
    main()
