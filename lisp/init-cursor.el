;;; init-cursor.el --- Add helpers to move the cursor around

;; Copyright (C) 2015 Mathieu Marques

;; Author: Mathieu Marques <mathieumarques78@gmail.com>
;; Created: 16 May 2015
;; Homepage: https://bitbucket.org/angrybacon/dotemacs

;;; Code:


;;=============================================================================
;; Configure aggressive-indent
;;=============================================================================


;;https://github.com/Malabarba/aggressive-indent-mode
(use-package aggressive-indent
  :init (global-aggressive-indent-mode 1)
  :config
  (setq-default aggressive-indent-comments-too t)
  (add-to-list 'aggressive-indent-excluded-modes 'scss-mode))


;;=============================================================================
;; Configure expand-region
;;=============================================================================


;; https://github.com/magnars/expand-region.el
(use-package expand-region
  :bind ("C-=" . er/expand-region)
  :init (pending-delete-mode t))


;;=============================================================================
;; Configure multiple-cursors
;;=============================================================================


;; https://github.com/magnars/multiple-cursors.el
(use-package multiple-cursors
  :bind
  (("C-S-c C-S-c" . mc/edit-lines)
   ("C->" . mc/mark-next-like-this)
   ("C-<" . mc/mark-previous-like-this))
  :init (setq-default mc/list-file (expand-file-name ".multiple-cursors.el" user-emacs-directory)))


;;=============================================================================
;; Set key bindings
;;=============================================================================


(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "C-M-<left>") 'windmove-left)
(global-set-key (kbd "C-M-<right>") 'windmove-right)
(global-set-key (kbd "C-M-<up>") 'windmove-up)
(global-set-key (kbd "C-M-<down>") 'windmove-down)
(global-set-key (kbd "<C-up>") 'me/goto-previous-block)
(global-set-key (kbd "<C-down>") 'me/goto-next-block)
(global-set-key (kbd "<M-up>") 'me/swap-line-up)
(global-set-key (kbd "<M-down>") 'me/swap-line-down)


;;=============================================================================
;; Define helpers
;;=============================================================================


(defun me/goto-next-block ()
  "Jump to next paragraph."
  (interactive)
  (skip-chars-forward "\n")
  (when (not (search-forward-regexp "\n[[:blank:]]*\n" nil t)) (goto-char (point-max)))
  (skip-chars-forward "\n"))


(defun me/goto-previous-block ()
  "Jump to previous paragraph."
  (interactive)
  (skip-chars-backward "\n")
  (when (not (search-backward-regexp "\n[[:blank:]]*\n" nil t)) (goto-char (point-min)))
  (skip-chars-forward "\n"))


(defun me/swap-line-down ()
  "Move down the current line under point."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))


(defun me/swap-line-up ()
  "Move up the current line under point."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))


(provide 'init-cursor)
;;; init-cursor.el ends here
