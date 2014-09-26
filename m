Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXaJH-0004pk-RK
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 14:32:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XXaJC-0004ly-JF
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 14:32:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XXaJ4-0002jz-4D
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 14:31:58 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:36689 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XXaJ3-0002iu-U4; Fri, 26 Sep 2014 14:31:50 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XXagY-0004kU-A9; Fri, 26 Sep 2014 20:56:06 +0200
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-trivial@nongnu.org
Date: Fri, 26 Sep 2014 19:31:39 +0100
Message-Id: <1411756299-15428-5-git-send-email-alex.bennee@linaro.org>
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
Subject: [Qemu-trivial] [PATCH v3 4/4] .travis.yml: remove "make check" from
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
X-List-Received-Date: Fri, 26 Sep 2014 18:32:02 -0000

There are problems with unreliability in "make check" which still need
to be tracked down. As the tests are broadly the same for all targets if
added one explicit target to the matrix to run it. However this does
build all softmmu targets to ensure they at least "run"

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alexander Graf <agraf@suse.de>
Reviewed-by: Brian Jackson <iggy@theiggy.com>

diff --git a/.travis.yml b/.travis.yml
index e927da2..ad66e5b 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -12,7 +12,7 @@ notifications:
     on_failure: always
 env:
   global:
-    - TEST_CMD="make check"
+    - TEST_CMD=""
     - EXTRA_CONFIG=""
     # Development packages, EXTRA_PKGS saved for additional builds
     - CORE_PKGS="libusb-1.0-0-dev libiscsi-dev librados-dev libncurses5-dev"
@@ -52,6 +52,19 @@ script:
 matrix:
   # We manually include a number of additional build for non-standard bits
   include:
+    # Make check target (we only do this once)
+    - env:
+        - TARGETS=alpha-softmmu,arm-softmmu,aarch64-softmmu,cris-softmmu,
+                  i386-softmmu,x86_64-softmmu,m68k-softmmu,microblaze-softmmu,
+                  microblazeel-softmmu,mips-softmmu,mips64-softmmu,
+                  mips64el-softmmu,mipsel-softmmu,or32-softmmu,ppc-softmmu,
+                  ppc64-softmmu,ppcemb-softmmu,s390x-softmmu,sh4-softmmu,
+                  sh4eb-softmmu,sparc-softmmu,sparc64-softmmu,
+                  unicore32-softmmu,unicore32-linux-user,
+                  lm32-softmmu,moxie-softmmu,tricore-softmmu,xtensa-softmmu,
+                  xtensaeb-softmmu
+          TEST_CMD="make check"
+      compiler: gcc
     # Debug related options
     - env: TARGETS=i386-softmmu,x86_64-softmmu
            EXTRA_CONFIG="--enable-debug"
@@ -80,7 +93,6 @@ matrix:
       compiler: gcc
     - env: TARGETS=i386-softmmu,x86_64-softmmu
            EXTRA_CONFIG="--enable-trace-backends=ftrace"
-           TEST_CMD=""
       compiler: gcc
     - env: TARGETS=i386-softmmu,x86_64-softmmu
           EXTRA_PKGS="liblttng-ust-dev liburcu-dev"
-- 
2.1.0


