# danhoucke-repo

Build a particular product version:

```
PRODUCT_VERSION=23.11 VERSION=1.0.0 make rpm
```

Build latest (by default PRODUCT_VERSION=latest):

```
VERSION=1.0.0 make rpm
```

Build with different URL:
```
VERSION=1.0.0 REPO_URL="packages.redborder.com make rpm
```

Build with different USER URL:
```
VERSION=1.0.0 USERNAME=dvanhoucke USER_REPO_URL="packages-sc.redborder.lan make rpm
```
