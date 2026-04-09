;; load emacs built-in pac. man., so package-related variables and commands are available
(require 'package)
;; MELPA is a large 3rd party package repo for Emacs packages
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; open Magit status full fram by default
(setq magit-display-buffer-function
      #'magit-display-buffer-fullframe-status-v1)

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror)

;; if Magit is missing, refresh the archive and install the package
(unless (package-installed-p 'magit)
  (unless package-archive-contents
    (package-refresh-contents))
  (package-install 'magit))
