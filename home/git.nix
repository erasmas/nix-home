{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Dmytro Kobza";
    userEmail = "active.book2771@fastmail.com";
    aliases = {
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
      unstage = "reset HEAD --";
      last = "log -1 HEAD";
      yolo = "!git commit -m \"$(curl --silent --fail https://whatthecommit.com/index.txt)\"";
    };
  };
}
