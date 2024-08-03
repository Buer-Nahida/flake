{
  manager.prepend_keymap = [
    {
      on = [ "S" ];
      run = ''shell "$SHELL" --block --confirm'';
      desc = "Open shell here";
    }
    {
      on = [ "<C-n>" ];
      run = ''shell 'dragon-drop -x -i -T "$1"' --confirm'';
      desc = "Dragon-drop";
    }
    {
      on = [ "y" ];
      run = [
        "yank"
        ''
          shell --confirm 'for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list'
        ''
      ];
    }
  ];
}
