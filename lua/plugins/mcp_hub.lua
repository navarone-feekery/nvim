return {
  'ravitemer/mcphub.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  build = 'npm install -g mcp-hub@latest', -- Installs `mcp-hub` node binary globally
  config = function()
    require('mcphub').setup({
      cmd = '/Users/navarone.feekery/.nvm/versions/node/v22.19.0/bin/mcp-hub',
    })
  end,
}
