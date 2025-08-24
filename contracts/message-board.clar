;; message-board.clar
;; A simple on-chain message board
;; Users can post messages, each gets an ID.

(define-data-var next-id uint u0)

;; posts map: id  {sender, content}
(define-map posts
  {id: uint}
  {sender: principal, content: (buff 64)})

;; Post a message (max 64 chars)
(define-public (post (msg (buff 64)))
  (begin
    (if (> (len msg) u64)
        (err u100)
        (let ((id (var-get next-id)))
          (map-set posts {id: id} {sender: tx-sender, content: msg})
          (var-set next-id (+ id u1))
          (ok id)))))

;; Read a message by ID
(define-read-only (get-post (id uint))
  (map-get? posts {id: id}))

;; Get the total number of posts
(define-read-only (get-total-posts)
  (ok (var-get next-id)))
