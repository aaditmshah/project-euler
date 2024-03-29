# Project Euler #

![Project Euler Solutions](http://projecteuler.net/profile/aaditmshah.png#85 "Project Euler Solutions")

My solutions to [Project Euler](http://projecteuler.net/) problems in Haskell. All the solutions are encrypted via GPG using the corresponding answer as the key. Hence you can only view my solution to a problem if you already know the answer. The answers to all the solutions are listed in a separate file which is encypted using a secret key which only I possess.

## Decryption ##

All the solutions are encrypted using the AES256 cipher. Hence you can use the following command to decrypt them:

```bash
gpg2 --output <filename> --decrypt <filename>.gpg
```

You will then be prompted to enter the password required to decrypt the file.

## Contribution ##

If you wish to provide a better solution to any problem then you can send me a pull request. To encrypt the solution use the following command:

```bash
gpg2 --cipher-algo AES256 --output <filename>.gpg --symmetric <filename>
```

When prompted for the password use the answer to the problem as the password.
