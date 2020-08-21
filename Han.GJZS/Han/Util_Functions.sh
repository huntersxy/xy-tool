#Custom variable
export Util_Functions_Code=2020082002
export SDdir=/data/media/0
export Modules_Dir=/data/adb/modules
export Magisk_S=/data/adb/magisk/util_functions.sh
export Script_Dir=$TMPDIR/Script_Dir
export Module_disabled_get=$ShellScript/switchs/Magisk_Module_disabled_get.sh
export Module_disabled_set=$ShellScript/switchs/Magisk_Module_disabled_set.sh
export Module_remove_get=$ShellScript/switchs/Magisk_Module_remove_get.sh
export Module_remove_set=$ShellScript/switchs/Magisk_Module_remove_set.sh
export Frame_remove_Set=$ShellScript/switchs/Installed_Frame_remove_Set.sh
export install_MOD=$ShellScript/Magisk_Module/install_Module_Script.sh
export APK_Name_list=$Data_Dir/APK_Name.log
export APK_Name_list2=$Data_Dir/APK_Name2.log
export jian="$Script_Dir/update-binary"
export jian2="$Script_Dir/updater-script"
export Frame_Dir=/data/misc/$Package_name
export Charging_control=/sys/class/power_supply/battery/input_suspend
export Charging_control2=/sys/class/power_supply/battery/charging_enabled
export Game_Toolbox_File=/data/data/com.miui.securitycenter/files/gamebooster/freeformlist
export Status=$Data_Dir/Status.log
export BOOTMODE=true
export GXin=false
export Choice=0
export ChongQi Configuration File File_Name Download_File id name version versionCode author description MODID MODNAME MODPATH
Link=https://by-han.coding.net/api/share/download

#Dynamic variable
export Time=`date '+%F_%H·%M·%S'`
export ABI=`getprop ro.product.cpu.abi`
[[ -z $ABI ]] && export ABI=`getprop ro.product.cpu.abi2`

if [[ -f $Data_Dir/GJZS_PATH ]]; then
    export GJZS=$(cat $Data_Dir/GJZS_PATH)
else
    export GJZS=$SD_PATH/$Package_name
fi
export lu=$GJZS/Batch_installation
export lu2=$GJZS/Add_Modules
export lu3=$GJZS/XianShua


#Function

adb() (
    export HOME="$Data_Dir"
    lu="$HOME/.android"
         if [[ ! -d "$lu" ]]; then
            mkdir -p "$lu"
            chown $APP_USER_ID:$APP_USER_ID "$lu"
         fi
    
    if [[ $# -eq 0 ]]; then
        exec "$ELF1_Path/adb.elf"
    fi
    
    case "$1" in
        help | --help | kill-server | start-server | reconnect | devices | keygen | tcpip | connect | disconnect | usb | wait-for-*)
           exec "$ELF1_Path/adb.elf" "$@"
        ;;
        -reset)
            "$ELF1_Path/adb.elf" kill-server
            exec "$ELF1_Path/adb.elf" start-server
    esac
    
    
    [[ -z `"$ELF1_Path/adb.elf" devices | egrep -vi 'List of.*'` ]] && error "！无设备连接" && exit 126
    exec "$ELF1_Path/adb.elf" "$@"
)

fastboot() (
    if [[ $# -eq 0 ]]; then
        exec "$ELF1_Path/fastboot"
    fi
    
    case "$1" in
        help | --help | -h | devices)
        : ;;
        
        *)
            [[ -z `"$ELF1_Path/fastboot" devices` ]] && error "！无设备连接" && exit 126
        ;;
    esac
    
    exec "$ELF1_Path/fastboot" "$@"
)

abort() {
    error "$@"
    sleep 3
    exec exit 1
}

abort2() {
    abort -e "$@\n\n错误代码：`cat $Status`"
}

show_progress() {
    [[ -n $2 ]] && echo "progress:[$1/$2]" || echo "progress:[$1/100]"
}

adb2() { 
    if [[ "$#" -eq 0 ]]; then
        adb shell
        if [[ $? -ne 0 ]]; then
            abort "没有设备连接无法继续哦⊙∀⊙！"
        fi
    elif [[ "$1" = "-s" && "$#" -eq 2 ]]; then
        shift
        adb shell < "$1"
    elif [[ "$1" = "-c" ]]; then
        shift
        adb shell "$@"
    fi
}

adbsu() {
    local a b
    a=`adb shell su --help | grep '\-c'`
    [[ -n "$a" ]] && b=true || b=false
        if [[ "$#" -eq 0 ]]; then
            adb shell su
        elif [[ "$1" = "-s" && "$#" -eq 2 ]]; then
            shift
            adb shell su < "$1"
        elif [[ "$1" = "-c" ]]; then
            shift
            $b && adb shell su -c \'"$@"\' || echo "$@" | adb shell su
        fi
}

mask() {
        export Magisk=`$which magisk`
        if [[ "$1" == '-v' ]]; then
            if [[ -x $Magisk ]]; then
                MAGISK_VER=`$Magisk -v | sed 's/:.*//'`
                MAGISK_VER_CODE=`$Magisk -V`
            else
                abort "！未检测到Magisk，请确定Magisk Manager主页已显示安装了Magisk"
            fi
        elif [[ "$1" == '-vc' ]]; then
            if [[ -x $Magisk ]]; then
                MAGISK_VER=`$Magisk -v | sed 's/:.*//'`
                MAGISK_VER_CODE=`$Magisk -V`
            else
                abort "！未检测到Magisk，请确定Magisk Manager主页已显示安装了Magisk"
            fi
                if [[ -d $Modules_Dir ]]; then
                    echo "已安装Magisk版本：$MAGISK_VER（$MAGISK_VER_CODE）"
                    echo "本功能只支持已$Modules_Dir目录挂载模块的Magisk版本"
                    echo "---------------------------------------------------------"
                fi
        elif [[ -n "$1" ]]; then
            Module=$Modules_Dir/$1
            Module_XinXi=$Module/module.prop
            Module_S=$Module/post-fs-data.sh
            Module_S2=$Module/service.sh
            Module_us=$Module/uninstall.sh
            Module_prop=$Module/system.prop
            Module_Disable=$Module/disable
            Module_Remove=$Module/remove
            if [[ -f $Module_XinXi ]]; then
                version=`grep_prop version $Module_XinXi`
                versionCode=`grep_prop versionCode $Module_XinXi`
            fi
        fi
}

Installing_Busybox() {
    JCe=$PeiZhi_File/busybox_Installed.log
    [[ -f $JCe ]] && JCe2=`cat $JCe`
    case "$ABI" in
        arm64*) Type=arm64;;
        arm*) Type=arm;;
        x86_64*) Type=x86_64;;
        x86*) Type=x86;;
        mips64*) Type=mips64;;
        mips*) Type=mips;;
        *) echo "！ 未知的架构 ${ABI}，无法安装busybox"; return 1;;
    esac
    
    Start_Install() { CloudBusybox="$8"; }
        . $Load Install_busybox

    Start_Install() {
        Download "$@"
        if [[ -f "$Download_File" ]]; then
            BusyBox2=$ELF2_Path/busybox
            rm -f $ELF2_Path/*
            cp $Download_File $BusyBox2 && chmod 700 $BusyBox2
            echo "- 正在安装busybox-$Type版-$7($8)"
            $BusyBox2 --install -s $ELF2_Path &>/dev/null
                if [[ -L $ELF2_Path/true ]]; then
                    echo "- busybox-$Type版-$6($7)安装成功。"
                    echo "$8" >$JCe
                    chown $APP_USER_ID:$APP_USER_ID $BusyBox2
                    rm -f $Download_File
                else
                    echo "！busybox安装失败❌"
                    rm -f "$BusyBox2"
                    sleep 3
                fi
        fi
    }
    
        if [[ -z "$JCe2" || ! -L $ELF2_Path/true ]]; then
            echo "- 开始安装busybox"
            . $Load Install_busybox
        elif [[ $JCe2 -lt $CloudBusybox ]]; then
            echo "- 开始更新busybox"
            . $Load Install_busybox
        fi
}

Install_Applet() {
    JCe=$PeiZhi_File/Applet_Installed.log
    [[ -f $JCe ]] && JCe3=`cat $JCe`

    Start_Install2() {
        Download "$@"
        
            if [[ -f "$Download_File" ]]; then
                rm -rf $ELF1_Path/*
                unzip -oq "$Download_File" -d $ELF1_Path
                    if [[ $? = 0 ]]; then
                        echo "$7" >$JCe
                        chmod -R 700 $ELF1_Path/*
                        chown -R $APP_USER_ID:$APP_USER_ID $ELF1_Path/*
                            case "$ABI" in
                                arm64*)
                                    mv -f $ELF1_Path/arm64/* $ELF1_Path
                                ;;
                                
                                arm*)
                                    mv -f $ELF1_Path/arm/* $ELF1_Path
                                ;;
                                *)
                                    echo "！ 未知的架构 ${ABI}，无法安装adb & fastboot"
                                    rm -f "$ELF1_Path/adb"
                                ;;
                            esac
                            echo "- $3安装成功。"
                            rm -rf $Download_File $ELF1_Path/arm*
                    fi
            fi
        }
                           if [[ -z "$JCe3" || ! -f $ELF1_Path/CQ ]]; then
                               echo "- 开始安装$3"
                               Start_Install2 "$@"
                           elif [[ $JCe3 -lt $7 ]]; then
                               echo "- 开始更新$3"
                               Start_Install2 "$@"
                           fi
}

Cloud_Update() {
    local File S
    File="$PeiZhi_File/Cloud.zip"
    JCe="${PeiZhi_File}/Cloud_Version.log"
    Link=https://gitee.com/QingFeiDeiYi/Han.GJZS/raw/master/Han
    [[ -f $JCe ]] && JCe5=`cat $JCe`
    unset S
        if [[ -z $JCe5 || ! -f $Pages/Home.xml ]]; then
            S=初始化
        elif [[ $JCe5 -lt $Cloud_Version ]]; then
            S=更新
        fi
            if [[ -n $S ]]; then
                echo "- 正在$S云端页面：$Cloud_Version"
                    XiaZai "$Cloud_ID" "$File"
                    if [[ -f "$File" ]]; then
                        Check_MD5=`md5sum $File 2>/dev/null | sed 's/ .*//g'`
                           if [[ $Check_MD5 != $Cloud_MD5 ]]; then
                               rm -f $File
                               abort "- 更新云端页面失败"
                           else
                               unzip -oq "$File" -d ~
                                   if [[ $? = 0 ]]; then
                                       echo "- $S云端页面成功"
                                       echo $Cloud_Version >$JCe
                                       find ~ -exec chmod 700 {} \; -exec chown $APP_USER_ID:$APP_USER_ID {} \; &
                                       rm -f $File
                                   else
                                      echo "！$S云端页面失败❌"
                                   fi
                           fi
                    else
                        abort "！未连接到网络❓"
                    fi
            fi
}

Start_Time() {
    Start_T=`date +'%s_%N'`
    Start_s=${Start_T%_*}
    Start_ns=${Start_T#*_}
}

End_Time() {
    End_T=`date +'%s_%N'`
    
    End_s=${End_T%_*}
    End_ns=${End_T#*_}
    Time_s=$(($End_s-$Start_s))
    Time_ns=$(($End_ns-$Start_ns))
    if [[ $Time_ns -lt 0 ]]; then
        let Time_s=Time_s-1
        let Time_ns=Time_ns+1000000000
    fi
    Time_ms=${Time_ns:0:3}
    
    if [[ $Time_s -ge 3600 ]]; then
        let Time_h=Time_s/3600
        let Time_s=Time_s%3600
        if [[ $Time_s -ge 60 ]]; then
            let Time_min=Time_s/60
            let Time_s=Time_s%60
        fi
        echo "- 本次$1用时$Time_h小时:$Time_min分钟:$Time_s秒:$Time_ms毫秒"
    elif [[ $Time_s -ge 60 ]]; then
        let Time_min=Time_s/60
        let Time_s=Time_s%60
        echo "- 本次$1用时$Time_min分钟:$Time_s秒:$Time_ms毫秒"
    else
        echo "- 本次$1用时$Time_s秒:$Time_ms毫秒"
    fi
}

XiaZai() {
    if [[ "$#" -lt 2 ]]; then
        echo 1 > "$Status"
        abort "！没有参数无法下载"
    fi
    rm -rf "$Status"
        local dir
            dir=${2%/*}
            if [[ ! -d "$dir" ]]; then
                echo "1" > "$Status" && abort2 "！No such \"$dir\" directory"
            fi
                curl -s -o "$2" -kL "$Link/$1"
                if [[ -f "$2" ]]; then
                    echo 0 > "$Status"
                else
                    echo "408" > "$Status"
                    abort2 "！连接服务器超时，请重新下载"
                fi
}

EndMD5() {
    md5_down=`md5sum "$Download_File" | sed 's/ .*//g'`
    if [[ "$File_MD5" != "$md5_down" ]]; then
        Deleting_file
        abort "！ ["$File_Name"] MD5校验失败✘，请重新下载"
    else
        echo "- ["$File_Name"]文件MD5校验成功✔"
     return 0
    fi
}

Start_Download() {
    Check_command2() {
        $1 -where &>/dev/null
        return $?
    }
    
    
    local Download_File2 File_Type YiXZ YiXZ_2 YiXZ_SuDu Remaining_Time Percentage Size2 md5_down
    Download_File2="$2"
        if Check_command2 awk && Check_command2 wc && Check_command2 md5sum; then
            Start_Time
            XiaZai "$@" &
                until [[ -f "$Download_File2" ]]; do
                    if [[ -f "$Status" ]]; then
                        [[ `cat "$Status" 2>/dev/null` -ne 0 ]] && exit 1
                    fi
                done
                        echo "- 连接服务器成功"
                        if [[ $File_Size -ge 1048576 ]]; then
                            File_Type=`awk "BEGIN{print $File_Size/1048576}"`MB
                        elif [[ $File_Size -ge 1024 ]]; then
                            File_Type=`awk "BEGIN{print $File_Size/1024}"`kb
                        elif [[ $File_Size -le 1024 ]]; then
                            File_Type=${File_Size}b
                        fi
                        echo "- 正在下载 [$File_Name2]，文件总大小：${File_Type}"
                        echo -e "\n-----------------------------------------"
                            until [[ $Han = 1 ]]; do
                               YiXZ=`wc -c < $Download_File2`
                               sleep 1
                               YiXZ_2=`wc -c < $Download_File2`
                                   if [[ $YiXZ -gt 0 ]]; then
                                       YiXZ_SuDu=$(($YiXZ_2-$YiXZ))
                                       Remaining_Time=`awk "BEGIN{print ($File_Size-$YiXZ_2)/$YiXZ_SuDu}" 2>/dev/null`
                                       Remaining_Time=${Remaining_Time:-0}
                                       Percentage=`awk "BEGIN{print $YiXZ_2/($File_Size/100)}" 2>/dev/null`
                                       show_progress ${Percentage%.*}
                                           if [[ $YiXZ_2 -ge 1048576 ]]; then
                                               Size2=`awk "BEGIN{print $YiXZ_2/1048576}"`MB
                                           elif [[ $YiXZ_2 -ge 1024 ]]; then
                                               Size2=`awk "BEGIN{print $YiXZ_2/1024}"`kb
                                           elif [[ $YiXZ_2 -le 1024 ]]; then
                                               Size2=${YiXZ_2}b
                                           fi
                                               Schedule() { echo "- 已下载：${Size2}/$File_Type 已完成${Percentage}%" ; echo "-----------------------------------------"; }
                                               if [[ $YiXZ_SuDu -ge 1048576 ]]; then
                                                   echo -n "- 正在飞一般的下载：`awk "BEGIN{print $YiXZ_SuDu/1048576}"`MB/s"; echo " 剩余时间$Remaining_Time/s"; Schedule
                                               elif [[ $YiXZ_SuDu -ge 1024 ]]; then
                                                   echo -n "- 正在慢速下载：`awk "BEGIN{print $YiXZ_SuDu/1024}"`kb/s"; echo " 剩余时间$Remaining_Time/s"; Schedule
                                               elif [[ $YiXZ_SuDu -lt 1024 && $YiXZ_SuDu -gt 0 ]]; then
                                                   echo -n "- 正在龟速下载：${YiXZ_SuDu}b/s"; echo " 剩余时间$Remaining_Time/s"; Schedule
                                               elif [[ $YiXZ_SuDu -eq 0 ]]; then
                                                   if [[ $YiXZ_2 -ge $File_Size ]]; then
                                                       [[ $Options = -split ]] && break
                                                       echo "- 下载完成，开始MD5校验……"
                                                   elif [[ $YiXZ_2 -lt $File_Size ]]; then
                                                       Schedule
                                                       Deleting_file
                                                       Han=1
                                                       abort "- 与服务器连接已断开，如果网络正常请私信我修复"
                                                   fi
                                                       Han=1
                                                       md5_down=`md5sum "$Download_File2" | sed 's/ .*//'`
                                                       if [[ $File_MD5 = $md5_down ]]; then
                                                           echo "- [$File_Name2] MD5校验成功✔"
                                                           End_Time 下载
                                                           return 0
                                                       else
                                                           Deleting_file
                                                           abort "- [$File_Name2] MD5校验失败✘，请重新下载"
                                                       fi
                                                fi
                                   fi
                            done
        else
            echo "- 正在下载 [$File_Name2]配置文件……文件总大小：${File_Size}b"
            echo "- 因为缺少命令所以无法提供进度，请耐心等待"
            Start_Time
            XiaZai "$@"
            End_Time 下载
            EndMD5
        fi
}

Download() {
    if [[ "$#" -lt 6 ]]; then
        abort "！没有参数无法提供下载"
    fi
    
    Deleting_file() {
        rm -rf "$PeiZhi_File/$Delete"*
    }
    
    MD5() {
        if [[ -f "$Download_File" ]]; then
            md5_down=`md5sum "$Download_File" | sed 's/ .*//g'`
            if [[ "$File_MD5" != "$md5_down" ]]; then
                Deleting_file
                error "！ ["$File_Name"] MD5校验失败，文件损坏正在重新下载"
                return 1
            else
                return 0
            fi
        else
            Deleting_file
            echo "- 没有检测到文件，正在连接服务器下载中……"
            return 1
        fi
    }
    
    
    local Han Options ID File_Name2 File_Size File_MD5 Delete split_size PeiZhi_Dir Total_size n size ysize xsize
    Han=0
    Options="$1"
    ID="$2"
    File_Name="$3"
    File_Size="$4"
    File_MD5="$5"
    Delete="$6"
    Download_File="$PeiZhi_File/$File_Name"
        MD5
        [[ $? -eq 0 ]] && return 0
    
    case "$Options" in
        -net)
            File_Name2="$File_Name"
            Start_Download "$ID" "$Download_File"
        ;;
        
        -split)
        n=1
        size=0
        split_size=99614720
        Total_size="$File_Size"
        PeiZhi_Dir="$PeiZhi_File"
        PeiZhi_File="$Script_Dir/tmp"
    
        rm -rf "$PeiZhi_File"
        mkdir -p "$PeiZhi_File"
        for i in ${DID[@]}; do
            if [[ $size -eq 0 ]]; then
                size=$split_size
                xsize=$split_size
            elif [[ $n -eq ${#DID[@]} ]]; then
                ysize=$size
                xsize=`awk "BEGIN{print $Total_size-$ysize}"`
                end=1
            elif [[ $size -lt $Total_size ]]; then
                xsize=$split_size
                size=`awk "BEGIN{print $size+$xsize}"`
            fi
                File_Size="$xsize"
                File_Name2="第$n个文件"
                Start_Download "$i" "$PeiZhi_File/$n"
                n=`awk "BEGIN{print $n+1}"`
                echo
        done
        
        
        if [[ $end -eq 1 ]]; then
            echo
            echo "下载完成，检测文件md5"
            cat $PeiZhi_File/* >"$Download_File"
            EndMD5
            rm -rf "$PeiZhi_File"
        fi
        ;;
        esac
}

Mount_Write() {
    GZai=$1
    echo "开始使用`which mount`挂载$2可读写$3"
    mount -o rw,remount $GZai
        if [[ -w /$2 ]]; then
            system=/system
            vendor=/vendor
            Result=0
            return 0
        elif [[ -w $GZai ]]; then
            Result=0
            if [[ $GZai = / ]]; then
                unset GZai
            elif [[ $GZai = /sbin/.magisk/mirror/system_root ]]; then
                if [[ -w $GZai/system ]]; then
                    GZai=$GZai/system
                    Result=0
                else
                    unset GZai
                    Result=1
                    return 1
                fi
            fi
            return 0
        fi
        echo "开始使用`busybox -where` mount挂载$2可读写$3"
        echo
        busybox mount -o rw,remount $GZai
            if [[ -w /$2 ]]; then
                system=/system
                vendor=/vendor
                Result=0
                return 0
            elif [[ -w $GZai ]]; then
                Result=0
                if [[ $GZai = / ]]; then
                    unset GZai
                elif [[ $GZai = /sbin/.magisk/mirror/system_root ]]; then
                    if [[ -w $GZai/system ]]; then
                        GZai=$GZai/system
                        Result=0
                    else
                        unset GZai
                        Result=1
                        return 1
                    fi
                fi
            else
                unset GZai
                Result=1
                return 1
            fi
}


Check_Mount() {
    [[ $Result -eq 0 ]] && echo "挂载$1读写成功。"
    if [[ $Result -eq 1 ]]; then
        error "！您的`getprop ro.product.model`（Android `getprop ro.build.version.release`）设备未解锁system"
        echo -e "\n\n错误详情：\n"
        mount | grep -m 1 /system 1>&2
        abort
    fi
}

Mount_system() {
    Mount_Write /system system . 2>/dev/null
    if [[ $? -eq 1 ]]; then
        Mount_Write /sbin/.magisk/mirror/system system .. 2>/dev/null
        if [[ $? -eq 1 ]]; then
            Mount_Write /sbin/.magisk/mirror/system_root system ... 2>/dev/null
            if [[ $? -eq 1 ]]; then
                Mount_Write / system .... 2>/dev/null
            fi
        fi
    fi

    export system=${GZai:=/system}
    export audio=$system/media/audio/ui
    Check_Mount system
    
    Unload(){
        mount -o ro,remount $GZai &>/dev/null
        [[ ! -w $GZai ]] && busybox mount -o ro,remount $GZai &>/dev/null
        #umount -r $GZai
    }
}

Mount_vendor() {
    Mount_Write /vendor vendor . 2>/dev/null
    if [[ $? -eq 1 ]]; then
        Mount_Write /sbin/.magisk/mirror/vendor vendor .. 2>/dev/null
        if [[ $? -eq 1 ]]; then
            Mount_Write / vendor ... 2>/dev/null
        fi
    fi
    export vendor=${GZai:=/vendor}
    Check_Mount vendor
    
    
    Unload_vendor(){
        mount -o ro,remount $GZai &>/dev/null
        [[ ! -w $GZai ]] && busybox mount -o ro,remount $GZai &>/dev/null
        #umount -r $GZai
    }
}

grep_prop() {
    local J="s/^$1=//p"
    [[ -z "$2" ]] && { getprop $1; return $?; }
    [[ -n "$2" ]] && sed -n "$J" $2 2>/dev/null | head -n 1
}

mkdir() {
    umask 022
    `$which mkdir` "$@"
}

abi_Detection() {
    API=`grep_prop ro.build.version.sdk`
    ABI=`grep_prop ro.product.cpu.abi | cut -c-3`
    ABI2=`grep_prop ro.product.cpu.abi2 | cut -c-3`
    ABILONG=`grep_prop ro.product.cpu.abi`
    
    ARCH=arm
    ARCH32=arm
    IS64BIT=false
        if [ "$ABI" = "x86" ]; then ARCH=x86; ARCH32=x86; fi;
        if [ "$ABI2" = "x86" ]; then ARCH=x86; ARCH32=x86; fi;
        if [ "$ABILONG" = "arm64-v8a" ]; then ARCH=arm64; ARCH32=arm; IS64BIT=true; fi;
        if [ "$ABILONG" = "x86_64" ]; then ARCH=x64; ARCH32=x86; IS64BIT=true; fi;
}

set_perm() {
    chown $2:$3 $1 || return 1
    chmod $4 $1 || return 1
    CON=$5
    [ -z $CON ] && CON=u:object_r:system_file:s0
    chcon $CON $1 || return 1
}

set_perm_recursive() {
    find $1 -type d 2>/dev/null | while read dir; do
        set_perm $dir $2 $3 $4 $6
    done
        find $1 -type f -o -type l 2>/dev/null | while read file; do
            set_perm $file $2 $3 $5 $6
        done
}

mktouch() {
    mkdir -p ${1%/*} 2>/dev/null
    [[ -z $2 ]] && touch "$1" || echo "$2" > "$1"
    chmod 644 "$1"
}

Delete_Frame_Dir() {
    rm -rf `ls | egrep -v 'uninstall.sh|module.prop|Write_Record.log'`
}

End_of_Frame_installation() {
 if [[ -f $Frame_Dir/$MODID/module.prop ]]; then
    echo "THE END"
    [[ $Result = 0 ]] && CQ
else
    abort "！安装$MODID失败"
fi
}

Write_Record() {
    local jian=$Frame_Dir/$1/Write_Record.log
        if [[ -d $Frame_Dir/$1 ]]; then
            [[ -f $jian ]] && rm -f $jian
            cd $Frame_Dir/$1
                for c in `find system -type f`; do
                    echo "\$$c" >>$jian
                done
        else
            abort "！写入记录失败！安装失败！"
        fi
}

End_installation() {
    lu="$MODPATH/system"
    [[ ! -d $lu ]] && abort -e "！ "$Name"安装失败"
    cp -arf "$lu"/* "$system"
    [[ $? = 0 ]] && echo "- "$Name"安装成功"
    
    cd $MODPATH
    Delete_Frame_Dir
}

check_ab_device() {
    . ./Block_Device_Name.sh -None
    egrep -q 'boot_a|boot_b' "$Data_Dir/by_name.log"
    return $?
}

set_Game_Toolbox() {
    am force-stop com.miui.securitycenter
    set_perm /data/data/com.miui.securitycenter/files/gamebooster system system 700
    set_perm "$Game_Toolbox_File" system system 444
    echo "将在下次启动游戏时立即生效，不需要重启手机哦 ⊙∀⊙"
}
