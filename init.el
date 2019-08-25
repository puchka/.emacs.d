(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize)
  (when (not package-archive-contents)
    (package-refresh-contents)
    (package-install 'use-package))
  (require 'use-package)

  (use-package ensime
	       :ensure t
	       :pin melpa-stable)
  )

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.cshtml\\'" . web-mode))

;; turn off splash screen
(setq inhibit-startup-message t)

;; turn off unnecessary UI
(menu-bar-mode 0)

(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

(add-to-list 'load-path "~/.emacs.d/vendor/jade-mode")
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.jade\\'" . jade-mode))

(add-to-list 'load-path "~/.emacs.d/vendor/php-mode")
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

(add-to-list 'load-path "~/.emacs.d/vendor/qml-mode")
(require 'qml-mode)
(add-to-list 'auto-mode-alist '("\\.qml\\'" . qml-mode))
