Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kHXCp-0001UG-D7
	for mharc-qemu-trivial@gnu.org; Sun, 13 Sep 2020 14:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddstreet@canonical.com>)
 id 1kHXCn-0001SE-TE
 for qemu-trivial@nongnu.org; Sun, 13 Sep 2020 14:58:29 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <ddstreet@canonical.com>)
 id 1kHXCl-0004f4-EE
 for qemu-trivial@nongnu.org; Sun, 13 Sep 2020 14:58:29 -0400
Received: from mail-qt1-f199.google.com ([209.85.160.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <ddstreet@canonical.com>) id 1kHXCi-0003IC-HW
 for qemu-trivial@nongnu.org; Sun, 13 Sep 2020 18:58:24 +0000
Received: by mail-qt1-f199.google.com with SMTP id f12so10488731qtq.5
 for <qemu-trivial@nongnu.org>; Sun, 13 Sep 2020 11:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WhWjLVJoveAo+HAvTRl7IUPrEpnDXFj7bLJc41F5zJY=;
 b=dWYxQ0i3Nc5RTYSOGV/6Gk1W0I5u7WDpmogULpQXF6QgD1YSHS5AVZSOYfJHuXcTU7
 UJ+JmjoBfAdc9150qrXGoTsNq/Vw52KVVrFi0Xxs1qnWYzV9gu2JbsLJK8ujUUu4mDq3
 fD9USCmyuixNH0NwXOTe95yBzpCk6LwqDKjIy81XB5Sqp6WJLwoipOYQnNJzo6BtZzFI
 nB5sf4iuyOarxwjfH0lp6haStqV8on19IDvwQ41wf+FUDwZBEwZ/RBCWsL75Muzs042p
 ommsOK52nihnc8aDLWrP9gHhzfTmNHM7ZwWby1MmvB2SDdMhrREteLfsrZqYZiO1drIr
 XCGQ==
X-Gm-Message-State: AOAM532wCcUaV6sWwwrDdBxCo3vS83bc4fvi1+x0wbFrPITobVnT537g
 KDKqi+iDilED0pgqqf/XCjWn4Lvk+vQ2nTtZrvT6Yvy0SqGrahz+8Qscm7hFnYOI/c1sWq/9SnH
 4BRwL1a75VNzqsNAJG1NI1XvrBe0LgIM1vrI=
X-Received: by 2002:a37:be02:: with SMTP id o2mr10283749qkf.482.1600023503456; 
 Sun, 13 Sep 2020 11:58:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPl7WlVFNEvxbYSroCfPNiDbcQithYqWWNsR8GnYpkwo3Byv+YGxuwCIM1YI4CyzDskIU9LQ==
X-Received: by 2002:a37:be02:: with SMTP id o2mr10283742qkf.482.1600023503134; 
 Sun, 13 Sep 2020 11:58:23 -0700 (PDT)
Received: from thorin.shire (45-27-90-188.lightspeed.rlghnc.sbcglobal.net.
 [45.27.90.188])
 by smtp.gmail.com with ESMTPSA id c13sm11315724qtq.5.2020.09.13.11.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 11:58:22 -0700 (PDT)
From: Dan Streetman <ddstreet@canonical.com>
To: qemu-devel@nongnu.org
Cc: Dan Streetman <ddstreet@canonical.com>, qemu-trivial@nongnu.org,
 Rafael David Tinoco <rafael.tinoco@canonical.com>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH resend] configure: actually disable 'git_update' mode with
 --disable-git-update
Date: Sun, 13 Sep 2020 14:57:08 -0400
Message-Id: <20200913185708.1681279-1-ddstreet@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200729195829.1335082-1-ddstreet@canonical.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=ddstreet@canonical.com; helo=youngberry.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/13 14:58:25
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 13 Sep 2020 18:58:30 -0000

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
Resend; this was sent twice before:
https://lists.nongnu.org/archive/html/qemu-trivial/2020-07/msg00180.html
https://lists.nongnu.org/archive/html/qemu-devel/2020-07/msg08243.html

Makefile  | 15 +++++++++------
 configure | 23 ++++++++++++++---------
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/Makefile b/Makefile
index 2ed19310cf7..712aaf8b53b 100644
--- a/Makefile
+++ b/Makefile
@@ -38,6 +38,8 @@ git-submodule-update:
 
 .PHONY: git-submodule-update
 
+# If --disable-git-update specified, skip these git checks
+ifneq (no,$(GIT_UPDATE))
 git_module_status := $(shell \
   cd '$(SRC_PATH)' && \
   GIT="$(GIT)" ./scripts/git-submodule.sh status $(GIT_SUBMODULES); \
@@ -45,7 +47,12 @@ git_module_status := $(shell \
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
@@ -54,11 +61,7 @@ git-submodule-update:
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
index 4231d56bcc0..2e0e2adc587 100755
--- a/configure
+++ b/configure
@@ -346,7 +346,7 @@ then
     git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
     git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
 else
-    git_update=no
+    git_update=""
     git_submodules=""
 
     if ! test -f "$source_path/ui/keycodemapdb/README"
@@ -1577,7 +1577,12 @@ for opt do
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
@@ -1974,7 +1979,7 @@ python="$python -B"
 if test -z "$meson"; then
     if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.55.1; then
         meson=meson
-    elif test -e "${source_path}/.git" && test $git_update = 'yes' ; then
+    elif test $git_update = 'yes' ; then
         meson=git
     elif test -e "${source_path}/meson/meson.py" ; then
         meson=internal
@@ -2052,7 +2057,7 @@ fi
 # Consult white-list to determine whether to enable werror
 # by default.  Only enable by default for git builds
 if test -z "$werror" ; then
-    if test -e "$source_path/.git" && \
+    if test "$git_update" = "yes" && \
         { test "$linux" = "yes" || test "$mingw32" = "yes"; }; then
         werror="yes"
     else
@@ -4175,10 +4180,10 @@ EOF
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
           fdt_cflags="-I${source_path}/dtc/libfdt"
@@ -5126,7 +5131,7 @@ case "$capstone" in
   "" | yes)
     if $pkg_config capstone; then
       capstone=system
-    elif test -e "${source_path}/.git" && test $git_update = 'yes' ; then
+    elif test "$git_update" = "yes" ; then
       capstone=git
     elif test -e "${source_path}/capstone/Makefile" ; then
       capstone=internal
@@ -6126,7 +6131,7 @@ case "$slirp" in
   "" | yes)
     if $pkg_config slirp; then
       slirp=system
-    elif test -e "${source_path}/.git" && test $git_update = 'yes' ; then
+    elif test "$git_update" = "yes" ; then
       slirp=git
     elif test -e "${source_path}/slirp/Makefile" ; then
       slirp=internal
@@ -6460,7 +6465,7 @@ if test "$cpu" = "s390x" ; then
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


