if find /Applications/ -iname flux.app; then
  echo "FLUX"
else
  wget https://justgetflux.com/mac/Flux.zip
fi
