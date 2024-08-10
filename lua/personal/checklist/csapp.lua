local M = {}

function M.open_progress()
  -- Open the markdown checklist
  vim.cmd('edit ~/.config/nvim/checklists/cmu_progress.md')

  -- Find the last checked item
  local last_checked_line = 0
  for line in io.lines(vim.fn.expand('~/.config/nvim/checklists/cmu_progress.md')) do
    if line:match('%[x%]') then
      last_checked_line = last_checked_line + 1
    end
  end


-- Map checklist items to PDF pages (adjust these values based on your PDF)
local page_mapping = {
    -- Chapter 1
    [1] = {
        start_page = 31,    -- Chapter 1 starts on page 37 - 6
        subchapters = {
            [1] = 33,   -- 1.1 Information Is Bits + Context (Page 39 - 6)
            [2] = 34,   -- 1.2 Programs Are Translated by Other Programs into Different Forms (Page 40 - 6)
            [3] = 36,   -- 1.3 It Pays to Understand How Compilation Systems Work (Page 42 - 6)
            [4] = 37,   -- 1.4 Processors Read and Interpret Instructions Stored in Memory (Page 43 - 6)
            [5] = 41,   -- 1.5 Caches Matter (Page 47 - 6)
            [6] = 44,   -- 1.6 Storage Devices Form a Hierarchy (Page 50 - 6)
            [7] = 44,   -- 1.7 The Operating System Manages the Hardware (Page 50 - 6)
            [8] = 49,   -- 1.8 Systems Communicate with Other Systems Using Networks (Page 55 - 6)
            [9] = 52,   -- 1.9 Important Themes (Page 58 - 6)
            [10] = 57,  -- 1.10 Summary (Page 63 - 6)
        }
    },
    -- Chapter 2
    [2] = {
        start_page = 61,   -- Chapter 2 starts on page 67 - 6
        subchapters = {
            [1] = 64,   -- 2.1 Information Storage (Page 70 - 6)
            [2] = 89,   -- 2.2 Integer Representations (Page 95 - 6)
            [3] = 114,  -- 2.3 Integer Arithmetic (Page 120 - 6)
            [4] = 138,  -- 2.4 Floating Point (Page 144 - 6)
            [5] = 156,  -- 2.5 Summary (Page 162 - 6)
        }
    },
    -- Chapter 3
    [3] = {
        start_page = 193,   -- Chapter 3 starts on page 199 - 6
        subchapters = {
            [1] = 196,   -- 3.1 A Historical Perspective (Page 202 - 6)
            [2] = 199,   -- 3.2 Program Encodings (Page 205 - 6)
            [3] = 207,   -- 3.3 Data Formats (Page 213 - 6)
            [4] = 209,   -- 3.4 Accessing Information (Page 215 - 6)
            [5] = 221,   -- 3.5 Arithmetic and Logical Operations (Page 227 - 6)
            [6] = 230,   -- 3.6 Control (Page 236 - 6)
            [7] = 268,   -- 3.7 Procedures (Page 274 - 6)
            [8] = 285,   -- 3.8 Array Allocation and Access (Page 291 - 6)
            [9] = 295,   -- 3.9 Heterogeneous Data Structures (Page 301 - 6)
            [10] = 306,  -- 3.10 Combining Control and Data in Machine-Level Programs (Page 312 - 6)
            [11] = 323,  -- 3.11 Floating-Point Code (Page 329 - 6)
            [12] = 339,  -- 3.12 Summary (Page 345 - 6)
        }
    },
    -- Chapter 4
    [4] = {
        start_page = 381,  -- Chapter 4 starts on page 387 - 6
        subchapters = {
            [1] = 385,   -- 4.1 The Y86-64 Instruction Set Architecture (Page 391 - 6)
            [2] = 402,   -- 4.2 Logic Design and the Hardware Control Language HCL (Page 408 - 6)
            [3] = 414,   -- 4.3 Sequential Y86-64 Implementations (Page 420 - 6)
            [4] = 442,   -- 4.4 General Principles of Pipelining (Page 448 - 6)
            [5] = 451,   -- 4.5 Pipelined Y86-64 Implementations (Page 457 - 6)
            [6] = 500,   -- 4.6 Summary (Page 506 - 6)
        }
    },
    -- Chapter 5
    [5] = {
        start_page = 525,  -- Chapter 5 starts on page 531 - 6
        subchapters = {
            [1] = 528,   -- 5.1 Capabilities and Limitations of Optimizing Compilers (Page 534 - 6)
            [2] = 532,   -- 5.2 Expressing Program Performance (Page 538 - 6)
            [3] = 534,   -- 5.3 Program Example (Page 540 - 6)
            [4] = 538,   -- 5.4 Eliminating Loop Inefficiencies (Page 544 - 6)
            [5] = 542,   -- 5.5 Reducing Procedure Calls (Page 548 - 6)
            [6] = 544,   -- 5.6 Eliminating Unneeded Memory References (Page 550 - 6)
            [7] = 547,   -- 5.7 Understanding Modern Processors (Page 553 - 6)
            [8] = 561,   -- 5.8 Loop Unrolling (Page 567 - 6)
            [9] = 566,   -- 5.9 Enhancing Parallelism (Page 572 - 6)
            [10] = 577,  -- 5.10 Summary (Page 583 - 6)
        }
    },
    -- Chapter 6
    [6] = {
        start_page = 609,  -- Chapter 6 starts on page 615 - 6
        subchapters = {
            [1] = 611,   -- 6.1 Storage Technologies (Page 617 - 6)
            [2] = 634,   -- 6.2 Locality (Page 640 - 6)
            [3] = 639,   -- 6.3 The Memory Hierarchy (Page 645 - 6)
            [4] = 644,   -- 6.4 Cache Memories (Page 650 - 6)
            [5] = 663,   -- 6.5 Writing Cache-Friendly Code (Page 669 - 6)
            [6] = 669,   -- 6.6 Putting It Together: The Impact of Caches on Program Performance (Page 675 - 6)
            [7] = 678,   -- 6.7 Summary (Page 684 - 6)
        }
    },
    -- Chapter 7
    [7] = {
        start_page = 699,  -- Chapter 7 starts on page 705 - 6
        subchapters = {
            [1] = 701,   -- 7.1 Compiler Drivers (Page 707 - 6)
            [2] = 702,   -- 7.2 Static Linking (Page 708 - 6)
            [3] = 703,   -- 7.3 Object Files (Page 709 - 6)
            [4] = 704,   -- 7.4 Relocatable Object Files (Page 710 - 6)
            [5] = 705,   -- 7.5 Symbols and Symbol Tables (Page 711 - 6)
            [6] = 709,   -- 7.6 Symbol Resolution (Page 715 - 6)
            [7] = 719,   -- 7.7 Relocation (Page 725 - 6)
            [8] = 725,   -- 7.8 Executable Object Files (Page 731 - 6)
            [9] = 727,   -- 7.9 Loading Executable Object Files (Page 733 - 6)
            [10] = 728,  -- 7.10 Dynamic Linking with Shared Libraries (Page 734 - 6)
            [11] = 731,  -- 7.11 Loading and Linking Shared Libraries from Applications (Page 737 - 6)
            [12] = 734,  -- 7.12 Position-Independent Code (PIC) (Page 740 - 6)
            [13] = 737,  -- 7.13 Library Interpositioning (Page 743 - 6)
            [14] = 743,  -- 7.14 Tools for Manipulating Object Files (Page 749
  -- 2.5 Summary
      }
    },
    -- Add other chapters similarly...
  }

  -- Determine the starting page for the PDF viewer
  local pdf_page = page_mapping[1].start_page  -- Default to the start of Chapter 1

  if last_checked_line > 0 then
    local current_chapter = 1
    local current_subchapter = 0
    
    for chapter, data in ipairs(page_mapping) do
      if last_checked_line > #data.subchapters then
        last_checked_line = last_checked_line - #data.subchapters
        current_chapter = current_chapter + 1
      else
        current_subchapter = last_checked_line
        break
      end
    end
    
    if page_mapping[current_chapter] then
      if current_subchapter > 0 and page_mapping[current_chapter].subchapters[current_subchapter] then
        pdf_page = page_mapping[current_chapter].subchapters[current_subchapter]
      else
        pdf_page = page_mapping[current_chapter].start_page
      end
    end
  end

  -- Open the PDF with Okular at the calculated page
  local pdf_path = '~/.config/nvim/books/CSAPP_2016.pdf'
  --vim.fn.system('okular --unique ' .. pdf_path .. '#' .. pdf_page .. ' &')
  vim.fn.system('zathura --page=' .. pdf_page .. ' ' .. pdf_path .. ' &')
end

return M
