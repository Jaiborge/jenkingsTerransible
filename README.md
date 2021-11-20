# jenkingsTerransible

1) Firat at all , cerate your key pairs to login AWS EC2 instance

ssh-keygen -t rsa -b 2048 

artmcair@MBA-NPQ00001 workspace % ssh-keygen -t rsa -b 2048
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/artmcair/.ssh/id_rsa): macAwsPuKey
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in macAwsPuKey.
Your public key has been saved in macAwsPuKey.pub.
The key fingerprint is:
SHA256:hHgroxd6+FDd0PIHlc5SifEM83RHUj8+0PjwPlRR4f4 artmcair@MBA-NPQ00001.local
The key's randomart image is:
+---[RSA 2048]----+
|        +ooooo+o+|
|     . o.O+. o+..|
|    . = +++  + +o|
|     o B..o   B o|
|    = o S..    B |
|   = +   .    o o|
|  = o          oE|
|   =            .|
|    .            |
+----[SHA256]-----+


2) Verify generated keys in your roor folder, in my case /Users/artmcair/workspace

3) we are goping to use public key inside terraform to connect to ec2 instance, if your open your pub file, you will see something like this
 ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbvRN/gvQBhFe+dE8p3Q865T/xTKgjqTjj56p1IIKbq8SDyOybE8ia0rMPcBLAKds+wjePIYpTtRxT9UsUbZJTgF+SGSG2dC6+ohCQpi6F3xM7ryL9fy3BNCT5aPrwbR862jcOIfv7R1xVfH8OS0WZa8DpVy5kTeutsuH5FMAmEgba4KhYLTzIdhM7UKJvNoUMRBaxAqIAThqH9Vt/iR1WpXgazoPw6dyPssa7ye6tUPRipmPTZukfpxcPlsqytXWlXm7R89xAY9OXkdPPVsrQA0XFQnY8aFb9XaZP8cm7EOVRdxMsA1DyWMVZOTjhBwCHfEIGoePAS3jFMqQjGWQd rahul@rahul-HP-ZBook-15-G2


AND PRIVATE KEY

-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABFwAAAAdzc2gtcn
NhAAAAAwEAAQAAAQEA270Tf4L0AYRXvnRPKd0POuU/8UyoI6k44+eqdSCCm6vEg8jsmxPI
mtKzD3ASwCnbPsI3jyGKU7UcU/VLFG2SU4BfkhkhtnQuvqIQkKYuhd8TO68i/X8twTQk+W
j68G0fOto3DiH7+0dcVXx/DktFmWvA6VcuZE3rrbLh+RTAJhIG2uCoWC08yHYTO1CibzaF
DEQWsQKiAE4ah/Vbf4kdVqV4Gs6D8Oncj7LGu8nurVD0YqZj02bpH6cXD5bKsrV1pV5u0f
PcQGPTl5HTz1bK0ANFxUJ2PGhW/V2mT/HJuxDlUXcTLANQ8ljFWTk44QcAh3xCBqHjwEt4
xTKkIxlkHQAAA9CsiPUKrIj1CgAAAAdzc2gtcnNhAAABAQDbvRN/gvQBhFe+dE8p3Q865T
/xTKgjqTjj56p1IIKbq8SDyOybE8ia0rMPcBLAKds+wjePIYpTtRxT9UsUbZJTgF+SGSG2
dC6+ohCQpi6F3xM7ryL9fy3BNCT5aPrwbR862jcOIfv7R1xVfH8OS0WZa8DpVy5kTeutsu
H5FMAmEgba4KhYLTzIdhM7UKJvNoUMRBaxAqIAThqH9Vt/iR1WpXgazoPw6dyPssa7ye6t
UPRipmPTZukfpxcPlsqytXWlXm7R89xAY9OXkdPPVsrQA0XFQnY8aFb9XaZP8cm7EOVRdx
MsA1DyWMVZOTjhBwCHfEIGoePAS3jFMqQjGWQdAAAAAwEAAQAAAQB83JvPwSHWGtWhK4Yw
S6Tz2oDTJLQGT4o8Ns/tbmPJAXnRSMLp+/vpvgBxrUV6XE5xAvt/IZfwqOFH9AKNwRV8zV
2BLzaw7qQBPyYai9Ozzmana4V+dl4RgwffkX/GTruIPac7KKR+zLXy/aNVBACwhUJBVYDP
Dlf1g8hUOS5WcqpRpdzf3PWjAosC2sZUNtoU9wmMTOQMb96haWgdqQrdulzhBxMb7/hJQ5
q11gGdTboFM2l8yKMbRsba1OG/0JR2cmSNoK2PDL8GxskolwveGjvzsYPUS0iQsvjqAWQX
F3cW7lBq0eL23qkLFxAJxFQU4mB9yH5KCunU0K9am18hAAAAgAxkrreETLmI0snIX3uX+T
ySTNTb0G9kya0G3TGpkjvZT8Ump/L8ysleidqK2VYVEPre6vfTECqzWhBL1BVT/howuacG
5LeEkgS/F8oQJ19iEKT4LXxTumlFJqIj7+9jjnD5Z+gxi/ttJVTWvN/L4Ho9ZbZ6SoUBIB
hnb+tDP0+mAAAAgQDwFBx6E7dARqwOeN8byrmzsYmnr9a2jx4eXR1iDX7ZzPLjYoOCFiJP
3ahHhXSzPx5pJK4k8MRYUFNTjtl2K+cKgCZC75Dj5mfI/8l0pvmUrZ2e2GN1+ATUcQO7Dy
0j8124Bke0OkItBTfwQrsIOSyYzySOll88odoISNB2BdZsewAAAIEA6k+ljxLX1sfn8wOg
l9zgXqoT64tiQIJ720WSHuc5xoslgHVdjeunVy1eAaZMDURn8sbedlGLaebaGdVZwidR04
gpodkAZdkBm+tju2NRIxIhuDU02ddJFEGy/8lp+XqEm+YfbUpHrCSNOjYBDkdAp6umQFVq
jQi2RBtpIsNFikcAAAAacmFodWxAcmFodWwtSFAtWkJvb2stMTUtRzIB
-----END OPENSSH PRIVATE KEY-----

4)


