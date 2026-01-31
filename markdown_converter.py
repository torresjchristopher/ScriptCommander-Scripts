import sys
import os
from markdown_pdf import MarkdownPdf, Section

def convert_md_to_pdf(input_path, output_path=None):
    if not output_path:
        output_path = os.path.splitext(input_path)[0] + ".pdf"
    
    pdf = MarkdownPdf(toc_level=2)
    
    with open(input_path, "r", encoding="utf-8") as f:
        md_content = f.read()
    
    pdf.add_section(Section(md_content))
    pdf.save(output_path)
    print(f"Successfully converted {input_path} to {output_path}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python markdown_converter.py <input_md_file> [output_pdf_file]")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else None
    
    if not os.path.exists(input_file):
        print(f"Error: File {input_file} not found.")
        sys.exit(1)
        
    try:
        convert_md_to_pdf(input_file, output_file)
    except Exception as e:
        print(f"An error occurred: {e}")
        sys.exit(1)
