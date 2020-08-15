(import (scheme) (duck)
        (x86-os))

(define (read-file name)
    (let ((p (open-input-file name)))
        (let f ((x (read p)))
            (if (eof-object? x)
                (begin
                (close-input-port p)
                '())
                (cons x (f (read p)))))))

(define (compile-file name)
    (let ((code (read-file (format "../~a.ss" name))))
        (duck-compile-exp `,code name)
    ))

(compile-file 'boot)