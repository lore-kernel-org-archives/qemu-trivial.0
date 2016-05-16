Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b2IIS-0003kg-MB
	for mharc-qemu-trivial@gnu.org; Mon, 16 May 2016 09:10:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1b2IIO-0003cQ-M1
	for qemu-trivial@nongnu.org; Mon, 16 May 2016 09:10:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1b2IIH-0000v0-I5
	for qemu-trivial@nongnu.org; Mon, 16 May 2016 09:10:51 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:52816)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1b2II7-0000tw-95; Mon, 16 May 2016 09:10:35 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 2E48717F522; Mon, 16 May 2016 15:10:32 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>
Date: Mon, 16 May 2016 15:10:20 +0200
Message-Id: <1463404220-5945-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a03:4000:2:362::1
Subject: [Qemu-trivial] [PATCH] configure: Use $(..) instead of deprecated
 `..`
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 16 May 2016 13:10:55 -0000

This fixes these warnings from shellcheck:

    ^-- SC2006: Use $(..) instead of deprecated `..`

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

More warnings from shellcheck for configure and other files
will be handled by later patches.

Setting CONFIG_STAMP below needed special care.

Regards
Stefan W.


 configure | 174 +++++++++++++++++++++++++++++++-------------------------------
 1 file changed, 87 insertions(+), 87 deletions(-)

diff --git a/configure b/configure
index bbf9005..5a83345 100755
--- a/configure
+++ b/configure
@@ -164,7 +164,7 @@ have_backend () {
 }
 
 # default parameters
-source_path=`dirname "$0"`
+source_path=$(dirname "$0")
 cpu=""
 iasl="iasl"
 interp_prefix="/usr/gnemul/qemu-%M"
@@ -323,7 +323,7 @@ jemalloc="no"
 
 # parse CC options first
 for opt do
-  optarg=`expr "x$opt" : 'x[^=]*=\(.*\)'`
+  optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
   case "$opt" in
   --cross-prefix=*) cross_prefix="$optarg"
   ;;
@@ -398,7 +398,7 @@ if test "$debug_info" = "yes"; then
 fi
 
 # make source path absolute
-source_path=`cd "$source_path"; pwd`
+source_path=$(cd "$source_path"; pwd)
 
 # running configure in the source tree?
 # we know that's the case if configure is there.
@@ -443,7 +443,7 @@ elif check_define __sun__ ; then
 elif check_define __HAIKU__ ; then
   targetos='Haiku'
 else
-  targetos=`uname -s`
+  targetos=$(uname -s)
 fi
 
 # Some host OSes need non-standard checks for which CPU to use.
@@ -461,7 +461,7 @@ Darwin)
   fi
   ;;
 SunOS)
-  # `uname -m` returns i86pc even on an x86_64 box, so default based on isainfo
+  # $(uname -m) returns i86pc even on an x86_64 box, so default based on isainfo
   if test -z "$cpu" && test "$(isainfo -k)" = "amd64"; then
     cpu="x86_64"
   fi
@@ -507,7 +507,7 @@ elif check_define __aarch64__ ; then
 elif check_define __hppa__ ; then
   cpu="hppa"
 else
-  cpu=`uname -m`
+  cpu=$(uname -m)
 fi
 
 ARCH=
@@ -627,7 +627,7 @@ SunOS)
   ld="gld"
   smbd="${SMBD-/usr/sfw/sbin/smbd}"
   needs_libsunmath="no"
-  solarisrev=`uname -r | cut -f2 -d.`
+  solarisrev=$(uname -r | cut -f2 -d.)
   if [ "$cpu" = "i386" -o "$cpu" = "x86_64" ] ; then
     if test "$solarisrev" -le 9 ; then
       if test -f /opt/SUNWspro/prod/lib/libsunmath.so.1; then
@@ -722,7 +722,7 @@ fi
 werror=""
 
 for opt do
-  optarg=`expr "x$opt" : 'x[^=]*=\(.*\)'`
+  optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
   case "$opt" in
   --help|-h) show_help=yes
   ;;
@@ -846,9 +846,9 @@ for opt do
   ;;
   --audio-drv-list=*) audio_drv_list="$optarg"
   ;;
-  --block-drv-rw-whitelist=*|--block-drv-whitelist=*) block_drv_rw_whitelist=`echo "$optarg" | sed -e 's/,/ /g'`
+  --block-drv-rw-whitelist=*|--block-drv-whitelist=*) block_drv_rw_whitelist=$(echo "$optarg" | sed -e 's/,/ /g')
   ;;
-  --block-drv-ro-whitelist=*) block_drv_ro_whitelist=`echo "$optarg" | sed -e 's/,/ /g'`
+  --block-drv-ro-whitelist=*) block_drv_ro_whitelist=$(echo "$optarg" | sed -e 's/,/ /g')
   ;;
   --enable-debug-tcg) debug_tcg="yes"
   ;;
@@ -943,7 +943,7 @@ for opt do
   ;;
   --enable-cocoa)
       cocoa="yes" ;
-      audio_drv_list="coreaudio `echo $audio_drv_list | sed s,coreaudio,,g`"
+      audio_drv_list="coreaudio $(echo $audio_drv_list | sed s,coreaudio,,g)"
   ;;
   --disable-system) softmmu="no"
   ;;
@@ -1388,7 +1388,7 @@ fi
 
 # Consult white-list to determine whether to enable werror
 # by default.  Only enable by default for git builds
-z_version=`cut -f3 -d. $source_path/VERSION`
+z_version=$(cut -f3 -d. $source_path/VERSION)
 
 if test -z "$werror" ; then
     if test -d "$source_path/.git" -a \
@@ -1617,7 +1617,7 @@ if test "$solaris" = "yes" ; then
         "install fileutils from www.blastwave.org using pkg-get -i fileutils" \
         "to get ginstall which is used by default (which lives in /opt/csw/bin)"
   fi
-  if test "`path_of $install`" = "/usr/sbin/install" ; then
+  if test "$(path_of $install)" = "/usr/sbin/install" ; then
     error_exit "Solaris /usr/sbin/install is not an appropriate install program." \
         "try ginstall from the GNU fileutils available from www.blastwave.org" \
         "using pkg-get -i fileutils, or use --install=/usr/ucb/install"
@@ -1636,7 +1636,7 @@ fi
 if test -z "${target_list+xxx}" ; then
     target_list="$default_target_list"
 else
-    target_list=`echo "$target_list" | sed -e 's/,/ /g'`
+    target_list=$(echo "$target_list" | sed -e 's/,/ /g')
 fi
 
 # Check that we recognised the target name; this allows a more
@@ -1886,8 +1886,8 @@ if test "$seccomp" != "no" ; then
 
     if test "$libseccomp_minver" != "" &&
        $pkg_config --atleast-version=$libseccomp_minver libseccomp ; then
-        libs_softmmu="$libs_softmmu `$pkg_config --libs libseccomp`"
-        QEMU_CFLAGS="$QEMU_CFLAGS `$pkg_config --cflags libseccomp`"
+        libs_softmmu="$libs_softmmu $($pkg_config --libs libseccomp)"
+        QEMU_CFLAGS="$QEMU_CFLAGS $($pkg_config --cflags libseccomp)"
         seccomp="yes"
     else
         if test "$seccomp" = "yes" ; then
@@ -2127,8 +2127,8 @@ fi
 x11_cflags=
 x11_libs=-lX11
 if $pkg_config --exists "x11"; then
-    x11_cflags=`$pkg_config --cflags x11`
-    x11_libs=`$pkg_config --libs x11`
+    x11_cflags=$($pkg_config --cflags x11)
+    x11_libs=$($pkg_config --libs x11)
 fi
 
 ##########################################
@@ -2155,9 +2155,9 @@ if test "$gtk" != "no"; then
       gtkversion="2.18.0"
     fi
     if $pkg_config --exists "$gtkpackage >= $gtkversion"; then
-        gtk_cflags=`$pkg_config --cflags $gtkpackage`
-        gtk_libs=`$pkg_config --libs $gtkpackage`
-        gtk_version=`$pkg_config --modversion $gtkpackage`
+        gtk_cflags=$($pkg_config --cflags $gtkpackage)
+        gtk_libs=$($pkg_config --libs $gtkpackage)
+        gtk_version=$($pkg_config --modversion $gtkpackage)
         if $pkg_config --exists "$gtkx11package >= $gtkversion"; then
             gtk_cflags="$gtk_cflags $x11_cflags"
             gtk_libs="$gtk_libs $x11_libs"
@@ -2195,8 +2195,8 @@ gnutls_gcrypt=no
 gnutls_nettle=no
 if test "$gnutls" != "no"; then
     if gnutls_works; then
-        gnutls_cflags=`$pkg_config --cflags gnutls`
-        gnutls_libs=`$pkg_config --libs gnutls`
+        gnutls_cflags=$($pkg_config --cflags gnutls)
+        gnutls_libs=$($pkg_config --libs gnutls)
         libs_softmmu="$gnutls_libs $libs_softmmu"
         libs_tools="$gnutls_libs $libs_tools"
 	QEMU_CFLAGS="$QEMU_CFLAGS $gnutls_cflags"
@@ -2220,7 +2220,7 @@ if test "$gnutls" != "no"; then
 	    gnutls_gcrypt=no
 	    gnutls_nettle=yes
 	elif $pkg_config --exists 'gnutls >= 2.12'; then
-	    case `$pkg_config --libs --static gnutls` in
+	    case $($pkg_config --libs --static gnutls) in
 		*gcrypt*)
 		    gnutls_gcrypt=yes
 		    gnutls_nettle=no
@@ -2281,7 +2281,7 @@ has_libgcrypt_config() {
 
     if test -n "$cross_prefix"
     then
-	host=`libgcrypt-config --host`
+	host=$(libgcrypt-config --host)
 	if test "$host-" != $cross_prefix
 	then
 	    return 1
@@ -2293,8 +2293,8 @@ has_libgcrypt_config() {
 
 if test "$gcrypt" != "no"; then
     if has_libgcrypt_config; then
-        gcrypt_cflags=`libgcrypt-config --cflags`
-        gcrypt_libs=`libgcrypt-config --libs`
+        gcrypt_cflags=$(libgcrypt-config --cflags)
+        gcrypt_libs=$(libgcrypt-config --libs)
         # Debian has remove -lgpg-error from libgcrypt-config
         # as it "spreads unnecessary dependencies" which in
         # turn breaks static builds...
@@ -2334,9 +2334,9 @@ fi
 
 if test "$nettle" != "no"; then
     if $pkg_config --exists "nettle"; then
-        nettle_cflags=`$pkg_config --cflags nettle`
-        nettle_libs=`$pkg_config --libs nettle`
-        nettle_version=`$pkg_config --modversion nettle`
+        nettle_cflags=$($pkg_config --cflags nettle)
+        nettle_libs=$($pkg_config --libs nettle)
+        nettle_version=$($pkg_config --modversion nettle)
         libs_softmmu="$nettle_libs $libs_softmmu"
         libs_tools="$nettle_libs $libs_tools"
         QEMU_CFLAGS="$QEMU_CFLAGS $nettle_cflags"
@@ -2373,8 +2373,8 @@ tasn1=yes
 tasn1_cflags=""
 tasn1_libs=""
 if $pkg_config --exists "libtasn1"; then
-    tasn1_cflags=`$pkg_config --cflags libtasn1`
-    tasn1_libs=`$pkg_config --libs libtasn1`
+    tasn1_cflags=$($pkg_config --cflags libtasn1)
+    tasn1_libs=$($pkg_config --libs libtasn1)
 else
     tasn1=no
 fi
@@ -2404,9 +2404,9 @@ if test "$vte" != "no"; then
       vteminversion="0.24.0"
     fi
     if $pkg_config --exists "$vtepackage >= $vteminversion"; then
-        vte_cflags=`$pkg_config --cflags $vtepackage`
-        vte_libs=`$pkg_config --libs $vtepackage`
-        vteversion=`$pkg_config --modversion $vtepackage`
+        vte_cflags=$($pkg_config --cflags $vtepackage)
+        vte_libs=$($pkg_config --libs $vtepackage)
+        vteversion=$($pkg_config --modversion $vtepackage)
         libs_softmmu="$vte_libs $libs_softmmu"
         vte="yes"
     elif test "$vte" = "yes"; then
@@ -2447,16 +2447,16 @@ else
     error_exit "Unknown sdlabi $sdlabi, must be 1.2 or 2.0"
 fi
 
-if test "`basename $sdl_config`" != $sdlconfigname && ! has ${sdl_config}; then
+if test "$(basename $sdl_config)" != $sdlconfigname && ! has ${sdl_config}; then
   sdl_config=$sdlconfigname
 fi
 
 if $pkg_config $sdlname --exists; then
   sdlconfig="$pkg_config $sdlname"
-  sdlversion=`$sdlconfig --modversion 2>/dev/null`
+  sdlversion=$($sdlconfig --modversion 2>/dev/null)
 elif has ${sdl_config}; then
   sdlconfig="$sdl_config"
-  sdlversion=`$sdlconfig --version`
+  sdlversion=$($sdlconfig --version)
 else
   if test "$sdl" = "yes" ; then
     feature_not_found "sdl" "Install SDL devel"
@@ -2474,14 +2474,14 @@ if test "$sdl" != "no" ; then
 #undef main /* We don't want SDL to override our main() */
 int main( void ) { return SDL_Init (SDL_INIT_VIDEO); }
 EOF
-  sdl_cflags=`$sdlconfig --cflags 2> /dev/null`
+  sdl_cflags=$($sdlconfig --cflags 2>/dev/null)
   if test "$static" = "yes" ; then
-    sdl_libs=`$sdlconfig --static-libs 2>/dev/null`
+    sdl_libs=$($sdlconfig --static-libs 2>/dev/null)
   else
-    sdl_libs=`$sdlconfig --libs 2> /dev/null`
+    sdl_libs=$($sdlconfig --libs 2>/dev/null)
   fi
   if compile_prog "$sdl_cflags" "$sdl_libs" ; then
-    if test `echo $sdlversion | sed 's/[^0-9]//g'` -lt 121 ; then
+    if test $(echo $sdlversion | sed 's/[^0-9]//g') -lt 121 ; then
       sdl_too_old=yes
     else
       sdl=yes
@@ -2490,8 +2490,8 @@ EOF
     # static link with sdl ? (note: sdl.pc's --static --libs is broken)
     if test "$sdl" = "yes" -a "$static" = "yes" ; then
       if test $? = 0 && echo $sdl_libs | grep -- -laa > /dev/null; then
-         sdl_libs="$sdl_libs `aalib-config --static-libs 2>/dev/null`"
-         sdl_cflags="$sdl_cflags `aalib-config --cflags 2>/dev/null`"
+         sdl_libs="$sdl_libs $(aalib-config --static-libs 2>/dev/null)"
+         sdl_cflags="$sdl_cflags $(aalib-config --cflags 2>/dev/null)"
       fi
       if compile_prog "$sdl_cflags" "$sdl_libs" ; then
 	:
@@ -2608,8 +2608,8 @@ int main(void) {
 }
 EOF
   if $pkg_config libpng --exists; then
-    vnc_png_cflags=`$pkg_config libpng --cflags`
-    vnc_png_libs=`$pkg_config libpng --libs`
+    vnc_png_cflags=$($pkg_config libpng --cflags)
+    vnc_png_libs=$($pkg_config libpng --libs)
   else
     vnc_png_cflags=""
     vnc_png_libs="-lpng"
@@ -2803,7 +2803,7 @@ EOF
     fi
 }
 
-audio_drv_list=`echo "$audio_drv_list" | sed -e 's/,/ /g'`
+audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/,/ /g')
 for drv in $audio_drv_list; do
     case $drv in
     alsa)
@@ -2915,8 +2915,8 @@ if test "$curl" != "no" ; then
 #include <curl/curl.h>
 int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0; }
 EOF
-  curl_cflags=`$curlconfig --cflags 2>/dev/null`
-  curl_libs=`$curlconfig --libs 2>/dev/null`
+  curl_cflags=$($curlconfig --cflags 2>/dev/null)
+  curl_libs=$($curlconfig --libs 2>/dev/null)
   if compile_prog "$curl_cflags" "$curl_libs" ; then
     curl=yes
   else
@@ -2934,8 +2934,8 @@ if test "$bluez" != "no" ; then
 #include <bluetooth/bluetooth.h>
 int main(void) { return bt_error(0); }
 EOF
-  bluez_cflags=`$pkg_config --cflags bluez 2> /dev/null`
-  bluez_libs=`$pkg_config --libs bluez 2> /dev/null`
+  bluez_cflags=$($pkg_config --cflags bluez 2>/dev/null)
+  bluez_libs=$($pkg_config --libs bluez 2>/dev/null)
   if compile_prog "$bluez_cflags" "$bluez_libs" ; then
     bluez=yes
     libs_softmmu="$bluez_libs $libs_softmmu"
@@ -2958,8 +2958,8 @@ fi
 
 for i in $glib_modules; do
     if $pkg_config --atleast-version=$glib_req_ver $i; then
-        glib_cflags=`$pkg_config --cflags $i`
-        glib_libs=`$pkg_config --libs $i`
+        glib_cflags=$($pkg_config --cflags $i)
+        glib_libs=$($pkg_config --libs $i)
         CFLAGS="$glib_cflags $CFLAGS"
         LIBS="$glib_libs $LIBS"
         libs_qga="$glib_libs $libs_qga"
@@ -3048,8 +3048,8 @@ if test "$pixman" = "none"; then
   pixman_libs=
 elif test "$pixman" = "system"; then
   # pixman version has been checked above
-  pixman_cflags=`$pkg_config --cflags pixman-1`
-  pixman_libs=`$pkg_config --libs pixman-1`
+  pixman_cflags=$($pkg_config --cflags pixman-1)
+  pixman_libs=$($pkg_config --libs pixman-1)
 else
   if test ! -d ${source_path}/pixman/pixman; then
     error_exit "pixman >= 0.21.8 not present. Your options:" \
@@ -3165,8 +3165,8 @@ fi
 min_libssh2_version=1.2.8
 if test "$libssh2" != "no" ; then
   if $pkg_config --atleast-version=$min_libssh2_version libssh2; then
-    libssh2_cflags=`$pkg_config libssh2 --cflags`
-    libssh2_libs=`$pkg_config libssh2 --libs`
+    libssh2_cflags=$($pkg_config libssh2 --cflags)
+    libssh2_libs=$($pkg_config libssh2 --libs)
     libssh2=yes
   else
     if test "$libssh2" = "yes" ; then
@@ -3417,8 +3417,8 @@ fi
 if test "$glusterfs" != "no" ; then
   if $pkg_config --atleast-version=3 glusterfs-api; then
     glusterfs="yes"
-    glusterfs_cflags=`$pkg_config --cflags glusterfs-api`
-    glusterfs_libs=`$pkg_config --libs glusterfs-api`
+    glusterfs_cflags=$($pkg_config --cflags glusterfs-api)
+    glusterfs_libs=$($pkg_config --libs glusterfs-api)
     if $pkg_config --atleast-version=4 glusterfs-api; then
       glusterfs_xlator_opt="yes"
     fi
@@ -4225,12 +4225,12 @@ int main(void) { return 0; }
 EOF
   if compile_prog "" "" ; then
     if $pkg_config lttng-ust --exists; then
-      lttng_ust_libs=`$pkg_config --libs lttng-ust`
+      lttng_ust_libs=$($pkg_config --libs lttng-ust)
     else
       lttng_ust_libs="-llttng-ust"
     fi
     if $pkg_config liburcu-bp --exists; then
-      urcu_bp_libs=`$pkg_config --libs liburcu-bp`
+      urcu_bp_libs=$($pkg_config --libs liburcu-bp)
     else
       urcu_bp_libs="-lurcu-bp"
     fi
@@ -4670,10 +4670,10 @@ if test "$guest_agent_msi" = "yes"; then
   fi
 
   if test "$QEMU_GA_VERSION" = ""; then
-      QEMU_GA_VERSION=`cat $source_path/VERSION`
+      QEMU_GA_VERSION=$(cat $source_path/VERSION)
   fi
 
-  QEMU_GA_MSI_MINGW_DLL_PATH="-D Mingw_dlls=`$pkg_config --variable=prefix glib-2.0`/bin"
+  QEMU_GA_MSI_MINGW_DLL_PATH="-D Mingw_dlls=$($pkg_config --variable=prefix glib-2.0)/bin"
 
   case "$cpu" in
   x86_64)
@@ -4747,16 +4747,16 @@ QEMU_CFLAGS="$pixman_cflags $fdt_cflags $QEMU_CFLAGS"
 libs_softmmu="$pixman_libs $libs_softmmu"
 
 echo "Install prefix    $prefix"
-echo "BIOS directory    `eval echo $qemu_datadir`"
-echo "binary directory  `eval echo $bindir`"
-echo "library directory `eval echo $libdir`"
-echo "module directory  `eval echo $qemu_moddir`"
-echo "libexec directory `eval echo $libexecdir`"
-echo "include directory `eval echo $includedir`"
-echo "config directory  `eval echo $sysconfdir`"
+echo "BIOS directory    $(eval echo $qemu_datadir)"
+echo "binary directory  $(eval echo $bindir)"
+echo "library directory $(eval echo $libdir)"
+echo "module directory  $(eval echo $qemu_moddir)"
+echo "libexec directory $(eval echo $libexecdir)"
+echo "include directory $(eval echo $includedir)"
+echo "config directory  $(eval echo $sysconfdir)"
 if test "$mingw32" = "no" ; then
-echo "local state directory   `eval echo $local_statedir`"
-echo "Manual directory  `eval echo $mandir`"
+echo "local state directory   $(eval echo $local_statedir)"
+echo "Manual directory  $(eval echo $mandir)"
 echo "ELF interp prefix $interp_prefix"
 else
 echo "local state directory   queried at runtime"
@@ -4791,16 +4791,16 @@ if test "$darwin" = "yes" ; then
     echo "Cocoa support     $cocoa"
 fi
 echo "pixman            $pixman"
-echo "SDL support       $sdl `echo_version $sdl $sdlversion`"
-echo "GTK support       $gtk `echo_version $gtk $gtk_version`"
+echo "SDL support       $sdl $(echo_version $sdl $sdlversion)"
+echo "GTK support       $gtk $(echo_version $gtk $gtk_version)"
 echo "GTK GL support    $gtk_gl"
-echo "VTE support       $vte `echo_version $vte $vteversion`"
+echo "VTE support       $vte $(echo_version $vte $vteversion)"
 echo "GNUTLS support    $gnutls"
 echo "GNUTLS hash       $gnutls_hash"
 echo "GNUTLS rnd        $gnutls_rnd"
 echo "libgcrypt         $gcrypt"
 echo "libgcrypt kdf     $gcrypt_kdf"
-echo "nettle            $nettle `echo_version $nettle $nettle_version`"
+echo "nettle            $nettle $(echo_version $nettle $nettle_version)"
 echo "nettle kdf        $nettle_kdf"
 echo "libtasn1          $tasn1"
 echo "curses support    $curses"
@@ -4851,7 +4851,7 @@ echo "Trace backends    $trace_backends"
 if have_backend "simple"; then
 echo "Trace output file $trace_file-<pid>"
 fi
-echo "spice support     $spice `echo_version $spice $spice_protocol_version/$spice_server_version`"
+echo "spice support     $spice $(echo_version $spice $spice_protocol_version/$spice_server_version)"
 echo "rbd support       $rbd"
 echo "xfsctl support    $xfs"
 echo "smartcard support $smartcard"
@@ -4930,7 +4930,7 @@ if test "$bigendian" = "yes" ; then
 fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
-  rc_version=`cat $source_path/VERSION`
+  rc_version=$(cat $source_path/VERSION)
   version_major=${rc_version%%.*}
   rc_version=${rc_version#*.}
   version_minor=${rc_version%%.*}
@@ -5006,7 +5006,7 @@ if test "$cap_ng" = "yes" ; then
 fi
 echo "CONFIG_AUDIO_DRIVERS=$audio_drv_list" >> $config_host_mak
 for drv in $audio_drv_list; do
-    def=CONFIG_`echo $drv | LC_ALL=C tr '[a-z]' '[A-Z]'`
+    def=CONFIG_$(echo $drv | LC_ALL=C tr '[a-z]' '[A-Z]')
     echo "$def=y" >> $config_host_mak
 done
 if test "$audio_pt_int" = "yes" ; then
@@ -5038,7 +5038,7 @@ fi
 if test "$xfs" = "yes" ; then
   echo "CONFIG_XFS=y" >> $config_host_mak
 fi
-qemu_version=`head $source_path/VERSION`
+qemu_version=$(head $source_path/VERSION)
 echo "VERSION=$qemu_version" >>$config_host_mak
 echo "PKGVERSION=$pkgversion" >>$config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
@@ -5049,7 +5049,7 @@ fi
 if test "$modules" = "yes"; then
   # $shacmd can generate a hash started with digit, which the compiler doesn't
   # like as an symbol. So prefix it with an underscore
-  echo "CONFIG_STAMP=_`(echo $qemu_version; echo $pkgversion; cat $0) | $shacmd - | cut -f1 -d\ `" >> $config_host_mak
+  echo "CONFIG_STAMP=_$( (echo $qemu_version; echo $pkgversion; cat $0) | $shacmd - | cut -f1 -d\ )" >> $config_host_mak
   echo "CONFIG_MODULES=y" >> $config_host_mak
 fi
 if test "$sdl" = "yes" ; then
@@ -5577,7 +5577,7 @@ fi
 for target in $target_list; do
 target_dir="$target"
 config_target_mak=$target_dir/config-target.mak
-target_name=`echo $target | cut -d '-' -f 1`
+target_name=$(echo $target | cut -d '-' -f 1)
 target_bigendian="no"
 
 case "$target_name" in
@@ -5617,7 +5617,7 @@ mkdir -p $target_dir
 echo "# Automatically generated by configure - do not modify" > $config_target_mak
 
 bflt="no"
-interp_prefix1=`echo "$interp_prefix" | sed "s/%M/$target_name/g"`
+interp_prefix1=$(echo "$interp_prefix" | sed "s/%M/$target_name/g")
 gdb_xml_files=""
 
 TARGET_ARCH="$target_name"
@@ -5743,7 +5743,7 @@ upper() {
     echo "$@"| LC_ALL=C tr '[a-z]' '[A-Z]'
 }
 
-target_arch_name="`upper $TARGET_ARCH`"
+target_arch_name="$(upper $TARGET_ARCH)"
 echo "TARGET_$target_arch_name=y" >> $config_target_mak
 echo "TARGET_NAME=$target_name" >> $config_target_mak
 echo "TARGET_BASE_ARCH=$TARGET_BASE_ARCH" >> $config_target_mak
@@ -5959,11 +5959,11 @@ for bios_file in \
     $source_path/pc-bios/u-boot.* \
     $source_path/pc-bios/palcode-*
 do
-    FILES="$FILES pc-bios/`basename $bios_file`"
+    FILES="$FILES pc-bios/$(basename $bios_file)"
 done
-for test_file in `find $source_path/tests/acpi-test-data -type f`
+for test_file in $(find $source_path/tests/acpi-test-data -type f)
 do
-    FILES="$FILES tests/acpi-test-data`echo $test_file | sed -e 's/.*acpi-test-data//'`"
+    FILES="$FILES tests/acpi-test-data$(echo $test_file | sed -e 's/.*acpi-test-data//')"
 done
 mkdir -p $DIRS
 for f in $FILES ; do
-- 
2.1.4


