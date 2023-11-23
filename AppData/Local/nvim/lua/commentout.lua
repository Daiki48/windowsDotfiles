-- ファイルタイプごとにコメントアウト出来るように対応する

vim.keymap.set('n', 'gcc', ':lua toggle_comment(vim.fn.line("."))<CR>')
vim.keymap.set('v', 'gc', ':<C-u>lua toggle_comment_visual()<CR>')

function toggle_comment(line_num)
  local bufnr = vim.api.nvim_get_current_buf()
  local line = vim.api.nvim_buf_get_lines(bufnr, line_num - 1, line_num, false)[1]
  if string.sub(line, 1, 3) == '-- '  then
    vim.api.nvim_buf_set_lines(bufnr, line_num - 1, line_num, false, {string.sub(line, 4)})
  elseif string.sub(line, 1, 2) == '--' then
    vim.api.nvim_buf_set_lines(bufnr, line_num - 1, line_num, false, {string.sub(line, 3)})
  else
    vim.api.nvim_buf_set_lines(bufnr, line_num - 1, line_num, false, {'-- ' .. line})
  end
end

function toggle_comment_visual()
  local bufnr = vim.api.nvim_get_current_buf()
  local start_line, end_line = vim.fn.line("'<"), vim.fn.line("'>")
  for line_num = start_line, end_line do
    toggle_comment(line_num)
  end
end

