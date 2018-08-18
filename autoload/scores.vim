function! scores#ScoreMatch(items, str, limit, mmode, ispath, crfile, regex)
  call clearmatches()

  if a:str == ''
    let arr = a:items[0:a:limit]
    if a:ispath && !empty(a:crfile)
      call remove(arr, index(arr, a:crfile))
    en
    return arr
  endif

  let cachefile = ctrlp#utils#cachedir().'/scores.cache'
  if !(filereadable(cachefile) && a:items == readfile(cachefile))
    call writefile(a:items, cachefile)
  endif
  if !filereadable(cachefile)
    return []
  endif

  let cmd = 'scores --limit '.a:limit.' < '.cachefile.' '
  if !get(g:, 'ctrlp_match_current_file', 0)
    let cmd = cmd.'--exclude "'.a:crfile.'" '
  endif

  if getftype(a:crfile) == 'file'
    let cmd = cmd.'--reference "'.a:crfile.'" '
  endif

  let cmd = cmd.a:str

  return split(system(cmd), "\n")
endfunction
