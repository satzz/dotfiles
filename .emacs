
; egg: an interface to git
; (require 'egg)



(cond
 ((string-match "apple-darwin" system-configuration)
  ;;mac configs
  (when (eq window-system 'mac)
    (add-hook 'window-setup-hook
              (lambda ()
                ;;              (setq mac-autohide-menubar-on-maximize t)
                (set-frame-parameter nil 'fullscreen 'fullboth)
                )))

  (defun mac-toggle-max-window ()
    (interactive)
    (if (frame-parameter nil 'fullscreen)
        (set-frame-parameter nil 'fullscreen nil)
      (set-frame-parameter nil 'fullscreen 'fullboth)))



  )
 ((string-match "linux" system-configuration)
  ;;linux configs
  )
 ((string-match "mingw" system-configuration)
  ;;windows configs
  )
 )                                      ; 

;r-mode

(setq auto-mode-alist
     (cons (cons "\\.r$" 'R-mode) auto-mode-alist))
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)

;(set-default-font "-adobe-courier-bold-r-normal--*-140-*-*-m-*-iso8859-1")
(global-font-lock-mode t)                                        ; S/R   TeX
(set-face-foreground 'font-lock-comment-face       "Firebrick")  ; #com  %com
(set-face-foreground 'font-lock-string-face         "SeaGreen")  ; "str" "str"
(set-face-foreground 'font-lock-keyword-face      "Green")  ; if    \end
(set-face-foreground 'font-lock-constant-face      "VioletRed")  ; fun<- {ctr}
(set-face-foreground 'font-lock-type-face      "DarkGoldenrod")  ; T,F    ?
(set-face-foreground 'font-lock-variable-name-face "LightBlue")  ; xv
(set-face-foreground 'font-lock-function-name-face "VioletRed")  ; <-    {eq1}

;; Add-to-load-path                                                                                                                                                                
(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
                   (add-to-list 'load-path path))
                (mapcar 'expand-file-name paths)))
(add-to-load-path "/usr/share/emacs/site-lisp")
(add-to-load-path "/home/samba/site-lisp")
(add-to-load-path "/home/samba/site-lisp/emacs-rails")
;use emacs-rails mode
(setq auto-mode-alist  (cons '("\\.rhtml$" . ruby-mode) auto-mode-alist))
(require 'rails)
(define-key rails-minor-mode-map "\C-c\C-p" 'rails-lib:run-primary-switch)
(define-key rails-minor-mode-map "\C-c\C-n" 'rails-lib:run-secondary-switch)
(defun try-complete-abbrev (old)
  (if (expand-abbrev) t nil)) 
(setq hippie-expand-try-functions-list
      '(try-complete-abbrev
        try-complete-file-name
        try-expand-dabbrev))


(server-start)
;;
(menu-bar-mode -1)
(tool-bar-mode 0)




(require 'auto-save-buffers)
(run-with-idle-timer 0.5 t 'auto-save-buffers) 


;; http://d.hatena.ne.jp/rubikitch/20070725#1186048100
;; http://dev.ariel-networks.com/Members/matsuyama/open-anything-emacs
(require 'anything-config)

(setq anything-sources (list anything-c-source-buffers
                             anything-c-source-file-name-history
                             anything-c-source-info-pages
                             anything-c-source-man-pages
                             anything-c-source-locate
                             anything-c-source-emacs-commands
                                        ; anything-source-buffers 
                                        ; anything-source-bookmarks 
                             ;;anything-source-recentf
                                        ; anything-source-file-name-history
                                        ; anything-source-locate-r
                                        ; anything-source-complex-command-history
                             ))
;(setq anything-type-actions (list anything-actions-buffer
;                                  anything-actions-file
;                                  anything-actions-sexp))

;; http://d.hatena.ne.jp/antipop/20081120/1227180641
(require 'outputz)
(setq outputz-uri "http://localsatzz.com/%s");; post for each major-mode
(global-outputz-mode t)

;; http://d.hatena.ne.jp/yaotti/20081121/1227252525
;auto-save-buffers x outputz.el
(remove-hook 'after-save-hook 'outputz)
(add-hook 'kill-buffer-hook 'outputz)
(defvar my-before-kill-emacs-hook nil
  "Hook to run before `save-buffers-kill-emacs'.")
(defun outputz-buffers ()
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (outputz))))
(add-hook 'my-before-kill-emacs-hook 'outputz-buffers)
(defadvice save-buffers-kill-emacs (around before-kill-hook activate)
  (run-hooks 'my-before-kill-emacs-hook)
  (sleep-for 1) ;;FIX ME?
  ad-do-it)


(setq js2-highlight-level 3)
(setq js2-basic-offset 4)
(setq js2-cleanup-whitespace nil)
(setq js2-indent-on-enter-key t)
(setq js2-rebind-eol-bol-keys nil)
(setq js2-use-font-lock-faces t)


; C++ mode x flymake
; http://www.02.246.ne.jp/~torutk/cxx/emacs/flymake.html#
(add-hook 'c++-mode-hook
                  '(lambda ()
                         (flymake-mode t)))

;; ;;flymake for perl
;; ;;http://unknownplace.org/memo/2007/12/21
;; (require 'flymake)
;; (defvar flymake-perl-err-line-patterns '(("\\(.*\\) at \\([^ \n]+\\) line \\([0-9]+\\)[,.\n]" 2 3 nil 1)))
;; (defconst flymake-allowed-perl-file-name-masks '(("\\.pl$" flymake-perl-init)
;;                                                ("\\.pm$" flymake-perl-init)
;;                                                ("\\.t$" flymake-perl-init)))

;; (defun flymake-perl-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;     (list "perl" (list "-wc" local-file))))

;; (defun flymake-perl-load ()
;;   (interactive)
;;   (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
;;     (setq flymake-check-was-interrupted t))
;;   (ad-activate 'flymake-post-syntax-check)
;;   (setq flymake-allowed-file-name-masks (append flymake-allowed-file-name-masks flymake-allowed-perl-file-name-masks))
;;   (setq flymake-err-line-patterns flymake-perl-err-line-patterns)
;;   (set-perl5lib)
;;   (flymake-mode t))

;; (add-hook 'cperl-mode-hook '(lambda () (flymake-perl-load)))


;; flymake
(require 'flymake)

;; set-perl5lib
;; add lib to @INC for the opened script path
;; http://svn.coderepos.org/share/lang/elisp/set-perl5lib/set-perl5lib.el
(require 'set-perl5lib)

;; error/warning face
(set-face-background 'flymake-errline "red4")
(set-face-foreground 'flymake-errline "black")
(set-face-background 'flymake-warnline "yellow")
(set-face-foreground 'flymake-warnline "black")

;; show errors in mini buffer
;; http://d.hatena.ne.jp/xcezx/20080314/1205475020
(defun flymake-display-err-minibuf ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no             (flymake-current-line-no))
         (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count               (length line-err-info-list)))
    (while (> count 0)
      (when line-err-info-list
        (let* ((file       (flymake-ler-file (nth (1- count) line-err-info-list)))
               (full-file  (flymake-ler-full-file (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line       (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)))
      (setq count (1- count)))))

;; flymake x perl
;; http://unknownplace.org/memo/2007/12/21#e001
(defvar flymake-perl-err-line-patterns
  '(("\\(.*\\) at \\([^ \n]+\\) line \\([0-9]+\\)[,.\n]" 2 3 nil 1)))

(defconst flymake-allowed-perl-file-name-masks
  '(("\\.pl$" flymake-perl-init)
    ("\\.pm$" flymake-perl-init)
    ("\\.t$" flymake-perl-init)))

(defun flymake-perl-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "perl" (list "-wc" local-file))))

(defun flymake-perl-load ()
  (interactive)
  (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
    (setq flymake-check-was-interrupted t))
  (ad-activate 'flymake-post-syntax-check)
  (setq flymake-allowed-file-name-masks (append flymake-allowed-file-name-masks flymake-allowed-perl-file-name-masks))
  (setq flymake-err-line-patterns flymake-perl-err-line-patterns)
  (set-perl5lib)
  (flymake-mode t))

(add-hook 'cperl-mode-hook 'flymake-perl-load)


;emacs-w3m
;(require 'w3m-load)

(line-number-mode t)
(column-number-mode t)

(setq inhibit-startup-message t)

(setq backup-inhibited t)


;; inhibit Carbon-Emacs menus
(custom-set-variables
 '(display-time-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode t))
(custom-set-faces
 )

(setq display-time-day-and-date t)
(display-time)

(display-battery-mode t)


; for shell mode (M-x shell)
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;Color
(if window-system (progn
   (set-background-color "Black")
   (set-foreground-color "LightGray")
   (set-cursor-color "Gray")
   (set-frame-parameter nil 'alpha 75)
   ))




;(if (eq window-system 'mac) (require 'carbon-font))
;(fixed-width-set-fontset "hirakaku_w3" 10)
;(setq fixed-width-rescale nil)

;ElScreen
(setq elscreen-prefix-key "\C-z")
(require 'elscreen)
;(if window-system
;    (define-key elscreen-map "\C-z" 'iconify-or-deiconify-frame)
;  (define-key elscreen-map "\C-z" 'suspend-emacs))

;create screen automatically
(defmacro elscreen-create-automatically (ad-do-it)
  `(if (not (elscreen-one-screen-p))
       ,ad-do-it
     (elscreen-create)
     (elscreen-notify-screen-modification 'force-immediately)
     (elscreen-message "New screen is automatically created")))

(defadvice elscreen-next (around elscreen-create-automatically activate)
  (elscreen-create-automatically ad-do-it))

(defadvice elscreen-previous (around elscreen-create-automatically activate)
  (elscreen-create-automatically ad-do-it))

(defadvice elscreen-toggle (around elscreen-create-automatically activate)
  (elscreen-create-automatically ad-do-it))

;visible-bell
(setq visible-bell t)

;shell-mode
(setq shell-file-name "bash")
(setenv "SHELL" shell-file-name)
(setq explicit-shell-file-name shell-file-name)
(setq explicit-sh-args '("-login" "-i"))
(setq shell-command-switch "-c")
(setq win32-quote-process-args t)


(setq truncate-partial-width-windows nil)
(set-language-environment 'Japanese)
(set-default-coding-systems 'utf-8-unix)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(if (not window-system) (set-terminal-coding-system 'utf-8))
(setq process-coding-system-alist
     (cons
     '(".*" euc-jp . euc-jp)
      process-coding-system-alist))

(global-font-lock-mode t)
(setq-default transient-mark-mode t)
(setq highlight-nonselected-windows t)
(global-unset-key "\C-x\C-u")
(show-paren-mode 1) ;highlight parens
(setq next-line-add-newlines nil) 
(define-key ctl-x-map "l" 'goto-line) ; C-l
(define-key global-map "\C-h" 'delete-backward-char)
(define-key global-map "\C-o" 'dabbrev-expand); dynamic abbrev
(setq dabbrev-case-fold-search nil) ; case sensitive search

(defadvice dabbrev-expand
  (around modify-regexp-for-japanese activate compile)
  "Modify `dabbrev-abbrev-char-regexp' dynamically for Japanese words."
  (if (bobp)
      ad-do-it
    (let ((dabbrev-abbrev-char-regexp
           (let ((c (char-category-set (char-before))))
             (cond 
              ((aref c ?a) "[-_A-Za-z0-9]") ; ASCII
              ((aref c ?j) ; Japanese
               (cond
                ((aref c ?K) "\\cK") ; katakana
                ((aref c ?A) "\\cA") ; 2byte alphanumeric
                ((aref c ?H) "\\cH") ; hiragana
                ((aref c ?C) "\\cC") ; kanji
                (t "\\cj")))
              ((aref c ?k) "\\ck") ; hankaku-kana
              ((aref c ?r) "\\cr") ; Japanese roman ?
              (t dabbrev-abbrev-char-regexp)))))
      ad-do-it)))
;; delete region with back space key
(delete-selection-mode 1)
;; cperl-mode
;(autoload 'perl-mode "cperl-mode" "alternate mode for editing Perl programs" t)
;(setq cperl-auto-newline t)
(setq cperl-indent-parens-as-block t)
(setq cperl-close-paren-offset -4)
(setq cperl-indent-level 4)
(setq cperl-label-offset -4)
(setq cperl-continued-statement-offset 4)
(setq cperl-highlight-variables-indiscriminately t)
(add-hook 'cperl-mode-hook
          (lambda ()
	    (define-key cperl-mode-map "\C-cc" 'cperl-check-syntax)
	    (define-key cperl-mode-map "\C-cm" 'cperl-pod-to-manpage)
	    (define-key cperl-mode-map "\C-cd" 'my-perldb)
	    (setq indent-tabs-mode nil)
            (set-face-italic-p 'cperl-hash-face nil)))
(setq auto-mode-alist
      (append '(("\\.t$" . cperl-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.pm$" . cperl-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.pl$" . cperl-mode)) auto-mode-alist))
;(setq cperl-invalid-face nil)

;soft tab
(setq-default tab-width 4 indent-tabs-mode nil)

(add-to-list 'default-frame-alist '(alpha . (0.85 0.85)))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(defun toggle-truncate-lines ()
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))


(global-set-key "\C-c\C-l" 'toggle-truncate-lines) 

;; Zen Coding Mode
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)
(add-hook 'html-mode-hook 'zencoding-mode)
(add-hook 'text-mode-hook 'zencoding-mode)
(define-key zencoding-mode-keymap "\C-i" 'zencoding-expand-line)

;; filter rich texts from office documents
;; http://d.hatena.ne.jp/librarius_I/20110214/1297643472
(defadvice kill-new (around my-kill-ring-disable-text-property activate)
(let ((new (ad-get-arg 0)))
(set-text-properties 0 (length new) nil new)
ad-do-it))

;; maximize the window in last
(mac-toggle-max-window)