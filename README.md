* Repository tot est modifcation of the proj.db

* Result should be that a transformation with NSGI as authorit is added.

* Tests in container with:
```
projinfo -s EPSG:28992 -t EPSG:9067 --authority NSGI --hide-ballpark -o PROJ
```
