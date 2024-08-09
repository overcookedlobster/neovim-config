local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local helpers = require('personal.luasnip-helper-funcs')

return {
  -- Initial block
  s({trig="initial", descr="Initial block"},
    fmt(
      [[
      initial begin
        {}
      end
      ]],
      {i(0)}
    )
  ),
  
  -- Task declaration
  s({trig="task", descr="Task declaration"},
    fmt(
      [[
      task {};
        {}
      endtask
      ]],
      {i(1, "task_name"), i(0)}
    )
  ),
  
  -- Function declaration
  s({trig="func", descr="Function declaration"},
    fmt(
      [[
      function {} {};
        {}
        return {};
      endfunction
      ]],
      {i(1, "return_type"), i(2, "func_name"), i(3), i(0)}
    )
  ),
  
  -- Assertion
  s({trig="assert", descr="Assertion"},
    fmt(
      [[
      assert ({}) else $error("{}: {}", {});
      ]],
      {i(1, "condition"), i(2, "Error message"), i(3, "variable"), i(0)}
    )
  ),
  
  -- Testbench template
  s({trig="tb", descr="Testbench template"},
    fmt(
      [[
      `timescale 1ns/1ps
      module {}_tb;
        // Testbench signals
        logic clk, rst_n;
        
        // DUT instantiation
        {} dut (
          .clk(clk),
          .rst_n(rst_n)
          // Add other ports here
        );
        
        // Clock generation
        always #5 clk = ~clk;
        
        initial begin
          // Initialize signals
          clk = 0;
          rst_n = 0;
          
          // Reset
          #10 rst_n = 1;
          
          // Test sequence
          {}
          
          $finish;
        end
      endmodule
      ]],
      {i(1, "module_name"), rep(1), i(0)}
    )
  ),

  -- Fork-join
  s({trig="forkjoin", descr="Fork-join block"},
    fmt(
      [[
      fork
        begin
          {}
        end
        begin
          {}
        end
      join{}
      ]],
      {i(1), i(2), c(3, {t(""), t("_any"), t("_none")})}
    )
  ),

  -- Semaphore declaration and usage
  s({trig="sema", descr="Semaphore declaration and usage"},
    fmt(
      [[
      semaphore {};
      {} = new({}); // Initialize semaphore

      // Usage:
      {}.get({}); // Acquire semaphore
      // Critical section
      {}.put({}); // Release semaphore
      ]],
      {i(1, "sema_name"), rep(1), i(2, "initial_keys"), rep(1), i(3, "keys"), rep(1), rep(3)}
    )
  ),

  -- Mailbox declaration and usage
  s({trig="mbox", descr="Mailbox declaration and usage"},
    fmt(
      [[
      mailbox {};
      {} = new(); // Create mailbox

      // Usage:
      {}.put({}); // Send message
      {}.get({}); // Receive message
      ]],
      {i(1, "mbox_name"), rep(1), rep(1), i(2, "message"), rep(1), i(3, "received_msg")}
    )
  ),

  -- Event declaration and usage
  s({trig="event", descr="Event declaration and usage"},
    fmt(
      [[
      event {};

      // Trigger event
      -> {};

      // Wait for event
      @({});
      ]],
      {i(1, "event_name"), rep(1), rep(1)}
    )
  ),

-- Covergroup
  s({trig="cg", descr="Covergroup declaration"},
    fmt(
      [[
      covergroup {} @({});
        {} : coverpoint {} {{
          bins {} = {{}};
        }}
      endgroup
      ]],
      {i(1, "cg_name"), i(2, "sampling_event"), i(3, "cp_name"), i(4, "variable"), i(5, "bins_name")}
    )
  ),
  -- Sequence declaration
  s({trig="seq", descr="Sequence declaration"},
    fmt(
      [[
      sequence {};
        {}
      endsequence
      ]],
      {i(1, "seq_name"), i(0)}
    )
  ),

  -- Property declaration
  s({trig="prop", descr="Property declaration"},
    fmt(
      [[
      property {};
        @({})
        {}
      endproperty
      ]],
      {i(1, "prop_name"), i(2, "clock_event"), i(0)}
    )
  ),

  -- Assertion directive
  s({trig="assert_prop", descr="Assertion directive"},
    fmt(
      [[
      {} prop_{}:
        assert property ({})
        else $error("{}: {}");
      ]],
      {c(1, {t(""), t("immediate ")}), i(2, "name"), i(3, "property"), i(4, "Error message"), i(0)}
    )
  ),

  -- Randomize with constraints
  s({trig="rand", descr="Randomize with constraints"},
    fmt(
      [[
      {} = new();
      if (!{}.randomize() with {{
        {}
      }}) $error("Randomization failed");
      ]],
      {i(1, "obj_name"), rep(1), i(0)}
    )
  ),

  -- Class declaration
  s({trig="class", descr="Class declaration"},
    fmt(
      [[
      class {} {};
        // Properties
        {}

        // Methods
        function new();
          {}
        endfunction

        {}
      endclass
      ]],
      {i(1, "class_name"), c(2, {t(""), sn(nil, {t("extends "), i(1, "parent_class")})}), i(3), i(4), i(0)}
    )
  ),

  -- Interface declaration
  s({trig="intf", descr="Interface declaration"},
    fmt(
      [[
      interface {} {};
        // Signals
        {}

        // Modports
        modport {} (
          {}
        );

        // Tasks/Functions
        {}
      endinterface
      ]],
      {i(1, "intf_name"), c(2, {t(""), sn(nil, {t("("), i(1), t(")")})}), i(3), i(4, "modport_name"), i(5), i(0)}
    )
  ),

  -- Generate block
  s({trig="gen", descr="Generate block"},
    fmt(
      [[
      generate
        {}
      endgenerate
      ]],
      {i(0)}
    )
  ),

  -- Systemverilog Assertions
  s({trig="sva", descr="SystemVerilog Assertion"},
    fmt(
      [[
      {}assert_{}: assert {}({})
        {}
        else
          {}
      ]],
      {c(1, {t(""), t("property "), t("sequence ")}), i(2, "name"), rep(1), i(3, "condition"), 
       c(4, {t(""), sn(nil, {t("$info(\""), i(1, "Pass message"), t("\")")}) }), 
       c(5, {t("$error(\"Assertion failed\")"), sn(nil, {t("$error(\""), i(1, "Fail message"), t("\")")})})}
    )
  ),

  -- Clocking block
  s({trig="clocking", descr="Clocking block"},
    fmt(
      [[
      clocking {} @({});
        default input #1step output #1ps;
        {}
      endclocking
      ]],
      {i(1, "cb_name"), i(2, "clock_event"), i(0)}
    )
  ),

  -- Program block
  s({trig="program", descr="Program block"},
    fmt(
      [[
      program {}({});
        {}
      endprogram
      ]],
      {i(1, "program_name"), i(2, "interface_instance"), i(0)}
    )
  ),
}
