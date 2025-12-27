(setq custom-file "~/.emacs.custom.el")

(setq-default inhibit-splash-screen t
	          make-backup-files nil
	      tab-width 4
	      indent-tabs-mode nil
	      compilation-scroll-output t
	      )

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(add-to-list 'load-path "~/.emacs.local/")

(add-to-list 'default-frame-alist
	     '(font . "JetBrainsMono Nerd Font Mono 16"))

(require 'simpc-mode)
(require 'smex)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(ido-mode 1)
(ido-everywhere 1)
(package-initialize)
(load-file custom-file)

