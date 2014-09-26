Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXZZa-0004eN-8o
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 13:44:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZZS-0004Qk-G5
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:44:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZZO-00060h-Fm
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:44:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37779)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XXZZC-0005vi-5e; Fri, 26 Sep 2014 13:44:26 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 00F0946F6A;
	Fri, 26 Sep 2014 21:44:19 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 04FC670D;
	Fri, 26 Sep 2014 21:36:19 +0400 (MSK)
Received: (nullmailer pid 29114 invoked by uid 1000);
	Fri, 26 Sep 2014 17:36:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 26 Sep 2014 21:36:09 +0400
Message-Id: <1411752976-29051-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
References: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [Qemu-trivial] [PULL 05/12] .travis.yml: remove "make check" from
	main matrix
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
X-List-Received-Date: Fri, 26 Sep 2014 17:44:46 -0000

From: Alex Benn=C3=A9e <alex.bennee@linaro.org>

There are problems with unreliability in "make check" which still need
to be tracked down. As the tests are broadly the same for all targets if
added one explicit target to the matrix to run it. However this does
build all softmmu targets to ensure they at least "run"

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Alexander Graf <agraf@suse.de>
Reviewed-by: Brian Jackson <iggy@theiggy.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .travis.yml |   18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index b9025be..ad66e5b 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -12,7 +12,7 @@ notifications:
     on_failure: always
 env:
   global:
-    - TEST_CMD=3D"make check"
+    - TEST_CMD=3D""
     - EXTRA_CONFIG=3D""
     # Development packages, EXTRA_PKGS saved for additional builds
     - CORE_PKGS=3D"libusb-1.0-0-dev libiscsi-dev librados-dev libncurses=
5-dev"
@@ -48,10 +48,23 @@ before_install:
 before_script:
   - ./configure --target-list=3D${TARGETS} --enable-debug-tcg ${EXTRA_CO=
NFIG}
 script:
-  - make -j2 && {TEST_CMD}
+  - make -j2 && ${TEST_CMD}
 matrix:
   # We manually include a number of additional build for non-standard bi=
ts
   include:
+    # Make check target (we only do this once)
+    - env:
+        - TARGETS=3Dalpha-softmmu,arm-softmmu,aarch64-softmmu,cris-softm=
mu,
+                  i386-softmmu,x86_64-softmmu,m68k-softmmu,microblaze-so=
ftmmu,
+                  microblazeel-softmmu,mips-softmmu,mips64-softmmu,
+                  mips64el-softmmu,mipsel-softmmu,or32-softmmu,ppc-softm=
mu,
+                  ppc64-softmmu,ppcemb-softmmu,s390x-softmmu,sh4-softmmu=
,
+                  sh4eb-softmmu,sparc-softmmu,sparc64-softmmu,
+                  unicore32-softmmu,unicore32-linux-user,
+                  lm32-softmmu,moxie-softmmu,tricore-softmmu,xtensa-soft=
mmu,
+                  xtensaeb-softmmu
+          TEST_CMD=3D"make check"
+      compiler: gcc
     # Debug related options
     - env: TARGETS=3Di386-softmmu,x86_64-softmmu
            EXTRA_CONFIG=3D"--enable-debug"
@@ -80,7 +93,6 @@ matrix:
       compiler: gcc
     - env: TARGETS=3Di386-softmmu,x86_64-softmmu
            EXTRA_CONFIG=3D"--enable-trace-backends=3Dftrace"
-           TEST_CMD=3D""
       compiler: gcc
     - env: TARGETS=3Di386-softmmu,x86_64-softmmu
           EXTRA_PKGS=3D"liblttng-ust-dev liburcu-dev"
--=20
1.7.10.4


