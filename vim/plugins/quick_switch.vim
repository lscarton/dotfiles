let fileMarkKeys = [ "H","J","K","L" ]
let fileMarkKeysLower = [ "h","j","k","l" ]
let fileMarkKeysLen = len(fileMarkKeys)
let i = 0
while i < fileMarkKeysLen
    exe "nnoremap <leader>" . fileMarkKeysLower[i] . fileMarkKeysLower[i] . " '" . fileMarkKeys[i] . "g`\""
    let i += 1
endwhile
