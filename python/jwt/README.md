Example:

    {
        'jti': '4504af24-cc36-4aca-aac5-783ecbf5f6c9',
        'iat': 1704302066,
        'nbf': 1704302017,
        'scope': 'rasa:pro rasa:enterprise rasa:studio',
        'exp': 1767139200,
        'email': 'j.trammell@rasa.com',
        'company': 'Rasa'
    }

* jti: JWT Token ID, (nonce to prevent replays)
* iat: issued at
* exp: expiration
* nbf: not before
* scope: lists allowed scopes
* email / company: specify the allowed recipient

## `jti`

<https://www.rfc-editor.org/rfc/rfc7519#section-4.1.7>

> The "jti" (JWT ID) claim provides a unique identifier for the JWT. The
> identifier value MUST be assigned in a manner that ensures that there is a
> negligible probability that the same value will be accidentally assigned to a
> different data object; if the application uses multiple issuers, collisions
> MUST be prevented among values produced by different issuers as well.  The
> "jti" claim can be used to prevent the JWT from being replayed. The "jti"
> value is a case- sensitive string.  Use of this claim is OPTIONAL.





