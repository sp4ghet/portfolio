module Blog.Contents.TravisDeploy exposing (..)

import Blog.Article.Types exposing (..)
import Date exposing (Date)


article : Article
article =
    Article
        "Using TravisCI for a Simple Deploy Tool"
        "travis-deploy"
        (Date.fromString "05/02/2017")
        "I recently started developing a project that would get placed in the `/var/www/html` directory on the live server: [ http://wiki.openag.media.mit.edu/]( http://wiki.openag.media.mit.edu/) I wanted to set up a CI environment so that I wouldn't have to keep ssh-ing into the live server to pull changes or something."
        [ Words mainText ]


mainText : String
mainText =
    """
# Using TravisCI for a Simple Deploy Tool

I recently started developing a project that would get placed in the `/var/www/html` directory on the live server: [ http://wiki.openag.media.mit.edu/]( http://wiki.openag.media.mit.edu/) I wanted to set up a CI environment so that I wouldn't have to keep ssh-ing into the live server to pull changes or something. That's pretty lame. Looking into TravisCI, it supports deploying to some BaaS/PaaS type services like Heroku and S3. The problem is, my server is a pretty generic server running CentOS. The simple way to move files to and from my server that I've been using was [rsync](https://linux.die.net/man/1/rsync). The problem with this approach when I try to script it on TravisCI is, I was using this in conjunction with a [ssh-config file](http://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/). I don't really want to store my private key in plaintext, which ruins security horribly, so I looked into a way of conducting an rsync deploy semi-securely. TravisCI has a command called [`travis encrpyt-file`](https://docs.travis-ci.com/user/encrypting-files/), which will encrypt a file based on your Github account and target repository. This encrypts a file using a keypair unique to the repository targeted (Defaults, with confirmation, to the origin remote). Just encrypt your private key with this command. Make sure to add the encrypted key and not the bare key. A complete sample repository is here: <https://github.com/OpenAgInitiative/dokuwiki_template> The important bits of code are below: The `.travis.yml` file, which tells TravisCI to decrypt the private key and run `deploy.sh`

```yaml
language: php
php:
  - 7.0

before_install:
  - openssl aes-256-cbc -K $encrypted_b3b8deca1fd8_key -iv $encrypted_b3b8deca1fd8_iv -in openag-wiki.enc -out openag-wiki -d
install: true

script: true
after_success:
  - ./deploy.sh
```

The `deploy.sh` that gets run when the build succeeds:

```bash
#!/bin/bash

set -e

mv config ~/.ssh/
rsync openag/* openag-wiki:/var/www/html/lib/tpl/openag/
```

The `ssh-config` file that tells rsync where to sync.


```cfg
Host openag-wiki
    Hostname <IP>
    User root
    IdentityFile ~/.ssh/openag-wiki
```
"""
