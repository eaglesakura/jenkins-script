#! /bin/sh
PLIST_PATH=${1}
VERSION_NAME=${2}


if [ -z "${VERSION_NAME}" ]; then
    echo "VERSION_NAME not found..."
    exit 1
fi

echo "plist = ${PLIST_PATH}"

if [ -f "${PLIST_PATH}" ]; then
    echo "plist exist!"
else
    echo "plist not found!!"
    exit 1
fi

# plistを編集する
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion ${VERSION_NAME}" "${PLIST_PATH}"
