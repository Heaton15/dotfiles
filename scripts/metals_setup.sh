# Make sure to use coursier v1.1.0-M9 or newer.

IPATH=$HOME/.local/bin
curl -L -o $IPATH/coursier https://git.io/coursier-cli
chmod +x $IPATH/coursier
$IPATH/coursier bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=vim-lsc \
  org.scalameta:metals_2.13:0.11.6 \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o $IPATH/metals-vim -f
