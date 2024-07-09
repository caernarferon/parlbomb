{
  fetchurl,
  pkgs ? import <nixpkgs> {},
}:
pkgs.stdenv.mkDerivation {
  name = "torus-pro";
  src = fetchurl {
    url = "https://github.com/caernarferon/torus-flake/releases/download/1.0/toruspro.zip";
    sha256 = "00kcpjnhzn3k248xhi15cjvmph8nmrmakjar8zm494hkjrsvkp38";
  };

  buildInputs = [pkgs.unzip];

  unpackPhase = "unzip $src";

  installPhase = ''
    cd ./toruspro/Torus.Pro
    install -Dm 444 ./TorusPro-BoldItalic.ttf $out/share/fonts/torus-pro/TorusPro-BoldItalic.ttf
    install -Dm 444 ./TorusPro-HeavyItalic.ttf $out/share/fonts/torus-pro/TorusPro-HeavyItalic.ttf
    install -Dm 444 ./TorusPro-Italic.ttf $out/share/fonts/torus-pro/TorusPro-Italic.ttf
    install -Dm 444 ./TorusPro-Light.ttf $out/share/fonts/torus-pro/TorusPro-Light.ttf
    install -Dm 444 ./TorusPro-LightItalic.ttf $out/share/fonts/torus-pro/TorusPro-LightItalic.ttf
    install -Dm 444 ./TorusPro-Regular.ttf $out/share/fonts/torus-pro/TorusPro-Regular.ttf
    install -Dm 444 ./TorusPro-SemiBold.ttf $out/share/fonts/torus-pro/TorusPro-SemiBold.ttf
    install -Dm 444 ./TorusPro-SemiBoldItalic.ttf $out/share/fonts/torus-pro/TorusPro-SemiBoldItalic.ttf
    install -Dm 444 ./TorusPro-Thin.ttf $out/share/fonts/torus-pro/TorusPro-Thin.ttf
    install -Dm 444 ./TorusPro-ThinItalic.ttf $out/share/fonts/torus-pro/TorusPro-ThinItalic.ttf
    runHook postInstall
  '';
}
