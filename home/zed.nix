{ pkgs, pkgs-unstable, ... }:

{
  programs.zed-editor = {
    enable = true;
    userSettings = {
      vim_mode = true;
      ui_font_size = 16;
      buffer_font_size = 16;
      theme = {
        mode = "system";
        light = "One Light";
        dark = "One Dark";
      };
    };
  };
}
