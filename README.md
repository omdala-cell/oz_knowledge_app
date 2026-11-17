# OZ Knowledge Hub (ສູນລວມຄວາມຮູ້ວິຊາການ)

Mobile Application ສຳລັບເຊື່ອມຕໍ່ Google Sites ທັງ 6 ໝວດໝູ່ຄວາມຮູ້ວິຊາການ.

## ວິທີ Build ໄຟລ໌ .apk ຜ່ານ GitHub + Codemagic (ບໍ່ຕ້ອງລົງໂປຣແກຣມໃນຄອມ)
1. ແຕກໄຟລ໌ `.zip` ນີ້ອອກ.
2. ສ້າງ Repository ໃໝ່ໃນ GitHub ແລ້ວອັບໂຫຼດໄຟລ໌ທັງໝົດໃນໂຟນເດີນີ້ຂຶ້ນໄປ.
3. ເຂົ້າເວັບ [codemagic.io](https://codemagic.io) -> ລັອກອິນດ້ວຍ GitHub -> ເລືອກ Repository ນີ້.
4. ກົດ **Start new build** (ເລືອກ Workflow: `Build OZ Knowledge Hub APK`).
5. ລໍຖ້າປະມານ 3-5 ນາທີ ແລ້ວດາວໂຫຼດໄຟລ໌ `app-release.apk` ໄປຕິດຕັ້ງໃນມືຖື Android ໄດ້ເລີຍ.
