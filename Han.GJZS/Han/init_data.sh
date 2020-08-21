Configuration=2020082005
Magisk_Warehouse_version=2020082011
App_Store_version=2020082001
Show_Compatibility_Mode=1
MIUI=0

case "$1" in

Update_Log)
Log() {
cat <<Han
v2020081900
- ROOT专区增加一键刷机、一键刷写recovery.img到recovery分区


v2020081600
- 1.Magisk模块仓库增加开启MIUI12主题破解、开启SELinux
- 2.附加功能区开启/关闭SELinux支持添加快捷方式
- 3.太极模块增加是否安装太极apk
- 4.首页增加应用仓库
- 5.系统相关查看与调试增加NTP服务修改


Han
}

APK_log() {
cat <<Han
懒得写


Han
b
}

a() {
cat <<Han

Han
}

b() {
cat <<Han
v2.8.0（2020081300）
- 1.更新kr-script框架PIO至3.9.7(103)
Han
}


if [[ $Version_code -eq $Canary ]]; then
    beta=true
else
    beta=false
fi
    case $2 in
    -log)
    $beta && Log || a
    ;;
    
    -apk)
    $beta && APK_log || b
    # b
    ;;
    esac
;;

EdXposed)
List="：
EdXposed_Manager_4.5.7.apk
Stable-EdXposed-YAHFA-v0.4.6.2(4529)-release.zip
Stable-EdXposed-SandHook-v0.4.6.2(4529)-release.zip
"
[[ $Stable_YAHFA = 1 ]] && Download -net 96b5735f-51dd-4edc-8f22-670e646aaf17 "Stable-riru_edxposed.zip" 2857221 9fe80372b839a414eca3d8e0da975c97 "Stable-riru_edxposed.zip"
[[ $Stable_SandHook = 1 ]] && Download -net 5649fb8c-261a-4403-a4a2-981e7ffe66b3 "Stable-riru_edxposed_sandhook.zip" 3088552 02d821ec536bb038e67444e2c0173672 "Stable-riru_edxposed_sandhook.zip"
[[ $apk = 1 ]] && AZ_EdXp_apk -net 709616a9-4e12-4e23-93a1-142f014a9231 "EdXposed_Manager_4.5.7.apk" 5181074 d46a9905d4561343b9906c8bdd21577e "EdXposed_Manager"
;;
   
Installation_lion)
   List="安装狮-3.7.5-miui.apk"
   [[ $Choice = 1 ]] && Download -net 990a0515-7e68-4e8e-8ec9-f5c882fafa07 "Installation_lion.apk" 1869340 865a0a9a40d289a36e9a8ee17bb6e774 "Installation_lion.apk"
;;

Redmi-K30-5G-recovery)
if [[ $Version = 11 ]]; then
DID=(
11bb2cc0-e076-42fd-b24c-56108b8cb08f
a2951b86-d687-4bc1-a647-322d1aecce42
)
elif [[ $Version = 12 ]]; then
DID=(
22f1610c-3bd1-459a-b701-a72adf69ab78
e2da5973-c1fb-44c4-a40f-73a5be63e28e
)
fi
List="
Redmi-K30-5G-3.4.1B-0313-wzsx150.img
Redmi-K30-5G-3.4.2B-0623-wzsx150.img"
   [[ $Version = 11 ]] && Download -split none "Redmi-K30-5G-11-3.4.1B-0313-wzsx150.img" 134217728 941a7ff1f4de4745b9bdd68bf895bd9f "Redmi-K30-5G-11"
   [[ $Version = 12 ]] && Download -split none "Redmi-K30-5G-12-3.4.2B-0623-wzsx150.img" 134217728 1a734c45512fbbecd79bb861e74968ca "Redmi-K30-5G-12"
;;

Charging_Sound_Effect)
   Download -net c0d2d469-7955-4ee2-9258-4040077d754e Charging_Sound_Effect.zip 637194 e2baba8c619d9cb26275524238ffe2ad Charging_Sound_Effect.zip
;;

Install_Applet)
   Install_Applet -net 9d45fc70-018f-4ed2-a7e2-120cb2b6bce3 "Applet-57.zip" 2528216 e45671ec7f0ab82635c092174271f6cc "Applet-" 57
;;

Install_busybox)
   [[ $Type = arm ]] && Start_Install -net f816534e-afd8-4062-80cb-2298fa6a3f32 busybox_arm 1439756 399cb275516a2c50433b6af23444c15a busybox_arm 1.31.1 13115
   [[ $Type = arm64 ]] && Start_Install -net 1e233dce-6257-48f6-8892-552b70f2eda6 busybox_arm64 2054232 ecd59f931c4c7ded14ea0a07a586e3d1 busybox_arm64 1.31.1 13115
   [[ $Type = x86 ]] && Start_Install -net 3262ec66-f365-4480-8bf7-e02f91e9303e busybox_x86 2078488 a39bea9fd3614001a27f8ea79004b625 busybox_x86 1.31.1 13115
   [[ $Type = x86_64 ]] && Start_Install -net 42959f98-d633-41d5-b057-0e70814dd56e busybox_x86_64 2206024 9eb395e4c7f53df5feff89fb16f0cb10 busybox_x86_64 1.31.1 13115
   [[ $Type = mips ]] && Start_Install -net ec07c1e3-dc4f-4989-baac-9695ff0aaadb busybox_mips 1918664 a919e846eab773feca1c878c7e2b5d1a busybox_mips 1.31.1 13111
   [[ $Type = mips64 ]] && Start_Install -net 16ea638b-36d0-4bc5-9b3a-50a4cb5dd0e8 busybox_mips64 1927016 41b78f9275c445f061aea408046dd68d busybox_mips64 1.31.1 13111
;;

Zipsigner)
   Download -net 17e49ffa-877e-4ee1-b070-8fea20a7d769 "Zipsigner-1.zip" 5206525 8b75d8340b336f118d3c15db46b53cbb "Zipsigner-"
;;

#应用
com.omarea.vtools)
apk='com.omarea.vtools'
name='Scene'
version='3.3.7'
versionCode=11274
author='嘟嘟Ski'
description='你猜'
time='2020年8月20号'
   [[ $Choice = 1 ]] && Download -net 4e90b405-6c31-417e-833e-2ca3a8e18015 "$1.apk" 3766162 129dab939d5de3b751e5f7261b53a01f "$1.apk"
;;

bin.mt.plus)
apk='bin.mt.plus'
name='MT管理器'
version='2.9.1'
versionCode='20070900'
author='Bin'
description='文件管理器/安卓逆向神器'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 26583c11-75af-48b5-ac78-a3c1a08dd9f9 "$1.apk" 10222833 db49958b3ba4c26878d2e350125fa070 "$1.apk"
;;

org.meowcat.edxposed.manager)
apk='org.meowcat.edxposed.manager'
name='EdXposed Manager'
version='4.5.7'
versionCode='45700'
author='mlgmxyysd'
description='EDXposed框架模块管理器'
time='2020年8月20号'
   [[ $Choice = 1 ]] && Download -net 709616a9-4e12-4e23-93a1-142f014a9231 "$1.apk" 5181074 d46a9905d4561343b9906c8bdd21577e "$1.apk"
;;

com.topjohnwu.magisk)
apk='com.topjohnwu.magisk'
name='Magisk Manager'
version='7.5.1'
versionCode='267'
author='John Wu'
description='Magisk Manager'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 36811a6d-6dfc-4bd8-ab00-2d43ed01f29c "$1.apk" 2143331 0bfc5a310d7f363f9c9c3d5f4836d1d9 "$1.apk"
;;

ru.zdevs.zarchiver.pro)
apk='ru.zdevs.zarchiver.pro'
name='ZArchiver Pro'
version='0.9.4'
versionCode=9405
author='未知'
description='解压缩神器'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 463c7699-8e8b-45b1-970e-77722266d961 "$1.apk" 5320967 3c55d28ac1bd498ab7de67aec7212c8f "$1.apk"
;;

com.termux)
apk='com.termux'
name='Termux'
version='0.98'
versionCode=98
author='未知'
description='带有软件包的终端模拟器'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 52f5f58a-6146-4fb8-ab26-a7e9e146c3dd "$1.apk" 72447482 962cbf2dd208238ab73feb0bfd364d9f "$1.apk"
;;

com.andromeda.androbench2)
apk='com.andromeda.androbench2'
name='AndroBench'
version='5.0.1'
versionCode=16
author='未知'
description='测试内存读取速度汉化版'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 9713b1db-ca32-40a4-b417-1891d18de8ad "$1.apk" 2906485 0765ed36fbb5c2a52a6b33857059f7b6 "$1.apk"
;;

ru.YlWeRbFE.IdgNBLial)
apk='ru.YlWeRbFE.IdgNBLial'
name='Luckу*Pаtcher'
version='8.8.3'
versionCode=1643
author='未知'
description='幸运破解器'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 93554a78-de43-424e-afa2-434752c5c07d "$1.apk" 10115802 23f92e1bd463d5e1eccc40239a45fd14 "$1.apk"
;;

com.linroid.zlive)
apk='com.linroid.zlive'
name='Z直播'
version='4.13.2'
versionCode=342
author='未知'
description='Z直播只有 6M 大小，非常流畅和简洁，一个 App 即可关注全网主播'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net aeba740f-71e1-438c-b5f4-6a2e0d311031 "$1.apk" 6703460 6e110f47cece4fb763d43345cc76d991 "$1.apk"
;;

com.kuss.rewind)
apk='com.kuss.rewind'
name='倒带'
version='2.9.0'
versionCode=3000073
author='未知'
description='简单的音乐播放器'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 9bd283c5-5649-4013-a3e9-bf6e95a8bb3a "$1.apk" 6663929 fda6911a05a7aec10d5f4bb1ffddfcc2 "$1.apk"
;;

com.mhook.MrSFastTranslation)
apk='com.mhook.MrSFastTranslation'
name='Xp快译'
version='3.1.4-beta4'
versionCode=20190612
author='未知'
description='XP模块：复制即可翻译'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 9b03fb03-800b-4b80-8a26-faec86108678 "$1.apk" 782673 6df81f2136aefc9de79d36e7b7a384d2 "$1.apk"
;;

com.coderstory.toolkit)
apk='com.coderstory.toolkit'
name='安卓4.4-10核心破解'
author='CoderStory'
description='XP模块：降级安装/不同签名安装'
time='2020年8月14号'
    case $SDK in
    28 | 29)
        version='2.2'
        versionCode=1765
        [[ $Choice = 1 ]] && Download -net f71d244f-fb54-4187-a69b-1b52b3b26141 "$1.apk" 1327894 65a25c6d5d2e42475fb215ac0d9eb504 "$1.apk"
    ;;
    24 | 25 | 26 | 27)
        version='2.1'
        versionCode=1765
        [[ $Choice = 1 ]] && Download -net bb54dcb0-994a-486c-bf8b-5f82442a73da "$1.apk" 1423421 8b746d3c648f48cb0189fe4b53e9462c "$1.apk"
    ;;
    19 | 20 | 21 | 22 | 23)
        version='1.4'
        versionCode=1580
        [[ $Choice = 1 ]] && Download -net 02a226ca-fced-4ad2-b0e6-c43a5316d0a1 "$1.apk" 88680 d5df351b2754df0d5cc0251553fbd1d7 "$1.apk"
    ;;
    *)
        [[ $Choice = 1 ]] && echo "不支持SDK=$SDK"
    ;;
    esac
;;

nil.nadph.qnotified)
apk='nil.nadph.qnotified'
name='QNotified'
version='0.8.9.56.53fb2c0'
versionCode=40
author='cinit'
description='XP模块：QQ辅助性功能增强'
time='2020年8月18号'
   [[ $Choice = 1 ]] && Download -net d7b77f20-e23f-4424-a853-b884ec8f9a65 "$1.apk" 3253906 b013a5d1d37a3d21beb43bb8efe5bafa "$1.apk"
;;

com.mhook.dialog)
apk='com.mhook.dialog'
name='对话框取消'
version='2.2.0'
versionCode=220
author='未知'
description='XP模块：对话框取消'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 97f31281-40ad-4305-84d3-ec11bf3d423a "$1.apk" 1453335 4f3bd3dd7d3336cc1750e563e843710a "$1.apk"
;;

com.volant.mzxpt)
apk='com.volant.mzxpt'
name='MeiZu Xposed Tool'
version='2.2.5'
versionCode=1
author='未知'
description='XP模块/ROOT工具箱：MeiZu Xposed Tool'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 0da7a1f1-812a-4800-b2e0-72381305f69c "$1.apk" 4674032 00fba8fa0124070d2690e83b2e1f879b "$1.apk"
;;

com.surcumference.fingerprintpay)
apk='com.surcumference.fingerprintpay'
name='指纹支付'
version='3.9.9'
versionCode=20
author='eritpchy'
description='XP模块：让微信、支付宝、淘宝和腾讯QQ在支持指纹识别的手机上使用指纹支付, 即使他们都不打算支持!'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 24ba77ea-18dd-4929-9a21-bfd2afc45162 "$1.apk" 1733158 dfb5264066bc2c1857db5146a9c51604 "$1.apk"
;;

com.coderstory.flyme)
apk='com.coderstory.flyme'
name='Flyme8助手'
version='4.0.9 正式版'
versionCode=415
author='CoderStory'
description='XP模块：flyme8助手基于dexposed/xposed开发的插件，实现了去除系统广告，核心破解，隐藏桌面应用标签等实用功能。使用插件前请申请root权限并安装EdXposed，也可以选择xposed。'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 497c8c1e-3ac2-4210-a9c6-b7f30fbf6904 "$1.apk" 2359760 e650542d9047f8c3fd042c8f2e77bb1c "$1.apk"
;;

com.coderstory.purify)
apk='com.coderstory.purify'
name='小米净化'
version='3.3.1 Dev'
versionCode=108002
author='CoderStory'
description='XP模块：小米净化是基于dexposed/xposed开发的插件，实现了去除系统广告，核心破解，隐藏桌面应用标签等实用功能。使用插件前请申请root权限并安装magisk版EdXposed。'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net f591a84e-c53f-433d-a69a-847eee1c94b4 "$1.apk" 1955700 628e33908c26ebec2489082c22d04ecb "$1.apk"
;;

chili.xposed.chimi)
apk='chili.xposed.chimi'
name='ChiMi'
version='3.07.07'
versionCode=200707
author='yonghen'
description='XP模块：MIUI扩展插件（EdXposed/TaiChi）'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net abc5d59c-2695-4059-bba6-d602b8f756ed "$1.apk" 342601 4c96891b940440b9af2701a9d2ca25fc "$1.apk"
;;

me.iacn.biliroaming)
apk='me.iacn.biliroaming'
name='哔哩漫游'
version='1.3.0'
versionCode=30
author='yujincheng08'
description='XP模块：解除B站客户端番剧区域限制的Xposed模块，并且提供其他小功能'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net f1812e95-38d0-4d4b-97cd-2ba70f1a65a4 "$1.apk" 705206 902c501ca5e43d1ba5f53de4a045fdf4 "$1.apk"
;;

me.zjns.lovecloudmusic)
apk='me.zjns.lovecloudmusic'
name='云村清洁工'
version='2.7.0'
versionCode=20
author='yujincheng08'
description='XP模块：适用于网易云音乐'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 4a69d2a0-cf3a-4ea0-89da-de1c7b13d1dd "$1.apk" 30113 67f39526afd3c002e2a285119dceb307 "$1.apk"
;;

com.specher.music163)
apk='com.specher.music163'
name='网易云音乐插件'
version='2.8.2'
versionCode=21
author='Specher'
description='XP模块：网易云音乐插件'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net e6b6cd03-9955-4b7d-85f7-e14f6a1e540c "$1.apk" 29180 fab79b2c910db212d1824282094bc9f3 "$1.apk"
;;

com.raincat.unblockmusicpro)
apk='com.raincat.unblockmusicpro'
name='UnblockMusic Pro'
version='2.8.2'
versionCode=282
author='nining377'
description='XP模块：安卓端基于Xposed解锁网易云音乐客户端变灰歌曲'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 18295e35-7620-4906-8f98-dcd9162f81b0 "$1.apk" 15762135 e98d137bb20a4531283dd3f4a726f1a4 "$1.apk"
;;

com.raincat.dolby_beta)
apk='com.raincat.dolby_beta'
name='杜比大喇叭β版'
version='1.0.5'
versionCode=105
author='nining377'
description='XP模块：网易云音乐去广告/签到/精简美化'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 1d079ea6-41d4-4050-a64b-fe3b779050a1 "$1.apk" 1028563 2c0eecfe9da51cf9f01f54f2849a2238 "$1.apk"
;;

me.dyq.android.SDLink)
apk='me.dyq.android.SDLink'
name='SD重定向'
version='1.4.3'
versionCode=13
author='未知'
description='XP模块：解决APP在内部储存根目录乱拉屎'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 0a084710-d8db-4cf7-9cab-7f17b1ac826d "$1.apk" 401063 61d45f2477b3efa5b8910cfefa2d33e5 "$1.apk"
;;

com.lemonsqueeze.fakewificonnection)
apk='com.lemonsqueeze.fakewificonnection'
name='伪装wifi'
version='1.10'
versionCode=11
author='未知'
description='XP模块：伪装成wifi连接'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 53e40236-14ad-49f5-9ef4-5f839fd278f0 "$1.apk" 327389 43a28736d96ade25351d6db3ce37d9ff "$1.apk"
;;

me.lee.adaway.sina)
apk='me.lee.adaway.sina'
name='SinaAdAway'
version='0.0.5'
versionCode=5
author='未知'
description='XP模块：去除新浪微博广告'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net aea1d3ec-8c21-4e25-a988-16c96e439b38 "$1.apk" 1254213 23f42b426b9b266407d3feb41ce638f4 "$1.apk"
;;

com.github.tianma8023.xposed.smscode)
apk='com.github.tianma8023.xposed.smscode'
name='验证码提取器(Xposed)'
version='2.2.3'
versionCode=43
author='未知'
description='XP模块：提取新短信中的验证码并复制到剪贴板，并能自动输入验证码'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 9f70d4d4-4870-4d0a-9060-7fbe661135a7 "$1.apk" 1925433 6f9cd7905b4d2aaa21bdd47dfc50bfe4 "$1.apk"
;;

com.viewblocker.jrsen)
apk='com.viewblocker.jrsen'
name='上帝模式'
version='2.7.10'
versionCode=21
author='未知'
description='XP模块：去除apk布局，哪里不要点哪里'
time='2020年8月16号'
   [[ $Choice = 1 ]] && Download -net 9fd27c92-fb9d-4be8-ba28-10e505b60d29 "$1.apk" 1251752 0e3dd4ba758411c198da21b1b2d7cbc9 "$1.apk"
;;




#模块
Automatic_brick_rescue)
id='Automatic_brick_rescue'
name='自动神仙救砖'
version='v2020072605'
versionCode=19
author='by：Han | 情非得已c'
description='用途：当刷入一些模块导致无法正常开机，自动触发已设置好的救砖操作'
time='2020年7月26号'
;;

riru_edxposed)
id='riru_edxposed'
name='Riru - EdXposed'
version='v0.4.6.2 (4529) (YAHFA)'
versionCode='4529'
author='solohsu, MlgmXyysd & rk700'
description='基于 Riru 的 ART hook 框架 (最初用于 Android Pie) ，提供与原版 Xposed 相同的 API, 使用 YAHFA (或 SandHook) 进行 hook, supports Android 8.0 ~ 10 Telegram: @EdXposed'
time='2020年6月15号'
;;

riru_edxposed_sandhook)
    id='riru_edxposed_sandhook'
    name='Riru - EdXposed'
    version='v0.4.6.2 (4529) (SandHook)'
    versionCode='4529'
    author='solohsu, MlgmXyysd & ganyao114'
    description='基于 Riru 的 ART hook 框架 (最初用于 Android Pie) ，提供与原版 Xposed 相同的 API, 使用 YAHFA (或 SandHook) 进行 hook, supports Android 8.0 ~ 10 Telegram: @EdXposed'
    time='2020年6月15号'
;;

znzl)
MIUI=1
id='znzl'
eval `(curl -skL 'https://gitee.com/youngdriver/pio/raw/master/znzl/module.prop')`
[[ $2 = -d ]] && curl -skL -o $Pages/Intelligent_Assistant.xml "$xml_url"
;;

MIUI_Wallpaper)
MIUI=1
id='MIUI_Wallpaper'
version='ALPHA-2.3.95-07221822'
versionCode=203000095
name="Magisk版 MIUI壁纸apk-$version($versionCode)"
author='by：Han | 情非得已c'
description="使用模块方式将「壁纸」替换成"$MOD_name"($7)来达到使不支持超级壁纸的MIUI12使用超级壁纸功能。使用方法：从搞机助手MIUI专区可快速进入隐藏的超级壁纸功能"
time='2020年8月12号'
   [[ $Choice = 1 ]] && Download -net 9a576e81-d9cb-4268-81af-51243a2004ed "$1.apk" 54131300 5a8109c055dffb64eb50ccb0a7cd2a33 "$1.apk"
;;

MIUI-12_All_in_one)
MIUI=1
id='MIUI-12_All_in_one'
version='2020-07-14'
versionCode='1'
name="MIUI 12多合一通用模块"
author='by：Han | 情非得已c'
description="$name"
time='2020年人7月14号'
   [[ $Choice = 1 ]] && Download -net db2be5c1-d932-4ae9-8700-833e6aae25da "$1.zip" 3158237 d356a8a17b4996a1d23b5eb73fdd5191 "$1.zip"
;;

MIUI_In_Common_Use)
MIUI=1
id='MIUI_In_Common_Use'
version='2019-08-17'
versionCode='1'
name="MIUI9 - MIUI10多合一通用模块"
author='by：Han | 情非得已c'
description="$name"
time='2019年8月17号'
;;

GJZS_Theme_Color)
MIUI=1
id='GJZS_Theme_Color'
version='v1'
versionCode='1'
name='自定义「搞机助手」主题配色'
author='by：Han | 情非得已c'
description="$name"
time='2020年6月15号'
;;

com.miui.packageinstaller)
MIUI=1
id='com.miui.packageinstaller'
name='应用包管理组件'
version='v1.8.3'
versionCode='183'
author='by：Han | 情非得已c'
description='去除应用详情和权限设置、前往应用商店安装更多应用'
time='2020年7月19号'
   [[ $Choice = 1 ]] && Download -net a7519945-6bb0-4523-926c-19a43633982d "$1.zip" 2067223 101786047d9a2d11d547cd84f190076b "$1.zip"
;;

Game_BianShengQi)
MIUI=1
id='Game_BianShengQi'
name='MIUI开发版游戏加速变声器'
version='v1'
versionCode='1'
author='淡淡的影寒'
description='工作原理：在prop内增加ro.vendor.audio.voice.change.support=true，打开游戏加速变声器功能'
time='2020年6月15号'
   [[ $Choice = 1 ]] && Download -net 2a9347cb-45c6-4e30-a4f2-de98b92c6553 "$1.zip" 1635 eb4a5f78013f1e91a88964b8824e5847 "$1.zip"
;;

com.android.thememanager)
MIUI=1
id='com.android.thememanager'
name='开启MIUI12主题破解'
version='v2.4'
versionCode='2'
author='酷安@帝殇哥'
description='修复了20.3+以上不可用的问题，主题版本1.7.0.1，有效防止系统自动恢复默认主题。卸载模块后如有异常请到应用商城更新主题壁纸'
time='2020年8月11号'
   [[ $Choice = 1 ]] && Download -net b063d047-d7e3-4ff4-9458-9e35943730dc "$1.zip" 11885413 ced109d3686aca4fd7f6950d7803ade7 "$1.zip"
;;

gametools)
MIUI=1
id='gametools'
name='修改游戏工具箱'
author='酷安ID流昔枫落'
version='基于4.1.6安全中心'
description='修改游戏工具箱快捷方式QQ为tim，适用于MIUI11安全中心版本4.1.2，最好安装mm以防卡米'
time='2020年8月7号'
   [[ $Choice = 1 ]] && Download -net 8b315c37-736a-4e83-95e1-1e4ac4f7da6c "$1.zip" 19163791 cb08a33800824be1fe716a55afd6099a "$1.zip"
;;

aerfacharge)
MIUI=1
id='aerfacharge'
name='阿尔法充电动画'
version='v1.0'
versionCode='1'
author='相见即是缘'
description='MIUI12安卓10阿尔法充电动画全机型通用（仅限官方，官改无效）'
time='2020年6月21号'
   [[ $Choice = 1 ]] && Download -net 1c5ec0ba-c867-4af9-97ac-f1777266ce03 "$1.zip" 405267 c4c65b717af0f84c62003da62bcf1bf2 "$1.zip"
;;

10x5g_perfect_cutout)
MIUI=1
id='10x5g_perfect_cutout'
name='Redmi 10x 5G 完美缺口'
version='2.0.0'
versionCode='2'
author='嘟嘟Ski'
description='优化隐藏水滴效果，此模块适用于Redmi 10x 5G 及 10x 5G Pro，系统为基于Android 10的MIUI所有版本'
time='2020年6月25号'
   [[ $Choice = 1 ]] && Download -net 9e86469b-883e-4148-b84f-acb7934b699c "$1.zip" 15826 9fbd92a81175a45eeac4a8cdf0c07440 "$1.zip"
;;

10x5g_perfect_cutout2)
MIUI=1
id='10x5g_perfect_cutout2'
name='Redmi 10x 5G水滴优化'
version='2.2.0'
versionCode='4'
author='嘟嘟Ski'
description='优化隐藏水滴效果，此模块仅适用于Redmi 10x 5G（不包括10x 5G Pro），且要求系统版本必须为MIUI 12.0.2。不符合要求的型号和系统版本，切勿使用！'
time='2020年7月23号'
   [[ $Choice = 1 ]] && Download -net 2a291c5d-6170-4e91-ae61-c5e8f3aba943 "$1.zip" 48984 eb82f672596c5cc6811642421f89fd8c "$1.zip"
;;

pig)
MIUI=1
id='pig'
name='K30 全系列  全局猪鼻子'
version='v1.3'
versionCode='3'
author='@Teemo_omeeT   qq：773676080'
description='让K30系列的药丸孔，变成猪鼻子'
time='2020年6月23号'
   [[ $Choice = 1 ]] && Download -net 27a82174-d0a8-43fc-9098-4ac323b70324 "$1.zip" 31674 d36b082c0455cdc87d838cd464ac6e0e "$1.zip"
;;

K30-5G_Status_bar)
MIUI=1
id='K30-5G_Status_bar'
name='k30-5G猪鼻子加普通状态栏高度'
version='v1'
versionCode='1'
author='by：Han | 情非得已c & Teemo_omeeT'
description='让k30-5G的药丸孔，变成猪鼻子，加普通状态栏高度，猪鼻子由@Teemo_omeeT修改'
time='2020年6月23号'
   [[ $Choice = 1 ]] && Download -net bf8563c8-11d8-4396-b601-091c219e2835 "$1.zip" 31250 334935c6feef7cb2bdb8f26635930443 "$1.zip"
;;

Xiaomi_Full_frame_rate)
MIUI=1
id='Xiaomi_Full_frame_rate'
name='小米系列全局高刷'
version='v1.3'
versionCode='3'
author='by：Han | 情非得已c'
description='使用模块方式冻结电量和性能，让支持小米高刷新率的设备，全局使用高刷，需要把在设置里 -->显示 -->屏幕刷新率设置为最高刷新率'
time='2020年6月25号'
   [[ $Choice = 1 ]] && Download -net 90db9063-5a40-41f4-8e4c-c4e573d9cad5 "$1.zip" 1628 50dad749ae3e6d529332f4d31e1fc05d "$1.zip"
;;

Hide_system_ROOT)
id='Hide_system_ROOT'
name='隐藏系统ROOT'
version='v1.2'
versionCode=2
author='by：Han | 情非得已c'
description='隐藏除Magisk以外的系统ROOT，只保留magisk su，因为系统ROOT的存在会让Magisk Hide失效，导致部分应用仍然会检测到ROOT，且部分机型会存在Magisk掉ROOT的情况'
time='2020年7月8号'
   [[ $Choice = 1 ]] && Download -net 40ef1dc9-a9ca-4e94-b3d3-1de5d28f1db0 "$1.zip" 1639 b08b0258ab5b9916379ce6bd54cb9e81 "$1.zip"
;;

Show_touch)
id='Show_touch'
name='修改显示触摸点'
version='v1'
versionCode=1
author='by：Han | 情非得已c'
description='修改显示点按操作视觉反馈触摸点'
time='2020年7月21号'
   [[ $Choice = 1 ]] && Download -net 2c64fe55-d474-4c78-a95e-39a3b64e976e "$1.zip" 48757 58b731914754fffbaeb5816df6cc385d "$1.zip"
;;

AD-Hosts)
id='AD-Hosts'
name='AD Hosts'
version='V5.2.3'
versionCode='5230'
author='依然的爱'
description='屏蔽各类广告包括(各大视频网站,运营商劫持广告,大部分APP广告),hosts规则均来自于网络搜索,github,人工抓取及酷友提供,使用时请关闭其他hosts模块,请关闭systemless hosts模块(如果有)。'
time='2020年8月15号'
   [[ $Choice = 1 ]] && Download -net 39be2dce-3e65-44a3-ba07-697802340d5c "$1.zip" 846432 a1c935dd561cda7fce4e76f37b711bb1 "$1.zip"
#https://aisauce.coding.net/p/ad-hosts/d/ad-hosts/git/raw/master/release/AD_hosts.zip
;;

Freezing_system_app)
id='Freezing_system_app'
name='使用Magisk模块方式冻结系统应用'
version='v1'
versionCode='1'
author='by：Han | 情非得已c'
description='就算是官方系统没去除卡米限制，也可完美使用'
time='2020年8月9号'
;;

Convert_to_system_app)
id='Convert_to_system_app'
name='三方应用转系统应用'
version='v1.2'
versionCode='2'
author='by：Han | 情非得已c'
description='自定义方式使用模块方式将三方应用转为系统应用'
time='2020年8月20号'
;;

taichi)
id='taichi'
name='Taichi'
version='v6.2.2'
versionCode='622'
author='weishu'
description='Use Xposed modules with Taichi in Magisk.（切换到太极 · 阳）'
expversion='湛泸·6.3.0(630)'
time='2020年7月9号'
   [[ $Choice = 1 ]] && Download -net b91d9dd5-049e-4dad-b608-e0b89e0197d6 "$1.zip" 410776 dab612cd6ab9d1fdda23017e19219cce "$1.zip"
   [[ $exp = 1 ]] && Download -net b92bd97a-4480-40bd-8b1b-594ec7ebcb90 "me.weishu.exp.apk" 8558626 6f66701ad229658bfb004c0f9441c5fb "me.weishu.exp.apk"
;;

Remove_Temperature_Control)
id='Remove_Temperature_Control'
name='移除温控'
version='v2020081400'
versionCode='6'
author='by：Han | 情非得已c'
description='用途：Magisk模块方式移除温控文件'
time='2020年8月14号'
;;

wifi-bonding)
id='wifi-bonding'
name='Wifi Bonding - 让Wi-Fi带宽提速（高通）'
version='1.13'
versionCode='14'
author='simonsmh'
description='Doubles your wi-fi bandwith by modifying WCNSS_qcom_cfg.ini（通过修改WCNSS qcom cfg.ini，让Wi-Fi带宽提速）'
time='2020年8月18号'
   [[ $Choice = 1 ]] && Download -net 5ae55534-5b96-4a56-991d-914129190a0c "$1.zip" 4777 7bd6173bb8e254c4b1e0aae25528f566 "$1.zip"
;;


Transition_Animation)
id='Transition_Animation'
name='过渡动画切换（不通用）'
version='v2020020300'
versionCode='1'
author='by：Han | 情非得已c'
description='原理：通过修改Android 系统，修改过渡动画。'
time='2020年6月15号'
   [[ $Choice = 1 ]] && Download -net 8267a665-3767-493c-aa4a-f6f626966eb2 "$1.zip" 732022 c88194b23dc79665725d6aad47851faf "$1.zip"
;;

Model_Camouflage)
id='Model_Camouflage'
name='机型伪装'
version='v1'
versionCode='1'
author='by：Han | 情非得已c'
description='原理：通过Magisk修改prop达到机型伪装。'
time='2020年6月15号'
;;

com.fb.fluid)
id='com.fb.fluid'
name='流体手势导航'
version='2.0-beta11'
versionCode='178'
author='佚名'
description='将流体手势导航内置为系统应用'
time='2020年6月15号'
   [[ $Choice = 1 ]] && Download -net 3d2ae634-619d-484a-999c-ea7c196b9be8 "$1.apk" 7562544 c70b5ca61f0093f01b2d1b86b8f26156 "$1.apk" 2.0-11 178
;;

com.omarea.gesture)
id='com.omarea.gesture'
name='Gesture(手势导航) '
version='1.5.5'
versionCode='97'
author='嘟嘟Ski'
description="将Gesture(手势导航) $version($versionCode)内置为系统应用"
time='2020年8月4号'
   [[ $Choice = 1 ]] && Download -net d0aca454-49b8-4033-b13e-6bd9c455f287 "$1.apk" 171141 a213d182964badfad1b437ddf86c56e8 "$1.apk" 1.4.3 87
;;

emojiR)
id='emojiR'
name='Android11 emoji'
version='11 beta3'
versionCode='1'
author='酷安@mdog Telegram@mdogfortg'
description='Its new emoji for android 11 beta3，这是安卓11的新emoji'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net 47e6f38d-0f8e-4dec-874e-e5401cd1c476 "$1.apk" 9133455 daacac30d0c4870dbfc8fe796d24f15e "$1.apk" 1.4.3 87
;;

SELinux_OFF)
id='SELinux_OFF'
name='关闭SELinux'
version='v1.2'
versionCode='2'
author='by：Han | 情非得已c'
description='在重启时自动关闭SElinux，针对部分模块需要关闭SELinux才能正常开机'
time='2020年8月13号'
   [[ $Choice = 1 ]] && Download -net 11b0473c-a933-470f-9e45-1906fcd02284 "$1.zip" 1564 4c2c32d2664fb047a35227e58d42708c "$1.zip"
;;

SELinux_ON)
id='SELinux_ON'
name='开启SELinux'
version='v1.2'
versionCode='2'
author='by：Han | 情非得已c'
description='在重启时自动开启SElinux，针对部分官改系统默认关闭SELinux'
time='2020年8月13号'
   [[ $Choice = 1 ]] && Download -net f9a73788-1a84-4631-a67a-a8c10941ffc1 "$1.zip" 1568 18f8048cbe38e30ba038d9302940b2c5 "$1.zip"
;;

scene_swap_controller)
id='scene_swap_controller'
name='Scene的附加模块(二)'
version='1.1.0'
versionCode='11'
author='嘟嘟Ski'
description='Scene的附加模块之二（ZRAM/SWAP控制器），在开机时根据配置调整虚拟内存'
time='2020年8月14号'
   [[ $Choice = 1 ]] && Download -net de5b9b2a-ed4e-4890-ada4-68ca4587ef8e "$1.zip" 10618 94a46e894eefb15f015795cb317d0d87 "$1.zip"
;;

riru-core)
id='riru-core'
name='Riru (Riru - Core)'
version='v21.3'
versionCode='36'
author='Rikka  酷安@蓝莓味绿茶 '
description='提供一种将代码注入 zygote 进程的方法'
time='2020年8月18号'
   [[ $Choice = 1 ]] && Download -net ac7c10ba-d328-45c8-b54d-457a0ba7ac0e "$1.zip" 542443 4608f13dd47ad33145f47e7e667e97a1 "$1.zip"
;;

riru_storage_redirect)
id='riru_storage_redirect'
name='Riru - 存储空间隔离（存储重定向）'
version='v22.7'
versionCode='44'
author='Rikka  酷安@蓝莓味绿茶 '
description='启用存储空间隔离（存储重定向）的增强模式，包名=moe.shizuku.redirectstorage'
time='2020年7月29号'
   [[ $Choice = 1 ]] && Download -net 8f3b3786-b76c-40ba-8627-e295594e0c0e "$1.zip" 605754 f2c2d431a209269a6b21bf014d8a983a "$1.zip"
;;

riru-module-xfingerprint-pay-wechat)
id='riru-module-xfingerprint-pay-wechat'
name='Riru - 指纹支付 - 微信'
version='v3.9.11'
versionCode='1'
author='Jason Eric'
description='让微信支持指纹支付 Fingerprint pay for WeChat.'
time='2020年6月16号'
   [[ $Choice = 1 ]] && Download -net 10cd5e8d-f797-44c4-94ce-49d04ac9ea10 "$1.zip" 1200754 1131f9e466c6e32d7bbc24697361831d "$1.zip"
;;

riru-module-xfingerprint-pay-qq)
id='riru-module-xfingerprint-pay-qq'
name='Riru - 指纹支付 - QQ'
version='v3.9.11'
versionCode='1'
author='Jason Eric'
description='让QQ支持指纹支付 Fingerprint pay for QQ.'
time='2020年6月16号'
   [[ $Choice = 1 ]] && Download -net 608bccdb-c1da-4887-8143-79fb42f6d3bf "$1.zip" 1389596 0ad9d08cdab8abfef8bc4508366ed42d "$1.zip"
;;

riru-module-xfingerprint-pay-alipay)
id='riru-module-xfingerprint-pay-alipay'
name='Riru - 指纹支付 - 支付宝'
version='v3.9.11'
versionCode='1'
author='Jason Eric'
description='让支付宝支持指纹支付 Fingerprint pay for Alipay.'
time='2020年6月16号'
   [[ $Choice = 1 ]] && Download -net cfc83580-faaf-45ff-a5e0-6f1392ee3a17 "$1.zip" 1387225 3e87a4d1b62042f9eea301cb92709fda "$1.zip"
;;

riru-module-xfingerprint-pay-taobao)
id='riru-module-xfingerprint-pay-taobao'
name='Riru - 指纹支付 - 淘宝'
version='v3.9.11'
versionCode='1'
author='Jason Eric'
description='让淘宝支持指纹支付 Fingerprint pay for Taobao.'
time='2020年6月16号'
   [[ $Choice = 1 ]] && Download -net 7fbfa581-f5cb-472b-a7d2-8098c64930d6 "$1.zip" 1386372 f3a926b4c0abca2335059c59d59aadaa "$1.zip"
;;

mm)
id='mm'
name='MM管理器(叶子修改版)v3.0'
version='2020.2.26'
versionCode='202002260'
author='『酷安:@永恒丶叶子』'
description='使用方法：第三方REC→高级→在终端中运行 "/data/media/mm"、"/sdcard/mm"、"*/mm"、增加切换 magisk核心功能、增加备份还原模块!增加一键操作！'
time='2020年6月15号'
   [[ $Choice = 1 ]] && Download -net a96094aa-b94e-4780-8989-de960255a98f "$1.zip" 7374 f898f49917c231fae144e1ba60a58a14 "$1.zip"
;;

reducetouchdelay)
id='reducetouchdelay'
name='提高触控跟手性'
version='v2'
versionCode='2'
author='酷安@酷哥ゞ @Amktiao'
description='修改"无障碍"的触摸和按住延迟和修改framework中的dimen实现更流畅/顺手的效果.（食用方法：打开设置-无障碍，调整"触摸和按住延迟"）（感谢@Amktiao提供的思路及核心文件）'
time='2020年6月11号'
   [[ $Choice = 1 ]] && Download -net 31769945-a1b2-4107-835f-154b479d38ba "$1.zip" 8947 b94ae56a3b617247bac1f7d95475fb30 "$1.zip"
;;

busybox-ndk)
id='busybox-ndk'
name='Busybox for Android NDK'
version='1.31.1'
versionCode='13115'
author='osm0sis @ xda-developers'
description='Static busybox binary for all Android architectures built with the NDK（busybox可执行的二进制命令，适用于使用NDK构建的所有Android手机）'
time='2020年6月14号'
   [[ $Choice = 1 ]] && Download -net ed51f055-6dd1-4af6-8360-27512a6ed3e5 "$1.zip" 9767435 f158b4737a72f1426d7fe36746b42ad1 "$1.zip"
;;

kfmark)
id='kfmark'
name='快否激活器'
version='v1.3'
versionCode='6'
author='酷安@汝南京'
description="用途：每次重启手机自动激活快否，由cn.endureblaze.activatebenchaf & 快否激活器v$6提供服务支持"
time='2020年6月18号'
   [[ $Choice = 1 ]] && Download -net 7e5ab0da-73a7-483f-9c9f-73eae287fae7 "$id.txt" 867016 c968d8cebc8e3b84870e8e3248854be5 "$id.txt"
;;

Disable-HWoverlays)
id='Disable-HWoverlays'
name='停用HW叠加层模块'
version='v2'
versionCode='3'
author='是陉湮吖'
description='强制开发者选项里停用HW叠加层，始终使用GPU进行屏幕合成'
time='2020年6月11号'
   [[ $Choice = 1 ]] && Download -net 9b315c32-96ae-4c27-ab01-baab87ebb670 "$1.zip" 4604 0c80645bedc55ef88012bb7a7411c4a1 "$1.zip"
;;

MacRandomization)
id='MacRandomization'
name='Mac地址随机化模块'
version='v1'
versionCode='1'
author='Santiago'
description='Mac地址随机化模块，连接公共WIFI更安全。安装后去开发者设置找到选项打开设置即可。'
time='2020年6月11号'
   [[ $Choice = 1 ]] && Download -net c6d7af6d-b030-4bdb-819d-ff6ee9649c2a "$1.zip" 8138 f988087ed2668cf6c8888774f6ceeaf8 "$1.zip"
;;

mi.an)
id='mi.an'
name='给米安配个主题'
version='v1'
versionCode='1'
author='@酷安by:巴啦啦魔仙女王'
description='<请使用白色默认主题蟹蟹>辣鸡米安，毁我青春，颓我精神，耗我钱财，坑我历史，废我智商😡'
time='2020年6月11号'
   [[ $Choice = 1 ]] && Download -net 03a2a01b-2dcd-4cc3-ac04-79c89eafb62b "$1.zip" 3643715 4dc82ced9f17623bc287f69b2a5e42e7 "$1.zip"
;;

ziyouzhiyi)
id='ziyouzhiyi'
name='自由之翼美化缩小版字体'
version='v1'
versionCode='1'
author='@酷安by:巴啦啦魔仙女王'
description='字体模块'
time='2020年6月11号'
   [[ $Choice = 1 ]] && Download -net 59930962-665b-4b0b-854f-2c9ed8436250 "$1.zip" 5730560 6b6b310f616b9877c70af399bf86b3b4 "$1.zip"
;;

201806112158)
id='201806112158'
name='金刚黑体DFKingGothicJP（2018年全网首发移植日系苹方），微信公众号：宁静之雨'
version='2.0'
versionCode='2'
author='宁静之雨'
description='不修改系统文件实现多字重字体替换，勾选模块后重启生效，如果手机系统自带字体切换功能请务必切回系统默认字体。'
time='2020年6月11号'
   [[ $Choice = 1 ]] && Download -net fcc5cb36-7503-4af9-8c64-a65eec86a52b "$1.zip" 60131628 91aca7dbd08a18ede807e9caaf1d65f1 "$1.zip"
;;

201806031309)
id='201806031309'
name='iOS12苹方中英文+emoji移植'
version='13.0d1e3'
versionCode='1'
author='宁静之雨'
description='不修改系统文件实现多字重字体替换，勾选模块后重启生效，如果手机系统自带字体切换功能请务必切回系统默认字体，更多字体请关注微信公众号【宁静之雨】和小号【小梨科技】获取。注意，勾选多个字体模块会相互干扰，某些所谓开启系统隐藏特性的模块也会修改字体配置文件，同样会干扰我的字体显示效果。我的所有分享都完全免费，请勿轻信任何付费专享服务，如果喜欢我分享的字体，记得每天帮我点一下文章中间和底部的的广告，免费创作不易，还请多多支持。'
time='2020年6月11号'
   [[ $Choice = 1 ]] && Download -net c9d3b161-d194-472b-aff1-ee615e94473a "$1.zip" 83743185 e90203bea5ad241fa3b8922a1fe2d6bf "$1.zip"
;;

keepqdark)
id='keepqdark'
name='Android10强制黑暗模式'
version='v1'
versionCode='1'
author='robgiering'
description='在Android Q上重新启动后强制黑暗(ForceDark)模式'
time='2020年6月11号'
   [[ $Choice = 1 ]] && Download -net 36d523f7-531b-4535-8fc5-72e5c63a798e "$1.zip" 6574 bcf9188bc1b03729765def5c8ece039b "$1.zip"
;;

curl)
id='curl'
name='Curl For Android'
version='v2.2 (v7.67.0)'
versionCode='7'
author='Zackptg5'
description='Latest version of curl with boringssl support and more'
time='2020年6月11号'
   [[ $Choice = 1 ]] && Download -net 8feaac9d-19db-4cf0-afd6-3371d424d053 "$1.zip" 7735360 76a43ccd4cc3cb1de107ca6e4cbe6371 "$1.zip"
;;

BootAnimation_Screen1)
   BootAnimation_Screen1 -net ea328a64-c4da-41fd-8d5a-6e91e84d5cb9 第一屏splash内置18个.zip 10697488 8a69c474a8287108a1a79b01146349a7 第一屏splash 18
;;

BootAnimation_Screen2)
   [[ $BaiJZY = 1 ]] && Download -net 9d4ff1d7-3096-4747-8981-4f5d95afbd16 BaiJZY.zip 1794147 969c51b355b7292b91adc81ac77ddae3 BaiJZY.zip
   [[ $BaiJZY_Dynamic = 1 ]] && Download -net 89ce8017-ab28-43d8-b289-5a67d6877d74 BaiJZY_Dynamic.zip 12758763 1670809de395eeed135296eecf45bf6a BaiJZY_Dynamic.zip
   [[ $Bat = 1 ]] && Download -net 38828fa3-7ab5-4110-9c6c-b047dab3ab42 Bat.zip 13467018 71749fa85558d78b4e260ad6a79d471d Bat.zip：
   [[ $BiliBili = 1 ]] && Download -net bbf35ef2-e80e-4665-90e0-36381be96c21 BiliBili.zip 2168703 dd5ad5ba2d86391ee759e70c76cbbf15 BiliBili.zip
   [[ $BiliBili2233 = 1 ]] && Download -net fd5b148a-ff64-4f51-beef-50f2ba4bd886 BiliBili2233.zip 19659178 3847a30ee173b3be44548c8bfbac404b BiliBili2233.zip
   [[ $Bukaniang_Black = 1 ]] && Download -net ee459fd1-92db-4739-b904-8650e76ab4ad Bukaniang_Black.zip 3009410 6b68edd13e341dbc362bd837ef5f7095 Bukaniang_Black.zip
   [[ $Bukaniang_White = 1 ]] && Download -net 9208b7d3-047f-4e2f-bfff-25987d3f799e Bukaniang_White.zip 4105241 800a36d1b4b4367f3c9bfa00ae532bac Bukaniang_White.zip
   [[ $China_Telecom_5G = 1 ]] && Download -net c2c8ec73-8a55-47a2-91de-eb2fb152df3a China_Telecom_5G.zip 9449409 bf1c0627ac777baa5845cebfe3bd0da7 China_Telecom_5G.zip
   [[ $China_Unicom_5G = 1 ]] && Download -net bf6f4fcc-55d5-4b82-9552-8379cfbb0f7b China_Unicom_5G.zip 6799725 28d8ccc55a6cba6b9f322f06e67f7fc0 China_Unicom_5G.zip
   [[ $chuyinBlack = 1 ]] && Download -net f82d14f7-65f9-4567-989f-60e35f183dab chuyinBlack.zip 467628 c4e618f63c7c1da5b6db1a77baa7334e chuyinBlack.zip
   [[ $chuyinWhite = 1 ]] && Download -net 1f87c445-c7c4-425c-b3e7-ddd5a6a80ec8 chuyinWhite.zip 1859769 95fe13d96baff1c2848d06f18f868df3 chuyinWhite.zip
   [[ $Code_Rain = 1 ]] && Download -net 28ed599d-0819-4e0f-9f6f-cb13121693dd Code_Rain.zip 8275873 a95342d8ca543f007db5b93097d9aad1 Code_Rain.zip
   [[ $coolapk = 1 ]] && Download -net 8167cec0-95ec-4b65-be7d-3e84326afb1a coolapk.zip 9366708 64ddf1f747170a27966b883446cc69b7 coolapk.zip
   [[ $coolapk2 = 1 ]] && Download -net fe519f04-722b-4665-b52c-06ccf539e0ce coolapk2.zip 2994983 3e55137054db1a993fd8debbd263190b coolapk2.zip
   [[ $DaMoWang = 1 ]] && Download -net 3abbea7f-2c5a-4759-bb16-fc3a35c99d44 DaMoWang.zip 1198924 cdef4a3a4a9662ed93a370aada1ee088 DaMoWang.zip
   [[ $DaMoWang_x = 1 ]] && Download -net 851b73ad-b835-4b53-b969-76335951a1c1 DaMoWang_x.zip 263343 9dbe1277de1b74462ddf9d9a3a53e90b DaMoWang_x.zip
   [[ $DotOS = 1 ]] && Download -net 2c3436e8-6a14-4c3e-b7ec-bf8a2e21503e DotOS.zip 1798940 e4fe220e1b83d60b7aaf96990077516b DotOS.zip
   [[ $DuYe = 1 ]] && Download -net 37906b15-c189-4dd9-9675-44f62b6a20c4 DuYe.zip 19232047 fbd1c447e6a83a36935203a2c789bf1f DuYe.zip
   [[ $FindX = 1 ]] && Download -net d24ce49a-5e37-4b2b-a074-eaa57c845e78 FindX.zip 3660064 6018048bf689bf0b505c285b1055fc22 FindX.zip
   [[ $Flyme = 1 ]] && Download -net fd497076-4eb6-4232-bd1d-b26775ddefc3 Flyme.zip 1193872 3655e5fc077e811d0820dee44073f118 Flyme.zip
   [[ $Fox = 1 ]] && Download -net 073f2755-fa28-43b7-b3be-740741eb0156 Fox.zip 1131803 77942ee47e9e550b6d17802af9541bc1 Fox.zip
   [[ $GEARMAGIC = 1 ]] && Download -net 074ffd88-fb7a-485a-8a35-8fd91d60c5d0 GEARMAGIC.zip 235975 5f3130e10c48987ba76928a17201dc11 GEARMAGIC.zip
   [[ $Google_Colorful_White = 1 ]] && Download -net 686070d9-c760-4179-9a37-1d49d23ec749 Google_Colorful_White.zip 26512605 7f57277e961b92555480e21e32f83afe Google_Colorful_White.zip
   [[ $GoogleBlack = 1 ]] && Download -net e6327b7e-f3c2-4447-83f3-a4d90a8cc941 GoogleBlack.zip 1874601 acb835df41e619143dfb3ae95ae0dc0c GoogleBlack.zip
   [[ $GoogleWhite = 1 ]] && Download -net 5518f71e-613f-4075-b25b-67396cafbc69 GoogleWhite.zip 1842440 2ecc374d3c4321e8949a0b1d670921c1 GoogleWhite.zip
   [[ $GoogleWhite2 = 1 ]] && Download -net 97f563f8-8798-475d-ab00-29d08821c508 GoogleWhite2.zip 9724110 424c39d5899acb6539fec6e32c942efe GoogleWhite2.zip
   [[ $haipa = 1 ]] && Download -net 275cdec6-8afd-456f-90d3-1f3e0b635821 haipa.zip 14386690 e49820c65d6dae3158a7263f6e239022 haipa.zip
   [[ $HAVOC = 1 ]] && Download -net aa630795-d506-4d41-b53e-6e7897df26e1 HAVOC.zip 10769316 33e03a61693d82c4448a01c5c5a08bc2 HAVOC.zip
   [[ $HuaWeiBlack = 1 ]] && Download -net 60445684-a18a-4f19-8d54-0d0a5772226d HuaWeiBlack.zip 1001282 dc00d9aadd2b646c412d6baa8e443de3 HuaWeiBlack.zip
   [[ $HuaWeiBlack2 = 1 ]] && Download -net 7549f669-19c2-4c97-9650-4e7d1ac57790 HuaWeiBlack2.zip 7761130 9a501c80e00bcc6d610c1594214cdf12 HuaWeiBlack2.zip
   [[ $iPhoneBlack = 1 ]] && Download -net a5f4d40c-ba61-4a21-bfac-709e650ec144 iPhoneBlack.zip 157544 b867829d9f9ae14ff401c26889456901 iPhoneBlack.zip
   [[ $iPhoneBlack2 = 1 ]] && Download -net 5d14ecd0-ef67-4451-9b85-08c57724a09f iPhoneBlack2.zip 15383 6f51a952737c5b077b53126f124bbe44 iPhoneBlack2.zip
   [[ $iPhoneBlack_Flower = 1 ]] && Download -net 187dec61-d541-4b06-bf24-ab86173c2882 iPhoneBlack_Flower.zip 10765768 f30cb352e7abac65a509093fa52a90c1 iPhoneBlack_Flower.zip
   [[ $iPhoneWhite = 1 ]] && Download -net 2e4eda1e-d11c-4f62-8005-0cf956e7f415 iPhoneWhite.zip 23346 ce9af9e53c0c72a4ce1e8f10a0425355 iPhoneWhite.zip
   [[ $IQOO = 1 ]] && Download -net fa5d7bad-914a-461d-b14e-9260c3bb3840 IQOO.zip 5043143 e6e3eb9f3166079fe82daf0d77133050 IQOO.zip
   [[ $JiaZaiZ = 1 ]] && Download -net 0e40eafb-185c-495b-8b15-b34e76f2acc3 JiaZaiZ.zip 2391115 c6d2f445ae2acbb14cda4e0c9e4c40cc JiaZaiZ.zip
   [[ $Joker = 1 ]] && Download -net 930ddf6c-e5da-4edc-afb9-e66668752b46 Joker.zip 815691 2a2ecd693ba544f113dc5cb846489d03 Joker.zip
   [[ $Joker_Rom = 1 ]] && Download -net 0b7a19b7-4fd1-4c7d-9add-e2a8d1ef7bb2 Joker_Rom.zip 277688 7d5ba90ed233591287e2c43057e305c5 Joker_Rom.zip
   [[ $LineageOS = 1 ]] && Download -net 8e18875e-118c-4b17-88c5-852d8acf2321 LineageOS.zip 1973207 50b6a947bb080c8fbccbfa7fbeca80df LineageOS.zip
   [[ $MeiTu_CC = 1 ]] && Download -net 63a42e25-9484-45e1-bee6-17aa9c65455b MeiTu_CC.zip 9825387 f90be201cdb8af4538e88e9d6e46012e MeiTu_CC.zip
   [[ $mi = 1 ]] && Download -net ca0b6f90-c2ac-4ed5-a740-258b991aa363 mi.zip 174486 a80dc5fafe3a498ec8f8198a746b90d2 mi.zip
   [[ $MI8 = 1 ]] && Download -net e9b27254-a943-49ac-8226-6454190f6509 MI8.zip 13347835 e606a31f4bb9c0963b1bca57e579f388 MI8.zip
   [[ $MI9 = 1 ]] && Download -net d18a6d84-ce6e-4718-9c1b-5910c72b158c MI9.zip 39661781 2ab0258ea8a2bfebbd69b407019c3efd MI9.zip
   [[ $mi_CC = 1 ]] && Download -net f45b8fd8-9fe6-4378-bbd2-7a3a5e9a7e01 mi_CC.zip 20795341 9fca308b20af22eebc2fc01120ea426c mi_CC.zip
   [[ $mi_New = 1 ]] && Download -net 45f18d53-811f-4863-aa2d-8df7ffb20bee mi_New.zip 292628 e226ff1acf262b297b77137e2aa14471 mi_New.zip
   [[ $MiaoHuaTang = 1 ]] && Download -net b275708c-9466-4643-8a99-0cac2d9312c5 MiaoHuaTang.zip 4349845 4f7fc12886f79a27b7159dae9d34ccd3 MiaoHuaTang.zip
   [[ $miku = 1 ]] && Download -net 1703a7cd-186b-40b1-be91-e23c46eed90e miku.zip 12792125 e0d0af19723c38c81be0b7154f76fbdb miku.zip
   [[ $MIUI10 = 1 ]] && Download -net a9b2a4e6-5400-4a73-af5b-de1f3bfc24d7 MIUI10.zip 2476705 72675465776fa247672898a9f9041325 MIUI10.zip
   [[ $MIUI = 1 ]] && Download -net dedcdfbc-d073-41b8-bc6e-3e121d21e733 MIUI.zip 459898 857e1b808530cab0b0af22a595ddee6b MIUI.zip
   [[ $MIUI10_2 = 1 ]] && Download -net 7b511e76-06c6-4539-a361-b5dc0131877b MIUI10-2.zip 13369021 61cef1779aad6b62e5f9822b93c05a90 MIUI10-2.zip
   [[ $MIUI11 = 1 ]] && Download -net be2afbea-7b3e-4de9-a892-92577b074ecb MIUI11.zip 33862944 c0309c88d9c42c4e0d159a9fb53b0347 MIUI11.zip
   [[ $MIUI_History = 1 ]] && Download -net 7147b47a-ef73-4917-b599-fcf7045d3c83 MIUI_History.zip 3844612 4e6de77f25e818f944a347d772e052d2 MIUI_History.zip
   [[ $MIX = 1 ]] && Download -net 2f6baede-a1c1-4d01-a6f5-0dc1d5741603 MIX.zip 33211 96873cabdb249913c7bf745518bed69e MIX.zip
   [[ $MIX_New = 1 ]] && Download -net 5ae70d9a-5cb6-4a90-a381-7621b7d74fd9 MIX_New.zip 323339 d9db8dde42701996572a1dc88d4f7fba MIX_New.zip
   [[ $MOKEE = 1 ]] && Download -net 6c1b4686-9fed-42ae-b94f-87706f08e31e MOKEE.zip 4642817 e3d3434747ff459feea199a077c92564 MOKEE.zip
   [[ $Nike = 1 ]] && Download -net cef7fab8-2d80-45fc-8298-9b796285f54b Nike.zip 874407 29463791455f84c6f74deb7d370c3f0f Nike.zip
   [[ $NOKIA = 1 ]] && Download -net df147c04-a3ba-4571-887e-c03f9de9f57b NOKIA.zip 305737 df7ea2c13c14038896fca6578f4db421 NOKIA.zip
   [[ $NOKIA = 1 || $NOKIABlack = 1 || $Nokia_White2 = 1 ]] && Download -net fe39fb0c-92ed-4031-9220-86ad778f6a2a NOKIA_Music.mp3 815788 5414fa8d73238fd0f96c6e8437dae0e4 NOKIA_Music.mp3
   [[ $Nokia_White2 = 1 ]] && Download -net c4d7d752-b9d2-4eda-8915-a56411fc2a24 Nokia_White2.zip 12864675 f60ea74c55f5592794075a32f0d92aaf Nokia_White2.zip
   [[ $NOKIABlack = 1 ]] && Download -net ea04c32b-7a33-4ed4-9e1b-d8bedc73384c NOKIABlack.zip 471492 fd451c7a575e22e395e64597929f0de4 NOKIABlack.zip
   [[ $One_Plus_Colorful_Red = 1 ]] && Download -net 0f922ad0-7d0f-4ed6-ab87-0b0b734ed5ee One_Plus_Colorful_Red.zip 10249441 1b9583cf8fd69bd8bea9fbaf5ca13f53 One_Plus_Colorful_Red.zip
   [[ $One_Plus_Colorful_White = 1 ]] && Download -net f1cb388e-04d0-4757-a712-304e3ba27331 One_Plus_Colorful_White.zip 13678052 1e505b2dc520ec741d52d097ca6d96ba One_Plus_Colorful_White.zip
   [[ $OnePlus_H2OS = 1 ]] && Download -net 5251babc-2d6e-40f5-84d0-412006624188 OnePlus_H2OS.zip 5228568 24a50c8e4398499d7c2752a206185326 OnePlus_H2OS.zip
   [[ $OnePlus_XiangJiaoJun = 1 ]] && Download -net e8ac750c-8973-4f68-92e3-d41d23caecd7 OnePlus_XiangJiaoJun.zip 34142011 ed9238361c125e6094b67d164f63540f OnePlus_XiangJiaoJun.zip
   [[ $OPPO_Cai_S = 1 ]] && Download -net f1cb388e-04d0-4757-a712-304e3ba27331 OPPO_Cai_S.zip 1618211 0140cd3d836b7ae0a6786a9cbb3663ca OPPO_Cai_S.zip
   [[ $OPPO_Cai_Z = 1 ]] && Download -net b3b4d96b-f051-49c7-8603-a9df8c89c3d5 OPPO_Cai_Z.zip 909334 327241b2184894c90183462462a73d46 OPPO_Cai_Z.zip
   [[ $OPPO_S = 1 ]] && Download -net 0f27b850-524e-4571-98d3-27a5639dd6a5 OPPO_S.zip 212333 7c3d8aa7683d5940c19a15ab564e34d2 OPPO_S.zip
   [[ $realme = 1 ]] && Download -net 4c45c054-16cf-44a3-ae96-8d1847a4611d realme.zip 1022750 4dcaa50809016a3926ccab5d1e813bc0 realme.zip
   [[ $Redmi = 1 ]] && Download -net 5d69fb6c-0821-4699-88e6-88bcd84eeba1 Redmi.zip 706579 8b70c45b0b4fb5563d29e19a88801685 Redmi.zip
   [[ $Redmi_New = 1 ]] && Download -net 15e86d41-6cae-48a3-be56-120dab0d7433 Redmi_New.zip 379694 5317fbd9623f41b3067c9f47709c0e39 Redmi_New.zip
   [[ $ShangGan = 1 ]] && Download -net 93b39fdd-7336-4cbd-9447-e2dee36e8ac1 ShangGan.zip 4184144 7642c5a427f41af46288d08ecdecbe2a ShangGan.zip
   [[ $SIMPLICITY = 1 ]] && Download -net b2cbfe2d-934c-47a6-9f6f-75dcc4bdbd69 SIMPLICITY.zip 8038239 7cf975cad5f0f4039050836d3e49cc59 SIMPLICITY.zip
   [[ $SteveJobs = 1 ]] && Download -net 201e0b56-fb32-4579-9f80-c0491e9b081d SteveJobs.zip 35486 d30f0cfcce41624599b96887e325cb93 SteveJobs.zip
   [[ $TanChiShe = 1 ]] && Download -net afefda1f-4a06-4496-8adc-59f73c590100 TanChiShe.zip 6898692 e00f36c2fdef682d743bae5e1facba4a TanChiShe.zip
   [[ $Windows10 = 1 ]] && Download -net 5ce56a7d-aa8a-47a1-a112-486ef5565e4d Windows10.zip 1890458 dc7661d414a9f627a6b69cef96d442ff Windows10.zip
;;

Donation)
   URL "http://www.iyuji.cn/iyuji/s/YVJVV3RQNHppWnJpYjRSMEQwdjA2QT09/1587046677113263" &>/dev/null
;;

Update_History)
   URL "https://gitee.com/QingFeiDeiYi/Han.GJZS/raw/master/Update_History.md"
;;

exit_sideload)
   Download -net 2f49bf01-ce29-4239-9a2b-d0651048c5c2 "exit_sideload.zip" 548 a3b026fb22d60a0abd8bdbdb9b7ba194 "exit_sideload.zip"
;;

MIUI)
   MIUI -net f49313b8-946a-4e1a-83c8-37b3c0685064 MIUI1.4.7.zip 6502579 9caad9db13259bee221dff82888a1d34 MIUI
;;

Update)
   Update none none "搞机助手-2.7.11.apk" none none none 2020071800
;;

Update_Magisk)
   Update_Magisk -net f0461e2c-bf20-46bb-970c-e51607af954f "Magisk-v20.4.zip" 5942417 9503fc692e03d60cb8897ff2753c193f "Magisk-" 20.4 20400
   $GXin && AZ_Magisk_Manager -net 36811a6d-6dfc-4bd8-ab00-2d43ed01f29c "Magisk_Manager_7.5.1.apk" 2143331 0bfc5a310d7f363f9c9c3d5f4836d1d9 "Magisk_Manager"
;;

*)
   abort "！未找到服务"
esac
