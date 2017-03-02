lines=`cat $1`
for line in $lines; do
    repo_name=$(echo "$line"|cut -d ":" -f1)
    branch=$(echo "$line"|cut -d ":" -f2)
    wget https://github.com/Bahmni/$repo_name/archive/$branch.zip
    unzip $branch.zip
    rm -rf $branch.zip
    mv $repo_name* $repo_name
done
for line in $lines; do
   repo_name=$(echo "$line"|cut -d ":" -f1) 
   cd $repo_name
   mvn clean install 
   cd ..
done
mkdir output
mkdir output/omod
mkdir output/war
cp bacteriology/omod/target/bacteriology-1.1-SNAPSHOT.omod output/omod/
cp openmrs-module-bahmni.ie.apps/omod/target/bahmni.ie.apps-0.89-SNAPSHOT.omod output/omod/
cp bahmni-core/openmrs-elis-atomfeed-client-omod/target/openelis-atomfeed-client-omod-0.89-SNAPSHOT.omod output/omod/
cp bahmni-core/bahmnicore-omod/target/bahmnicore-omod-0.89-SNAPSHOT.omod output/omod/
cp bahmni-core/reference-data/omod/target/reference-data-0.89-SNAPSHOT.omod output/omod/
cp bahmni-offline-sync/omod/target/bahmniOfflineSync-0.89-SNAPSHOT.omod output/omod/
cp openmrs-module-rulesengine/omod/target/rulesengine-0.89-SNAPSHOT.omod output/omod/
cp bahmni-reports/target/bahmnireports.war output/war/

