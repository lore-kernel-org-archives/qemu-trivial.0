Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvv0Q-0002YD-MX
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jul 2020 23:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddstreet@canonical.com>)
 id 1jvoML-0006f8-T5
 for qemu-trivial@nongnu.org; Wed, 15 Jul 2020 16:50:33 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <ddstreet@canonical.com>)
 id 1jvoMK-0007Bg-1U
 for qemu-trivial@nongnu.org; Wed, 15 Jul 2020 16:50:33 -0400
Received: from mail-qv1-f69.google.com ([209.85.219.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <ddstreet@canonical.com>) id 1jvoMG-0004ZI-2g
 for qemu-trivial@nongnu.org; Wed, 15 Jul 2020 20:50:28 +0000
Received: by mail-qv1-f69.google.com with SMTP id v20so2073729qvt.15
 for <qemu-trivial@nongnu.org>; Wed, 15 Jul 2020 13:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yA1A3hNm/cwoJKlVY2uv4xO6h112riB2A167wR0Fqjs=;
 b=RGhl90yk5O1efosYjrZFmp0hzmwGHXsPRN8SBhjY4aJgr0fnlK0qDpt4aJJ7qh+jZn
 iassY+Jm0uEGgY0Mf8RNSBbc31Nbu03BbppwoWcXXCcGQx3AxSw9f2AyhQLA61Xivdab
 cigCD8jMPSLheaipCunkh1acEd0l9BcVXwLAac3tSkY1erbA2XMrpE3ULWV93nyvWkUY
 dQleTEQknfzhyCTh1SRugHGbbMVEIKE9ghBBzpfcGn/2+IqkFGKPpXfmri3BLdQ4AtJj
 Tej74RK1DHkFcpilyYXRbl7BLEWqutzrNVMkq6JIw2ey7MKSfBkBlDuGOugl78NMDrnH
 29PQ==
X-Gm-Message-State: AOAM530uBUTt+8Ptp+4zlDZ9E0PSy7hBJnOyIltEPztq/OKQ3sJtjHER
 2X7b9hHzSSFk/Eiu+T4fma7ObOgp/9lvVN57HrKurbSpVwNd4+AdDaHUxrI1NYo95g731/bU/ws
 Nyv9RJtA+HyFNiaYM4Ug54++XD7w/NfJuqfE=
X-Received: by 2002:ac8:1bad:: with SMTP id z42mr1865248qtj.110.1594846226865; 
 Wed, 15 Jul 2020 13:50:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgoCuxK2vvTXm+yTrsnY+UBkShHLDVpbjE7nUjBiadQVUs+b30UB7x4r2scXWaQ5CQQRVu9g==
X-Received: by 2002:ac8:1bad:: with SMTP id z42mr1865225qtj.110.1594846226541; 
 Wed, 15 Jul 2020 13:50:26 -0700 (PDT)
Received: from thorin.shire (45-27-90-188.lightspeed.rlghnc.sbcglobal.net.
 [45.27.90.188])
 by smtp.gmail.com with ESMTPSA id r18sm4377260qtf.62.2020.07.15.13.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 13:50:25 -0700 (PDT)
From: Dan Streetman <ddstreet@canonical.com>
To: qemu-trivial@nongnu.org
Cc: Dan Streetman <ddstreet@canonical.com>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 Rafael David Tinoco <rafael.tinoco@canonical.com>
Subject: [PATCH] configure: actually disable 'git_update' mode with
 --disable-git-update
Date: Wed, 15 Jul 2020 16:50:13 -0400
Message-Id: <20200715205013.2367760-1-ddstreet@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=ddstreet@canonical.com; helo=youngberry.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 16:50:28
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Jul 2020 23:56:21 -0400
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
X-List-Received-Date: Wed, 15 Jul 2020 20:50:34 -0000

The --disable-git-update configure param sets git_update=no, but
some later checks only look for the .git dir. This changes the
--enable-git-update to set git_update=yes but also fail if it
does not find a .git dir. Then all the later checks for the .git
dir can just be changed to a check for $git_update = "yes".

This is needed because downstream packagers, e.g. Debian, Ubuntu, etc,
also keep the source code in git, but do not want to enable the
'git_update' mode; with the current code, that's not possible even
if the downstream package specifies --disable-git-update.

Signed-off-by: Dan Streetman <ddstreet@canonical.com>
---
 configure | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index b751c853f5..fdc292b838 100755
--- a/configure
+++ b/configure
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


