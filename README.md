# Message Board Smart Contract

A simple on-chain message board implemented in Clarity for the Stacks blockchain.

## Features

- Post messages to the blockchain (max 64 bytes)
- Each message gets a unique ID
- Read messages by their ID
- Get total number of posted messages
- Messages are stored with sender's address

## Functions

### Public Functions

```clarity
(post (msg (buff 64)))
```
- Posts a new message to the board
- Returns: (ok uint) with the message ID or (err u100) if message too long

### Read-Only Functions

```clarity
(get-post (id uint))
```
- Retrieves a post by ID
- Returns: Optional tuple with {sender: principal, content: (buff 64)}

```clarity
(get-total-posts)
```
- Gets the total number of posts
- Returns: (ok uint) with current post count

## Usage Example

```clarity
;; Post a message
(contract-call? .message-board post 0x48656C6C6F21)  ;; "Hello!"

;; Read a post
(contract-call? .message-board get-post u0)

;; Get total posts
(contract-call? .message-board get-total-posts)
```

## Development

Built with Clarity for the Stacks blockchain.
