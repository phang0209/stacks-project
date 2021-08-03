
;; My nft: token-A

(impl-trait .sip009-nft-trait.nft-trait)

;; constants, maps, vars
(define-constant contract-owner tx-sender)
(define-non-fungible-token token-A uint)
(define-data-var last-token-id uint u0)
;; error codes:
(define-constant err-tx-sender-not-owner (err u100))
(define-constant err-tx-sender-not-sender (err u101))

;; read-only functions
;; sip009: get the last token id
(define-read-only (get-last-token-id)
    (ok (var-get last-token-id))
)

;; sip009: get URI for this token
(define-read-only (get-token-uri (uri uint))
    (ok none)
)

;; sip009: get owner of the token
(define-read-only (get-owner (token-id uint))
    (ok (nft-get-owner? token-A token-id))
)

;; public functions
;; mint function (generate new nft)
(define-public (mint)
    (let
        (
            (token-id (+ (var-get last-token-id) u1))
        )
        (asserts! (is-eq contract-owner tx-sender) err-tx-sender-not-owner)
        (var-set last-token-id token-id)
        (nft-mint? token-A token-id tx-sender)
    )
)

;; sip009: transfer
(define-public (transfer (token-id uint) (sender principal) (recipient principal))
    (begin
        (asserts! (is-eq tx-sender sender) err-tx-sender-not-sender)
        (nft-transfer? token-A token-id sender recipient)   
    )
)
