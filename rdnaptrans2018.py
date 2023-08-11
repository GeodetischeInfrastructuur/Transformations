#!/usr/bin/env python

from pyproj import Transformer

pipeline_2d = (
    '+proj=pipeline '
    '+step +proj=unitconvert +xy_in=deg +xy_out=rad '
    '+step +proj=axisswap +order=2,1 '
    '+step +proj=push +v_3 '
    '+step +proj=set +v_3=43 +omit_inv '
    '+step +proj=cart +ellps=GRS80 '
    '+step +proj=helmert +x=-565.7346 +y=-50.4058 +z=-465.2895 +rx=-0.395023 +ry=0.330776 +rz=-1.876073 +s=-4.07242 +convention=coordinate_frame +exact '
    '+step +proj=cart +inv +ellps=bessel '
    '+step +proj=hgridshift +inv +grids=./rdcorr2018.tif,null '
    '+step +proj=sterea +lat_0=52.156160556 +lon_0=5.387638889 +k=0.9999079 +x_0=155000 +y_0=463000 +ellps=bessel '
    '+step +proj=set +v_3=0 +omit_fwd '
    '+step +proj=pop +v_3'
)

rdnaptrans2018_2d = Transformer.from_pipeline(pipeline_2d)

pipeline_hgt = (
    '+proj=pipeline '
    '+step +proj=unitconvert +xy_in=deg +z_in=m +xy_out=rad +z_out=m '
    '+step +proj=axisswap +order=2,1,3,4 '
    '+step +proj=vgridshift +grids=./nlgeo2018.tif '
    '+step +proj=axisswap +order=2,1,3,4 '
    '+step +proj=unitconvert +xy_in=rad +z_in=m +xy_out=deg +z_out=m '
)

rdnaptrans2018_hgt = Transformer.from_pipeline(pipeline_hgt)

pipeline_xyz = (
    '+proj=pipeline '
    '+step +proj=unitconvert +xy_in=deg +xy_out=rad '
    '+step +proj=axisswap +order=2,1 '
    '+step +proj=cart +ellps=GRS80'
)

xyz = Transformer.from_pipeline(pipeline_xyz)

def xyz2llh(X, Y, Z):

    return xyz.transform(X, Y, Z, direction='INVERSE')

def llh2xyz(lat, lon, hell):

    return xyz.transform(lat, lon, hell, direction='FORWARD')

def etrs2rd(lat, lon):

    return rdnaptrans2018_2d.transform(lat, lon, direction='FORWARD')

def etrs2nap(lat, lon, hell):

    return rdnaptrans2018_hgt.transform(lat, lon, hell, direction='FORWARD')[2]

def etrs2rdnap(lat, lon, hell):

    x, y = etrs2rd(lat, lon)
    H = etrs2nap(lat, lon, hell)

    return (x, y, H)

def rd2etrs(x, y):

    return rdnaptrans2018_2d.transform(x, y, direction='INVERSE')

def rdnap2etrs(x, y, H):

    lat, lon = rd2etrs(x, y)
    hell = rdnaptrans2018_hgt.transform(lat, lon, H, direction='INVERSE')[2]

    return (lat, lon, hell)

# EOF
