Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jw12U-0004zw-LY
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jul 2020 06:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddstreet@canonical.com>)
 id 1jw12T-0004zb-D3
 for qemu-trivial@nongnu.org; Thu, 16 Jul 2020 06:22:53 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <ddstreet@canonical.com>)
 id 1jw12R-0006f7-DW
 for qemu-trivial@nongnu.org; Thu, 16 Jul 2020 06:22:53 -0400
Received: from mail-qk1-f199.google.com ([209.85.222.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <ddstreet@canonical.com>) id 1jw12P-0004aF-FP
 for qemu-trivial@nongnu.org; Thu, 16 Jul 2020 10:22:49 +0000
Received: by mail-qk1-f199.google.com with SMTP id 13so3453996qks.11
 for <qemu-trivial@nongnu.org>; Thu, 16 Jul 2020 03:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7joy9bFHepjfFjjIT9o76ElHhG9W+jtL8mEGvGgYHA=;
 b=mT37P2dkUlQO7qbwR/XF3mUP309MczVk6Qy8BmRyA4DP3EhFLWxkhpkVNlw2ZSMlLV
 Zh9en+duakItqKE7+dlB9XhXvjcw/4o8iDTacMDv6+Swqldh5zVkjGhd4JX6lETyZFly
 4cGR2bbVZFeQ2XbIIGshHStXnN1iSQkXo/uGclv2bOoxhATRpowP54lLWB9/iMcAP7Gy
 vXMO9dnh+U8Onw4QsjduCiQHoObA0deJulC6QhwnlCCr5v36aD1RRJ3pgquH5/znKwtA
 eKXTuJrHxrbZaXfoLpN2hSWMtOOHvcjxE21/9FH46DyaOrTRHZUjvI4s0Q9rX+6DGinC
 5UuQ==
X-Gm-Message-State: AOAM531WsaVky47r0l+S3ismTfyRAs6uDroWn3dL8Z/qzJVvE4TotbL0
 OSdbNc/Ob8NiF+6MdV31mkVu2MVtPzhSd0Ha5shKTNzhhnQp1fzBx2hVs7jj3x5zh27AHWbFw0c
 /3E6RxeKfhgFs3sSbsIrpMYVY5iyJt2klFB0=
X-Received: by 2002:a37:4185:: with SMTP id o127mr3193926qka.478.1594894967632; 
 Thu, 16 Jul 2020 03:22:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRM1cOqJQj+oMK0G1pHuFqakTu4mbWeR65zkozg4CCd/5MirQ+tKHbLwtqfMRg+6xDzk0G3g==
X-Received: by 2002:a37:4185:: with SMTP id o127mr3193902qka.478.1594894967111; 
 Thu, 16 Jul 2020 03:22:47 -0700 (PDT)
Received: from thorin.shire (45-27-90-188.lightspeed.rlghnc.sbcglobal.net.
 [45.27.90.188])
 by smtp.gmail.com with ESMTPSA id 15sm6078600qkm.93.2020.07.16.03.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 03:22:46 -0700 (PDT)
From: Dan Streetman <ddstreet@canonical.com>
To: qemu-trivial@nongnu.org
Cc: Dan Streetman <ddstreet@canonical.com>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 Rafael David Tinoco <rafael.tinoco@canonical.com>
Subject: [PATCH v2] configure: actually disable 'git_update' mode with
 --disable-git-update
Date: Thu, 16 Jul 2020 06:22:13 -0400
Message-Id: <20200716102213.2931209-1-ddstreet@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715205013.2367760-1-ddstreet@canonical.com>
References: <20200715205013.2367760-1-ddstreet@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=ddstreet@canonical.com; helo=youngberry.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 06:22:49
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jul 2020 10:22:53 -0000

The --disable-git-update configure param sets git_update=no, but
some later checks only look for the .git dir. This changes the
--enable-git-update to set git_update=yes but also fail if it
does not find a .git dir. Then all the later checks for the .git
dir can just be changed to a check for $git_update = "yes".

Also update the Makefile to skip the 'git_update' checks if it has
been disabled.

This is needed because downstream packagers, e.g. Debian, Ubuntu, etc,
also keep the source code in git, but do not want to enable the
'git_update' mode; with the current code, that's not possible even
if the downstream package specifies --disable-git-update.

Signed-off-by: Dan Streetman <ddstreet@canonical.com>
---
Changes in v2:
 - change GIT_UPDATE default to "" if no .git found
 - change Makefile to skip git update checks if GIT_UPDATE=no

 Makefile  | 15 +++++++++------
 configure | 21 +++++++++++++--------
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 32345c610e..9bcd3f9af4 100644
--- a/Makefile
+++ b/Makefile
@@ -25,6 +25,8 @@ git-submodule-update:
 
 .PHONY: git-submodule-update
 
+# If --disable-git-update specified, skip these git checks
+ifneq (no,$(GIT_UPDATE))
 git_module_status := $(shell \
   cd '$(SRC_PATH)' && \
   GIT="$(GIT)" ./scripts/git-submodule.sh status $(GIT_SUBMODULES); \
@@ -32,7 +34,12 @@ git_module_status := $(shell \
 )
 
 ifeq (1,$(git_module_status))
-ifeq (no,$(GIT_UPDATE))
+ifeq (yes,$(GIT_UPDATE))
+git-submodule-update:
+	$(call quiet-command, \
+          (cd $(SRC_PATH) && GIT="$(GIT)" ./scripts/git-submodule.sh update $(GIT_SUBMODULES)), \
+          "GIT","$(GIT_SUBMODULES)")
+else
 git-submodule-update:
 	$(call quiet-command, \
             echo && \
@@ -41,11 +48,7 @@ git-submodule-update:
             echo "from the source directory checkout $(SRC_PATH)" && \
             echo && \
             exit 1)
-else
-git-submodule-update:
-	$(call quiet-command, \
-          (cd $(SRC_PATH) && GIT="$(GIT)" ./scripts/git-submodule.sh update $(GIT_SUBMODULES)), \
-          "GIT","$(GIT_SUBMODULES)")
+endif
 endif
 endif
 
diff --git a/configure b/configure
index b751c853f5..eefda62210 100755
--- a/configure
+++ b/configure
@@ -318,7 +318,7 @@ then
     git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
     git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
 else
-    git_update=no
+    git_update=""
     git_submodules=""
 
     if ! test -f "$source_path/ui/keycodemapdb/README"
@@ -1603,7 +1603,12 @@ for opt do
   ;;
   --with-git=*) git="$optarg"
   ;;
-  --enable-git-update) git_update=yes
+  --enable-git-update)
+      git_update=yes
+      if test ! -e "$source_path/.git"; then
+          echo "ERROR: cannot --enable-git-update without .git"
+          exit 1
+      fi
   ;;
   --disable-git-update) git_update=no
   ;;
@@ -2017,7 +2022,7 @@ fi
 # Consult white-list to determine whether to enable werror
 # by default.  Only enable by default for git builds
 if test -z "$werror" ; then
-    if test -e "$source_path/.git" && \
+    if test "$git_update" = "yes" && \
         { test "$linux" = "yes" || test "$mingw32" = "yes"; }; then
         werror="yes"
     else
@@ -4418,10 +4423,10 @@ EOF
     fdt=system
   else
       # have GIT checkout, so activate dtc submodule
-      if test -e "${source_path}/.git" ; then
+      if test "$git_update" = "yes" ; then
           git_submodules="${git_submodules} dtc"
       fi
-      if test -d "${source_path}/dtc/libfdt" || test -e "${source_path}/.git" ; then
+      if test -d "${source_path}/dtc/libfdt" || test "$git_update" = "yes" ; then
           fdt=git
           mkdir -p dtc
           if [ "$pwd_is_source_path" != "y" ] ; then
@@ -5391,7 +5396,7 @@ case "$capstone" in
   "" | yes)
     if $pkg_config capstone; then
       capstone=system
-    elif test -e "${source_path}/.git" && test $git_update = 'yes' ; then
+    elif test "$git_update" = "yes" ; then
       capstone=git
     elif test -e "${source_path}/capstone/Makefile" ; then
       capstone=internal
@@ -6447,7 +6452,7 @@ case "$slirp" in
   "" | yes)
     if $pkg_config slirp; then
       slirp=system
-    elif test -e "${source_path}/.git" && test $git_update = 'yes' ; then
+    elif test "$git_update" = "yes" ; then
       slirp=git
     elif test -e "${source_path}/slirp/Makefile" ; then
       slirp=internal
@@ -6809,7 +6814,7 @@ if test "$cpu" = "s390x" ; then
     roms="$roms s390-ccw"
     # SLOF is required for building the s390-ccw firmware on s390x,
     # since it is using the libnet code from SLOF for network booting.
-    if test -e "${source_path}/.git" ; then
+    if test "$git_update" = "yes" ; then
       git_submodules="${git_submodules} roms/SLOF"
     fi
   fi
-- 
2.25.1


