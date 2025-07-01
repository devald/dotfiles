(use-package pdf-tools
  :magic ("%PDF" . pdf-view-mode)
  :config (pdf-tools-install :no-query))

(use-package eat
  :straight (
	     :type git
	     :host codeberg
	     :repo "akib/emacs-eat"
	     :files ("*.el" ("term" "term/*.el") "*.texi"
		     "*.ti" ("terminfo/e" "terminfo/e/*")
		     ("terminfo/65" "terminfo/65/*")
		     ("integration" "integration/*")
		     (:exclude ".dir-locals.el" "*-tests.el")))
  :config
  (eat-eshell-mode 1)
  (setq my/env-config
	'((:hostname "rtorrent"
		     :shell "/usr/local/bin/fish"
		     :term-name "xterm-256color")
	  (:hostname "samba"
		     :shell "/usr/local/bin/fish"
		     :term-name "xterm-256color")))

  (defun my/get-server-config ()
    (seq-find (lambda (entry)
		(string-match (plist-get entry :hostname) default-directory))
	      my-env-config))

  (defun my/eat ()
    (interactive)
    (let* (
	   (config (my-get-server-config))
	   (hostname (plist-get config :hostname))
           (shell (plist-get config :shell))
           (term-name (plist-get config :term-name)))
      ;; Set eat-term-name dynamically for this session
      (let ((eat-term-name term-name))
	(eat shell)))))

(use-package completion-preview
  :straight nil
  :hook (prog-mode . completion-preview-mode)
  :bind
  (:map completion-preview-active-mode-map
	("M-n" . completion-preview-next-candidate)
	("M-p" . completion-preview-prev-candidate)))

(use-package nix-mode
  :mode "\\.nix\\'"
  :hook (nix-mode . eglot-ensure))

(use-package terraform-mode
  :mode ("\\.tf\\'" "\\.tfvars\\'")
  :hook (terraform-mode . eglot-ensure))

(use-package clojure-mode
  :mode ("\\.clj\\'" "\\.cljs\\'" "\\.cljc\\'"))

(use-package cider
  :after clojure-mode
  :hook (clojure-mode . cider-mode)
  :config
  (setq cider-repl-display-help-banner nil
        cider-show-error-buffer nil
        cider-save-file-on-load t))

(use-package paredit
  :hook ((clojure-mode . paredit-mode)
         (emacs-lisp-mode . paredit-mode)))

(use-package rainbow-delimiters
  :hook (clojure-mode . rainbow-delimiters-mode))

(use-package magit)

(use-package ox-reveal
  :after ox)

(use-package gptel)

(provide 'packages)

(setq
 gptel-model 'mistral:latest
 gptel-backend (gptel-make-ollama "Ollama"
                 :host "localhost:11434"
                 :stream t
                 :models '(mistral:latest)))
