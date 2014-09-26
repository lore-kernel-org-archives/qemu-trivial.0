Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXaJG-0004n8-Jn
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 14:32:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XXaJA-0004ls-4q
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 14:32:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XXaJ4-0002jl-3F
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 14:31:56 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:36687 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XXaJ3-0002io-Tu; Fri, 26 Sep 2014 14:31:50 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XXagW-0004kU-TJ; Fri, 26 Sep 2014 20:56:05 +0200
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-trivial@nongnu.org
Date: Fri, 26 Sep 2014 19:31:36 +0100
Message-Id: <1411756299-15428-2-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1411756299-15428-1-git-send-email-alex.bennee@linaro.org>
References: <1411756299-15428-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: iggy@theiggy.com, peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, agraf@suse.de
Subject: [Qemu-trivial] [PATCH v3 1/4] .travis.yml: add more linux-user to
	the build matrix
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
X-List-Received-Date: Fri, 26 Sep 2014 18:32:01 -0000

At the same time I've grouped the $ARCH-linux-user and $ARCH-softmmu
builds together (hoping FS cache helps) and grouped all $ARCH-softmmu
only builds into one target. This reduces the build matrix slightly
which will hopefully help with build times.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alexander Graf <agraf@suse.de>
Reviewed-by: Brian Jackson <iggy@theiggy.com>

diff --git a/.travis.yml b/.travis.yml
index 89c30ae..72cfc9f 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -20,23 +20,23 @@ env:
     - GUI_PKGS="libgtk-3-dev libvte-2.90-dev libsdl1.2-dev libpng12-dev libpixman-1-dev"
     - EXTRA_PKGS=""
   matrix:
+    # Group major targets together with their linux-user counterparts
     - TARGETS=alpha-softmmu,alpha-linux-user
-    - TARGETS=arm-softmmu,arm-linux-user
-    - TARGETS=aarch64-softmmu,aarch64-linux-user
-    - TARGETS=cris-softmmu
-    - TARGETS=i386-softmmu,x86_64-softmmu
-    - TARGETS=lm32-softmmu
-    - TARGETS=m68k-softmmu
-    - TARGETS=microblaze-softmmu,microblazeel-softmmu
+    - TARGETS=arm-softmmu,arm-linux-user,armeb-linux-user,aarch64-softmmu,aarch64-linux-user
+    - TARGETS=cris-softmmu,cris-linux-user
+    - TARGETS=i386-softmmu,i386-linux-user,x86_64-softmmu,x86_64-linux-user
+    - TARGETS=m68k-softmmu,m68k-linux-user
+    - TARGETS=microblaze-softmmu,microblazeel-softmmu,microblaze-linux-user,microblazeel-linux-user
     - TARGETS=mips-softmmu,mips64-softmmu,mips64el-softmmu,mipsel-softmmu
-    - TARGETS=moxie-softmmu
-    - TARGETS=or32-softmmu,
-    - TARGETS=ppc-softmmu,ppc64-softmmu,ppcemb-softmmu
-    - TARGETS=s390x-softmmu
-    - TARGETS=sh4-softmmu,sh4eb-softmmu
-    - TARGETS=sparc-softmmu,sparc64-softmmu
-    - TARGETS=unicore32-softmmu
-    - TARGETS=xtensa-softmmu,xtensaeb-softmmu
+    - TARGETS=mips-linux-user,mips64-linux-user,mips64el-linux-user,mipsel-linux-user,mipsn32-linux-user,mipsn32el-linux-user
+    - TARGETS=or32-softmmu,or32-linux-user
+    - TARGETS=ppc-softmmu,ppc64-softmmu,ppcemb-softmmu,ppc-linux-user,ppc64-linux-user,ppc64abi32-linux-user,ppc64le-linux-user
+    - TARGETS=s390x-softmmu,s390x-linux-user
+    - TARGETS=sh4-softmmu,sh4eb-softmmu,sh4-linux-user sh4eb-linux-user
+    - TARGETS=sparc-softmmu,sparc64-softmmu,sparc-linux-user,sparc32plus-linux-user,sparc64-linux-user
+    - TARGETS=unicore32-softmmu,unicore32-linux-user
+    # Group remaining softmmu only targets into one build
+    - TARGETS=lm32-softmmu,moxie-softmmu,tricore-softmmu,xtensa-softmmu,xtensaeb-softmmu
 before_install:
   - git submodule update --init --recursive
   - sudo apt-get update -qq
-- 
2.1.0


