 # Make sure to use coursier v1.1.0-M9 or newer.
curl -L -o coursier https://git.io/coursier-cli
chmod +x coursier
./coursier bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=vim-lsc \
  org.scalameta:metals_2.13:0.11.6 \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o $HOME/.local/bin/metals-vim -f
