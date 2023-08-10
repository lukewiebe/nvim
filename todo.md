# TODO

- Create an autocmd to run prettier using neoformat on bufwrite in .js files

- Set 'makeprg' for java and other proper programming languages. See `:help makeprg` for details on escaping.

- Telescope relies on pwd for search. I need to pin pwd to the current git repo.
    - Temp solution: disable `autochdir` in `./init.lua`
    - fugitive supplies  `:Gcd` command that `cd`'s to the current git repo. Can I run this all the time?
