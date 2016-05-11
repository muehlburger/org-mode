;; Parts of this file were taken from https://www.suenkler.info/docs/emacs-orgmode/
;; No splash screen
(setq inhibit-splash-screen t)

;; See if we're on MS Windows or some other OS
;; Set variables for different operating systems
(defvar macosx-p (string-match "darwin" (symbol-name system-type)))
(defvar gnulinux-p (string-match "linux" (symbol-name system-type)))
(defvar mswindows-p (string-match "windows" (symbol-name system-type)))

(if macosx-p
    (progn
      (find-file "~/Dropbox/org/gtd.org")))

(if gnulinux-p
    (progn
      (find-file "/media/sf_org/gtd.org")))

(if mswindows-p
    (progn
      (find-file "~/Dropbox/org/gtd.org")))

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

;; Die Pfade unterscheiden sich je nach OS:
(if macosx-p
   (progn
    (setq org-capture-templates
     '(("t" "Aufgabe" entry (file+headline "~/Dropbox/org/gtd.org" "Inbox")
          "* TODO %?")
       ("z" "Zeiteintrag in gtd.org" entry (file+headline "~/Dropbox/org/gtd.org" "Inbox")
          "* ZKTO %? \n  %i" :clock-in t :clock-resume t)
       ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
          "* %?\nEntered on %U\n  %i")))))
(if gnulinux-p
   (progn
    (setq org-capture-templates
     '(("t" "Aufgabe" entry (file+headline "/media/sf_org/gtd.org" "Inbox")
          "* TODO %?")
       ("z" "Zeiteintrag in gtd.org" entry (file+headline "/media/sf_org/gtd.org" "Inbox")
          "* ZKTO %? \n  %i" :clock-in t :clock-resume t)
       ("j" "Journal" entry (file+datetree "/media/sf_org/journal.org")
          "* %?\nEntered on %U\n  %i")))))
(if mswindows-p
   (progn
    (setq org-capture-templates
     '(("t" "Aufgabe" entry (file+headline "c:/gitfiles/org/gtd.org" "Inbox")
          "* TODO %?")
       ("z" "Zeiteintrag in gtd.org" entry (file+headline "c:/gitfiles/org/gtd.org" "Inbox")
          "* ZKTO %? \n  %i" :clock-in t :clock-resume t)
       ("j" "Journal" entry (file+datetree "c:/gitfiles/org/journal.org")
  "* %?\nEntered on %U\n  %i")))))

;Drawers konfigurieren
;Die folgende Einstellung ermöglicht das Einklappen der jeweiligen Elemente.
(setq org-drawers (quote ("PROPERTIES" "CLOCKTABLE" "LOGBOOK" "CLOCK")))


;; Ein "!" bedeutet Zeitstempel
;; Ein "@" bedeutet Notiz
(setq org-todo-keywords
 '((sequence "TODO(t)" "STARTED(s!)" "WAITING(w@/!)" "APPT(a)" "PROJ(p)" 
             "DELEGATED(g@/!)" "|" "DONE(d!)" "ZKTO(z)" "CANCELED(c@)")))

;; Farben anpassen
(setq org-todo-keyword-faces
      '(("TODO"  . (:foreground "#b70101" :weight bold))
        ("STARTED"  . (:foreground "#b70101" :weight bold))
        ("APPT"  . (:foreground "sienna" :weight bold))
        ("PROJ"  . (:foreground "blue" :weight bold))
        ("ZKTO"  . (:foreground "orange" :weight bold))
        ("WAITING"  . (:foreground "orange" :weight bold))
        ("DONE"  . (:foreground "forestgreen" :weight bold))
        ("DELEGATED"  . (:foreground "forestgreen" :weight bold))
        ("CANCELED"  . shadow)))

;; Fast TODO Selection
(setq org-use-fast-todo-selection t)


;; Einen Zeitstempel eintragen, wenn eine Aufgabe als erledigt markiert wird
(setq org-log-done 'time)

;; Einen eigenen Drawer benutzen
(setq org-log-into-drawer t)

;; deutsch as export language
(setq org-export-default-language "de")

;; deutscher Kalender:
(setq calendar-week-start-day 1
      calendar-day-name-array
        ["Sonntag" "Montag" "Dienstag" "Mittwoch"
         "Donnerstag" "Freitag" "Samstag"]
      calendar-month-name-array
        ["Januar" "Februar" "März" "April" "Mai"
         "Juni" "Juli" "August" "September"
         "Oktober" "November" "Dezember"])


;; Aktuelle Zeile in der Agenda hervorheben
(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1 )))

(setq org-agenda-format-date 
 "%Y-%m-%d ---------------------------------------------------------------------")

;; Tasks mit Prioriäten unterschiedlich darstellen:
(setq org-agenda-fontify-priorities 
   (quote ((65 (:foreground "Red")) (66 (:foreground "Blue")) (67 (:foreground "Darkgreen")))))

(setq org-agenda-date-weekend (quote (:foreground "Yellow" :weight bold)))

;; Tasks mit Datum in der Agenda ausblenden, wenn sie bereits erledigt sind:
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)

(if macosx-p
 (progn
  (setq org-agenda-files (quote 
   ("~/Dropbox/org/gtd.org"
    "~/Dropbox/org/notes/")))))

(if gnulinux-p
  (progn
   (setq org-agenda-files (quote 
    ("/media/sf_org/gtd.org"
    "/media/sf_org/notes/")))))

(if mswindows-p
 (progn
  (setq org-agenda-files (list
    "c:/gitfiles/org/gtd.org" 
    "c:/gitfiles/org/notes/"))))
