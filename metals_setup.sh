 coursier bootstrap \
     --java-opt -Xss4m \
     --java-opt -Xms100m \
     --java-opt -Dmetals.client=YouCompleteMe \
     --java-opt -Dmetals.extensions=true \
     org.scalameta:metals_2.12:0.9.2 \
     -r bintray:scalacenter/releases \
     -r sonatype:snapshots \
     -o $HOME/.linuxbrew/bin/metals-vim -f

