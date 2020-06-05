vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/ignitionrobotics/ign-math/archive/ignition-math6_6.4.0.tar.gz"
    FILENAME "ignition-math6_6.4.0.tar.gz"
    SHA512 8a6e672ef6de591d25200f288deaaa16cc43e3c90804ee5ead0f06345036afbfa40acb531eb5b6a1fa80bd34c0c5964662cc0659d8bed2c811ad7c776d6f77cb
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/${PORT})

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
