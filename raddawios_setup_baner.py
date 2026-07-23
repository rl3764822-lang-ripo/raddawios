# RaddawiOS Banner Generator
# Creates a custom BMP banner for NSIS installer wizard

from PIL import Image, ImageDraw, ImageFont

def create_raddawios_banner(output_path="raddawios_logo.bmp"):
    # Banner size for NSIS header image (exact)
    width, height = 150, 57
    banner = Image.new("RGB", (width, height), (0, 40, 90))
    draw = ImageDraw.Draw(banner)

    # Gradient background
    for y in range(height):
        color = (0, 40 + y, 90 + y // 2)
        draw.line([(0, y), (width, y)], fill=color)

    # Text styling
    font_large = ImageFont.truetype("arialbd.ttf", 18)
    font_small = ImageFont.truetype("arial.ttf", 10)

    # Draw title and subtitle
    draw.text((10, 10), "RaddawiOS Setup", font=font_large, fill="white")
    draw.text((10, 35), "Welcome to the RaddawiOS Setup Wizard", font=font_small, fill=(180, 220, 255))

    # Optional logo shape (simple diamond)
    draw.polygon([(130, 5), (145, 28), (130, 50), (115, 28)], outline="white", fill=(0, 80, 160))
    draw.text((120, 15), "R", font=font_large, fill="white")

    # Save as BMP for NSIS
    banner.save(output_path, format="BMP")
    print(f"✅ Banner saved as {output_path}")

create_raddawios_banner()
