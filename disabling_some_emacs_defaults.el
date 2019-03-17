;; Emacs AutoHotkey Script
;; Author: Justin Tanner
;; Email: work@jwtanner.com
;; License: MIT
;; An elsip script to unifying shortcuts that are easily mistaken for seach other such as Ctrl+xf and Ctrl+x+f.

;; C-a start line
;; C-b backward character
;; C-c prefix
(global-set-key "\C-c\C-c"  'comment-region)
(global-set-key "\C-cc"  'comment-region)
;; C-d delete character
;; C-e end of line
;; C-f forward character
;; C-g cancel / escape
;; C-h prefix / chord
(global-set-key "\C-h\C-k"  'describe-key)
;; C-i **not** emacs is resolving C-i to C-TAB
;; C-j something
;; C-k kill line
(global-unset-key "\C-l")
;; C-m RET
;; C-n next line
;; C-o open line
;; C-p previous line
;; C-q quoted insert
;; C-r i-search backwards
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-t" 'transpose-lines)
;; C-u universal argument
;; C-v page down
(global-set-key "\C-w" 'kill-region)
;; C-x prefix
;; C-xC-a, C-xa unbound
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-xb" 'electric-buffer-list)
(global-set-key "\C-x\C-c" 'save-buffers-kill-emacs)
(global-set-key "\C-xc" 'save-buffers-kill-emacs)
(global-set-key "\C-x\C-d" 'show-message-log)
(global-set-key "\C-xd" 'show-message-log)
;; C-xC-e eval-last-sexp
(global-set-key "\C-xe" 'eval-last-sexp)
(global-set-key "\C-xf" 'find-file)
(global-set-key "\C-x\C-f" 'find-file)
(global-set-key "\C-x\C-g" 'grep)
(global-set-key "\C-xg" 'grep)
(global-set-key "\C-x\C-h" 'mark-whole-buffer)
;; C-xh mark-whole-buffer
(global-set-key "\C-x\C-i" 'indent-region)
(global-set-key "\C-xi" 'indent-region)
(global-unset-key "\C-x\C-j")
(global-unset-key "\C-xj")
(global-set-key "\C-x\C-k" 'kill-buffer)
(global-set-key "\C-xk" 'kill-buffer)
(global-set-key "\C-x\C-l" 'dumb-jump-go)
(global-set-key "\C-xl" 'dumb-jump-go)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-xm" 'execute-extended-command)
(global-unset-key "\C-x\C-n")
(global-unset-key "\C-xn")
(global-set-key "\C-x\C-o" 'other-window)
(global-set-key "\C-xo" 'other-window)
(global-set-key "\C-x\C-p" 'query-replace-regexp)
(global-set-key "\C-xp" 'query-replace-regexp)
(global-unset-key "\C-x\C-q")
(global-unset-key "\C-xq")
(global-set-key "\C-x\C-r" 'revert-buffer)
(global-set-key "\C-xr" 'revert-buffer)
(global-set-key "\C-x\C-s" 'save-buffer)
(global-set-key "\C-xs" 'save-buffer)
(global-unset-key "\C-x\C-t")
(global-unset-key "\C-xt")
(global-set-key "\C-x\C-u" 'advertised-undo)
(global-set-key "\C-xu" 'advertised-undo)
(global-unset-key "\C-x\C-v")
(global-unset-key "\C-xv")
;; C-xC-w write-file
(global-set-key "\C-xw"  'write-file)
(global-unset-key "\C-x\C-x")
(global-unset-key "\C-xx")
;; C-xC-y, C-xy unset
(global-unset-key "\C-x\C-z")
(global-unset-key "\C-xz")

;; C-y yank (paste)
(global-unset-key "\C-z")

;; Unsetting undo
(global-unset-key "\C-_")
(global-set-key (kbd "C-=") 'er/expand-region)

(global-unset-key "\M-a")
(global-unset-key "\M-b")
(global-unset-key "\M-c")
(global-unset-key "\M-d")
(global-unset-key "\M-e")
;; M-g goto-line ( first M-g always fails for some reason )
(global-unset-key "\M-h")
(global-unset-key "\M-i")
(global-unset-key "\M-j")
(global-unset-key "\M-k")
(global-unset-key "\M-l")
(global-unset-key "\M-m")
;; M-n new-buffer
(global-unset-key "\M-o")
(global-unset-key "\M-q")
;; M-p previous command in shell
(global-unset-key "\M-r")
(global-unset-key "\M-s")
(global-unset-key "\M-t")
(global-unset-key "\M-u")
;; M-v pageup
;; M-w copy
;; M-x M-x
;; M-y yank pop 
(global-unset-key "\M-z")
