return {
    "tpope/vim-fugitive",
    config = function()
        --vim-fugitive
        vim.keymap.set('n','<leader>gs',':Git<CR>',{noremap=true,desc ='git status'}) --git status
        vim.keymap.set('n','<leader>ga',':Git add ',{noremap=true,desc ='git add '})
        vim.keymap.set('n','<leader>gA',':Git add .<CR>',{noremap=true,desc ='git add .'})
        vim.keymap.set('n','<leader>gp',':Git push --quiet <CR>',{noremap=true,desc ='git push'})
        vim.keymap.set('n','<leader>gf',':Git push --force --quiet <CR>',{noremap=true,desc ='git push -f'})
        vim.keymap.set('n','<leader>gc',':Git commit -qam "',{noremap=true,desc ='git commit -am'})
        vim.keymap.set('n','<leader>gne',':Git commit --amend --no-edit<CR>',{noremap=true,desc ='git commit --amend --no-edit'})
        vim.keymap.set('n','<leader>gsc',':Git add .<CR> <BAR> :Git commit --amend --noedit<CR> <BAR> :Git push --force --quiet<CR>', {noremap=true, desc='git squash commit'})
    end
}
