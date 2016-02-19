# spacemacs.org

[![Gitter](https://badges.gitter.im/syl20bnr/spacemacs.org.svg)](https://gitter.im/syl20bnr/spacemacs.org?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)


## Operations


### Troubleshooting

If you get the error:

    "ERROR! to use the 'ssh' connection type with passwords, you must install the sshpass program"

Then install `sshpass` and you should be good to go.

If you are using `brew` on OS X then you'll to get around a protection of
`homebrew` to prevent your from installing `sshpass`:

    brew install https://raw.github.com/eugeneoden/homebrew/eca9de1/Library/Formula/sshpass.rb
