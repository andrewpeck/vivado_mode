;; vivado-mode.el
;; Major mode for editing Xilinx Design Constraint file (XDC) and Vivado Tcl
;; scripts in Emacs

;; Copyright (C) 2013, 2024 Jim Wu
;;
;; History
;; Feb 2, 2013: initial release
;; Apr 25, 2013: added IPI bd commands/options
;; Dec 17, 2021: some additional key words, add tcl-font-lock-keywords (anp)

;; Author: Jim Wu (jimwu88 at yahoo dot com)

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;; USAGE
;; Installation for setting up automatic VIVADO  mode:
;; Save this file in your load path, and add the following lines in your
;; .emacs (uncomment them first)
;; (setq auto-mode-alist (cons  '("\\.xdc\\'" . xdc-mode) auto-mode-alist))
;; (add-hook 'vivado-mode-hook '(lambda () (font-lock-mode 1)))
;; (autoload 'vivado-mode "vivado-mode")

(require 'tcl)

(setq vivado-keywords
      '(("\\<\\(get_files\\|get_clocks\\|get_cells\\|get_pins\\|get_ports\\|get_nets\\)\\>" . font-lock-builtin-face)
        ("\\<\\(create_generated_clock\\|create_clock\\|set_input_jitter\\|set_input_delay\\|set_output_delay\\)\\>" . font-lock-builtin-face)
        ("\\<\\(place_ports\\|set_property\\|set_clock_groups\\|set_multicycle_path\\|set_false_path\\|set_max_delay\\)\\>" . font-lock-builtin-face)
        ("\\<\\(create_pblock\\|add_cells_to_pblock\\|resize_pblock\\)\\>" . font-lock-keyword-face)
        ("\\<\\(MAX_FANOUT\\|CLOCK_DEDICATED_ROUTE\\|IOSTANDARD\\|DRIVE\\|DIFF_TERM\\|VCCAUX_IO\\|SLEW\\|FAST\\|SLOW\\|DCI_CASCADE\\)\\>" . font-lock-constant-face)
        ("\\<\\(LVCMOS33\\|LVCMOS25\\|LVCMOS15\\|LVCMOS18\\|LVDS_25\\|LVDS\\)\\>" . font-lock-constant-face)
        ("\\<\\(true\\|false\\)\\>" . font-lock-constant-face)
        ("\\<\\(PULLDOWN\\|PULLUP\\|PACKAGE_PIN\\|IOB\\|LOC\\)\\>" . font-lock-constant-face)
        ("-\\<\\(name\\|period\\|clock\\|through\\|filter\\|hierarchical\\|hier\\|fall_from\\|rise_from\\|add_delay\\)\\>" . font-lock-constant-face)
        ("-\\<\\(max\\|min\\|rise_to\\|fall_to\\|of_objects\\|from\\|to\\|setup\\|hold\\|end\\|start\\|of\\|group\\|quiet\\|datapath_only\\)\\>" . font-lock-constant-face)
        ("-\\<\\(physically_exclusive\\|asynchronous\\|min\\|rise_to\\|fall_to\\|of_objects\\|from\\|to\\|setup\\|hold\\|of\\|group\\|asynchronous\\)\\>" . font-lock-constant-face)
        ("-\\<\\(include_generated_clocks\\|primitive_group\\|pppasynchronous\\)\\>" . font-lock-constant-face)
        ("\\<\\(create_bd_design\\|create_bd_cell\\|create_bd_intf_pin\\|current_bd_instance\\)\\>" . font-lock-keyword-face)
        ("\\<\\(create_bd_pin\\|connect_bd_intf_net\\|connect_bd_net\\|create_bd_addr_seg\\)\\>" . font-lock-keyword-face)
        ("-\\<\\(intf_net\\|dict\\|range\\|offset\\|dir\\|type\\|vlnv\\|net\\)\\>" . font-lock-constant-face)))

;;;###autoload
(define-derived-mode
  vivado-mode                     ; child
  tcl-mode                        ; parent
  "Vivado Mode"                   ; name
  "Major mode for Xilinx Vivado." ; docstring

  ;; body
  (setq font-lock-defaults (list (append vivado-keywords tcl-font-lock-keywords)))
  (setq mode-name "Vivado"))

(provide 'vivado-mode)
