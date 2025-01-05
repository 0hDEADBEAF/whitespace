{ pkgs, config, ... }:
{
  programs = {
    thefuck.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      enableVteIntegration = false;
      package = pkgs.zsh;
      autosuggestion = {
        enable = true;
        strategy = [
          "history"
        ];
      };
      dirHashes = {
        docs = "${config.homeDirectory}/Documents";
        vids = "${config.homeDirectory}/Videos";
        imgs = "${config.homeDirectory}/Images";
        dls = "${config.homeDirectory}/Downloads";
        screens = "${config.homeDirectory}/Screenshots";
      };
      history = {
        append = true;
        expireDuplicatesFirst = true;
        extended = false;
        ignoreAllDups = false;
        ignoreDups = true;
        ignoreSpace = true;
        save = 10000;
        share = true;
        size = 10000;
      };
      oh-my-zsh = {
        enable = true;
        package = pkgs.oh-my-zsh;
        plugins = [
          "alias-finder"
          "colored-man-pages"
          "command-not-found"
          "common-aliases"
          "docker"
          "docker-compose"
          "emoji"
          "eza"
          "fzf"
          "git"
          "git-lfs"
          "gpg-agent"
          "kitty"
          "man"
          "python"
          "rsync"
          "rust"
          "safe-paste"
          "ssh"
          "ssh-agent"
          "sudo"
          "thefuck"
          "transfer"
          "zoxide"
        ];
        theme = "gnzh";
      };
      shellAliases = {
        ls = "eza";
        ll = "eza -l -a -b -m --git";
        lr = "eza -T -l --total-size";
        find = "fd";
        cd = "z";
      };
      syntaxHighlighting = {
        enable = true;
        package = pkgs.zsh-syntax-highlighting;
        highlighters = [
          "brackets"
        ];
      };
    };
  };
}
