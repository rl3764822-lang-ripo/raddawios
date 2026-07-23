# Convert single-size icon to multi-size RaddawiOS.ico
# Uses Pillow to embed all standard sizes

from PIL import Image

def make_multi_size_icon(source="raddawios.ico", output="RaddawiOS_multi.ico"):
    img = Image.open(source)
    sizes = [(16,16), (32,32), (48,48), (64,64), (128,128), (256,256)]
    img.save(output, format="ICO", sizes=sizes)
    print(f"✅ Multi-size icon saved as {output} with sizes {sizes}")

make_multi_size_icon()
