Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YjmrG-0001PJ-2F
	for mharc-qemu-trivial@gnu.org; Sun, 19 Apr 2015 06:53:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YjmrB-0001HO-O1
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmr7-0005v7-81
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:45 -0400
Received: from mail-wg0-f46.google.com ([74.125.82.46]:36210)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmr6-0005ti-VF
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:41 -0400
Received: by wgsk9 with SMTP id k9so151891384wgs.3
	for <qemu-trivial@nongnu.org>; Sun, 19 Apr 2015 03:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tnnQ2x+I1afXbYkiPHwpqzPQ1VQxPvzz/6CeJ5mLkus=;
	b=D9TOFN9Jm/Z/8js6vP0XPLHZ9VenkbhEukekYk0rwnN5Dq7FIt3xjTWGY+RSfWktSX
	8EmanaPvd62F/iJJXF3f42RGgP8dPdFJ8wW7Pi3HmZuj4AFsslAFQAfCvonMx5Vfsfit
	T9PYAolrtxnSeO2FOL1noPjnpjV5fccbci1Tzwd2sC0vJ3CvhLB58IWx0idQO0NG14do
	ExRGvZFeFgFYj4saBgHSgyNV0Fr18z+DvoqYWhgCO20zt5b1LDwE3b3rNclCbGb61bqf
	kLkd8nc7DvnSXYPDnezVwYSNy6UueuPn/x4vcn0DwTfw3gZcFLf0dQMmiSqZ5yo8tZbY
	bxMw==
X-Gm-Message-State: ALoCoQmVZuZFF6DB7SNjO80mQGL3IzbwRt1Ak4iF+lO6UojOePWAyeldbyUQIrCLiFC6xaCQPfL5
X-Received: by 10.194.71.208 with SMTP id x16mr20844015wju.129.1429440820359; 
	Sun, 19 Apr 2015 03:53:40 -0700 (PDT)
Received: from Snarl.daynix ([91.205.155.63])
	by mx.google.com with ESMTPSA id fv2sm4350546wjb.6.2015.04.19.03.53.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Apr 2015 03:53:39 -0700 (PDT)
From: Joseph Hindin <jhindin@daynix.com>
To: qemu-devel@nongnu.org
Date: Sun, 19 Apr 2015 13:53:18 +0300
Message-Id: <1429440798-11888-6-git-send-email-jhindin@daynix.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1429440798-11888-1-git-send-email-jhindin@daynix.com>
References: <1429440798-11888-1-git-send-email-jhindin@daynix.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.46
Cc: qemu-trivial@nongnu.org, Joseph Hindin <jhindin@daynix.com>
Subject: [Qemu-trivial] [PATCH 4/4] qemu-ga: Building Windows MSI
	installation with configure/Makefile
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
X-List-Received-Date: Sun, 19 Apr 2015 10:53:48 -0000

New options were added to enable Windows MSI installation package
creation:

Option --enable-guest-msi, like the name suggest, enables building
Windows MSI package for QEMU guest agemt; option --disable-guest-msi
disables MSI package creation; by default, no MSI package is created

Signed-off-by: Joseph Hindin <jhindin@daynix.com>
---
 Makefile  | 19 ++++++++++++++++--
 configure | 67 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 83 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 93af871..15ff62a 100644
--- a/Makefile
+++ b/Makefile
@@ -74,7 +74,7 @@ Makefile: ;
 configure: ;
 
 .PHONY: all clean cscope distclean dvi html info install install-doc \
-	pdf recurse-all speed test dist
+	pdf recurse-all speed test dist msi
 
 $(call set-vpath, $(SRC_PATH))
 
@@ -287,10 +287,25 @@ $(qga-obj-y) qemu-ga.o: $(QGALIB_GEN)
 qemu-ga$(EXESUF): $(qga-obj-y) libqemuutil.a libqemustub.a
 	$(call LINK, $^)
 
+QEMU_GA_MSI=qemu-ga-${ARCH}.msi
+
+msi: ${QEMU_GA_MSI}
+
+ifdef QEMU_GA_MSI_WITH_VSS
+${QEMU_GA_MSI}: qga/vss-win32/qga-vss.dll qemu-ga.exe
+endif
+
+${QEMU_GA_MSI}: config-host.mak
+
+${QEMU_GA_MSI}:  qga/installer/qemu-ga.wxs
+	$(call quiet-command,QEMU_GA_VERSION="$(QEMU_GA_VERSION)" QEMU_GA_MANUFACTURER="$(QEMU_GA_MANUFACTURER)" QEMU_GA_DISTRO="$(QEMU_GA_DISTRO)" \
+	wixl -o $@ ${QEMU_GA_MSI_ARCH} ${QEMU_GA_MSI_WITH_VSS} ${QEMU_GA_MSI_MINGW_DLL_PATH} $<, "  WIXL  $@")
+
 clean:
 # avoid old build problems by removing potentially incorrect old files
 	rm -f config.mak op-i386.h opc-i386.h gen-op-i386.h op-arm.h opc-arm.h gen-op-arm.h
 	rm -f qemu-options.def
+	rm -f *.msi
 	find . \( -name '*.l[oa]' -o -name '*.so' -o -name '*.dll' -o -name '*.mo' -o -name '*.[oda]' \) -type f -exec rm {} +
 	rm -f $(filter-out %.tlb,$(TOOLS)) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
 	rm -f fsdev/*.pod
@@ -339,7 +354,7 @@ ar      de     en-us  fi  fr-be  hr     it  lv  nl         pl  ru     th \
 common  de-ch  es     fo  fr-ca  hu     ja  mk  nl-be      pt  sl     tr \
 bepo    cz
 
-ifdef INSTALL_BLOBS
+ifdef INSTALL_BLOB
 BLOBS=bios.bin bios-256k.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
 vgabios-stdvga.bin vgabios-vmware.bin vgabios-qxl.bin \
 acpi-dsdt.aml q35-acpi-dsdt.aml \
diff --git a/configure b/configure
index 6969f6f..6c02839 100755
--- a/configure
+++ b/configure
@@ -316,6 +316,7 @@ snappy=""
 bzip2=""
 guest_agent=""
 guest_agent_with_vss="no"
+guest_msi=""
 vss_win32_sdk=""
 win_sdk="no"
 want_tools="yes"
@@ -1069,6 +1070,10 @@ for opt do
   ;;
   --disable-guest-agent) guest_agent="no"
   ;;
+  --enable-guest-msi) guest_msi="yes"
+  ;;
+  --disable-guest-msi) guest_msi="no"
+  ;;
   --with-vss-sdk) vss_win32_sdk=""
   ;;
   --with-vss-sdk=*) vss_win32_sdk="$optarg"
@@ -1407,6 +1412,8 @@ Advanced options (experts only):
   --enable-quorum          enable quorum block filter support
   --disable-numa           disable libnuma support
   --enable-numa            enable libnuma support
+  --enable-guest-msi       enable building guest agent Windows MSI installation package
+  --disable-guest-msi      disable building guest agent Windows MSI installation package
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -3817,6 +3824,8 @@ fi
 # VSS provider from the source. It is usually unnecessary because the
 # pre-compiled .tlb file is included.
 
+  
+
 if test "$mingw32" = "yes" -a "$guest_agent" != "no" -a "$guest_agent_with_vss" = "yes" ; then
   if test -z "$win_sdk"; then
     programfiles="$PROGRAMFILES"
@@ -3832,6 +3841,54 @@ if test "$mingw32" = "yes" -a "$guest_agent" != "no" -a "$guest_agent_with_vss"
 fi
 
 ##########################################
+# Guest agent Window MSI  package
+
+if test "$guest_msi" = "yes"; then
+
+  if test "$guest_agent" != "yes"; then
+      error_exit "MSI guest agent package requires guest agent enabled"
+  fi
+
+  if test "$mingw32" != "yes"; then
+      error_exit "MSI guest agent is available only for MinGW Windows cross-compilation"
+  fi
+
+  if ! has wixl; then
+    error_exit "wixl not found, required for building installation"
+  fi
+
+
+  if test "$guest_agent_with_vss" = "yes"; then
+    QEMU_GA_MSI_WITH_VSS="-D InstallVss"
+  fi
+
+  if test "$QEMU_GA_MANUFACTURER" = ""; then
+    QEMU_GA_MANUFACTURER=QEMU
+  fi
+
+  if test "$QEMU_GA_DISTRO" = ""; then
+    QEMU_GA_DISTRO=Linux
+  fi
+
+  if test "$QEMU_GA_VERSION" = ""; then
+      QEMU_GA_VERSION=`cat $source_path/VERSION`
+  fi
+
+  case "$cpu" in
+  x86_64)
+    QEMU_GA_MSI_ARCH="-a x64 -D Arch=64"
+    ;;
+  i386)
+    QEMU_GA_MSI_ARCH="-D Arch=32"
+    ;;
+  *)
+    error_exit "CPU $cpu not supported for building installation package"
+    ;;
+  esac
+
+fi
+
+##########################################
 
 ##########################################
 # check if we have fdatasync
@@ -4302,7 +4359,7 @@ EOF
         -e '1,/==================================================/d' \
         -e '/==================================================/,$d' \
         -e "s/[.] = [0-9a-fx]* [+] SIZEOF_HEADERS/. = $textseg_addr + SIZEOF_HEADERS/" \
-        -e "s/__executable_start = [0-9a-fx]*/__executable_start = $textseg_addr/" > config-host.ld
+         -e "s/__executable_start = [0-9a-fx]*/__executable_start = $textseg_addr/" > config-host.ld
       textseg_ldflags="-Wl,-T../config-host.ld"
     fi
   fi
@@ -4500,6 +4557,14 @@ if test "$mingw32" = "yes" ; then
     echo "CONFIG_QGA_VSS=y" >> $config_host_mak
     echo "WIN_SDK=\"$win_sdk\"" >> $config_host_mak
   fi
+  if test "$guest_msi" = "yes"; then
+    echo "QEMU_GA_MSI_MINGW_DLL_PATH=-D Mingw_dlls=`$pkg_config --variable=prefix glib-2.0`/bin" >> $config_host_mak
+    echo "QEMU_GA_MSI_WITH_VSS=${QEMU_GA_MSI_WITH_VSS}" >> $config_host_mak
+    echo "QEMU_GA_MSI_ARCH=${QEMU_GA_MSI_ARCH}" >> $config_host_mak
+    echo "QEMU_GA_MANUFACTURER=${QEMU_GA_MANUFACTURER}" >> $config_host_mak
+    echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO}" >> $config_host_mak
+    echo "QEMU_GA_VERSION=${QEMU_GA_VERSION}" >> $config_host_mak
+  fi
 else
   echo "CONFIG_POSIX=y" >> $config_host_mak
 fi
-- 
2.1.0


