if [ $3 == "bundle" ]
then
flutter build appbundle --build-name=$1 --build-number=$2
open build/app/outputs/bundle/release
else
flutter build apk --build-name=$1 --build-number=$2
open build/app/outputs/flutter-apk
fi




#sh app_release.sh 0.0.1 1 bundle
#sh app_release.sh 0.0.1 1 apk
#cd scripts; sh app_release.sh 0.0.1 1 apk