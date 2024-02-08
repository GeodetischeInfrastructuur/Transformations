# Transformations

[![GitHub
license](https://img.shields.io/github/license/GeodetischeInfrastructuur/Transformations)](https://github.com/GeodetischeInfrastructuur/Transformations/blob/master/LICENSE)

This repository contains a modified proj.db that implements the following
transformations according to the recommendations of the NSGI (see image below).

![transformations](supported-transformations-nsgi.drawio.svg)

1. SQL which adds to the [PROJ](https://proj.org/en/9.3/) proj.db:
   * added NSGI to authority references
   * added extents of NSGI transformations
   * added additional NL datum (AGRS.NL)
   * added additional NL CRSs
   * added additional NSGI transformations

2. A Dockerfile with [PROJ](https://proj.org/en/9.3/) configured to use this
   NSGI authority as a base

These will form the base for the transformations that are defined or recommended by
[NSGI](https://www.nsgi.nl/) (Nederlandse Samenwerkingsverband Geodetische
Infrastructuur). In the future additional transformations might be added to this
repository.

> :warning: this repository contains 2 proj.db. The first (the default)
> `proj.db` has the sql scripts nl_nsgi_00... till ns_nsgi_50... applied. The
> second `proj.time.dependent.transformations.db` has the sql script
> 'nl_nsgi_60_time_dependent_transformations.sql' applied for adding time
> dependent transformations. For this second proj.db, a input epoch should be
> provided (when applicable), to prevent the use of the default reference epoch
> of the transformation. When one wants to use this second proj.db this can be done
> in the following ways.
>
> Through a move command
>
> ```bash
> mv proj.db proj.db.bak
> mv proj.time.dependent.transformations.db proj.db
> ```
>
> or through the creating of a symbolic link
>
> ```bash
> ln -s proj.time.dependent.transformations.db proj.db
> ```

## Docker

The Docker image is intended to be used as a base image, for applications that
layer on top of PROJ; for instance use it with
[pyproj](https://pyproj4.github.io/pyproj/stable/index.html).

### Build

```bash
docker build -t ghcr.io/geodetischeinfrastructuur/transformations:1.1.0 .
```

### Run

To start an interactive terminal inside the container run:

```bash
docker run -it --rm --name nsgi-proj ghcr.io/geodetischeinfrastructuur/transformations:1.1.0
```

To invoke `projinfo` from your current terminal sessions run:

```bash
docker run --rm --name nsgi-proj ghcr.io/geodetischeinfrastructuur/transformations:1.1.0 projinfo
```

## Test

To verify if the NSGI transformation `EPSG:7931` -> `EPSG:7415` works as
expected, run the following in a terminal:

```bash
docker build -f validate/Dockerfile -t geodetischeinfrastructuur/pyproj:3.6.1 .
docker run --rm -it geodetischeinfrastructuur/pyproj:3.6.1 python
```

Then run the following Python code:

```python
from pyproj import transformer
etrf = transformer.TransformerGroup("EPSG:7931", "EPSG:7415")
"{0[0]:.4f} {0[1]:.4f} {0[2]:.4f}".format(etrf.transformers[0].transform(52.115330444, 7.684748554, 41.4160))
```

Alternatively the following [cs2cs](https://proj.org/en/9.3/apps/cs2cs.html) cmd
can be used:

```bash
cs2cs -f "%.4f" EPSG:7931 EPSG:7415 <<< "52.115330444 7.684748554 41.4160"
```

Both should result in the following output: `'312352.6004 461058.5812 -2.5206'`

## Validation

Running the full validation file can be done by running the following docker run
cmd.

```bash
docker run -d --rm -v `pwd`/validate:/validate geodetischeinfrastructuur/pyproj:3.6.1 python ./validate/validate.py ./validate/Z001_ETRS89andRDNAP.txt ./validate/validation-output.csv
```

Or by running the python script directly.

```bash
cd validate
python validate.py Z001_ETRS89andRDNAP.txt validation-output.csv
```

This should output a `validate/validation-output.csv` file containing the
results. When correct the result would show no (or minimal) deviation.

## LICENSE

The SQL used in this repository is licensed under a [CC-BY license](./LICENSE).

All other code in this repository is licensed under the [MIT
license](./LICENSE-CODE).
