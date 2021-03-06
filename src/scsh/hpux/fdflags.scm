;;; Flags for open(2) and fcntl(2).
;;; Copyright (c) 1993 by Olin Shivers. See file COPYING.

(define-enum-constants open
  ;; POSIX
  (read			0)
  (write		1)
  (read+write		2)
  (non-blocking		#o200000)
  (append		#o10)
  (no-control-tty	#o400000)
  (create		#o0400)
  (truncate		#o1000)
  (exclusive		#o2000)

  ;; NextStep
  (sync			#o100000))	; Synchronous writes

(define open/access-mask
  (bitwise-ior open/read
	       (bitwise-ior open/write open/read+write)))

;;; fcntl() commands
(define-enum-constants fcntl
  (dup-fdes			0)      ; F_DUPFD
  (get-fdes-flags		1)      ; F_GETFD
  (set-fdes-flags		2)      ; F_SETFD
  (get-status-flags		3)      ; F_GETFL
  (set-status-flags		4)      ; F_SETFL
  (get-record-lock		5)	; F_GETLK
  (set-record-lock-no-block	6)	; F_SETLK
  (set-record-lock		7))	; F_SETLKW

;;; fcntl fdes-flags (F_GETFD)

(define fdflags/close-on-exec 		1)

;;; fcntl status-flags (F_GETFL)
;;; Mostly, these are OPEN/... flags, like OPEN/APPEND.
;;; (define fdstatus/... ...)

;;; fcntl lock values.

(define-enum-constants lock
  (read		1)	; F_RDLCK
  (write	2)	; F_WRLCK
  (release	3))	; F_UNLCK
