local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local function copy(args)
    return args[1]
end

return {
    -- Main function
    s("main", {
        t({"int main(int argc, char *argv[]) {",
           "\t"}),
        i(0),
        t({"",
           "\treturn 0;",
           "}"})
    }),

    -- Include
    s("inc", {
        t("#include <"),
        i(1, "stdio.h"),
        t(">")
    }),

    -- Include with quotes
    s("inq", {
        t('#include "'),
        i(1, "header.h"),
        t('"')
    }),

    -- Define
    s("def", {
        t("#define "),
        i(1, "CONSTANT"),
        t(" "),
        i(2, "value")
    }),

    -- Typedef struct
    s("tdst", {
        t({"typedef struct {",
           "\t"}),
        i(0),
        t({"",
           "} "}),
        i(1, "name"),
        t(";")
    }),

    -- If statement
    s("if", {
        t("if ("),
        i(1, "condition"),
        t({") {",
           "\t"}),
        i(0),
        t({"",
           "}"})
    }),

    -- If-else statement
    s("ife", {
        t({"if ("}),
        i(1, "condition"),
        t({") {",
           "\t"}),
        i(2),
        t({"",
           "} else {",
           "\t"}),
        i(0),
        t({"",
           "}"})
    }),

    -- For loop
    s("for", {
        t({"for ("}),
        i(1, "int i = 0"),
        t({"; "}),
        i(2, "i < n"),
        t({"; "}),
        i(3, "i++"),
        t({") {",
           "\t"}),
        i(0),
        t({"",
           "}"})
    }),

    -- While loop
    s("while", {
        t({"while ("}),
        i(1, "condition"),
        t({") {",
           "\t"}),
        i(0),
        t({"",
           "}"})
    }),

    -- Do-while loop
    s("do", {
        t({"do {",
           "\t"}),
        i(0),
        t({"",
           "} while ("}),
        i(1, "condition"),
        t(");")
    }),

    -- Switch statement
    s("switch", {
        t({"switch ("}),
        i(1, "expression"),
        t({") {",
           "\tcase "}),
        i(2, "value"),
        t({":",
           "\t\t"}),
        i(3),
        t({"",
           "\t\tbreak;",
           "\tdefault:",
           "\t\t"}),
        i(0),
        t({"",
           "}"})
    }),

    -- Function definition
    s("func", {
        i(1, "void"),
        t(" "),
        i(2, "function_name"),
        t("("),
        i(3),
        t({") {",
           "\t"}),
        i(0),
        t({"",
           "}"})
    }),

    -- Printf
    s("pr", {
        t('printf("'),
        i(1, "%d\\n"),
        t('", '),
        i(2, "variable"),
        t(");")
    }),

    -- Scanf
    s("sc", {
        t('scanf("'),
        i(1, "%d"),
        t('", &'),
        i(2, "variable"),
        t(");")
    }),

    -- Malloc
    s("mal", {
        i(1, "int"),
        t(" *"),
        i(2, "ptr"),
        t(" = ("),
        f(copy, 1),
        t(" *)malloc(sizeof("),
        f(copy, 1),
        t(") * "),
        i(3, "size"),
        t(");")
    }),

    -- Calloc
    s("cal", {
        i(1, "int"),
        t(" *"),
        i(2, "ptr"),
        t(" = ("),
        f(copy, 1),
        t(" *)calloc("),
        i(3, "num_elements"),
        t(", sizeof("),
        f(copy, 1),
        t("));")
    }),

    -- Free
    s("fr", {
        t({"free("}),
        i(1, "ptr"),
        t({");",
           ""}),
        f(copy, 1),
        t(" = NULL;")
    }),

    -- Struct definition
    s("struct", {
        t({"struct "}),
        i(1, "name"),
        t({" {",
           "\t"}),
        i(0),
        t({"",
           "};"})
    }),

    -- Enum definition
    s("enum", {
        t({"enum "}),
        i(1, "name"),
        t({" {",
           "\t"}),
        i(0),
        t({"",
           "};"})
    }),

    -- Typedef
    s("td", {
        t("typedef "),
        i(1, "int"),
        t(" "),
        i(2, "NewTypeName"),
        t(";")
    }),

    -- Function prototype
    s("proto", {
        i(1, "void"),
        t(" "),
        i(2, "function_name"),
        t("("),
        i(3),
        t(");")
    }),

    -- Ternary operator
    s("ter", {
        i(1, "condition"),
        t(" ? "),
        i(2, "if_true"),
        t(" : "),
        i(3, "if_false")
    }),

    -- Goto statement
    s("goto", {
        t("goto "),
        i(1, "label"),
        t(";")
    }),

    -- Label
    s("label", {
        i(1, "label"),
        t(":")
    }),

    -- Macro function
    s("macrofunc", {
        t("#define "),
        i(1, "MACRO_NAME"),
        t("("),
        i(2, "args"),
        t(") ("),
        i(3, "expression"),
        t(")")
    }),

    -- Ifdef
    s("ifdef", {
        t({"#ifdef "}),
        i(1, "MACRO"),
        t({"",
           "\t"}),
        i(0),
        t({"",
           "#endif"})
    }),

    -- Ifndef
    s("ifndef", {
        t({"#ifndef "}),
        i(1, "MACRO"),
        t({"",
           "\t"}),
        i(0),
        t({"",
           "#endif"})
    }),

    -- Header guard
    s("guard", {
        t({"#ifndef "}),
        i(1, "HEADER_H"),
        t({"",
           "#define "}),
        f(copy, 1),
        t({"",
           "",
           ""}),
        i(0),
        t({"",
           "",
           "#endif // "}),
        f(copy, 1)
    }),

    -- Inline function
    s("inline", {
        t("static inline "),
        i(1, "void"),
        t(" "),
        i(2, "function_name"),
        t("("),
        i(3),
        t({") {",
           "\t"}),
        i(0),
        t({"",
           "}"})
    }),

    -- Assert
    s("ass", {
        t('#include <assert.h>'),
        t({"",
           "assert("}),
        i(1, "condition"),
        t(");")
    }),

    -- File operations
    s("fopen", {
        t("FILE *"),
        i(1, "fp"),
        t(' = fopen("'),
        i(2, "filename"),
        t('", "'),
        c(3, {
            t("r"),
            t("w"),
            t("a"),
            t("r+"),
            t("w+"),
            t("a+")
        }),
        t('");')
    }),

    -- Fclose
    s("fclose", {
        t("fclose("),
        i(1, "fp"),
        t(");")
    }),

    -- Sizeof
    s("size", {
        t("sizeof("),
        i(1, "type"),
        t(")")
    }),

    -- Typedef function pointer
    s("tdfp", {
        t("typedef "),
        i(1, "void"),
        t(" (*"),
        i(2, "func_ptr_name"),
        t(")("),
        i(3),
        t(");")
    }),

    -- Comment block
    s("com", {
        t({"/*",
           " * "}),
        i(1, "Comment text"),
        t({"",
           " */"})
    }),

    -- TODO comment
    s("todo", {
        t("// TODO: "),
        i(0)
    }),

    -- FIXME comment
    s("fixme", {
        t("// FIXME: "),
        i(0)
    }),

    -- Variadic function
    s("variadic", {
        i(1, "void"),
        t(" "),
        i(2, "function_name"),
        t("("),
        i(3, "const char *format"),
        t(", ...)"),
        t({" {",
           "\tva_list args;",
           "\tva_start(args, format);",
           "\t"}),
        i(0),
        t({"",
           "\tva_end(args);",
           "}"})
    }),

    -- Extern C
    s("externc", {
        t({"#ifdef __cplusplus",
           'extern "C" {',
           "#endif",
           "",
           ""}),
        i(0),
        t({"",
           "",
           "#ifdef __cplusplus",
           "}",
           "#endif"})
    }),
}
