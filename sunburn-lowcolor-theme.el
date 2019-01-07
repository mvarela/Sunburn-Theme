;;; sunburn-desat-theme.el --- A low contrast color theme

;; Copyright © 2019 Martín Varela
;; Copyright (C) 2011016 Bozhidar Batsov (zenburn-theme.el)

;; Author: Martín Varela (martin@varela.fi)
;; URL: http://github.com/mvarela/Sunburn-Theme
;; Version: 1.0
;; Package-Requires: ((emacs "24"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A port of the popular Vim theme Zenburn for Emacs 24, built on top
;; of the new built-in theme support in Emacs 24.

;;; Credits:

;; This code is based off Bozhidar Batsov's port of the Zenburn theme

;;; Code:

(deftheme sunburn-lowcolor "The Sunburn-Lowcolor color theme")

;;; Color Palette

(defvar sunburn-lowcolor-default-colors-alist
  '(("sunburn-lowcolor-fg+1"     . "#f1f1f1")
    ("sunburn-lowcolor-fg"       . "#dbdae0")
    ("sunburn-lowcolor-bg"       . "#433844")
    ("sunburn-lowcolor-bg+1"     . "#686369")
    ("sunburn-lowcolor-bg+3"     . "#888389")
    ("sunburn-lowcolor-red"      . "#e4c2c2")
    ("sunburn-lowcolor-orange"   . "#eed4a4")
    ("sunburn-lowcolor-yellow"   . "#e8e8b7")
    ("sunburn-lowcolor-gold"     . "#eead0e")
    ("sunburn-lowcolor-green"    . "#ddecc4")
    ("sunburn-lowcolor-blue"   .   "#c0c0e9")
    ("sunburn-lowcolor-magenta"  . "#e3aae3"))
  "List of Sunburn-Lowcolor colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defvar sunburn-lowcolor-override-colors-alist
  '()
  "Place to override default theme colors.

You can override a subset of the theme's default colors by
defining them in this alist before loading the theme.")

(defvar sunburn-lowcolor-colors-alist
  (append sunburn-lowcolor-default-colors-alist sunburn-lowcolor-override-colors-alist))

(defmacro sunburn-lowcolor-with-color-variables (&rest body)
  "`let' bind all colors defined in `sunburn-lowcolor-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   sunburn-lowcolor-colors-alist))
     ,@body))

;;; Theme Faces
(sunburn-lowcolor-with-color-variables
  (custom-theme-set-faces
   'sunburn-lowcolor
;;;; Built-in
;;;;; basic coloring
   `(button ((t (:foreground ,sunburn-lowcolor-yellow :underline t))))
   `(widget-button ((t (:foreground ,sunburn-lowcolor-yellow :underline t))))
   `(link ((t (:foreground ,sunburn-lowcolor-yellow :underline t :weight bold))))
   `(link-visited ((t (:foreground ,sunburn-lowcolor-yellow :underline t :weight normal))))
   `(default ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg))))
   `(cursor ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-fg+1))))
   `(escape-glyph ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(fringe ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg+1))))
   `(header-line ((t (:foreground ,sunburn-lowcolor-yellow
                                  :background ,sunburn-lowcolor-bg
                                  :box (:line-width -1  :style released-button)))))
   `(highlight ((t (:background ,sunburn-lowcolor-bg))))
   `(success ((t (:foreground ,sunburn-lowcolor-green :weight bold))))
   `(warning ((t (:foreground ,sunburn-lowcolor-orange :weight bold))))
   `(tooltip ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg+1))))


   ;; Spaceline colors

   `(spaceline-evil-insert ((t (:foreground ,sunburn-lowcolor-green :weight bold))))
;;;;; compilation
   `(compilation-column-face ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(compilation-enter-directory-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(compilation-error-face ((t (:foreground ,sunburn-lowcolor-red :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(compilation-info-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(compilation-info ((t (:foreground ,sunburn-lowcolor-green :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(compilation-line-face ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(compilation-line-number ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(compilation-message-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(compilation-warning-face ((t (:foreground ,sunburn-lowcolor-orange :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,sunburn-lowcolor-green :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
;;;;; completions
   `(completions-annotations ((t (:foreground ,sunburn-lowcolor-fg))))
;;;;; grep
   `(grep-context-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(grep-error-face ((t (:foreground ,sunburn-lowcolor-red :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(grep-match-face ((t (:foreground ,sunburn-lowcolor-orange :weight bold))))
   `(match ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-orange :weight bold))))
;;;;; info
   `(Info-quoted ((t (:inherit font-lock-constant-face))))
;;;;; isearch
   `(isearch ((t (:foreground ,sunburn-lowcolor-yellow :weight bold :background ,sunburn-lowcolor-bg))))
   `(isearch-fail ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-red))))
   `(lazy-highlight ((t (:foreground ,sunburn-lowcolor-yellow :weight bold :background ,sunburn-lowcolor-bg))))

   `(menu ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg))))
   `(minibuffer-prompt ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-yellow))))
   `(mode-line
     ((,class (:foreground ,sunburn-lowcolor-fg+1
                           :background ,sunburn-lowcolor-bg
                           :box (:line-width -1  :style released-button)))
      (t :inverse-video t)))
   `(mode-line-buffer-id ((t (:foreground ,sunburn-lowcolor-fg :weight bold))))
   `(mode-line-inactive
     ((t (:foreground ,sunburn-lowcolor-blue
                      :background ,sunburn-lowcolor-bg
                      :box (:line-width -1 :style released-button)))))
   ;; `(region ((,class (:background ,sunburn-lowcolor-gold))
   ;;           (t :inverse-video t)))
   `(region ((t (:foreground ,sunburn-lowcolor-bg  :background ,sunburn-lowcolor-gold :reverse-video t))))
   `(secondary-selection ((t (:background ,sunburn-lowcolor-bg))))
   `(trailing-whitespace ((t (:background ,sunburn-lowcolor-red))))
   `(vertical-border ((t (:foreground ,sunburn-lowcolor-fg))))
;;;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,sunburn-lowcolor-fg, :weight bold))))
   `(font-lock-comment-face ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-bg+3))))
   `(font-lock-comment-delimiter-face ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-bg+3))))
   `(font-lock-constant-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(font-lock-doc-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(font-lock-function-name-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(font-lock-keyword-face ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,sunburn-lowcolor-green :weight bold))))
   `(font-lock-string-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(font-lock-type-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(font-lock-variable-name-face ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(font-lock-warning-face ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))
;;;;; newsticker
   `(newsticker-date-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(newsticker-default-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(newsticker-enclosure-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(newsticker-extra-face ((t (:foreground ,sunburn-lowcolor-bg :height 0.8))))
   `(newsticker-feed-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(newsticker-immortal-item-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(newsticker-new-item-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(newsticker-obsolete-item-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(newsticker-old-item-face ((t (:foreground ,sunburn-lowcolor-bg+3))))
   `(newsticker-statistics-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(newsticker-treeview-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(newsticker-treeview-immortal-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(newsticker-treeview-listwindow-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(newsticker-treeview-new-face ((t (:foreground ,sunburn-lowcolor-blue :weight bold))))
   `(newsticker-treeview-obsolete-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(newsticker-treeview-old-face ((t (:foreground ,sunburn-lowcolor-bg+3))))
   `(newsticker-treeview-selection-face ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-yellow))))
;;;; Third-party
;;;;; ace-jump
   `(ace-jump-face-background
     ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg :inverse-video nil))))
   `(ace-jump-face-foreground
     ((t (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-bg :inverse-video nil))))
;;;;; ace-window
   `(aw-background-face
     ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg :inverse-video nil))))
   `(aw-leading-char-face ((t (:inherit aw-mode-line-face))))
;;;;; android mode
   `(android-mode-debug-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(android-mode-error-face ((t (:foreground ,sunburn-lowcolor-orange :weight bold))))
   `(android-mode-info-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(android-mode-verbose-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(android-mode-warning-face ((t (:foreground ,sunburn-lowcolor-yellow))))
;;;;; anzu
   `(anzu-mode-line ((t (:foreground ,sunburn-lowcolor-blue :weight bold))))
   `(anzu-mode-line-no-match ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(anzu-match ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-green))))
   `(anzu-match ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-orange))))
   `(anzu-match ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-blue))))
   `(anzu-replace-to ((t (:inherit anzu-replace-highlight :foreground ,sunburn-lowcolor-yellow))))
;;;;; auctex
   `(font-latex-bold-face ((t (:inherit bold))))
   `(font-latex-warning-face ((t (:foreground nil :inherit font-lock-warning-face))))
   `(font-latex-slide-title-face ((t (:foreground ,sunburn-lowcolor-blue :weight bold :scale 1.3))))
   `(font-latex-sectioning-0-face ((t (:foreground ,sunburn-lowcolor-yellow :weight bold :scale 1.3))))
   `(font-latex-sectioning-face ((t (:foreground ,sunburn-lowcolor-blue :weight bold :scale 1.2))))
   `(font-latex-sectioning-face ((t (:foreground ,sunburn-lowcolor-orange :weight bold :scale 1.1))))
   `(font-latex-sectioning-face ((t (:foreground ,sunburn-lowcolor-blue :weight bold ))))
   `(font-latex-sectioning-face ((t (:foreground ,sunburn-lowcolor-green :weight bold ))))
   `(font-latex-sectioning-face ((t (:foreground ,sunburn-lowcolor-red :weight bold ))))
   `(font-latex-verbatim-face ((t (:foreground ,sunburn-lowcolor-blue :weight bold ))))
   `(font-latex-sedate-face ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(font-latex-italic-face ((t (:foreground ,sunburn-lowcolor-blue :slant italic))))
   `(font-latex-string-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(font-latex-math-face ((t (:foreground ,sunburn-lowcolor-orange))))
;;;;; agda-mode
   `(agda2-highlight-keyword-face ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(agda2-highlight-string-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(agda2-highlight-symbol-face ((t (:foreground ,sunburn-lowcolor-orange))))
   `(agda2-highlight-primitive-type-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(agda2-highlight-inductive-constructor-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(agda2-highlight-coinductive-constructor-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(agda2-highlight-datatype-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(agda2-highlight-function-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(agda2-highlight-module-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(agda2-highlight-error-face ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-magenta))))
   `(agda2-highlight-unsolved-meta-face ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-magenta))))
   `(agda2-highlight-unsolved-constraint-face ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-magenta))))
   `(agda2-highlight-termination-problem-face ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-magenta))))
   `(agda2-highlight-incomplete-pattern-face ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-magenta))))
   `(agda2-highlight-typechecks-face ((t (:background ,sunburn-lowcolor-red))))
;;;;; auto-complete
   `(ac-candidate-face ((t (:background ,sunburn-lowcolor-bg+3 :foreground ,sunburn-lowcolor-bg))))
   `(ac-selection-face ((t (:background ,sunburn-lowcolor-blue :foreground ,sunburn-lowcolor-fg))))
   `(popup-tip-face ((t (:background ,sunburn-lowcolor-yellow :foreground ,sunburn-lowcolor-bg))))
   `(popup-menu-mouse-face ((t (:background ,sunburn-lowcolor-yellow :foreground ,sunburn-lowcolor-bg))))
   `(popup-summary-face ((t (:background ,sunburn-lowcolor-bg+3 :foreground ,sunburn-lowcolor-bg))))
   `(popup-scroll-bar-foreground-face ((t (:background ,sunburn-lowcolor-blue))))
   `(popup-scroll-bar-background-face ((t (:background ,sunburn-lowcolor-bg))))
   `(popup-isearch-match ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-fg))))
;;;;; avy
   `(avy-background-face
     ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg :inverse-video nil))))
   `(avy-lead-face-0
     ((t (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-bg :inverse-video nil :weight bold))))
   `(avy-lead-face
     ((t (:foreground ,sunburn-lowcolor-yellow :background ,sunburn-lowcolor-bg :inverse-video nil :weight bold))))
   `(avy-lead-face
     ((t (:foreground ,sunburn-lowcolor-red :background ,sunburn-lowcolor-bg :inverse-video nil :weight bold))))
   `(avy-lead-face
     ((t (:foreground ,sunburn-lowcolor-blue :background ,sunburn-lowcolor-bg :inverse-video nil :weight bold))))
;;;;; company-mode
   `(company-tooltip ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg+1))))
   `(company-tooltip-annotation ((t (:foreground ,sunburn-lowcolor-orange :background ,sunburn-lowcolor-bg+1))))
   `(company-tooltip-annotation-selection ((t (:foreground ,sunburn-lowcolor-orange :background ,sunburn-lowcolor-bg))))
   `(company-tooltip-selection ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg))))
   `(company-tooltip-mouse ((t (:background ,sunburn-lowcolor-bg))))
   `(company-tooltip-common ((t (:foreground ,sunburn-lowcolor-green))))
   `(company-tooltip-common-selection ((t (:foreground ,sunburn-lowcolor-green))))
   `(company-scrollbar-fg ((t (:background ,sunburn-lowcolor-bg))))
   `(company-scrollbar-bg ((t (:background ,sunburn-lowcolor-bg))))
   `(company-preview ((t (:background ,sunburn-lowcolor-green))))
   `(company-preview-common ((t (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-bg))))
;;;;; bm
   `(bm-face ((t (:background ,sunburn-lowcolor-yellow :foreground ,sunburn-lowcolor-bg))))
   `(bm-fringe-face ((t (:background ,sunburn-lowcolor-yellow :foreground ,sunburn-lowcolor-bg))))
   `(bm-fringe-persistent-face ((t (:background ,sunburn-lowcolor-green :foreground ,sunburn-lowcolor-bg))))
   `(bm-persistent-face ((t (:background ,sunburn-lowcolor-green :foreground ,sunburn-lowcolor-bg))))
;;;;; calfw
   `(cfw:face-annotation ((t (:foreground ,sunburn-lowcolor-red :inherit cfw:face-day-title))))
   `(cfw:face-day-title ((t nil)))
   `(cfw:face-default-content ((t (:foreground ,sunburn-lowcolor-green))))
   `(cfw:face-default-day ((t (:weight bold))))
   `(cfw:face-disable ((t (:foreground ,sunburn-lowcolor-fg))))
   `(cfw:face-grid ((t (:inherit shadow))))
   `(cfw:face-header ((t (:inherit font-lock-keyword-face))))
   `(cfw:face-holiday ((t (:inherit cfw:face-sunday))))
   `(cfw:face-periods ((t (:foreground ,sunburn-lowcolor-blue))))
   `(cfw:face-saturday ((t (:foreground ,sunburn-lowcolor-blue :weight bold))))
   `(cfw:face-select ((t (:background ,sunburn-lowcolor-blue))))
   `(cfw:face-sunday ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(cfw:face-title ((t (:height 2.0 :inherit (variable-pitch font-lock-keyword-face)))))
   `(cfw:face-today ((t (:foreground ,sunburn-lowcolor-blue :weight bold))))
   `(cfw:face-today-title ((t (:inherit highlight bold))))
   `(cfw:face-toolbar ((t (:background ,sunburn-lowcolor-blue))))
   `(cfw:face-toolbar-button-off ((t (:underline nil :inherit link))))
   `(cfw:face-toolbar-button-on ((t (:underline nil :inherit link-visited))))
;;;;; cider
   `(cider-result-overlay-face ((t (:background unspecified))))
   `(cider-enlightened-face ((t (:box (:color ,sunburn-lowcolor-orange :line-width -1 )))))
   `(cider-enlightened-local-face ((t (:weight bold :foreground ,sunburn-lowcolor-green))))
   `(cider-deprecated-face ((t (:background ,sunburn-lowcolor-yellow))))
   `(cider-instrumented-face ((t (:box (:color ,sunburn-lowcolor-red :line-width -1)))))
   `(cider-traced-face ((t (:box (:color ,sunburn-lowcolor-blue :line-width -1)))))
   `(cider-test-failure-face ((t (:background ,sunburn-lowcolor-red))))
   `(cider-test-error-face ((t (:background ,sunburn-lowcolor-magenta))))
   `(cider-test-success-face ((t (:background ,sunburn-lowcolor-green))))
;;;;; circe
   `(circe-highlight-nick-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(circe-my-message-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(circe-fool-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(circe-topic-diff-removed-face ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(circe-originator-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(circe-server-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(circe-topic-diff-new-face ((t (:foreground ,sunburn-lowcolor-orange :weight bold))))
   `(circe-prompt-face ((t (:foreground ,sunburn-lowcolor-orange :background ,sunburn-lowcolor-bg :weight bold))))
;;;;; context-coloring
   `(context-coloring-level-0-face ((t :foreground ,sunburn-lowcolor-fg)))
   `(context-coloring-level-face ((t :foreground ,sunburn-lowcolor-blue)))
   `(context-coloring-level-face ((t :foreground ,sunburn-lowcolor-green)))
   `(context-coloring-level-face ((t :foreground ,sunburn-lowcolor-yellow)))
   `(context-coloring-level-face ((t :foreground ,sunburn-lowcolor-orange)))
   `(context-coloring-level-face ((t :foreground ,sunburn-lowcolor-magenta)))
   `(context-coloring-level-6-face ((t :foreground ,sunburn-lowcolor-blue)))
   `(context-coloring-level-7-face ((t :foreground ,sunburn-lowcolor-green)))
   `(context-coloring-level-8-face ((t :foreground ,sunburn-lowcolor-yellow)))
   `(context-coloring-level-9-face ((t :foreground ,sunburn-lowcolor-red)))
;;;;; coq
   `(coq-solve-tactics-face ((t (:foreground nil :inherit font-lock-constant-face))))
;;;;; ctable
   `(ctbl:face-cell-select ((t (:background ,sunburn-lowcolor-blue :foreground ,sunburn-lowcolor-bg))))
   `(ctbl:face-continue-bar ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-bg))))
   `(ctbl:face-row-select ((t (:background ,sunburn-lowcolor-blue :foreground ,sunburn-lowcolor-bg))))
;;;;; debbugs
   `(debbugs-gnu-done ((t (:foreground ,sunburn-lowcolor-fg))))
   `(debbugs-gnu-handled ((t (:foreground ,sunburn-lowcolor-green))))
   `(debbugs-gnu-new ((t (:foreground ,sunburn-lowcolor-red))))
   `(debbugs-gnu-pending ((t (:foreground ,sunburn-lowcolor-blue))))
   `(debbugs-gnu-stale ((t (:foreground ,sunburn-lowcolor-orange))))
   `(debbugs-gnu-tagged ((t (:foreground ,sunburn-lowcolor-red))))
;;;;; diff
   `(diff-added          ((t (:background "#335533" :foreground ,sunburn-lowcolor-green))))
   `(diff-changed        ((t (:background "#555511" :foreground ,sunburn-lowcolor-yellow))))
   `(diff-removed        ((t (:background "#553333" :foreground ,sunburn-lowcolor-red))))
   `(diff-refine-added   ((t (:background "#338833" :foreground ,sunburn-lowcolor-green))))
   `(diff-refine-change  ((t (:background "#888811" :foreground ,sunburn-lowcolor-yellow))))
   `(diff-refine-removed ((t (:background "#883333" :foreground ,sunburn-lowcolor-red))))
   `(diff-header ((,class (:background ,sunburn-lowcolor-bg))
                  (t (:background ,sunburn-lowcolor-fg :foreground ,sunburn-lowcolor-bg))))
   `(diff-file-header
     ((,class (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-fg :weight bold))
      (t (:background ,sunburn-lowcolor-fg :foreground ,sunburn-lowcolor-bg :weight bold))))
;;;;; diff-hl
   `(diff-hl-change ((,class (:foreground ,sunburn-lowcolor-blue :background ,sunburn-lowcolor-blue))))
   `(diff-hl-delete ((,class (:foreground ,sunburn-lowcolor-red :background ,sunburn-lowcolor-red))))
   `(diff-hl-insert ((,class (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-green))))
;;;;; dim-autoload
   `(dim-autoload-cookie-line ((t :foreground ,sunburn-lowcolor-bg+1)))
;;;;; dired+
   `(diredp-display-msg ((t (:foreground ,sunburn-lowcolor-blue))))
   `(diredp-compressed-file-suffix ((t (:foreground ,sunburn-lowcolor-orange))))
   `(diredp-date-time ((t (:foreground ,sunburn-lowcolor-magenta))))
   `(diredp-deletion ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(diredp-deletion-file-name ((t (:foreground ,sunburn-lowcolor-red))))
   `(diredp-dir-heading ((t (:foreground ,sunburn-lowcolor-blue :background ,sunburn-lowcolor-bg))))
   `(diredp-dir-priv ((t (:foreground ,sunburn-lowcolor-blue))))
   `(diredp-exec-priv ((t (:foreground ,sunburn-lowcolor-red))))
   `(diredp-executable-tag ((t (:foreground ,sunburn-lowcolor-green))))
   `(diredp-file-name ((t (:foreground ,sunburn-lowcolor-blue))))
   `(diredp-file-suffix ((t (:foreground ,sunburn-lowcolor-green))))
   `(diredp-flag-mark ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(diredp-flag-mark-line ((t (:foreground ,sunburn-lowcolor-orange))))
   `(diredp-ignored-file-name ((t (:foreground ,sunburn-lowcolor-red))))
   `(diredp-link-priv ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(diredp-mode-line-flagged ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(diredp-mode-line-marked ((t (:foreground ,sunburn-lowcolor-orange))))
   `(diredp-no-priv ((t (:foreground ,sunburn-lowcolor-fg))))
   `(diredp-number ((t (:foreground ,sunburn-lowcolor-green))))
   `(diredp-other-priv ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(diredp-rare-priv ((t (:foreground ,sunburn-lowcolor-red))))
   `(diredp-read-priv ((t (:foreground ,sunburn-lowcolor-green))))
   `(diredp-symlink ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(diredp-write-priv ((t (:foreground ,sunburn-lowcolor-magenta))))
;;;;; dired-async
   `(dired-async-failures ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(dired-async-message ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(dired-async-mode-message ((t (:foreground ,sunburn-lowcolor-yellow))))
;;;;; ediff
   `(ediff-current-diff-A ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-red))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-red))))
   `(ediff-current-diff-B ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-green))))
   `(ediff-current-diff-C ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-blue))))
   `(ediff-even-diff-A ((t (:background ,sunburn-lowcolor-bg+1))))
   `(ediff-even-diff-Ancestor ((t (:background ,sunburn-lowcolor-bg+1))))
   `(ediff-even-diff-B ((t (:background ,sunburn-lowcolor-bg+1))))
   `(ediff-even-diff-C ((t (:background ,sunburn-lowcolor-bg+1))))
   `(ediff-fine-diff-A ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-red :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-red weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-green :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-blue :weight bold ))))
   `(ediff-odd-diff-A ((t (:background ,sunburn-lowcolor-bg))))
   `(ediff-odd-diff-Ancestor ((t (:background ,sunburn-lowcolor-bg))))
   `(ediff-odd-diff-B ((t (:background ,sunburn-lowcolor-bg))))
   `(ediff-odd-diff-C ((t (:background ,sunburn-lowcolor-bg))))
;;;;; egg
   `(egg-text-base ((t (:foreground ,sunburn-lowcolor-fg))))
   `(egg-help-header ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(egg-help-header ((t (:foreground ,sunburn-lowcolor-green))))
   `(egg-branch ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(egg-branch-mono ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(egg-term ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(egg-diff-add ((t (:foreground ,sunburn-lowcolor-green))))
   `(egg-diff-del ((t (:foreground ,sunburn-lowcolor-red))))
   `(egg-diff-file-header ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(egg-section-title ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(egg-stash-mono ((t (:foreground ,sunburn-lowcolor-green))))
;;;;; elfeed
   `(elfeed-log-error-level-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(elfeed-log-info-level-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(elfeed-log-warn-level-face ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(elfeed-search-date-face ((t (:foreground ,sunburn-lowcolor-yellow :underline t
                                              :weight bold))))
   `(elfeed-search-tag-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(elfeed-search-feed-face ((t (:foreground ,sunburn-lowcolor-blue))))
;;;;; emacs-w3m
   `(w3m-anchor ((t (:foreground ,sunburn-lowcolor-yellow :underline t
                                 :weight bold))))
   `(w3m-arrived-anchor ((t (:foreground ,sunburn-lowcolor-yellow
                                         :underline t :weight normal))))
   `(w3m-form ((t (:foreground ,sunburn-lowcolor-red :underline t))))
   `(w3m-header-line-location-title ((t (:foreground ,sunburn-lowcolor-yellow
                                                     :underline t :weight bold))))
   '(w3m-history-current-url ((t (:inherit match))))
   `(w3m-lnum ((t (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-bg))))
   `(w3m-lnum-match ((t (:background ,sunburn-lowcolor-bg
                                     :foreground ,sunburn-lowcolor-orange
                                     :weight bold))))
   `(w3m-lnum-minibuffer-prompt ((t (:foreground ,sunburn-lowcolor-yellow))))
;;;;; erc
   `(erc-action-face ((t (:inherit erc-default-face))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,sunburn-lowcolor-blue :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
   `(erc-default-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(erc-direct-msg-face ((t (:inherit erc-default-face))))
   `(erc-error-face ((t (:inherit font-lock-warning-face))))
   `(erc-fool-face ((t (:inherit erc-default-face))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(erc-keyword-face ((t (:foreground ,sunburn-lowcolor-blue :weight bold))))
   `(erc-nick-default-face ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(erc-my-nick-face ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(erc-nick-msg-face ((t (:inherit erc-default-face))))
   `(erc-notice-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(erc-pal-face ((t (:foreground ,sunburn-lowcolor-orange :weight bold))))
   `(erc-prompt-face ((t (:foreground ,sunburn-lowcolor-orange :background ,sunburn-lowcolor-bg :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(erc-underline-face ((t (:underline t))))
;;;;; eros
   `(eros-result-overlay-face ((t (:background unspecified))))
;;;;; ert
   `(ert-test-result-expected ((t (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-bg))))
   `(ert-test-result-unexpected ((t (:foreground ,sunburn-lowcolor-red :background ,sunburn-lowcolor-bg))))
;;;;; eshell
   `(eshell-prompt ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,sunburn-lowcolor-blue :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,sunburn-lowcolor-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,sunburn-lowcolor-blue :weight bold))))
;;;;; flx
   `(flx-highlight-face ((t (:foreground ,sunburn-lowcolor-green :weight bold))))
;;;;; flycheck
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,sunburn-lowcolor-red) :inherit unspecified))
      (t (:foreground ,sunburn-lowcolor-red :weight bold :underline t))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,sunburn-lowcolor-yellow) :inherit unspecified))
      (t (:foreground ,sunburn-lowcolor-yellow :weight bold :underline t))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,sunburn-lowcolor-blue) :inherit unspecified))
      (t (:foreground ,sunburn-lowcolor-blue :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,sunburn-lowcolor-blue :weight bold))))
;;;;; flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,sunburn-lowcolor-red)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,sunburn-lowcolor-red :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,sunburn-lowcolor-orange)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,sunburn-lowcolor-orange :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,sunburn-lowcolor-green)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,sunburn-lowcolor-green :weight bold :underline t))))
;;;;; flyspell
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,sunburn-lowcolor-orange) :inherit unspecified))
      (t (:foreground ,sunburn-lowcolor-orange :weight bold :underline t))))
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,sunburn-lowcolor-red) :inherit unspecified))
      (t (:foreground ,sunburn-lowcolor-red :weight bold :underline t))))
;;;;; full-ack
   `(ack-separator ((t (:foreground ,sunburn-lowcolor-fg))))
   `(ack-file ((t (:foreground ,sunburn-lowcolor-blue))))
   `(ack-line ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(ack-match ((t (:foreground ,sunburn-lowcolor-orange :background ,sunburn-lowcolor-bg :weight bold))))
;;;;; git-commit
   `(git-commit-comment-action  ((,class (:foreground ,sunburn-lowcolor-green :weight bold))))
   `(git-commit-comment-branch  ((,class (:foreground ,sunburn-lowcolor-blue  :weight bold))))
   `(git-commit-comment-heading ((,class (:foreground ,sunburn-lowcolor-yellow  :weight bold))))
;;;;; git-gutter
   `(git-gutter:added ((t (:foreground ,sunburn-lowcolor-green :weight bold :inverse-video t))))
   `(git-gutter:deleted ((t (:foreground ,sunburn-lowcolor-red :weight bold :inverse-video t))))
   `(git-gutter:modified ((t (:foreground ,sunburn-lowcolor-magenta :weight bold :inverse-video t))))
   `(git-gutter:unchanged ((t (:foreground ,sunburn-lowcolor-fg :weight bold :inverse-video t))))
;;;;; git-gutter-fr
   `(git-gutter-fr:added ((t (:foreground ,sunburn-lowcolor-green  :weight bold))))
   `(git-gutter-fr:deleted ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(git-gutter-fr:modified ((t (:foreground ,sunburn-lowcolor-magenta :weight bold))))
;;;;; git-rebase
   `(git-rebase-hash ((t (:foreground, sunburn-lowcolor-orange))))
;;;;; gnus
   `(gnus-group-mail ((t (:weight bold :inherit gnus-group-mail-empty))))
   `(gnus-group-mail-empty ((t (:inherit gnus-group-news-empty))))
   `(gnus-group-mail ((t (:weight bold :inherit gnus-group-mail-empty))))
   `(gnus-group-mail-empty ((t (:inherit gnus-group-news-empty))))
   `(gnus-group-mail ((t (:weight bold :inherit gnus-group-mail-empty))))
   `(gnus-group-mail-empty ((t (:inherit gnus-group-news-empty))))
   `(gnus-group-mail ((t (:weight bold :inherit gnus-group-mail-empty))))
   `(gnus-group-mail-empty ((t (:inherit gnus-group-news-empty))))
   `(gnus-group-mail ((t (:weight bold :inherit gnus-group-mail-empty))))
   `(gnus-group-mail-empty ((t (:inherit gnus-group-news-empty))))
   `(gnus-group-mail-6 ((t (:weight bold :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((t (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((t (:weight bold :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((t (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news ((t (:weight bold :inherit gnus-group-news-empty))))
   `(gnus-group-news ((t (:weight bold :inherit gnus-group-news-empty))))
   `(gnus-group-news ((t (:weight bold :inherit gnus-group-news-empty))))
   `(gnus-group-news ((t (:weight bold :inherit gnus-group-news-empty))))
   `(gnus-group-news ((t (:weight bold :inherit gnus-group-news-empty))))
   `(gnus-group-news-6 ((t (:weight bold :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((t (:weight bold :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((t (:inherit message-header-other))))
   `(gnus-header-from ((t (:inherit message-header-to))))
   `(gnus-header-name ((t (:inherit message-header-name))))
   `(gnus-header-newsgroups ((t (:inherit message-header-other))))
   `(gnus-header-subject ((t (:inherit message-header-subject))))
   `(gnus-server-opened ((t (:foreground ,sunburn-lowcolor-green :weight bold))))
   `(gnus-server-denied ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(gnus-server-closed ((t (:foreground ,sunburn-lowcolor-blue :slant italic))))
   `(gnus-server-offline ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(gnus-server-agent ((t (:foreground ,sunburn-lowcolor-blue :weight bold))))
   `(gnus-summary-cancelled ((t (:foreground ,sunburn-lowcolor-orange))))
   `(gnus-summary-high-ancient ((t (:foreground ,sunburn-lowcolor-blue))))
   `(gnus-summary-high-read ((t (:foreground ,sunburn-lowcolor-green :weight bold))))
   `(gnus-summary-high-ticked ((t (:foreground ,sunburn-lowcolor-orange :weight bold))))
   `(gnus-summary-high-unread ((t (:foreground ,sunburn-lowcolor-fg :weight bold))))
   `(gnus-summary-low-ancient ((t (:foreground ,sunburn-lowcolor-blue))))
   `(gnus-summary-low-read ((t (:foreground ,sunburn-lowcolor-green))))
   `(gnus-summary-low-ticked ((t (:foreground ,sunburn-lowcolor-orange :weight bold))))
   `(gnus-summary-low-unread ((t (:foreground ,sunburn-lowcolor-fg))))
   `(gnus-summary-normal-ancient ((t (:foreground ,sunburn-lowcolor-blue))))
   `(gnus-summary-normal-read ((t (:foreground ,sunburn-lowcolor-green))))
   `(gnus-summary-normal-ticked ((t (:foreground ,sunburn-lowcolor-orange :weight bold))))
   `(gnus-summary-normal-unread ((t (:foreground ,sunburn-lowcolor-fg))))
   `(gnus-summary-selected ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(gnus-cite ((t (:foreground ,sunburn-lowcolor-blue))))
   `(gnus-cite0 ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(gnus-cite1 ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(gnus-cite ((t (:foreground ,sunburn-lowcolor-blue))))
   `(gnus-cite ((t (:foreground ,sunburn-lowcolor-blue))))
   `(gnus-cite ((t (:foreground ,sunburn-lowcolor-green))))
   `(gnus-cite ((t (:foreground ,sunburn-lowcolor-green))))
   `(gnus-cite-6 ((t (:foreground ,sunburn-lowcolor-green))))
   `(gnus-cite-7 ((t (:foreground ,sunburn-lowcolor-red))))
   `(gnus-cite-8 ((t (:foreground ,sunburn-lowcolor-red))))
   `(gnus-cite-9 ((t (:foreground ,sunburn-lowcolor-red))))
   `(gnus-group-news-empty ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(gnus-group-news-empty ((t (:foreground ,sunburn-lowcolor-green))))
   `(gnus-group-news-empty ((t (:foreground ,sunburn-lowcolor-green))))
   `(gnus-group-news-empty ((t (:foreground ,sunburn-lowcolor-blue))))
   `(gnus-group-news-empty ((t (:foreground ,sunburn-lowcolor-blue))))
   `(gnus-group-news-6-empty ((t (:foreground ,sunburn-lowcolor-bg))))
   `(gnus-group-news-low-empty ((t (:foreground ,sunburn-lowcolor-bg))))
   `(gnus-signature ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(gnus-x ((t (:background ,sunburn-lowcolor-fg :foreground ,sunburn-lowcolor-bg))))
;;;;; guide-key
   `(guide-key/highlight-command-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(guide-key/key-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(guide-key/prefix-command-face ((t (:foreground ,sunburn-lowcolor-green))))
;;;;; helm
   `(helm-header
     ((t (:foreground ,sunburn-lowcolor-green
                      :background ,sunburn-lowcolor-bg
                      :underline nil
                      :box nil))))
   `(helm-source-header
     ((t (:foreground ,sunburn-lowcolor-yellow
                      :background ,sunburn-lowcolor-bg
                      :underline nil
                      :weight bold
                      :box (:line-width -1  :style released-button)))))
   `(helm-selection ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-gold :weight bold))))
   `(helm-selection-line ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-gold :weight bold))))
   `(helm-visible-mark ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-yellow))))
   `(helm-candidate-number ((t (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-bg))))
   `(helm-separator ((t (:foreground ,sunburn-lowcolor-red :background ,sunburn-lowcolor-bg))))
   `(helm-time-zone-current ((t (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-bg))))
   `(helm-time-zone-home ((t (:foreground ,sunburn-lowcolor-red :background ,sunburn-lowcolor-bg))))
   `(helm-bookmark-addressbook ((t (:foreground ,sunburn-lowcolor-orange :background ,sunburn-lowcolor-bg))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,sunburn-lowcolor-magenta :background ,sunburn-lowcolor-bg))))
   `(helm-bookmark-info ((t (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-bg))))
   `(helm-bookmark-man ((t (:foreground ,sunburn-lowcolor-yellow :background ,sunburn-lowcolor-bg))))
   `(helm-bookmark-w3m ((t (:foreground ,sunburn-lowcolor-magenta :background ,sunburn-lowcolor-bg))))
   `(helm-buffer-not-saved ((t (:foreground ,sunburn-lowcolor-red :background ,sunburn-lowcolor-bg))))
   `(helm-buffer-process ((t (:foreground ,sunburn-lowcolor-blue :background ,sunburn-lowcolor-bg))))
   `(helm-buffer-saved-out ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg))))
   `(helm-buffer-size ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg))))
   `(helm-ff-directory ((t (:foreground ,sunburn-lowcolor-blue :background ,sunburn-lowcolor-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,sunburn-lowcolor-red :background ,sunburn-lowcolor-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,sunburn-lowcolor-yellow :background ,sunburn-lowcolor-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-yellow :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,sunburn-lowcolor-blue :background ,sunburn-lowcolor-bg))))
   `(helm-grep-file ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg))))
   `(helm-grep-finish ((t (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-bg))))
   `(helm-grep-lineno ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,sunburn-lowcolor-red :background ,sunburn-lowcolor-bg))))
   `(helm-match ((t (:foreground ,sunburn-lowcolor-orange :background ,sunburn-lowcolor-bg :weight bold))))
   `(helm-moccur-buffer ((t (:foreground ,sunburn-lowcolor-blue :background ,sunburn-lowcolor-bg))))
   `(helm-mu-contacts-address-face ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg))))
   `(helm-mu-contacts-name-face ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg))))
;;;;; helm-swoop
   `(helm-swoop-target-line-face ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg+1))))
   `(helm-swoop-target-word-face ((t (:foreground ,sunburn-lowcolor-yellow :background ,sunburn-lowcolor-bg :weight bold))))
;;;;; hl-line-mode
   `(hl-line-face ((,class (:background ,sunburn-lowcolor-bg))
                   (t :weight bold)))
   `(hl-line ((,class (:background ,sunburn-lowcolor-bg)) ; old emacsen
              (t :weight bold)))
;;;;; hl-sexp
   `(hl-sexp-face ((,class (:background ,sunburn-lowcolor-bg+1))
                   (t :weight bold)))
;;;;; hydra
   `(hydra-face-red ((t (:foreground ,sunburn-lowcolor-red :background ,sunburn-lowcolor-bg))))
   `(hydra-face-amaranth ((t (:foreground ,sunburn-lowcolor-red :background ,sunburn-lowcolor-bg))))
   `(hydra-face-blue ((t (:foreground ,sunburn-lowcolor-blue :background ,sunburn-lowcolor-bg))))
   `(hydra-face-pink ((t (:foreground ,sunburn-lowcolor-magenta :background ,sunburn-lowcolor-bg))))
   `(hydra-face-teal ((t (:foreground ,sunburn-lowcolor-blue :background ,sunburn-lowcolor-bg))))
;;;;; irfc
   `(irfc-head-name-face ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(irfc-head-number-face ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(irfc-reference-face ((t (:foreground ,sunburn-lowcolor-blue :weight bold))))
   `(irfc-requirement-keyword-face ((t (:inherit font-lock-keyword-face))))
   `(irfc-rfc-link-face ((t (:inherit link))))
   `(irfc-rfc-number-face ((t (:foreground ,sunburn-lowcolor-blue :weight bold))))
   `(irfc-std-number-face ((t (:foreground ,sunburn-lowcolor-green :weight bold))))
   `(irfc-table-item-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(irfc-title-face ((t (:foreground ,sunburn-lowcolor-yellow
                                      :underline t :weight bold))))
;;;;; ivy
   `(ivy-confirm-face ((t (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-bg))))
   `(ivy-match-required-face ((t (:foreground ,sunburn-lowcolor-red :background ,sunburn-lowcolor-bg))))
   `(ivy-remote ((t (:foreground ,sunburn-lowcolor-blue :background ,sunburn-lowcolor-bg))))
   `(ivy-subdir ((t (:foreground ,sunburn-lowcolor-yellow :background ,sunburn-lowcolor-bg))))
   `(ivy-current-match ((t (:foreground ,sunburn-lowcolor-yellow :weight bold :underline t))))
   `(ivy-minibuffer-match-face ((t (:background ,sunburn-lowcolor-bg+1))))
   `(ivy-minibuffer-match-face ((t (:background ,sunburn-lowcolor-green))))
   `(ivy-minibuffer-match-face ((t (:background ,sunburn-lowcolor-green))))
   `(ivy-minibuffer-match-face ((t (:background ,sunburn-lowcolor-green))))
;;;;; ido-mode
   `(ido-first-match ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(ido-only-match ((t (:foreground ,sunburn-lowcolor-orange :weight bold))))
   `(ido-subdir ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(ido-indicator ((t (:foreground ,sunburn-lowcolor-yellow :background ,sunburn-lowcolor-red))))
;;;;; iedit-mode
   `(iedit-occurrence ((t (:background ,sunburn-lowcolor-bg :weight bold))))
;;;;; jabber-mode
   `(jabber-roster-user-away ((t (:foreground ,sunburn-lowcolor-green))))
   `(jabber-roster-user-online ((t (:foreground ,sunburn-lowcolor-blue))))
   `(jabber-roster-user-dnd ((t (:foreground ,sunburn-lowcolor-red))))
   `(jabber-roster-user-xa ((t (:foreground ,sunburn-lowcolor-magenta))))
   `(jabber-roster-user-chatty ((t (:foreground ,sunburn-lowcolor-orange))))
   `(jabber-roster-user-error ((t (:foreground ,sunburn-lowcolor-red))))
   `(jabber-rare-time-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(jabber-chat-prompt-local ((t (:foreground ,sunburn-lowcolor-blue))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,sunburn-lowcolor-red))))
   `(jabber-chat-prompt-system ((t (:foreground ,sunburn-lowcolor-green))))
   `(jabber-activity-face((t (:foreground ,sunburn-lowcolor-red))))
   `(jabber-activity-personal-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(jabber-title-small ((t (:height 1.1 :weight bold))))
   `(jabber-title-medium ((t (:height 1.2 :weight bold))))
   `(jabber-title-large ((t (:height 1.3 :weight bold))))
;;;;; js2-mode
   `(js2-warning ((t (:underline ,sunburn-lowcolor-orange))))
   `(js2-error ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(js2-jsdoc-tag ((t (:foreground ,sunburn-lowcolor-green))))
   `(js2-jsdoc-type ((t (:foreground ,sunburn-lowcolor-green))))
   `(js2-jsdoc-value ((t (:foreground ,sunburn-lowcolor-green))))
   `(js2-function-param ((t (:foreground, sunburn-lowcolor-orange))))
   `(js2-external-variable ((t (:foreground ,sunburn-lowcolor-orange))))
;;;;; additional js2 mode attributes for better syntax highlighting
   `(js2-instance-member ((t (:foreground ,sunburn-lowcolor-green))))
   `(js2-jsdoc-html-tag-delimiter ((t (:foreground ,sunburn-lowcolor-orange))))
   `(js2-jsdoc-html-tag-name ((t (:foreground ,sunburn-lowcolor-red))))
   `(js2-object-property ((t (:foreground ,sunburn-lowcolor-blue))))
   `(js2-magic-paren ((t (:foreground ,sunburn-lowcolor-blue))))
   `(js2-private-function-call ((t (:foreground ,sunburn-lowcolor-blue))))
   `(js2-function-call ((t (:foreground ,sunburn-lowcolor-blue))))
   `(js2-private-member ((t (:foreground ,sunburn-lowcolor-blue))))
   `(js2-keywords ((t (:foreground ,sunburn-lowcolor-magenta))))
;;;;; ledger-mode
   `(ledger-font-payee-uncleared-face ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(ledger-font-payee-cleared-face ((t (:foreground ,sunburn-lowcolor-fg :weight normal))))
   `(ledger-font-payee-pending-face ((t (:foreground ,sunburn-lowcolor-red :weight normal))))
   `(ledger-font-xact-highlight-face ((t (:background ,sunburn-lowcolor-bg+1))))
   `(ledger-font-auto-xact-face ((t (:foreground ,sunburn-lowcolor-yellow :weight normal))))
   `(ledger-font-periodic-xact-face ((t (:foreground ,sunburn-lowcolor-green :weight normal))))
   `(ledger-font-pending-face ((t (:foreground ,sunburn-lowcolor-orange weight: normal))))
   `(ledger-font-other-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(ledger-font-posting-date-face ((t (:foreground ,sunburn-lowcolor-orange :weight normal))))
   `(ledger-font-posting-account-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(ledger-font-posting-account-cleared-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(ledger-font-posting-account-pending-face ((t (:foreground ,sunburn-lowcolor-orange))))
   `(ledger-font-posting-amount-face ((t (:foreground ,sunburn-lowcolor-orange))))
   `(ledger-occur-narrowed-face ((t (:foreground ,sunburn-lowcolor-fg :invisible t))))
   `(ledger-occur-xact-face ((t (:background ,sunburn-lowcolor-bg+1))))
   `(ledger-font-comment-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(ledger-font-reconciler-uncleared-face ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(ledger-font-reconciler-cleared-face ((t (:foreground ,sunburn-lowcolor-fg :weight normal))))
   `(ledger-font-reconciler-pending-face ((t (:foreground ,sunburn-lowcolor-orange :weight normal))))
   `(ledger-font-report-clickable-face ((t (:foreground ,sunburn-lowcolor-orange :weight normal))))
;;;;; linum-mode
   `(linum ((t (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-bg))))
;;;;; Line numbers in Emacs 26
   `(line-number ((t (:foreground ,sunburn-lowcolor-bg+3 :background ,sunburn-lowcolor-bg))))
   `(line-number-current-line ((t (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-bg))))
;;;;; lispy
   `(lispy-command-name-face ((t (:background ,sunburn-lowcolor-bg :inherit font-lock-function-name-face))))
   `(lispy-cursor-face ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-fg))))
   `(lispy-face-hint ((t (:inherit highlight :foreground ,sunburn-lowcolor-yellow))))
;;;;; ruler-mode
   `(ruler-mode-column-number ((t (:inherit 'ruler-mode-default :foreground ,sunburn-lowcolor-fg))))
   `(ruler-mode-fill-column ((t (:inherit 'ruler-mode-default :foreground ,sunburn-lowcolor-yellow))))
   `(ruler-mode-goal-column ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-comment-column ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-tab-stop ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-current-column ((t (:foreground ,sunburn-lowcolor-yellow :box t))))
   `(ruler-mode-default ((t (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-bg))))

;;;;; lui
   `(lui-time-stamp-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(lui-hilight-face ((t (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-bg))))
   `(lui-button-face ((t (:inherit hover-highlight))))
;;;;; macrostep
   `(macrostep-gensym
     ((t (:foreground ,sunburn-lowcolor-green :background ,sunburn-lowcolor-bg))))
   `(macrostep-gensym
     ((t (:foreground ,sunburn-lowcolor-red :background ,sunburn-lowcolor-bg))))
   `(macrostep-gensym
     ((t (:foreground ,sunburn-lowcolor-blue :background ,sunburn-lowcolor-bg))))
   `(macrostep-gensym
     ((t (:foreground ,sunburn-lowcolor-magenta :background ,sunburn-lowcolor-bg))))
   `(macrostep-gensym
     ((t (:foreground ,sunburn-lowcolor-yellow :background ,sunburn-lowcolor-bg))))
   `(macrostep-expansion-highlight-face
     ((t (:inherit highlight))))
   `(macrostep-macro-face
     ((t (:underline t))))
;;;;; magit
;;;;;; headings and diffs
   `(magit-section-highlight           ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-fg))))
   `(magit-section-heading             ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(magit-section-heading-selection   ((t (:foreground ,sunburn-lowcolor-orange :weight bold))))
   `(magit-diff-file-heading           ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-fg+1 :weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,sunburn-lowcolor-bg  :weight bold))))
   `(magit-diff-file-heading-selection ((t (:background ,sunburn-lowcolor-bg
                                                        :foreground ,sunburn-lowcolor-gold :weight bold))))
   `(magit-diff-hunk-heading           ((t (:background ,sunburn-lowcolor-bg))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-gold))))
   `(magit-diff-hunk-heading-selection ((t (:background ,sunburn-lowcolor-bg
                                                        :foreground ,sunburn-lowcolor-orange))))
   `(magit-diff-lines-heading          ((t (:background ,sunburn-lowcolor-red
                                                        :foreground ,sunburn-lowcolor-bg))))
   `(magit-diff-base      ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-fg))))
   `(magit-diff-context   ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-fg :weight bold))))
   `(magit-diff-context-highlight ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-gold))))
   `(magit-diff-removed-highlight ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-red))))
   `(magit-diff-removed  ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-red))))
   `(magit-diff-added-highlight  ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-green))))
   `(magit-diff-added  ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-green))))
   `(magit-diffstat-added   ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-green))))
   `(magit-diff-whitespace-warning ((t (:background ,sunburn-lowcolor-red :foreground ,sunburn-lowcolor-fg+1))))
   `(magit-diff-conflict-heading ((t (:background ,sunburn-lowcolor-red :foreground ,sunburn-lowcolor-fg+1))))
   `(magit-diffstat-removed ((t (:foreground ,sunburn-lowcolor-red))))
;;;;;; popup
   `(magit-popup-heading             ((t (:foreground ,sunburn-lowcolor-yellow  :weight bold))))
   `(magit-popup-key                 ((t (:foreground ,sunburn-lowcolor-green :weight bold))))
   `(magit-popup-argument            ((t (:foreground ,sunburn-lowcolor-green   :weight bold))))
   `(magit-popup-disabled-argument   ((t (:foreground ,sunburn-lowcolor-fg    :weight normal))))
   `(magit-popup-option-value        ((t (:foreground ,sunburn-lowcolor-blue  :weight bold))))
;;;;;; process
   `(magit-process-ok    ((t (:foreground ,sunburn-lowcolor-green  :weight bold))))
   `(magit-process-ng    ((t (:foreground ,sunburn-lowcolor-red    :weight bold))))
;;;;;; log
   `(magit-log-author    ((t (:foreground ,sunburn-lowcolor-orange))))
   `(magit-log-date      ((t (:foreground ,sunburn-lowcolor-fg))))
   `(magit-log-graph     ((t (:foreground ,sunburn-lowcolor-fg+1))))
;;;;;; sequence
   `(magit-sequence-pick ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(magit-sequence-stop ((t (:foreground ,sunburn-lowcolor-green))))
   `(magit-sequence-part ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(magit-sequence-head ((t (:foreground ,sunburn-lowcolor-blue))))
   `(magit-sequence-drop ((t (:foreground ,sunburn-lowcolor-red))))
   `(magit-sequence-done ((t (:foreground ,sunburn-lowcolor-fg))))
   `(magit-sequence-onto ((t (:foreground ,sunburn-lowcolor-fg))))
;;;;;; bisect
   `(magit-bisect-good ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-green))))
   `(magit-bisect-skip ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-yellow))))
   `(magit-bisect-bad  ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-red))))
;;;;;; blame
   `(magit-blame-heading ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-blue))))
   `(magit-blame-hash    ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-orange))))
   `(magit-blame-name    ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-orange))))
   `(magit-blame-date    ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-orange))))
   `(magit-blame-summary ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-blue
                                          :weight bold))))
;;;;;; references etc
   `(magit-dimmed         ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-bg+3))))
   `(magit-hash           ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-bg+3))))
   `(magit-tag            ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-orange :weight bold))))
   `(magit-branch-remote  ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-green  :weight bold))))
   `(magit-branch-local   ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-blue   :weight bold))))
   `(magit-branch-current ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-blue   :weight bold :box t))))
   `(magit-head           ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-blue   :weight bold))))
   `(magit-refname        ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-fg :weight bold))))
   `(magit-refname-stash  ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-fg :weight bold))))
   `(magit-refname-wip    ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-fg :weight bold))))
   `(magit-signature-good      ((t (:foreground ,sunburn-lowcolor-green))))
   `(magit-signature-bad       ((t (:foreground ,sunburn-lowcolor-red))))
   `(magit-signature-untrusted ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(magit-cherry-unmatched    ((t (:foreground ,sunburn-lowcolor-blue))))
   `(magit-cherry-equivalent   ((t (:foreground ,sunburn-lowcolor-magenta))))
   `(magit-reflog-commit       ((t (:foreground ,sunburn-lowcolor-green))))
   `(magit-reflog-amend        ((t (:foreground ,sunburn-lowcolor-magenta))))
   `(magit-reflog-merge        ((t (:foreground ,sunburn-lowcolor-green))))
   `(magit-reflog-checkout     ((t (:foreground ,sunburn-lowcolor-blue))))
   `(magit-reflog-reset        ((t (:foreground ,sunburn-lowcolor-red))))
   `(magit-reflog-rebase       ((t (:foreground ,sunburn-lowcolor-magenta))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,sunburn-lowcolor-green))))
   `(magit-reflog-remote       ((t (:foreground ,sunburn-lowcolor-blue))))
   `(magit-reflog-other        ((t (:foreground ,sunburn-lowcolor-blue))))
;;;;; message-mode
   `(message-cited-text ((t (:inherit font-lock-comment-face))))
   `(message-header-name ((t (:foreground ,sunburn-lowcolor-green))))
   `(message-header-other ((t (:foreground ,sunburn-lowcolor-green))))
   `(message-header-to ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(message-header-cc ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(message-header-newsgroups ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(message-header-subject ((t (:foreground ,sunburn-lowcolor-orange :weight bold))))
   `(message-header-xheader ((t (:foreground ,sunburn-lowcolor-green))))
   `(message-mml ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(message-separator ((t (:inherit font-lock-comment-face))))
;;;;; mew
   `(mew-face-header-subject ((t (:foreground ,sunburn-lowcolor-orange))))
   `(mew-face-header-from ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(mew-face-header-date ((t (:foreground ,sunburn-lowcolor-green))))
   `(mew-face-header-to ((t (:foreground ,sunburn-lowcolor-red))))
   `(mew-face-header-key ((t (:foreground ,sunburn-lowcolor-green))))
   `(mew-face-header-private ((t (:foreground ,sunburn-lowcolor-green))))
   `(mew-face-header-important ((t (:foreground ,sunburn-lowcolor-blue))))
   `(mew-face-header-marginal ((t (:foreground ,sunburn-lowcolor-fg :weight bold))))
   `(mew-face-header-warning ((t (:foreground ,sunburn-lowcolor-red))))
   `(mew-face-header-xmew ((t (:foreground ,sunburn-lowcolor-green))))
   `(mew-face-header-xmew-bad ((t (:foreground ,sunburn-lowcolor-red))))
   `(mew-face-body-url ((t (:foreground ,sunburn-lowcolor-orange))))
   `(mew-face-body-comment ((t (:foreground ,sunburn-lowcolor-fg :slant italic))))
   `(mew-face-body-cite1 ((t (:foreground ,sunburn-lowcolor-green))))
   `(mew-face-body-cite2 ((t (:foreground ,sunburn-lowcolor-blue))))
   `(mew-face-body-cite3 ((t (:foreground ,sunburn-lowcolor-orange))))
   `(mew-face-body-cite4 ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(mew-face-body-cite5 ((t (:foreground ,sunburn-lowcolor-red))))
   `(mew-face-mark-review ((t (:foreground ,sunburn-lowcolor-blue))))
   `(mew-face-mark-escape ((t (:foreground ,sunburn-lowcolor-green))))
   `(mew-face-mark-delete ((t (:foreground ,sunburn-lowcolor-red))))
   `(mew-face-mark-unlink ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(mew-face-mark-refile ((t (:foreground ,sunburn-lowcolor-green))))
   `(mew-face-mark-unread ((t (:foreground ,sunburn-lowcolor-red))))
   `(mew-face-eof-message ((t (:foreground ,sunburn-lowcolor-green))))
   `(mew-face-eof-part ((t (:foreground ,sunburn-lowcolor-yellow))))
;;;;; mic-paren
   `(paren-face-match ((t (:foreground ,sunburn-lowcolor-blue :background ,sunburn-lowcolor-bg :weight bold))))
   `(paren-face-mismatch ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-magenta :weight bold))))
   `(paren-face-no-match ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-red :weight bold))))
;;;;; mingus
   `(mingus-directory-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(mingus-pausing-face ((t (:foreground ,sunburn-lowcolor-magenta))))
   `(mingus-playing-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(mingus-playlist-face ((t (:foreground ,sunburn-lowcolor-blue ))))
   `(mingus-mark-face ((t (:bold t :foreground ,sunburn-lowcolor-magenta))))
   `(mingus-song-file-face ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(mingus-artist-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(mingus-album-face ((t (:underline t :foreground ,sunburn-lowcolor-red))))
   `(mingus-album-stale-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(mingus-stopped-face ((t (:foreground ,sunburn-lowcolor-red))))
;;;;; nav
   `(nav-face-heading ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(nav-face-button-num ((t (:foreground ,sunburn-lowcolor-blue))))
   `(nav-face-dir ((t (:foreground ,sunburn-lowcolor-green))))
   `(nav-face-hdir ((t (:foreground ,sunburn-lowcolor-red))))
   `(nav-face-file ((t (:foreground ,sunburn-lowcolor-fg))))
   `(nav-face-hfile ((t (:foreground ,sunburn-lowcolor-red))))
;;;;; mu4e
   `(mu4e-cited-face ((t (:foreground ,sunburn-lowcolor-blue    :slant italic))))
   `(mu4e-cited-face ((t (:foreground ,sunburn-lowcolor-green :slant italic))))
   `(mu4e-cited-face ((t (:foreground ,sunburn-lowcolor-blue  :slant italic))))
   `(mu4e-cited-face ((t (:foreground ,sunburn-lowcolor-green   :slant italic))))
   `(mu4e-cited-face ((t (:foreground ,sunburn-lowcolor-blue  :slant italic))))
   `(mu4e-cited-6-face ((t (:foreground ,sunburn-lowcolor-green :slant italic))))
   `(mu4e-cited-7-face ((t (:foreground ,sunburn-lowcolor-blue    :slant italic))))
   `(mu4e-replied-face ((t (:foreground ,sunburn-lowcolor-bg+3))))
   `(mu4e-trashed-face ((t (:foreground ,sunburn-lowcolor-bg+3 :strike-through t))))
;;;;; mumamo
   `(mumamo-background-chunk-major ((t (:background nil))))
   `(mumamo-background-chunk-submode1 ((t (:background ,sunburn-lowcolor-bg))))
   `(mumamo-background-chunk-submode2 ((t (:background ,sunburn-lowcolor-bg))))
   `(mumamo-background-chunk-submode3 ((t (:background ,sunburn-lowcolor-bg+3))))
   `(mumamo-background-chunk-submode4 ((t (:background ,sunburn-lowcolor-bg+1))))
;;;;; neotree
   `(neo-banner-face ((t (:foreground ,sunburn-lowcolor-blue :weight bold))))
   `(neo-header-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(neo-root-dir-face ((t (:foreground ,sunburn-lowcolor-blue :weight bold))))
   `(neo-dir-link-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(neo-file-link-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(neo-expand-btn-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(neo-vc-default-face ((t (:foreground ,sunburn-lowcolor-fg+1))))
   `(neo-vc-user-face ((t (:foreground ,sunburn-lowcolor-red :slant italic))))
   `(neo-vc-up-to-date-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(neo-vc-edited-face ((t (:foreground ,sunburn-lowcolor-magenta))))
   `(neo-vc-needs-merge-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(neo-vc-unlocked-changes-face ((t (:foreground ,sunburn-lowcolor-red :background ,sunburn-lowcolor-blue))))
   `(neo-vc-added-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(neo-vc-conflict-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(neo-vc-missing-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(neo-vc-ignored-face ((t (:foreground ,sunburn-lowcolor-fg))))
;;;;; org-mode
   `(org-agenda-date-today
     ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-fg+1 :slant italic :weight bold))) t)
   `(org-agenda-clocking
     ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-blue))) t)
   `(org-agenda-column-dateline
     ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-yellow))) t)
   `(org-agenda-structure
     ((t (:inherit font-lock-comment-face))))
   `(org-agenda-dimmed-todo-face ((t (:background ,sunburn-lowcolor-red :foreground ,sunburn-lowcolor-bg))))
   `(org-archived ((t (:foreground ,sunburn-lowcolor-fg :weight bold))))
   `(org-checkbox ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-fg+1
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,sunburn-lowcolor-blue :underline t))))
   `(org-deadline-announce ((t (:foreground ,sunburn-lowcolor-red))))
   `(org-formula ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(org-headline-done ((t (:foreground ,sunburn-lowcolor-green))))
   `(org-hide ((t (:foreground ,sunburn-lowcolor-bg))))
   `(org-level-1 ((t (:weight bold :foreground ,sunburn-lowcolor-yellow))))
   `(org-level-2 ((t (:weight bold :foreground ,sunburn-lowcolor-blue))))
   `(org-level-3 ((t (:weight bold :foreground ,sunburn-lowcolor-orange))))
   `(org-level-4 ((t (:weight bold :foreground ,sunburn-lowcolor-blue))))
   `(org-level-5 ((t (:weight bold :foreground ,sunburn-lowcolor-green))))
   `(org-level-6 ((t (:weight bold :foreground ,sunburn-lowcolor-red))))
   `(org-level-7 ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(org-level-8 ((t (:foreground ,sunburn-lowcolor-blue))))
   `(org-link ((t (:foreground ,sunburn-lowcolor-yellow :underline t))))
   `(org-ref-acronym-face ((t (:foreground ,sunburn-lowcolor-gold :underline t))))
   `(org-ref-cite-face ((t (:foreground ,sunburn-lowcolor-green :underline t))))
   `(org-ref-glossary-face ((t (:foreground ,sunburn-lowcolor-blue :underline t))))
   `(org-ref-label-face ((t (:foreground ,sunburn-lowcolor-magenta :underline t))))
   `(org-ref-ref-face ((t (:foreground ,sunburn-lowcolor-red :underline t))))
   `(org-verbatim ((,class (:weight bold :background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-blue))))
   `(org-quote ((,class (:weight bold :background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-blue))))
   `(org-code ((,class (:weight bold :background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-blue))))
   `(org-scheduled ((t (:foreground ,sunburn-lowcolor-green))))
   `(org-scheduled-previously ((t (:foreground ,sunburn-lowcolor-red))))
   `(org-scheduled-today ((t (:foreground ,sunburn-lowcolor-blue))))
   `(org-special-keyword ((t (:foreground ,sunburn-lowcolor-blue))))
   `(org-special-properties ((t (:foreground ,sunburn-lowcolor-blue))))
   `(org-sexp-date ((t (:foreground ,sunburn-lowcolor-blue :underline t))))
   `(org-meta-line ((t (:foreground ,sunburn-lowcolor-yellow))))
   ;; `(org-table ((t (:foreground ,sunburn-lowcolor-fg))))
   `(org-table ((t :background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-blue)))
   `(org-priority ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-red :weight bold))))
   `(org-tag ((t (:background ,sunburn-lowcolor-bg :weight bold))))
   `(org-tag-group ((t (:background ,sunburn-lowcolor-bg :weight bold))))
   `(org-special-keyword ((t (:background ,sunburn-lowcolor-bg :weight bold))))
   `(org-time-grid ((t (:foreground ,sunburn-lowcolor-orange))))
   `(org-kbd ((t :background ,sunburn-lowcolor-gold :foreground ,sunburn-lowcolor-bg :weight bold)))
   `(org-done ((t :background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-green)))
   `(org-todo ((t :background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-red)))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:weight bold :foreground ,sunburn-lowcolor-red :weight bold :underline nil))))
   `(org-column ((t (:background ,sunburn-lowcolor-bg))))
   `(org-column-title ((t (:background ,sunburn-lowcolor-bg :underline t :weight bold))))
   `(org-mode-line-clock ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg))))
   `(org-mode-line-clock-overrun ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-red))))
   `(org-ellipsis ((t (:foreground ,sunburn-lowcolor-yellow :underline t))))
   `(org-footnote ((t (:foreground ,sunburn-lowcolor-blue :underline t))))
   `(org-date ((t (:foreground ,sunburn-lowcolor-blue :underline t))))
   `(org-property-value ((t (:foreground ,sunburn-lowcolor-magenta :underline t))))
   `(org-document-title ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-blue :height 1.4))))
   `(org-document-info ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-blue :height 1.2))))
   `(org-document-info-keyword ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-green :height 1.2))))
   `(org-habit-ready-face ((t :background ,sunburn-lowcolor-green)))
   `(org-habit-alert-face ((t :background ,sunburn-lowcolor-yellow :foreground ,sunburn-lowcolor-bg)))
   `(org-habit-clear-face ((t :background ,sunburn-lowcolor-blue)))
   `(org-habit-overdue-face ((t :background ,sunburn-lowcolor-red)))
   `(org-habit-clear-future-face ((t :background ,sunburn-lowcolor-blue)))
   `(org-habit-ready-future-face ((t :background ,sunburn-lowcolor-green)))
   `(org-habit-alert-future-face ((t :background ,sunburn-lowcolor-yellow :foreground ,sunburn-lowcolor-bg)))
   `(org-habit-overdue-future-face ((t :background ,sunburn-lowcolor-red)))
   `(org-block-begin-line ((t :background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-yellow)))
   `(org-block-end-line ((t :background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-yellow)))
   `(org-block ((t :background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-fg+1)))
;;;;; ein
   `(ein:cell-input-prompt ((t (:foreground ,sunburn-lowcolor-blue))))
   `(ein:cell-input-area ((t :background ,sunburn-lowcolor-bg)))
   `(ein:cell-heading ((t (:weight bold :foreground ,sunburn-lowcolor-yellow))))
   `(ein:cell-heading ((t (:weight bold :foreground ,sunburn-lowcolor-blue))))
   `(ein:cell-heading ((t (:weight bold :foreground ,sunburn-lowcolor-orange))))
   `(ein:cell-heading ((t (:weight bold :foreground ,sunburn-lowcolor-blue))))
   `(ein:cell-heading ((t (:weight bold :foreground ,sunburn-lowcolor-green))))
   `(ein:cell-heading-6 ((t (:weight bold :foreground ,sunburn-lowcolor-red))))
   `(ein:cell-output-stderr ((t (:weight bold :foreground ,sunburn-lowcolor-red :weight bold :underline nil))))
   `(ein:cell-output-prompt ((t (:foreground ,sunburn-lowcolor-green))))
;;;;; outline
   `(outline ((t (:foreground ,sunburn-lowcolor-orange))))
   `(outline ((t (:foreground ,sunburn-lowcolor-green))))
   `(outline ((t (:foreground ,sunburn-lowcolor-blue))))
   `(outline ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(outline ((t (:foreground ,sunburn-lowcolor-blue))))
   `(outline-6 ((t (:foreground ,sunburn-lowcolor-green))))
   `(outline-7 ((t (:foreground ,sunburn-lowcolor-red))))
   `(outline-8 ((t (:foreground ,sunburn-lowcolor-blue))))
;;;;; p4
   `(p4-depot-added-face ((t :inherit diff-added)))
   `(p4-depot-branch-op-face ((t :inherit diff-changed)))
   `(p4-depot-deleted-face ((t :inherit diff-removed)))
   `(p4-depot-unmapped-face ((t :inherit diff-changed)))
   `(p4-diff-change-face ((t :inherit diff-changed)))
   `(p4-diff-del-face ((t :inherit diff-removed)))
   `(p4-diff-file-face ((t :inherit diff-file-header)))
   `(p4-diff-head-face ((t :inherit diff-header)))
   `(p4-diff-ins-face ((t :inherit diff-added)))
;;;;; perspective
   `(persp-selected-face ((t (:foreground ,sunburn-lowcolor-yellow :inherit mode-line))))
;;;;;
   `(powerline-active1 ((t (:background ,sunburn-lowcolor-bg :inherit mode-line))))
   `(powerline-active2 ((t (:background ,sunburn-lowcolor-bg :inherit mode-line))))
   `(powerline-inactive1 ((t (:background ,sunburn-lowcolor-bg+1 :inherit mode-line-inactive))))
   `(powerline-inactive2 ((t (:background ,sunburn-lowcolor-bg+3 :inherit mode-line-inactive))))
;;;;; proofgeneral
   `(proof-active-area-face ((t (:underline t))))
   `(proof-boring-face ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-bg))))
   `(proof-command-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-debug-message-face ((t (:inherit proof-boring-face))))
   `(proof-declaration-name-face ((t (:inherit font-lock-keyword-face :foreground nil))))
   `(proof-eager-annotation-face ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-orange))))
   `(proof-error-face ((t (:foreground ,sunburn-lowcolor-fg :background ,sunburn-lowcolor-red))))
   `(proof-highlight-dependency-face ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-yellow))))
   `(proof-highlight-dependent-face ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-orange))))
   `(proof-locked-face ((t (:background ,sunburn-lowcolor-blue))))
   `(proof-mouse-highlight-face ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-orange))))
   `(proof-queue-face ((t (:background ,sunburn-lowcolor-red))))
   `(proof-region-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-script-highlight-error-face ((t (:background ,sunburn-lowcolor-red))))
   `(proof-tacticals-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,sunburn-lowcolor-bg))))
   `(proof-tactics-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,sunburn-lowcolor-bg))))
   `(proof-warning-face ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-yellow))))
;;;;; racket-mode
   `(racket-keyword-argument-face ((t (:inherit font-lock-constant-face))))
   `(racket-selfeval-face ((t (:inherit font-lock-type-face))))
;;;;; rainbow-delimiters
   `(rainbow-delimiters-depth-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(rainbow-delimiters-depth-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(rainbow-delimiters-depth-face ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(rainbow-delimiters-depth-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(rainbow-delimiters-depth-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(rainbow-delimiters-depth0-face ((t (:foreground ,sunburn-lowcolor-orange))))
   `(rainbow-delimiters-depth1-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(rainbow-delimiters-depth2-face ((t (:foreground ,sunburn-lowcolor-blue))))
;;;;; rcirc
   `(rcirc-my-nick ((t (:foreground ,sunburn-lowcolor-blue))))
   `(rcirc-other-nick ((t (:foreground ,sunburn-lowcolor-orange))))
   `(rcirc-bright-nick ((t (:foreground ,sunburn-lowcolor-blue))))
   `(rcirc-dim-nick ((t (:foreground ,sunburn-lowcolor-blue))))
   `(rcirc-server ((t (:foreground ,sunburn-lowcolor-green))))
   `(rcirc-server-prefix ((t (:foreground ,sunburn-lowcolor-green))))
   `(rcirc-timestamp ((t (:foreground ,sunburn-lowcolor-green))))
   `(rcirc-nick-in-message ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(rcirc-nick-in-message-full-line ((t (:weight bold))))
   `(rcirc-prompt ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(rcirc-track-nick ((t (:inverse-video t))))
   `(rcirc-track-keyword ((t (:weight bold))))
   `(rcirc-url ((t (:weight bold))))
   `(rcirc-keyword ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
;;;;; re-builder
   `(reb-match-0 ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-magenta))))
   `(reb-match ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-blue))))
   `(reb-match ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-orange))))
   `(reb-match ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-red))))
;;;;; regex-tool
   `(regex-tool-matched-face ((t (:background ,sunburn-lowcolor-blue :weight bold))))
;;;;; rpm-mode
   `(rpm-spec-dir-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(rpm-spec-doc-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(rpm-spec-ghost-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(rpm-spec-macro-face ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(rpm-spec-package-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(rpm-spec-section-face ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(rpm-spec-tag-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(rpm-spec-var-face ((t (:foreground ,sunburn-lowcolor-red))))
;;;;; rst-mode
   `(rst-level-face ((t (:foreground ,sunburn-lowcolor-orange))))
   `(rst-level-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(rst-level-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(rst-level-face ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(rst-level-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(rst-level-6-face ((t (:foreground ,sunburn-lowcolor-green))))
;;;;; sh-mode
   `(sh-heredoc     ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(sh-quoted-exec ((t (:foreground ,sunburn-lowcolor-red))))
;;;;; show-paren
   `(show-paren-mismatch ((t (:foreground ,sunburn-lowcolor-red :background ,sunburn-lowcolor-bg+3 :weight bold))))
   `(show-paren-match ((t (:background ,sunburn-lowcolor-bg+3 :weight bold))))
;;;;; smart-mode-line
   ;; use (setq sml/theme nil) to enable Sunburn-Lowcolor for sml
   `(sml/global ((,class (:foreground ,sunburn-lowcolor-fg :weight bold))))
   `(sml/modes ((,class (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(sml/minor-modes ((,class (:foreground ,sunburn-lowcolor-fg :weight bold))))
   `(sml/filename ((,class (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(sml/line-number ((,class (:foreground ,sunburn-lowcolor-blue :weight bold))))
   `(sml/col-number ((,class (:foreground ,sunburn-lowcolor-blue :weight bold))))
   `(sml/position-percentage ((,class (:foreground ,sunburn-lowcolor-blue :weight bold))))
   `(sml/prefix ((,class (:foreground ,sunburn-lowcolor-orange))))
   `(sml/git ((,class (:foreground ,sunburn-lowcolor-green))))
   `(sml/process ((,class (:weight bold))))
   `(sml/sudo ((,class  (:foreground ,sunburn-lowcolor-orange :weight bold))))
   `(sml/read-only ((,class (:foreground ,sunburn-lowcolor-red))))
   `(sml/outside-modified ((,class (:foreground ,sunburn-lowcolor-orange))))
   `(sml/modified ((,class (:foreground ,sunburn-lowcolor-red))))
   `(sml/vc-edited ((,class (:foreground ,sunburn-lowcolor-green))))
   `(sml/charging ((,class (:foreground ,sunburn-lowcolor-green))))
   `(sml/discharging ((,class (:foreground ,sunburn-lowcolor-red))))
;;;;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,sunburn-lowcolor-red :background ,sunburn-lowcolor-bg+3 :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,sunburn-lowcolor-bg+3 :weight bold))))
;;;;; sml-mode-line
   '(sml-modeline-end-face ((t :inherit default :width condensed)))
;;;;; SLIME
   `(slime-repl-output-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(slime-repl-inputed-output-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(slime-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,sunburn-lowcolor-red)))
      (t
       (:underline ,sunburn-lowcolor-red))))
   `(slime-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,sunburn-lowcolor-orange)))
      (t
       (:underline ,sunburn-lowcolor-orange))))
   `(slime-style-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,sunburn-lowcolor-yellow)))
      (t
       (:underline ,sunburn-lowcolor-yellow))))
   `(slime-note-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,sunburn-lowcolor-green)))
      (t
       (:underline ,sunburn-lowcolor-green))))
   `(slime-highlight-face ((t (:inherit highlight))))
;;;;; speedbar
   `(speedbar-button-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(speedbar-directory-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(speedbar-file-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(speedbar-highlight-face ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-green))))
   `(speedbar-selected-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(speedbar-separator-face ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-blue))))
   `(speedbar-tag-face ((t (:foreground ,sunburn-lowcolor-yellow))))
;;;;; tabbar
   `(tabbar-button ((t (:foreground ,sunburn-lowcolor-fg
                                    :background ,sunburn-lowcolor-bg))))
   `(tabbar-selected ((t (:foreground ,sunburn-lowcolor-fg
                                      :background ,sunburn-lowcolor-bg
                                      :box (:line-width -1  :style pressed-button)))))
   `(tabbar-unselected ((t (:foreground ,sunburn-lowcolor-fg
                                        :background ,sunburn-lowcolor-bg+1
                                        :box (:line-width -1  :style released-button)))))
;;;;; term
   `(term-color-black ((t (:foreground ,sunburn-lowcolor-bg
                                       :background ,sunburn-lowcolor-bg))))
   `(term-color-red ((t (:foreground ,sunburn-lowcolor-red
                                     :background ,sunburn-lowcolor-red))))
   `(term-color-green ((t (:foreground ,sunburn-lowcolor-green
                                       :background ,sunburn-lowcolor-green))))
   `(term-color-yellow ((t (:foreground ,sunburn-lowcolor-orange
                                        :background ,sunburn-lowcolor-yellow))))
   `(term-color-blue ((t (:foreground ,sunburn-lowcolor-blue
                                      :background ,sunburn-lowcolor-blue))))
   `(term-color-magenta ((t (:foreground ,sunburn-lowcolor-magenta
                                         :background ,sunburn-lowcolor-red))))
   `(term-color-blue ((t (:foreground ,sunburn-lowcolor-blue
                                      :background ,sunburn-lowcolor-blue))))
   `(term-color-white ((t (:foreground ,sunburn-lowcolor-fg
                                       :background ,sunburn-lowcolor-fg))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))
;;;;; undo-tree
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,sunburn-lowcolor-fg+1 :weight bold))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(undo-tree-visualizer-default-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,sunburn-lowcolor-blue))))
;;;;; visual-regexp
   `(vr/group-0 ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-green :weight bold))))
   `(vr/group ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-orange :weight bold))))
   `(vr/group ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-blue :weight bold))))
   `(vr/match-0 ((t (:inherit isearch))))
   `(vr/match ((t (:foreground ,sunburn-lowcolor-yellow :background ,sunburn-lowcolor-bg :weight bold))))
   `(vr/match-separator-face ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
;;;;; volatile-highlights
   `(vhl/default-face ((t (:background ,sunburn-lowcolor-bg))))
;;;;; web-mode
   `(web-mode-builtin-face ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face ((t (:foreground ,sunburn-lowcolor-orange ))))
   `(web-mode-css-prop-face ((t (:foreground ,sunburn-lowcolor-orange))))
   `(web-mode-css-pseudo-class-face ((t (:foreground ,sunburn-lowcolor-green :weight bold))))
   `(web-mode-css-rule-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(web-mode-doctype-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face ((t (:underline t))))
   `(web-mode-function-name-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(web-mode-html-attr-name-face ((t (:foreground ,sunburn-lowcolor-orange))))
   `(web-mode-html-attr-value-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(web-mode-keyword-face ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face ((t (:background ,sunburn-lowcolor-bg))))
   `(web-mode-server-comment-face ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face ((t (:background ,sunburn-lowcolor-red))))
;;;;; whitespace-mode
   `(whitespace-space ((t (:background ,sunburn-lowcolor-bg+1 :foreground ,sunburn-lowcolor-bg+1))))
   `(whitespace-hspace ((t (:background ,sunburn-lowcolor-bg+1 :foreground ,sunburn-lowcolor-bg+1))))
   `(whitespace-tab ((t (:background ,sunburn-lowcolor-red))))
   `(whitespace-newline ((t (:foreground ,sunburn-lowcolor-bg+1))))
   `(whitespace-trailing ((t (:background ,sunburn-lowcolor-red))))
   `(whitespace-line ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-magenta))))
   `(whitespace-space-before-tab ((t (:background ,sunburn-lowcolor-orange :foreground ,sunburn-lowcolor-orange))))
   `(whitespace-indentation ((t (:background ,sunburn-lowcolor-yellow :foreground ,sunburn-lowcolor-red))))
   `(whitespace-empty ((t (:background ,sunburn-lowcolor-yellow))))
   `(whitespace-space-after-tab ((t (:background ,sunburn-lowcolor-yellow :foreground ,sunburn-lowcolor-red))))
;;;;; wanderlust
   `(wl-highlight-folder-few-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(wl-highlight-folder-many-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(wl-highlight-folder-path-face ((t (:foreground ,sunburn-lowcolor-orange))))
   `(wl-highlight-folder-unread-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(wl-highlight-folder-zero-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(wl-highlight-folder-unknown-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(wl-highlight-message-citation-header ((t (:foreground ,sunburn-lowcolor-red))))
   `(wl-highlight-message-cited-text ((t (:foreground ,sunburn-lowcolor-red))))
   `(wl-highlight-message-cited-text ((t (:foreground ,sunburn-lowcolor-green))))
   `(wl-highlight-message-cited-text ((t (:foreground ,sunburn-lowcolor-blue))))
   `(wl-highlight-message-cited-text ((t (:foreground ,sunburn-lowcolor-blue))))
   `(wl-highlight-message-header-contents-face ((t (:foreground ,sunburn-lowcolor-green))))
   `(wl-highlight-message-headers-face ((t (:foreground ,sunburn-lowcolor-red))))
   `(wl-highlight-message-important-header-contents ((t (:foreground ,sunburn-lowcolor-green))))
   `(wl-highlight-message-header-contents ((t (:foreground ,sunburn-lowcolor-green))))
   `(wl-highlight-message-important-header-contents2 ((t (:foreground ,sunburn-lowcolor-green))))
   `(wl-highlight-message-signature ((t (:foreground ,sunburn-lowcolor-green))))
   `(wl-highlight-message-unimportant-header-contents ((t (:foreground ,sunburn-lowcolor-fg))))
   `(wl-highlight-summary-answered-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(wl-highlight-summary-disposed-face ((t (:foreground ,sunburn-lowcolor-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((t (:foreground ,sunburn-lowcolor-blue))))
   `(wl-highlight-summary-normal-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(wl-highlight-summary-thread-top-face ((t (:foreground ,sunburn-lowcolor-yellow))))
   `(wl-highlight-thread-indent-face ((t (:foreground ,sunburn-lowcolor-magenta))))
   `(wl-highlight-summary-refiled-face ((t (:foreground ,sunburn-lowcolor-fg))))
   `(wl-highlight-summary-displaying-face ((t (:underline t :weight bold))))
;;;;; which-func-mode
   `(which-func ((t (:foreground ,sunburn-lowcolor-green))))
;;;;; xcscope
   `(cscope-file-face ((t (:foreground ,sunburn-lowcolor-yellow :weight bold))))
   `(cscope-function-face ((t (:foreground ,sunburn-lowcolor-blue :weight bold))))
   `(cscope-line-number-face ((t (:foreground ,sunburn-lowcolor-red :weight bold))))
   `(cscope-mouse-face ((t (:foreground ,sunburn-lowcolor-bg :background ,sunburn-lowcolor-blue))))
   `(cscope-separator-face ((t (:foreground ,sunburn-lowcolor-red :weight bold
                                            :underline t :overline t))))
;;;;; yascroll
   `(yascroll:thumb-text-area ((t (:background ,sunburn-lowcolor-bg))))
   `(yascroll:thumb-fringe ((t (:background ,sunburn-lowcolor-bg :foreground ,sunburn-lowcolor-bg))))
   ))

;;; Theme Variables
(sunburn-lowcolor-with-color-variables
  (custom-theme-set-variables
   'sunburn-lowcolor
;;;;; ansi-color
   `(ansi-color-names-vector [,sunburn-lowcolor-bg ,sunburn-lowcolor-red ,sunburn-lowcolor-green ,sunburn-lowcolor-yellow
                                          ,sunburn-lowcolor-blue ,sunburn-lowcolor-magenta ,sunburn-lowcolor-blue ,sunburn-lowcolor-fg])
;;;;; fill-column-indicator
   `(fci-rule-color ,sunburn-lowcolor-bg)
;;;;; nrepl-client
   `(nrepl-message-colors
     '(,sunburn-lowcolor-red ,sunburn-lowcolor-orange ,sunburn-lowcolor-yellow ,sunburn-lowcolor-green ,sunburn-lowcolor-green
                    ,sunburn-lowcolor-blue ,sunburn-lowcolor-blue ,sunburn-lowcolor-magenta))
;;;;; pdf-tools
   `(pdf-view-midnight-colors '(,sunburn-lowcolor-fg . ,sunburn-lowcolor-bg))
;;;;; vc-annotate
   `(vc-annotate-color-map
     '(( 20. . ,sunburn-lowcolor-red)
       ( 40. . ,sunburn-lowcolor-red)
       ( 60. . ,sunburn-lowcolor-orange)
       ( 80. . ,sunburn-lowcolor-yellow)
       (100. . ,sunburn-lowcolor-yellow)
       (120. . ,sunburn-lowcolor-yellow)
       (140. . ,sunburn-lowcolor-green)
       (160. . ,sunburn-lowcolor-green)
       (180. . ,sunburn-lowcolor-green)
       (200. . ,sunburn-lowcolor-green)
       (220. . ,sunburn-lowcolor-green)
       (240. . ,sunburn-lowcolor-green)
       (260. . ,sunburn-lowcolor-blue)
       (280. . ,sunburn-lowcolor-blue)
       (300. . ,sunburn-lowcolor-blue)
       (320. . ,sunburn-lowcolor-blue)
       (340. . ,sunburn-lowcolor-blue)
       (360. . ,sunburn-lowcolor-magenta)))
   `(vc-annotate-very-old-color ,sunburn-lowcolor-magenta)
   `(vc-annotate-background ,sunburn-lowcolor-bg)
   ))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'sunburn-lowcolor)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:
;;; sunburn-lowcolor-theme.el ends here
