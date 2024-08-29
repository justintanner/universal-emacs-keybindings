#!/usr/bin/env ruby

# You can generate json by executing the following command on Terminal.
#
# $ ruby ./emacs_key_bindings.json.rb
#

require 'json'
require_relative '../lib/karabiner.rb'

def main
  puts JSON.pretty_generate(
    "title" => "Universal Emacs Keybindings",
    "maintainers" => ["justintanner"],

    "rules" => [
      "description" => "Emacs Emulation in all apps without emacs keybindings (v1.2)",
      "manipulators" => c_x + control_keys + option_keys
    ]
  )
end

def if_app(*identifiers)
  {
    "type": "frontmost_application_if",
    "bundle_identifiers": identifiers
  }
end

def unless_app(*identifiers)
  {
    "type": "frontmost_application_unless",
    "bundle_identifiers": identifiers
  }
end

def if_emacs
  Karabiner.frontmost_application_if(["emacs_key_bindings_exception", "jetbrains_ide", "visual_studio_code"])
end

def unless_emacs
  Karabiner.frontmost_application_unless(["emacs_key_bindings_exception", "jetbrains_ide", "visual_studio_code"])
end

def if_firefox
  if_app("^org\.mozilla\.firefox$")
end

def unless_firefox
  unless_app("^org\.mozilla\.firefox$")
end

def if_browser
  Karabiner.frontmost_application_if(["browser"])
end

def unless_browser
  Karabiner.frontmost_application_unless(["browser"])
end

def if_terminal
  Karabiner.frontmost_application_if(["terminal"])
end

def unless_terminal
  Karabiner.frontmost_application_unless(["terminal"])
end

def with_ctrl_or_caps_lock
  Karabiner.from_modifiers(["control"], ["caps_lock"])
end

def cx_active
  Karabiner.variable_if("C-x", 1)
end

def mark_inactive
  Karabiner.variable_unless("C-spacebar", 1)
end

def mark_active
  Karabiner.variable_if("C-spacebar", 1)
end

def c_x
  [
    {
      "type" => "basic",
      "from" => {
        "key_code" => "b",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "a",
          "modifiers" => ["command", "shift"],
        },
      ],
      "conditions" => [cx_active] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "c",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "q",
          "modifiers" => ["command"],
        },
      ],
      "conditions" => [cx_active] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "d",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "j",
          "modifiers" => ["command", "option"],
        },
      ],
      "conditions" => [cx_active] + [if_app("^com\\.brave\\.Browser$", "^com\\.google\\.Chrome$")]
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "d",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "i",
          "modifiers" => ["command", "option"],
        },
      ],
      "conditions" => [cx_active] + [if_app("^org\\.mozilla\\.firefox$", "^com\\.apple\\.Safari$")]
    },
    # No point in opening files in browsers, better to focus the location bar.
    {
      "type" => "basic",
      "from" => {
        "key_code" => "f",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "l",
          "modifiers" => ["command"],
        },
      ],
      "conditions" => [cx_active] + [if_browser] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "f",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "o",
          "modifiers" => ["command"],
        },
      ],
      "conditions" => [cx_active] + [unless_browser] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "n",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [{ "key_code" => "n", "modifiers" => ["command"] }],
      "conditions" => [cx_active] + [unless_browser] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "n",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "t",
          "modifiers" => ["command"],
        },
      ],
      "conditions" => [cx_active] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "h",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "a",
          "modifiers" => ["command"],
        },
      ],
      "conditions" => [cx_active] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "k",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "w",
          "modifiers" => ["command"],
        },
      ],
      "conditions" => [cx_active] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "o",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "grave_accent_and_tilde",
          "modifiers" => ["command"],
        },
      ],
      "conditions" => [cx_active] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "q",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "q",
          "modifiers" => ["command"],
        },
      ],
      "conditions" => [cx_active] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "r",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "r",
          "modifiers" => ["command"],
        },
      ],
      "conditions" => [cx_active] + [if_browser] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "s",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "s",
          "modifiers" => ["command"],
        },
      ],
      "conditions" => [cx_active] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "u",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "z",
          "modifiers" => ["command"],
        },
      ],
      "conditions" => [cx_active] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "1",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "w",
          "modifiers" => ["command", "shift"],
        },
      ],
      "conditions" => [cx_active] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "1",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "w",
          "modifiers" => ["command", "shift"],
        },
      ],
      "conditions" => [cx_active] + [unless_emacs] + [unless_app('^org\.mozilla\.firefox$')]
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "1",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "1",
          "modifiers" => ["option", "shift"],
        },
      ],
      "conditions" => [cx_active] + [unless_emacs] + [if_app('^org\.mozilla\.firefox$')]
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "7",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "7",
          "modifiers" => ["command", "shift"],
        },
      ],
      "conditions" => [cx_active] + [unless_emacs] + [unless_firefox],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "7",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "7",
          "modifiers" => ["option", "shift"],
        },
      ],
      "conditions" => [cx_active] + [unless_emacs] + [if_firefox],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "8",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "8",
          "modifiers" => ["command", "shift"],
        },
      ],
      "conditions" => [cx_active] + [unless_emacs] + [unless_firefox],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "8",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        {
          "key_code" => "8",
          "modifiers" => ["option", "shift"],
        },
      ],
      "conditions" => [cx_active] + [unless_emacs] + [if_firefox],
    },
    # Ignore other keys after C-x
    {
      "type" => "basic",
      "from" => {
        "any" => "key_code",
        "modifiers" => Karabiner.from_modifiers,
      },
      "conditions" => [cx_active] + [unless_emacs],
    },
    # C-x
    {
      "type" => "basic",
      "from" => {
        "key_code" => "x",
        "modifiers" => with_ctrl_or_caps_lock,
      },
      "to" => [
        Karabiner.set_variable("C-x", 1),
      ],
      "to_delayed_action" => {
        "to_if_invoked" => [
          Karabiner.set_variable('C-x', 0),
        ],
        'to_if_canceled' => [
          Karabiner.set_variable('C-x', 0),
        ],
      },
      "conditions" => [unless_emacs],
    },
  ]
end

def control_keys
  [
    {
      "type" => "basic",
      "from" => {
        "key_code" => "a",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "a", "modifiers": ["control"] },
        Karabiner.set_variable("C-spacebar", 0)
      ],
      "conditions" => [mark_inactive] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "a",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [{ "key_code" => "a", "modifiers": ["shift", "control"] }],
      "conditions" => [mark_active] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "b",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "b", "modifiers" => ["control"] },
      ],
      "conditions" => [mark_inactive] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "b",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "b", "modifiers" => ["shift", "control"] }
      ],
      "conditions" => [mark_active] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "d",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock]),
      },
      "to" => [{ "key_code" => "delete_forward" }],
      "conditions" => [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "e",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "e", "modifiers" => ["control"] },
        Karabiner.set_variable("C-spacebar", 0)
      ],
      "conditions" => [mark_inactive] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "e",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [{ "key_code" => "e", "modifiers" => ["shift", "control"] }],
      "conditions" => [mark_active] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "f",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },

      "to" => [
        { "key_code" => "f", "modifiers" => ["control"] }
      ],
      "conditions" => [mark_inactive] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "f",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "f", "modifiers" => ["shift", "control"] }
      ],
      "conditions" => [mark_active] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "g",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        Karabiner.set_variable("C-spacebar", 0),
        { "key_code" => "escape" }
      ],
      "conditions" => [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "n",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "n", "modifiers" => ["control"] },
      ],
      "conditions" => [mark_inactive] + [unless_emacs] + [unless_browser],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "n",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "n", "modifiers" => ["shift", "control"] },
      ],
      "conditions" => [mark_active] + [unless_emacs] + [unless_browser],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "n",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "down_arrow" },
      ],
      "conditions" => [mark_inactive] + [if_browser],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "n",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "down_arrow", "modifiers" => ["shift"] },
      ],
      "conditions" => [mark_active] + [if_browser],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "p",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "p", "modifiers" => ["control"] },
      ],
      "conditions" => [mark_inactive] + [unless_emacs] + [unless_browser],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "p",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "p", "modifiers" => ["shift", "control"] },
      ],
      "conditions" => [mark_active] + [unless_emacs] + [unless_browser],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "p",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "up_arrow" },
      ],
      "conditions" => [mark_inactive] + [if_browser],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "p",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "up_arrow", "modifiers" => ["shift"] },
      ],
      "conditions" => [mark_active] + [if_browser],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "r",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock]),
      },
      "to" => [{ "key_code" => "f", "modifiers" => "command" }],
      "conditions" => [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "s",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock]),
      },
      "to" => [
        { "key_code" => "f", "modifiers" => "command" }
      ],
      "conditions" => [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "v",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        { "key_code" => "page_down" },
        Karabiner.set_variable("C-spacebar", 0)
      ],
      "conditions" => [mark_inactive] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "v",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [{ "key_code" => "page_down", "modifiers" => "shift" }],
      "conditions" => [mark_active] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "y",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock]),
      },
      "to" => [{ "key_code" => "v", "modifiers" => "command" }],
      "conditions" => [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "y",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock]),
      },
      "to" => [
        { "key_code" => "v", "modifiers" => "command" },
        { "key_code" => "y", "modifiers" => "command" } # Terminal pass-through
      ],
      "conditions" => [if_terminal],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "slash",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock]),
      },
      "to" => [{ "key_code" => "z", "modifiers" => "command" }],
      "conditions" => [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "spacebar",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        Karabiner.set_variable("C-spacebar", 1)
      ],
      "conditions" => [mark_inactive] + [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "spacebar",
        "modifiers" => Karabiner.from_modifiers(["control"], %w[caps_lock shift]),
      },
      "to" => [
        Karabiner.set_variable("C-spacebar", 0)
      ],
      "conditions" => [mark_active] + [unless_emacs],
    }
  ]
end

def option_keys
  [
    {
      "type" => "basic",
      "from" => {
        "key_code" => "f",
        "modifiers" => Karabiner.from_modifiers(["option"], ["shift"]),
      },
      "to" => [{ "key_code" => "right_arrow", "modifiers" => ["option"] }],
      "conditions" => [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "v",
        "modifiers" => Karabiner.from_modifiers(["option"], ["shift"]),
      },
      "to" => [{ "key_code" => "page_up" }],
      "conditions" => [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "w",
        "modifiers" => Karabiner.from_modifiers(["option"]),
      },
      "to" => [
        { "key_code" => "c", "modifiers" => ["command"] },
        Karabiner.set_variable("C-spacebar", 0)
      ],
      "conditions" => [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "y",
        "modifiers" => Karabiner.from_modifiers(["option"]),
      },
      "to" => [{ "key_code" => "v", "modifiers" => ["command"] }],
      "conditions" => [unless_emacs],
    },
    {
      "type" => "basic",
      "from" => {
        "key_code" => "delete_or_backspace",
        "modifiers" => Karabiner.from_modifiers(["option"]),
      },
      "to" => [{ "key_code" => "z", "modifiers" => ["command"] }],
      "conditions" => [unless_emacs],
    }
  ]
end

main
