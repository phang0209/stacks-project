# stacks-project

### HKUST Stacks Summer Course
Aidan NG
This project implements a SIP009 compliant non-fungible token and a marketplace contract

##### Functions
token-A:
- read-only
  - (SIP009) get-last-token-id
  - (SIP009) get-token-uri
  - (SIP009) get-owner
- public
  - (SIP009) transfer
  - mint
marketplace:
- read only
  - get-listing
- public
  - list-nft
  - cancel-listing
  - fulfill-listing


##### My defined error codes
token-A:
- (err u100): tx-sender is different from the nft owner
- (err u101): tx-sender is different from the sender
marketplace:
- (err u200): the inputted listing id is not referring to a valid listing (id does not exist / listing was deleted)
- (err u201): tx-sender is different from the nft maker
- (err u202): the trait reference is invalid
