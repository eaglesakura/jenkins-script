#! /bin/sh
# AndroidManifest.xmlを自動的に書き換えます
# 機能１：Jenkinsのビルド番号とversionCodeの同期を行う。
# 機能２：Jenkinsのビルド番号をバージョン名と置換します。
#       その場合、"JENKINS_BUILD_NUMBER"をバージョン名に加えてください。
#       例：android:versionName="1.00.JENKINS_BUILD_NUMBER"


# BUILD_NUMBER=3103
MANIFEST_PATH=${1}
TEMP_MANIFEST_PATH=${MANIFEST_PATH}.txt

if [ -z "${BUILD_NUMBER}" ]; then
    echo "BUILD_NUMBER not found..."
    exit 1
fi

echo "manifest file = ${MANIFEST_PATH}"
if [ -f "${MANIFEST_PATH}" ]; then
    echo "manifest exist!"
else
    echo "manifest not found!!"
    exit 1
fi

# ビルド番号を置換
cat ${MANIFEST_PATH} | sed "s/android:versionCode=\".*\"/android:versionCode=\"${BUILD_NUMBER}\"/" > ${TEMP_MANIFEST_PATH}

# バージョン名を置換
cat ${TEMP_MANIFEST_PATH} | sed "s/JENKINS_BUILD_NUMBER/${BUILD_NUMBER}/" > ${MANIFEST_PATH}

# テンポラリファイルを削除
rm -f ${TEMP_MANIFEST_PATH}
