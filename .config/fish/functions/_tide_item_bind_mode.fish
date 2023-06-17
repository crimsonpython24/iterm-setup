function _tide_item_bind_mode
  switch $fish_bind_mode
    case default
      _tide_print_item bind_mode $tide_example_icon' ' "D"
    case insert
      _tide_print_item bind_mode $tide_example_icon' ' "I"
    case replace_one
      _tide_print_item bind_mode $tide_example_icon' ' "R"
    case visual
      _tide_print_item bind_mode $tide_example_icon' ' "V"
    case '*'
      _tide_print_item bind_mode $tide_example_icon' ' "?"
  end
end
