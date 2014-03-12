Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WNjvF-0001Oe-8v
	for mharc-qemu-trivial@gnu.org; Wed, 12 Mar 2014 10:14:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WNjv8-0001Al-BW
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:14:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WNjv2-0004zm-4R
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:14:10 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:33645 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WNjus-0004wY-0c; Wed, 12 Mar 2014 10:13:54 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WNjv6-0003Ek-0o; Wed, 12 Mar 2014 15:14:08 +0100
From: alex.bennee@linaro.org
To: qemu-devel@nongnu.org
Date: Wed, 12 Mar 2014 14:13:52 +0000
Message-Id: <1394633633-18211-4-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1394633633-18211-1-git-send-email-alex.bennee@linaro.org>
References: <1394633633-18211-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PULL 3/4] .travis.yml: trivial whitespace fixup
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
X-List-Received-Date: Wed, 12 Mar 2014 14:14:15 -0000

From: Alex Bennée <alex.bennee@linaro.org>

Purely cosmetic but satisfies my OCD.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

diff --git a/.travis.yml b/.travis.yml
index 1d78421..0dbf2da 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -14,23 +14,23 @@ env:
     - GUI_PKGS="libgtk-3-dev libvte-2.90-dev libsdl1.2-dev libpng12-dev libpixman-1-dev"
     - EXTRA_PKGS=""
   matrix:
-  - TARGETS=alpha-softmmu,alpha-linux-user
-  - TARGETS=arm-softmmu,arm-linux-user
-  - TARGETS=aarch64-softmmu,aarch64-linux-user
-  - TARGETS=cris-softmmu
-  - TARGETS=i386-softmmu,x86_64-softmmu
-  - TARGETS=lm32-softmmu
-  - TARGETS=m68k-softmmu
-  - TARGETS=microblaze-softmmu,microblazeel-softmmu
-  - TARGETS=mips-softmmu,mips64-softmmu,mips64el-softmmu,mipsel-softmmu
-  - TARGETS=moxie-softmmu
-  - TARGETS=or32-softmmu,
-  - TARGETS=ppc-softmmu,ppc64-softmmu,ppcemb-softmmu
-  - TARGETS=s390x-softmmu
-  - TARGETS=sh4-softmmu,sh4eb-softmmu
-  - TARGETS=sparc-softmmu,sparc64-softmmu
-  - TARGETS=unicore32-softmmu
-  - TARGETS=xtensa-softmmu,xtensaeb-softmmu
+    - TARGETS=alpha-softmmu,alpha-linux-user
+    - TARGETS=arm-softmmu,arm-linux-user
+    - TARGETS=aarch64-softmmu,aarch64-linux-user
+    - TARGETS=cris-softmmu
+    - TARGETS=i386-softmmu,x86_64-softmmu
+    - TARGETS=lm32-softmmu
+    - TARGETS=m68k-softmmu
+    - TARGETS=microblaze-softmmu,microblazeel-softmmu
+    - TARGETS=mips-softmmu,mips64-softmmu,mips64el-softmmu,mipsel-softmmu
+    - TARGETS=moxie-softmmu
+    - TARGETS=or32-softmmu,
+    - TARGETS=ppc-softmmu,ppc64-softmmu,ppcemb-softmmu
+    - TARGETS=s390x-softmmu
+    - TARGETS=sh4-softmmu,sh4eb-softmmu
+    - TARGETS=sparc-softmmu,sparc64-softmmu
+    - TARGETS=unicore32-softmmu
+    - TARGETS=xtensa-softmmu,xtensaeb-softmmu
 before_install:
   - git submodule update --init --recursive
   - sudo apt-get update -qq
-- 
1.9.0


