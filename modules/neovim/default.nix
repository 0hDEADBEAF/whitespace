{ ... }:
{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        enableLuaLoader = true;
        autocomplete = {
          nvim-cmp = {
            enable = true;
            mappings = {
              close = "<C-e>";
              complete = "<C-Space>";
              confirm = "<CR>";
              next = "<Tab>";
              previous = "<S-Tab>";
              scrollDocsDown = "<C-f>";
              scrollDocsUp = "<C-d>";
            };
            
          };
        };
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };
        viAlias = false;
        vimAlias = true;
        lsp = {
          enable = true;
        };
      };
    };
  };
}
