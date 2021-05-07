$LevelName = 'Gaias Vault';
$ServerLocation = './server/';
$DistLocation = './dist/';
$Version = '0.8';

#####################################################################

$SrcOverworld = "$ServerLocation$LevelName/";
$SrcNether = "$ServerLocation$LevelName" + "_nether/";
$DistFolder = "$DistLocation$LevelName v$Version";
$DistMapFolder = "$DistFolder/$LevelName World v$Version";

mkdir "$DistFolder";
mkdir "$DistMapFolder";
cp "./MAP-README" "$DistFolder";
cp -Recurse "$SrcOverworld/data" "$DistMapFolder";
cp -Recurse "$SrcOverworld/poi" "$DistMapFolder";
cp -Recurse "$SrcOverworld/region" "$DistMapFolder";
cp -Recurse "$SrcOverworld/icon.png" "$DistMapFolder";
cp -Recurse "$SrcOverworld/level.dat" "$DistMapFolder";
cp -Recurse "$SrcOverworld/uid.dat" "$DistMapFolder";
cp -Recurse "$SrcNether/DIM-1" "$DistMapFolder";

$compress = @{
  Path = "$DistFolder/*"
  CompressionLevel = "Optimal"
  DestinationPath = "$DistFolder.zip"
}
Compress-Archive @compress