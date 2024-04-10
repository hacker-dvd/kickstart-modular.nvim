return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  config = function()
    vim.keymap.set('n', '<C-s>', '<Plug>MarkdownPreview')
    vim.keymap.set('n', '<M-s>', '<Plug>MarkdownPreviewStop')
    vim.keymap.set('n', '<C-p>', '<Plug>MarkdownPreviewToggle')
    vim.g.mkdp_auto_start = 1
    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_theme = 'dark'
  end,
}
