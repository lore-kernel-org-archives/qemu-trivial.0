Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOlLM-0002RO-5e
	for mharc-qemu-trivial@gnu.org; Sat, 15 Mar 2014 05:57:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlLF-0002AJ-2v
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 05:57:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlLA-0004SR-5u
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 05:57:21 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55854)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOlKz-0004QD-7P; Sat, 15 Mar 2014 05:57:05 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 54B5A41D96;
	Sat, 15 Mar 2014 13:57:04 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 42554662;
	Sat, 15 Mar 2014 13:57:04 +0400 (MSK)
Received: (nullmailer pid 20012 invoked by uid 1000);
	Sat, 15 Mar 2014 09:57:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Mar 2014 13:56:50 +0400
Message-Id: <1394877419-19949-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [Qemu-trivial] [PULL 04/13] .travis.yml: trivial whitespace fixup
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
X-List-Received-Date: Sat, 15 Mar 2014 09:57:25 -0000

From: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Purely cosmetic but satisfies my OCD.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .travis.yml |   34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 1d78421..0dbf2da 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -14,23 +14,23 @@ env:
     - GUI_PKGS=3D"libgtk-3-dev libvte-2.90-dev libsdl1.2-dev libpng12-de=
v libpixman-1-dev"
     - EXTRA_PKGS=3D""
   matrix:
-  - TARGETS=3Dalpha-softmmu,alpha-linux-user
-  - TARGETS=3Darm-softmmu,arm-linux-user
-  - TARGETS=3Daarch64-softmmu,aarch64-linux-user
-  - TARGETS=3Dcris-softmmu
-  - TARGETS=3Di386-softmmu,x86_64-softmmu
-  - TARGETS=3Dlm32-softmmu
-  - TARGETS=3Dm68k-softmmu
-  - TARGETS=3Dmicroblaze-softmmu,microblazeel-softmmu
-  - TARGETS=3Dmips-softmmu,mips64-softmmu,mips64el-softmmu,mipsel-softmm=
u
-  - TARGETS=3Dmoxie-softmmu
-  - TARGETS=3Dor32-softmmu,
-  - TARGETS=3Dppc-softmmu,ppc64-softmmu,ppcemb-softmmu
-  - TARGETS=3Ds390x-softmmu
-  - TARGETS=3Dsh4-softmmu,sh4eb-softmmu
-  - TARGETS=3Dsparc-softmmu,sparc64-softmmu
-  - TARGETS=3Dunicore32-softmmu
-  - TARGETS=3Dxtensa-softmmu,xtensaeb-softmmu
+    - TARGETS=3Dalpha-softmmu,alpha-linux-user
+    - TARGETS=3Darm-softmmu,arm-linux-user
+    - TARGETS=3Daarch64-softmmu,aarch64-linux-user
+    - TARGETS=3Dcris-softmmu
+    - TARGETS=3Di386-softmmu,x86_64-softmmu
+    - TARGETS=3Dlm32-softmmu
+    - TARGETS=3Dm68k-softmmu
+    - TARGETS=3Dmicroblaze-softmmu,microblazeel-softmmu
+    - TARGETS=3Dmips-softmmu,mips64-softmmu,mips64el-softmmu,mipsel-soft=
mmu
+    - TARGETS=3Dmoxie-softmmu
+    - TARGETS=3Dor32-softmmu,
+    - TARGETS=3Dppc-softmmu,ppc64-softmmu,ppcemb-softmmu
+    - TARGETS=3Ds390x-softmmu
+    - TARGETS=3Dsh4-softmmu,sh4eb-softmmu
+    - TARGETS=3Dsparc-softmmu,sparc64-softmmu
+    - TARGETS=3Dunicore32-softmmu
+    - TARGETS=3Dxtensa-softmmu,xtensaeb-softmmu
 before_install:
   - git submodule update --init --recursive
   - sudo apt-get update -qq
--=20
1.7.10.4


