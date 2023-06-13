* Repository tot est modifcation of the proj.db

* Result should be that a transformation with NSGI as authority is added.

* Build with ``` docker build -t nsgi/proj . ```

* Run with ``` docker run -it nsgi/proj ```

* Test in container with: ``` projinfo -s EPSG:28992 -t EPSG:9067 --authority NSGI --hide-ballpark -o PROJ ```

* Should result in 
```
Candidate operations found: 1
-------------------------------------
Operation No. 1:

INVERSE(NSGI):ETRF2000_TO_RD_VARIANT_1, Inverse of ETRF2000 to ETRF2000 RD variant 1, 0.001 m, Netherlands - onshore, including Waddenzee, Dutch Wadden Islands and 12-mile offshore coastal zone.

PROJ string:
+proj=pipeline
  +step +proj=push +v_3
  +step +inv +proj=set +v_3=0 +omit_inv
  +step +inv +proj=sterea +lat_0=52.156160556 +lon_0=5.387638889 +k=0.9999079
        +x_0=155000 +y_0=463000 +ellps=bessel
  +step +proj=hgridshift +grids=nl_nsgi_rdcorr2018.tif,null
  +step +proj=cart +ellps=bessel
  +step +inv +proj=helmert +x=-565.7346 +y=-50.4058 +z=-465.2895 +rx=-0.395023
        +ry=0.330776 +rz=-1.876073 +s=-4.07242 +convention=coordinate_frame
        +exact
  +step +inv +proj=cart +ellps=GRS80
  +step +inv +proj=set +v_3=43 +omit_fwd
  +step +proj=pop +v_3
  +step +proj=axisswap +order=2,1
  +step +proj=unitconvert +xy_in=rad +xy_out=deg
```

