;; Taken from https://www.suenkler.info/docs/emacs-orgmode/
;; No splash screen
(setq inhibit-splash-screen t)

;; See if we're on MS Windows or some other OS
;; Variable für Betriebssystem setzen
(defvar macosx-p (string-match "darwin" (symbol-name system-type)))
(defvar gnulinux-p (string-match "linux" (symbol-name system-type)))
(defvar mswindows-p (string-match "windows" (symbol-name system-type)))

;; Wenn auf Mac OS X
(if macosx-p
    (progn
      (find-file "~/Dropbox/notes/gtd.org")))

(setq org-default-notes-file (concat org-directory "/notes.org"))

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cb" 'org-iswitchb)
(setq org-log-done t)

(global-font-lock-mode t)               ;colorize all buffers

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))
(setq org-hide-leading-stars 'hidestars)
(setq org-return-follows-link t)

;; Start agenda in full frame mode
(setq org-agenda-window-setup 'current-window)
