# shippy

## Purpose
Generator that returns JSON with ship name and hash information from `/~shippy`

## Installation
Make sure your `home` is mounted
```
cp gen/shippy.hoon $URBIT_PIER/gen

# in the Dojo:
|commit %home
|serve /'~shippy' %home /gen/shippy/hoon
```

## Uninstalling Old `shippy`
If you have the Gall agent version of `shippy`, we need to "lobotomotize" it.
```
cp app/shippy.hoon $URBIT_PIER/app

# in the Dojo:
|commit %home
```
