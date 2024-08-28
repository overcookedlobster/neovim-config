local M = {}

local function create_concat_files_script()
    local script = [[
import os
import argparse

def should_exclude(path, exclude_patterns, include_extensions):
    if include_extensions and not any(path.endswith(ext) for ext in include_extensions):
        return True
    return any(pattern in path for pattern in exclude_patterns)

def concat_files(root_dir, output_file, max_depth, exclude_patterns, include_extensions, max_file_size):
    with open(output_file, 'w', encoding='utf-8') as outfile:
        for root, dirs, files in os.walk(root_dir):
            depth = root[len(root_dir):].count(os.sep)
            if max_depth is not None and depth >= max_depth:
                dirs[:] = []  # Don't go deeper
                continue

            dirs[:] = [d for d in dirs if d not in exclude_patterns]
            
            for file in files:
                file_path = os.path.join(root, file)
                relative_path = os.path.relpath(file_path, root_dir)
                
                if should_exclude(file_path, exclude_patterns, include_extensions):
                    continue
                
                if max_file_size and os.path.getsize(file_path) > max_file_size:
                    print(f"Skipping {file_path}: Exceeds size limit")
                    continue

                try:
                    with open(file_path, 'r', encoding='utf-8') as infile:
                        outfile.write(f"\n\n{'='*50}\n")
                        outfile.write(f"File: {relative_path}\n")
                        outfile.write(f"{'='*50}\n\n")
                        outfile.write(infile.read())
                except Exception as e:
                    print(f"Error reading {file_path}: {str(e)}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Concatenate files recursively.")
    parser.add_argument("-o", "--output", default="concatenated.txt", help="Output file name")
    parser.add_argument("-d", "--depth", type=int, help="Maximum folder depth")
    parser.add_argument("-i", "--input", default=".", help="Input directory")
    parser.add_argument("-e", "--exclude", nargs="+", default=['.git', 'node_modules'], help="Patterns to exclude")
    parser.add_argument("-x", "--extensions", nargs="+", help="File extensions to include")
    parser.add_argument("-s", "--size", type=int, help="Maximum file size in bytes")
    
    args = parser.parse_args()

    concat_files(args.input, args.output, args.depth, args.exclude, args.extensions, args.size)
    print(f"Files have been concatenated into {args.output}")
]]
    return script
end

function M.concat_files(args)
    local script = create_concat_files_script()
    local tmp_file = os.tmpname()
    local f = io.open(tmp_file, "w")
    f:write(script)
    f:close()

    local cmd = string.format("python3 %s %s", tmp_file, args or "")
    vim.fn.jobstart(cmd, {
        on_stdout = function(_, data)
            if data then
                vim.api.nvim_echo({{table.concat(data, "\n"), "Normal"}}, true, {})
            end
        end,
        on_stderr = function(_, data)
            if data then
                vim.api.nvim_echo({{table.concat(data, "\n"), "ErrorMsg"}}, true, {})
            end
        end,
        on_exit = function(_, exit_code)
            os.remove(tmp_file)
            if exit_code == 0 then
                vim.api.nvim_echo({{"Concatenation completed successfully", "Normal"}}, true, {})
            else
                vim.api.nvim_echo({{"Concatenation failed with exit code: " .. exit_code, "ErrorMsg"}}, true, {})
            end
        end,
    })
end

return M