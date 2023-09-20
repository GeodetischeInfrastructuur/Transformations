from pyproj import Transformer

rdnap2etrf = Transformer.from_crs("EPSG:7415", "EPSG:7931")
etrf2rdnap = Transformer.from_crs("EPSG:7931", "EPSG:7415")

Z001 = open('/validate/Z001_ETRS89andRDNAP.txt','r')
        
result = ','.join(['nr', 'lat_diff', 'lon_diff', 'h_diff', 'rdx_diff', 'rdy_diff', 'nap_diff', 'lat_orig', 'lon_orig', 'h_orig', 'rdx_orig', 'rdy_orig', 'nap_orig', 'lat_calc', 'lon_calc', 'h_calc', 'rdx_calc', 'rdy_calc', 'nap_calc']) + '\n'

for _, point in enumerate(Z001.readlines()):

    nr, lat, lon, h, rdx, rdy, nap = point.split()

    if nap == '*': nap = float('inf')

    lat_calc, lon_calc, h_calc = rdnap2etrf.transform(rdx, rdy, nap)
    rdx_calc, rdy_calc, nap_calc = etrf2rdnap.transform(lat, lon, h)

    lat_diff, lon_diff, h_diff = float(lat)-lat_calc, float(lon)-lon_calc, float(h)-h_calc
    rdx_diff, rdy_diff, nap_diff = float(rdx)-rdx_calc, float(rdy)-rdy_calc, float(nap)-nap_calc

    result += (f'{nr},{lat_diff:.9f},{lon_diff:.9f},{h_diff:.4f},{rdx_diff:.4f},{rdy_diff:.4f},{nap_diff:.4f},{lat},{lon},{h},{rdx},{rdy},{nap},{lat_calc:.9f},{lon_calc:.9f},{h_calc:.4f},{rdx_calc:.4f},{rdy_calc:.4f},{nap_calc:.4f}\n')

open('./validate/zelfvalidatie.csv', 'w').write(result)