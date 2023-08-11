import pyproj
from pyproj import Transformer

pyproj.network.set_network_enabled(True)

rd2etrs = Transformer.from_crs("EPSG:7415", "EPSG:4937")
etrs2rd = Transformer.from_crs("EPSG:4937", "EPSG:7415")

Z001 = open('Z001_ETRS89andRDNAP.txt','r').readlines()
        
result = ','.join(['nr', 'lat_orig', 'lon_orig', 'hell_orig', 'rdx_orig', 'rdy_orig', 'nap_orig', 'lat_calc', 'lon_calc', 'hell_calc', 'rdx_calc', 'rdy_calc', 'nap_calc', 'lat_diff', 'lon_diff', 'hell_diff', 'rdx_diff', 'rdy_diff', 'nap_diff']) + '\n'

for i, point in enumerate(Z001):

    nr, lat, lon, hell, rdx, rdy, nap = point.split()

    if nap == '*': nap = float('inf')

    lat_calc, lon_calc, hell_calc = rd2etrs.transform(rdx, rdy, nap)
    rdx_calc, rdy_calc, nap_calc = etrs2rd.transform(lat, lon, hell)

    lat_diff, lon_diff, hell_diff = float(lat)-lat_calc, float(lon)-lon_calc, float(hell)-hell_calc
    rdx_diff, rdy_diff, nap_diff = float(rdx)-rdx_calc, float(rdy)-rdy_calc, float(nap)-nap_calc

    result += (f'{nr},{lat},{lon},{hell},{rdx},{rdy},{nap},{lat_calc:.9f},{lon_calc:.9f},{hell_calc:.4f},{rdx_calc:.4f},{rdy_calc:.4f},{nap_calc:.4f},{lat_diff:.9f},{lon_diff:.9f},{hell_diff:.4f},{rdx_diff:.4f},{rdy_diff:.4f},{nap_diff:.4f}\n')

    print(i)

open('zelfvalidatie_resultaat_epsg_etrs89.csv', 'w').write(result)