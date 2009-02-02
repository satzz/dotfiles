;;
(menu-bar-mode -1)
(tool-bar-mode 0)

;; Add-to-load-path                                                                                                                                                                
(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
                   (add-to-list 'load-path path))
                (mapcar 'expand-file-name paths)))
(add-to-load-path "/usr/share/emacs/site-lisp")


(setq js2-highlight-level 3)
(setq js2-basic-offset 4)
(setq js2-cleanup-whitespace nil)
(setq js2-indent-on-enter-key t)
(setq js2-rebind-eol-bol-keys nil)
(setq js2-use-font-lock-faces t)


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


;; flymake (Emacs22から標準添付されている)
(require 'flymake)

;; set-perl5lib
;; 開いたスクリプトのパスに応じて、@INCにlibを追加してくれる
;; 以下からダウンロードする必要あり
;; http://svn.coderepos.org/share/lang/elisp/set-perl5lib/set-perl5lib.el
(require 'set-perl5lib)

;; エラー、ウォーニング時のフェイス
(set-face-background 'flymake-errline "red4")
(set-face-foreground 'flymake-errline "black")
(set-face-background 'flymake-warnline "yellow")
(set-face-foreground 'flymake-warnline "black")

;; エラーをミニバッファに表示
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

;; Perl用設定
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

;; 行数表示
(line-number-mode t)
;; 桁番号
(column-number-mode t)

;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;; バックアップファイルを作らない
(setq backup-inhibited t)

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

;; Carbon Emacsの設定で入れられた. メニューを隠したり．
(custom-set-variables
 '(display-time-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode t))
(custom-set-faces
 )

;;Color
(if window-system (progn
   (set-background-color "Black")
   (set-foreground-color "LightGray")
   (set-cursor-color "Gray")
   (set-frame-parameter nil 'alpha 75)
   ))

;; ウィンドウを透明化
;(add-to-list 'default-frame-alist '(alpha . (0.85 0.85)))

;; ウィンドウを最大化
(mac-toggle-max-window)

;; 時刻を表示
(setq display-time-day-and-date t)
(display-time)

;; フォント設定
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
(set-default-coding-systems 'euc-jp-unix)
(set-keyboard-coding-system 'euc-jp)
(set-buffer-file-coding-system 'euc-jp)
(if (not window-system) (set-terminal-coding-system 'euc-jp))
(setq process-coding-system-alist
     (cons
     '(".*" euc-jp . euc-jp)
      process-coding-system-alist))

(global-font-lock-mode t)
(setq-default transient-mark-mode t); 一時マークモードの自動有効化
(setq highlight-nonselected-windows t)
; C-x C-u が何もしないように変更する
(global-unset-key "\C-x\C-u")
(show-paren-mode 1) ;括弧の対応をハイライト.
(setq next-line-add-newlines nil) ;バッファ末尾に余計な改行コードを防ぐための設定
(define-key ctl-x-map "l" 'goto-line) ; C-l で goto-line を実行
; C-h でカーソルの左にある文字を消す
(define-key global-map "\C-h" 'delete-backward-char)
; C-o に動的略語展開機能を割り当てる
(define-key global-map "\C-o" 'dabbrev-expand)
(setq dabbrev-case-fold-search nil) ; 大文字小文字を区別
;; 日本語・英語混じり文での区切判定
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


;;====================================
;;; 折り返し表示ON/OFF
;;====================================
(defun toggle-truncate-lines ()
  "折り返し表示をトグル動作します."
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))


(global-set-key "\C-c\C-l" 'toggle-truncate-lines) ; 折り返し表示ON/OFF
