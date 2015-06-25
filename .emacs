;; Fix the delete key binding
(normal-erase-is-backspace-mode 1)

;; Set backup directory                                                                                                                                     
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
                `((".*" ,temporary-file-directory t)))

;; Add the MELPA repository
(require 'package) 
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; ido-mode
(ido-mode 1)
(ido-everywhere 1)

;; ido-ubiquitous
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; ido-vertical-mode
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; js2-mode
(add-hook 'js-mode-hook 'js2-minor-mode)

;; ac-js2
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; yas-snippet
;; should be loaded before auto complete so that they can work together
(add-to-list 'load-path
                "~/path-to-yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;;auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;; set the trigger key so that it can work together with yasnippet on tab key,
;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
