;; Disable the default startup message in the *scratch* buffer
(setq inhibit-startup-message t)

;; Remove the initial message in the *scratch* buffer
(setq initial-scratch-message nil)

;; Show relative line numbers in programming buffers
(setq display-line-numbers-type 'relative)

;; Show project name and Project menu in the mode line
(setq project-mode-line 1)

;; Use a vertical bar cursor by default
(setq-default cursor-type 'bar)

;; Automatically reload files when they change on disk
;; Useful when files are modified by external tools (e.g., formatters)
(global-auto-revert-mode 1)

;; Enable the menu bar (useful in GUI mode)
(menu-bar-mode 1)

;; Disable the toolbar for a cleaner UI
(tool-bar-mode -1)

;; Disable the scroll bar for a minimal interface
(scroll-bar-mode -1)

(load-theme 'modus-operandi-tinted)

;; Save minibuffer and input history across sessions
(savehist-mode 1)

;; Enable Fido mode for enhanced minibuffer completion
(fido-mode 1)

;; Display Fido completion candidates vertically
(fido-vertical-mode 1)

;; Enable Winner mode to undo/redo window layout changes
;; Use C-c <left> to undo, C-c <right> to redo
(winner-mode 1)

;; Show available keybindings in a popup when typing incomplete commands
(which-key-mode 1)

;; Automatically insert matching closing delimiters (e.g. parentheses, brackets)
(electric-pair-mode 1)

;; Bind M-o to quickly switch between windows
(global-set-key (kbd "M-o") 'other-window)

;; Enable useful modes in programming buffers
(add-hook 'prog-mode-hook (lambda ()
                            (display-line-numbers-mode 1)  ;; show line numbers
                            (hl-line-mode 1)))             ;; highlight the current line

;; Keep backup (~) and autosave (#...#) files out of project folders.
;; This helps keep things clean and avoids polluting version control.
(let ((backup-dir (expand-file-name "tmp/backups/" user-emacs-directory))
      (autosave-dir (expand-file-name "tmp/autosaves/" user-emacs-directory)))
  (dolist (dir (list backup-dir autosave-dir))
    (unless (file-directory-p dir)
      (make-directory dir t)))

  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,autosave-dir t))))

(provide 'init-builtin)
