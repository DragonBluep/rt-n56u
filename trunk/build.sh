#!/bin/bash

fdir="./asuswrt"
ftar="asuswrt.tar.xz"

[ -e "$ftar" ] && rm "$ftar"
[ -d "$fdir" ] && rm -r "$fdir"
mkdir "$fdir"


# add MT7620 board PIDs here
Boards=(
	Domy_DM203 \
	FocusMedia \
	GBCOM_N3000 \
	Haier_HW-L1W \
	HWiFi_HC5661 \
	HWiFi_HC5861 \
	LBLink_W1210 \
	Phicomm_K2 \
	Phicomm_K2G \
	Youku_X2 \
	Youku_YK-L1c \
	)

./clear_tree
for Board in ${Boards[@]}
do
	./clear_tree_simple
	echo -e "\n\n\n\n-----------------------------------"
	echo "Build Board ${Board}"
	echo -e "-----------------------------------\n\n\n\n"
	fakeroot ./build_firmware_modify ${Board}
	cp ./images/*.trx "$fdir"/
done


# add MT7628 board PIDs here
Boards=(
	CMCC_ZY-368 \
	MOTO_MWR03 \
	)

./clear_tree
for Board in ${Boards[@]}
do
	./clear_tree_simple
	echo -e "\n\n\n\n-----------------------------------"
	echo "Build Board ${Board}"
	echo -e "-----------------------------------\n\n\n\n"
	fakeroot ./build_firmware_modify ${Board}
	cp ./images/*.trx "$fdir"/
done


# add MT7621 board PIDs here
Boards=(
	ZTE_E8820-V2 \
	)

./clear_tree
for Board in ${Boards[@]}
do
	./clear_tree_simple
	echo -e "\n\n\n\n-----------------------------------"
	echo "Build Board ${Board}"
	echo -e "-----------------------------------\n\n\n\n"
	fakeroot ./build_firmware_modify ${Board}
	cp ./images/*.trx "$fdir"/
done


tar -cvaf "$ftar" "$fdir"/*
