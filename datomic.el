;;; datomic.el --- Datomic -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 Alex
;;
;; Author: John Doe <alex@violet.city>
;; Maintainer: John Doe <alex@violet.city>
;; Created: November 03, 2022
;; Modified: November 03, 2022
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/zehcnas34/emacs-datomic.git
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Datomi
;;
;;; Code:

(defgroup datomic nil
  "Manage and navigate projects easily."
  :group 'tools
  :group 'convenience
  :link '(url-link :tag "GitHub" "https://github.com/zehcnas34/emacs-datomic.git"))


(defcustom datomic-path "~/.opt/datomic-pro-1.0.6397"
  "Path to datomic installation."
  :type 'string
  :group 'zk)

(defcustom datomic-dev-transactor-config "dev-transactor.properties"
  "Configuration to use for devtransactor."
  :type 'string
  :group 'zk)

(defun datomic-transactor-path ()
  "Create transactor path."
  (concat datomic-path "/bin/transactor"))

(defun datomic-transactor-command ()
  "Create the transactor command."
  (concat (datomic-transactor-path) " " datomic-path "/config/" datomic-dev-transactor-config))


(defun datomic-start-dev-transactor ()
  "Start Datomic dev transactor."
  (interactive)
  (let* ((default-directory datomic-path)
         (config-path (concat "config/" datomic-dev-transactor-config)))
    (start-process
     "datomic:transactor" "*datomic:transactor*"
     (datomic-transactor-path) config-path)
    (message "started datomic process")))

(provide 'datomic)
;;; datomic.el ends here
