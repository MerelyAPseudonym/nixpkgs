{ stdenv, fetchurl, rustPlatform, darwin }:

with rustPlatform;

buildRustPackage rec {
  name = "pijul-${version}";
  version = "0.8.0";

  src = fetchurl {
    url = "https://pijul.org/releases/${name}.tar.gz";
    sha256 = "00pi03yp2bgnjpsz2hgaapxfw2i4idbjqc88cagpvn4yr1612wqx";
  };

  sourceRoot = "${name}/pijul";

  buildInputs = stdenv.lib.optionals stdenv.isDarwin
    (with darwin.apple_sdk.frameworks; [ Security ]);

  depsSha256 = "1qzzpnkyw1bn5fnj06c80f7985v1q0rqcphrrrkpbi33lg5mzgbv";

  meta = with stdenv.lib; {
    description = "A distributed version control system";
    homepage = https://pijul.org;
    license = with licenses; [ gpl2Plus ];
    maintainers = [ maintainers.gal_bolle ];
    platforms = platforms.all;
  };
}
