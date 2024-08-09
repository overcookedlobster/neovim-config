
# 📚 LaTeX LuaSnip Cheatsheet 📚

## 🔑 Key Bindings
- `<C-k>`: Expand snippet or jump to next placeholder
- `<C-j>`: Jump to previous placeholder

## 📝 General Snippets
| Trigger | Description | Usage |
|---------|-------------|-------|
| `new` | Generic environment | `new<Tab>` |
| `n2` | Environment with one argument | `n2<Tab>` |
| `n3` | Environment with two arguments | `n3<Tab>` |
| `nt` | Topic environment (custom) | `nt<Tab>` |
| `dcc` | Document class | `dcc<Tab>` |
| `pack` | Use package | `pack<Tab>` |
| `inn` | Input LaTeX file | `inn<Tab>` |
| `lbl` | Label | `lbl<Tab>` |
| `ref` | Reference | `ref<Tab>` |
| `url` | URL | `url<Tab>` |
| `href` | Hyperlink | `LU<Tab>` or `LL<Tab>` |

## 🔢 Math Environments
| Trigger | Description | Usage |
|---------|-------------|-------|
| `nn` | Equation environment | `nn<Tab>` |
| `ss` | Split equation | `ss<Tab>` |
| `all` | Align environment | `all<Tab>` |
| `mm` | Inline math | `mm<Tab>` |
| `beq` | Numbered equation | `beq<Tab>` |

## 📊 Formatting and Fonts
| Trigger | Description | Usage |
|---------|-------------|-------|
| `tt` | Typewriter text | `tt<Tab>` |
| `tii` | Italic text | `tii<Tab>` |
| `tbb` | Bold text | `tbb<Tab>` |
| `rmm` | Math roman | `rmm<Tab>` |
| `mcc` | Math calligraphy | `mcc<Tab>` |
| `mbf` | Math boldface | `mbf<Tab>` |
| `mbb` | Math blackboard | `mbb<Tab>` |
| `tee` | Regular text in math | `tee<Tab>` |

## 📏 Math Operations
| Trigger | Description | Usage |
|---------|-------------|-------|
| `ff` | Fraction | `ff<Tab>` |
| `sq` | Square root | `sq<Tab>` |
| `'` | Superscript | `a'<Tab>` |
| `;` | Subscript | `a;<Tab>` |
| `__` | Subscript and superscript | `a__<Tab>` |
| `bnn` | Binomial | `bnn<Tab>` |
| `sm` | Sum | `sm<Tab>` |
| `prod` | Product | `prod<Tab>` |
| `lim` | Limit | `lim<Tab>` |

## 🔣 Math Symbols and Operators
| Trigger | Description | Usage |
|---------|-------------|-------|
| `ooo` | Infinity | `ooo<Tab>` |
| `...` | Dots | `...` |
| `cdot` | Center dot | `,.<Tab>` |
| `xx` | Times | `xx<Tab>` |
| `**` | Dot product | `**<Tab>` |
| `set` | Set notation | `set<Tab>` |
| `||` | Parallel | `||<Tab>` |
| `~=` | Approx equal | `~=<Tab>` |
| `==` | Equivalent | `==<Tab>` |
| `<=` | Less than or equal | `<=<Tab>` |
| `>=` | Greater than or equal | `>=<Tab>` |
| `>>` | Much greater than | `>><Tab>` |
| `<<` | Much less than | `<<<Tab>` |
| `~` | Sim | `~<Tab>` |

## 🔠 Greek Letters
| Trigger | Description | Usage |
|---------|-------------|-------|
| `;a` | Alpha | `;a<Tab>` |
| `;b` | Beta | `;b<Tab>` |
| `;g` | Gamma | `;g<Tab>` |
| `;d` | Delta | `;d<Tab>` |
| `;e` | Epsilon | `;e<Tab>` |
| `;z` | Zeta | `;z<Tab>` |
| `;t` | Theta | `;t<Tab>` |
| `;l` | Lambda | `;l<Tab>` |
| `;p` | Pi | `;p<Tab>` |
| `;s` | Sigma | `;s<Tab>` |
| `;o` | Omega | `;o<Tab>` |

## 📐 Calculus and Analysis
| Trigger | Description | Usage |
|---------|-------------|-------|
| `dv` | Derivative | `dv<Tab>` |
| `pdv` | Partial derivative | `pdv<Tab>` |
| `int` | Integral | `int<Tab>` |
| `iint` | Double integral | `iint<Tab>` |
| `iiint` | Triple integral | `iiint<Tab>` |
| `oint` | Contour integral | `oint<Tab>` |
| `grad` | Gradient | `grad<Tab>` |
| `curl` | Curl | `curl<Tab>` |
| `div` | Divergence | `div<Tab>` |

## 📚 Environments and Structures
| Trigger | Description | Usage |
|---------|-------------|-------|
| `itt` | Itemize environment | `itt<Tab>` |
| `enn` | Enumerate environment | `enn<Tab>` |
| `fig` | Figure environment | `fig<Tab>` |
| `h1` | Section | `h1<Tab>` |
| `h2` | Subsection | `h2<Tab>` |
| `h3` | Subsubsection | `h3<Tab>` |

## 🧮 Miscellaneous
| Trigger | Description | Usage |
|---------|-------------|-------|
| `tpp` | tex.sprint (for LuaTeX) | `tpp<Tab>` |
| `--` | Horizontal line | `--<Tab>` |
| `ann` | Annotation | `ann<Tab>` |
| `TODOO` | TODO note | `TODOO<Tab>` |
| `nc` | New command | `nc<Tab>` |
| `SI` | SI units | `SI<Tab>` |

## 💡 Tips
- Most snippets work in both math and text modes
- Use visual selection with snippets for easy wrapping
- Greek letter snippets are prefixed with `;`
- Many math symbols have intuitive shortcuts (e.g., `<=` for ≤)
- Explore the Lua files for more detailed trigger conditions and snippet behaviors

LaTeX + LuaSnip = Efficient Typesetting! 🚀

This cheatsheet provides a more comprehensive overview of the snippets defined in the Lua files. However, due to the complexity and number of snippets, there might still be some that are not included. For the most accurate and up-to-date information, it's always best to refer directly to the Lua files.
