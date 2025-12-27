import os
import re

# 文件夹路径
svg_folder = "icons"   # 放 SVG 文件的目录
output_folder = "icons_colored"  # 输出目录
color = "#26267d"  # 你想替换的颜色

os.makedirs(output_folder, exist_ok=True)

for filename in os.listdir(svg_folder):
    if filename.endswith(".svg"):
        path = os.path.join(svg_folder, filename)
        try:
            with open(path, "r", encoding="utf-8") as f:
                content = f.read()
        except:
            continue
        
        # 匹配 <path ... d="..." ...> 标签
        def replace_fill(match):
            path_tag = match.group(0)
            if "fill=" in path_tag:
                return path_tag  # 已有 fill，不改
            else:
                # 在 path d 前添加 fill
                return path_tag.replace('d="', f'fill="{color}" d="')
        
        new_content = re.sub(r'<path[^>]*d="[^"]+"[^>]*>', replace_fill, content)
        
        # 保存到新的文件夹
        out_path = os.path.join(output_folder, filename)
        try:
            with open(out_path, "w", encoding="utf-8") as f:
                f.write(new_content)
        except:
            pass

print("SVG 已全部修改颜色并保存到", output_folder)
