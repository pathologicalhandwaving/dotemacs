;;; init-elpa.el --- Initialize packages, see elpa/

;; Copyright (C) 2015 Mathieu Marques

;; Author: Mathieu Marques <mathieumarques78@gmail.com>
;; Created: 18 May 2015
;; Homepage: https://bitbucket.org/angrybacon/dotemacs

;;; Code:


;;=============================================================================
;; Initialize packages from Melpa
;;=============================================================================


(when (>= emacs-major-version 24)
  (setq-default
   load-prefer-newer t
   package-enable-at-startup nil)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (unless (package-installed-p 'delight)
    (package-refresh-contents)
    (package-install 'delight))
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)))
(eval-when-compile
  (require 'use-package)
  (setq-default
   use-package-always-defer t
   use-package-always-ensure t))


(provide 'init-elpa)
;;; init-elpa.el ends here
