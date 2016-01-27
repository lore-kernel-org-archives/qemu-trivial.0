Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aOOTH-0000hQ-4g
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jan 2016 06:41:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aOOT8-0000UZ-8k
	for qemu-trivial@nongnu.org; Wed, 27 Jan 2016 06:41:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aOOT6-00052K-UQ
	for qemu-trivial@nongnu.org; Wed, 27 Jan 2016 06:41:02 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:32976)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aOOT0-0004u8-Tg; Wed, 27 Jan 2016 06:40:55 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D023541445;
	Wed, 27 Jan 2016 14:40:42 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 0C930A92;
	Wed, 27 Jan 2016 14:40:42 +0300 (MSK)
Received: (nullmailer pid 4217 invoked by uid 1000);
	Wed, 27 Jan 2016 11:40:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed, 27 Jan 2016 14:40:22 +0300
Message-Id: <1453894822-4172-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH] remove libtool support
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jan 2016 11:41:08 -0000

Libtool support was needed to build shared library for libcacard.
Now there's no need to use libtool, and since the build system is
already complicated enough, we have a way to slightly de-complicate
it.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 86 ++-------------------------------------------------------------
 rules.mak | 18 -------------
 2 files changed, 2 insertions(+), 102 deletions(-)

diff --git a/configure b/configure
index 3506e44..fbcea37 100755
--- a/configure
+++ b/configure
@@ -116,38 +116,6 @@ compile_prog() {
   do_cc $QEMU_CFLAGS $local_cflags -o $TMPE $TMPC $LDFLAGS $local_ldflags
 }
 
-do_libtool() {
-    local mode=$1
-    shift
-    # Run the compiler, capturing its output to the log.
-    echo $libtool $mode --tag=CC $cc "$@" >> config.log
-    $libtool $mode --tag=CC $cc "$@" >> config.log 2>&1 || return $?
-    # Test passed. If this is an --enable-werror build, rerun
-    # the test with -Werror and bail out if it fails. This
-    # makes warning-generating-errors in configure test code
-    # obvious to developers.
-    if test "$werror" != "yes"; then
-        return 0
-    fi
-    # Don't bother rerunning the compile if we were already using -Werror
-    case "$*" in
-        *-Werror*)
-           return 0
-        ;;
-    esac
-    echo $libtool $mode --tag=CC $cc -Werror "$@" >> config.log
-    $libtool $mode --tag=CC $cc -Werror "$@" >> config.log 2>&1 && return $?
-    error_exit "configure test passed without -Werror but failed with -Werror." \
-        "This is probably a bug in the configure script. The failing command" \
-        "will be at the bottom of config.log." \
-        "You can run configure with --disable-werror to bypass this check."
-}
-
-libtool_prog() {
-    do_libtool --mode=compile $QEMU_CFLAGS -c -fPIE -DPIE -o $TMPO $TMPC || return $?
-    do_libtool --mode=link $LDFLAGS -o $TMPA $TMPL -rpath /usr/local/lib
-}
-
 # symbolically link $1 to $2.  Portable version of "ln -sf".
 symlink() {
   rm -rf "$2"
@@ -398,7 +366,6 @@ as="${AS-${cross_prefix}as}"
 cpp="${CPP-$cc -E}"
 objcopy="${OBJCOPY-${cross_prefix}objcopy}"
 ld="${LD-${cross_prefix}ld}"
-libtool="${LIBTOOL-${cross_prefix}libtool}"
 nm="${NM-${cross_prefix}nm}"
 strip="${STRIP-${cross_prefix}strip}"
 windres="${WINDRES-${cross_prefix}windres}"
@@ -1514,7 +1481,6 @@ EOF
     if do_cc $QEMU_CFLAGS -Werror $flag -c -o $TMPO $TMPC &&
        compile_prog "-Werror $flag" ""; then
       QEMU_CFLAGS="$QEMU_CFLAGS $flag"
-      LIBTOOLFLAGS="$LIBTOOLFLAGS -Wc,$flag"
       sp_on=1
       break
     fi
@@ -1609,32 +1575,6 @@ EOF
   fi
 fi
 
-# check for broken gcc and libtool in RHEL5
-if test -n "$libtool" -a "$pie" != "no" ; then
-  cat > $TMPC <<EOF
-
-void *f(unsigned char *buf, int len);
-void *g(unsigned char *buf, int len);
-
-void *
-f(unsigned char *buf, int len)
-{
-    return (void*)0L;
-}
-
-void *
-g(unsigned char *buf, int len)
-{
-    return f(buf, len);
-}
-
-EOF
-  if ! libtool_prog; then
-    echo "Disabling libtool due to broken toolchain support"
-    libtool=
-  fi
-fi
-
 ##########################################
 # __sync_fetch_and_and requires at least -march=i486. Many toolchains
 # use i686 as default anyway, but for those that don't, an explicit
@@ -2241,21 +2181,6 @@ if test "$xen_pv_domain_build" = "yes" &&
 fi
 
 ##########################################
-# libtool probe
-
-if ! has $libtool; then
-    libtool=
-fi
-
-# MacOSX ships with a libtool which isn't the GNU one; weed this
-# out by checking whether libtool supports the --version switch
-if test -n "$libtool"; then
-  if ! "$libtool" --version >/dev/null 2>&1; then
-    libtool=
-  fi
-fi
-
-##########################################
 # Sparse probe
 if test "$sparse" != "no" ; then
   if has cgcc; then
@@ -5501,13 +5426,8 @@ echo "MAKE=$make" >> $config_host_mak
 echo "INSTALL=$install" >> $config_host_mak
 echo "INSTALL_DIR=$install -d -m 0755" >> $config_host_mak
 echo "INSTALL_DATA=$install -c -m 0644" >> $config_host_mak
-if test -n "$libtool"; then
-  echo "INSTALL_PROG=\$(LIBTOOL) --mode=install $install -c -m 0755" >> $config_host_mak
-  echo "INSTALL_LIB=\$(LIBTOOL) --mode=install $install -c -m 0644" >> $config_host_mak
-else
-  echo "INSTALL_PROG=$install -c -m 0755" >> $config_host_mak
-  echo "INSTALL_LIB=$install -c -m 0644" >> $config_host_mak
-fi
+echo "INSTALL_PROG=$install -c -m 0755" >> $config_host_mak
+echo "INSTALL_LIB=$install -c -m 0644" >> $config_host_mak
 echo "PYTHON=$python" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
 if $iasl -h > /dev/null 2>&1; then
@@ -5525,7 +5445,6 @@ echo "OBJCOPY=$objcopy" >> $config_host_mak
 echo "LD=$ld" >> $config_host_mak
 echo "NM=$nm" >> $config_host_mak
 echo "WINDRES=$windres" >> $config_host_mak
-echo "LIBTOOL=$libtool" >> $config_host_mak
 echo "CFLAGS=$CFLAGS" >> $config_host_mak
 echo "CFLAGS_NOPIE=$CFLAGS_NOPIE" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
@@ -5544,7 +5463,6 @@ else
 fi
 echo "LDFLAGS=$LDFLAGS" >> $config_host_mak
 echo "LDFLAGS_NOPIE=$LDFLAGS_NOPIE" >> $config_host_mak
-echo "LIBTOOLFLAGS=$LIBTOOLFLAGS" >> $config_host_mak
 echo "LIBS+=$LIBS" >> $config_host_mak
 echo "LIBS_TOOLS+=$libs_tools" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
diff --git a/rules.mak b/rules.mak
index 4551b9e..fc5ee41 100644
--- a/rules.mak
+++ b/rules.mak
@@ -62,27 +62,9 @@ expand-objs = $(strip $(sort $(filter %.o,$1)) \
 # must link with the C++ compiler, not the plain C compiler.
 LINKPROG = $(or $(CXX),$(CC))
 
-ifeq ($(LIBTOOL),)
 LINK = $(call quiet-command, $(LINKPROG) $(QEMU_CFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ \
        $(call process-archive-undefs, $1) \
        $(version-obj-y) $(call extract-libs,$1) $(LIBS),"  LINK  $(TARGET_DIR)$@")
-else
-LIBTOOL += $(if $(V),,--quiet)
-%.lo: %.c
-	$(call quiet-command,$(LIBTOOL) --mode=compile --tag=CC $(CC) $(QEMU_INCLUDES) $(QEMU_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) $($*.o-cflags) -c -o $@ $<,"  lt CC $@")
-%.lo: %.rc
-	$(call quiet-command,$(LIBTOOL) --mode=compile --tag=RC $(WINDRES) -I. -o $@ $<,"lt RC   $(TARGET_DIR)$@")
-%.lo: %.dtrace
-	$(call quiet-command,$(LIBTOOL) --mode=compile --tag=CC dtrace -o $@ -G -s $<, " lt GEN $(TARGET_DIR)$@")
-
-LINK = $(call quiet-command,\
-       $(if $(filter %.lo %.la,$1),$(LIBTOOL) --mode=link --tag=CC \
-       )$(LINKPROG) $(QEMU_CFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ \
-       $(call process-archive-undefs, $1)\
-       $(if $(filter %.lo %.la,$1),$(version-lobj-y),$(version-obj-y)) \
-       $(if $(filter %.lo %.la,$1),$(LIBTOOLFLAGS)) \
-       $(call extract-libs,$(1:.lo=.o)) $(LIBS),$(if $(filter %.lo %.la,$1),"lt LINK ", "  LINK  ")"$(TARGET_DIR)$@")
-endif
 
 %.asm: %.S
 	$(call quiet-command,$(CPP) $(QEMU_INCLUDES) $(QEMU_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) -o $@ $<,"  CPP   $(TARGET_DIR)$@")
-- 
2.1.4


