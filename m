Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXZRo-0005kP-6n
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 13:36:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZRh-0005ZH-KA
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:36:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZRd-0003mf-5B
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:36:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XXZRQ-0003hH-Ci; Fri, 26 Sep 2014 13:36:24 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B395046F64;
	Fri, 26 Sep 2014 21:36:18 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 96F6E70E;
	Fri, 26 Sep 2014 21:36:18 +0400 (MSK)
Received: (nullmailer pid 29108 invoked by uid 1000);
	Fri, 26 Sep 2014 17:36:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 26 Sep 2014 21:36:06 +0400
Message-Id: <1411752976-29051-3-git-send-email-mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 02/12] .travis.yml: add more linux-user to the
	build matrix
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
X-List-Received-Date: Fri, 26 Sep 2014 17:36:45 -0000

From: Alex Benn=C3=A9e <alex.bennee@linaro.org>

At the same time I've grouped the $ARCH-linux-user and $ARCH-softmmu
builds together (hoping FS cache helps) and grouped all $ARCH-softmmu
only builds into one target. This reduces the build matrix slightly
which will hopefully help with build times.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Alexander Graf <agraf@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .travis.yml |   30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 89c30ae..72cfc9f 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -20,23 +20,23 @@ env:
     - GUI_PKGS=3D"libgtk-3-dev libvte-2.90-dev libsdl1.2-dev libpng12-de=
v libpixman-1-dev"
     - EXTRA_PKGS=3D""
   matrix:
+    # Group major targets together with their linux-user counterparts
     - TARGETS=3Dalpha-softmmu,alpha-linux-user
-    - TARGETS=3Darm-softmmu,arm-linux-user
-    - TARGETS=3Daarch64-softmmu,aarch64-linux-user
-    - TARGETS=3Dcris-softmmu
-    - TARGETS=3Di386-softmmu,x86_64-softmmu
-    - TARGETS=3Dlm32-softmmu
-    - TARGETS=3Dm68k-softmmu
-    - TARGETS=3Dmicroblaze-softmmu,microblazeel-softmmu
+    - TARGETS=3Darm-softmmu,arm-linux-user,armeb-linux-user,aarch64-soft=
mmu,aarch64-linux-user
+    - TARGETS=3Dcris-softmmu,cris-linux-user
+    - TARGETS=3Di386-softmmu,i386-linux-user,x86_64-softmmu,x86_64-linux=
-user
+    - TARGETS=3Dm68k-softmmu,m68k-linux-user
+    - TARGETS=3Dmicroblaze-softmmu,microblazeel-softmmu,microblaze-linux=
-user,microblazeel-linux-user
     - TARGETS=3Dmips-softmmu,mips64-softmmu,mips64el-softmmu,mipsel-soft=
mmu
-    - TARGETS=3Dmoxie-softmmu
-    - TARGETS=3Dor32-softmmu,
-    - TARGETS=3Dppc-softmmu,ppc64-softmmu,ppcemb-softmmu
-    - TARGETS=3Ds390x-softmmu
-    - TARGETS=3Dsh4-softmmu,sh4eb-softmmu
-    - TARGETS=3Dsparc-softmmu,sparc64-softmmu
-    - TARGETS=3Dunicore32-softmmu
-    - TARGETS=3Dxtensa-softmmu,xtensaeb-softmmu
+    - TARGETS=3Dmips-linux-user,mips64-linux-user,mips64el-linux-user,mi=
psel-linux-user,mipsn32-linux-user,mipsn32el-linux-user
+    - TARGETS=3Dor32-softmmu,or32-linux-user
+    - TARGETS=3Dppc-softmmu,ppc64-softmmu,ppcemb-softmmu,ppc-linux-user,=
ppc64-linux-user,ppc64abi32-linux-user,ppc64le-linux-user
+    - TARGETS=3Ds390x-softmmu,s390x-linux-user
+    - TARGETS=3Dsh4-softmmu,sh4eb-softmmu,sh4-linux-user sh4eb-linux-use=
r
+    - TARGETS=3Dsparc-softmmu,sparc64-softmmu,sparc-linux-user,sparc32pl=
us-linux-user,sparc64-linux-user
+    - TARGETS=3Dunicore32-softmmu,unicore32-linux-user
+    # Group remaining softmmu only targets into one build
+    - TARGETS=3Dlm32-softmmu,moxie-softmmu,tricore-softmmu,xtensa-softmm=
u,xtensaeb-softmmu
 before_install:
   - git submodule update --init --recursive
   - sudo apt-get update -qq
--=20
1.7.10.4


