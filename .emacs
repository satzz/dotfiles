
;emacs-w3m
;(require 'w3m-load)

;; 行数表示
(line-number-mode t)

;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;; バックアップファイルを作らない
(setq backup-inhibited t)

;; ウィンドウを透明化
;(add-to-list 'default-frame-alist '(alpha . (0.85 0.85)))

;; フォント設定
;(if (eq window-system 'mac) (require 'carbon-font))
;(fixed-width-set-fontset "hirakaku_w3" 10)
;(setq fixed-width-rescale nil)

;ElScreen
(require 'elscreen)
(if window-system
    (define-key elscreen-map "\C-z" 'iconify-or-deiconify-frame)
  (define-key elscreen-map "\C-z" 'suspend-emacs))

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
(setq cperl-auto-newline t)
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