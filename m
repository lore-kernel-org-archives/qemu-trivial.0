Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ve0ac-0001d9-JN
	for mharc-qemu-trivial@gnu.org; Wed, 06 Nov 2013 05:43:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Ve0aW-0001US-UD
	for qemu-trivial@nongnu.org; Wed, 06 Nov 2013 05:43:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Ve0aS-0002p8-Kz
	for qemu-trivial@nongnu.org; Wed, 06 Nov 2013 05:43:52 -0500
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:60613 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Ve0aJ-0002mx-99; Wed, 06 Nov 2013 05:43:39 -0500
Received: from localhost ([127.0.0.1] helo=sloy.cambridgebroadband.com)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Ve0cL-0001GD-AT; Wed, 06 Nov 2013 11:45:45 +0100
From: alex.bennee@linaro.org
To: qemu-devel@nongnu.org
Date: Wed,  6 Nov 2013 10:43:37 +0000
Message-Id: <1383734617-10516-2-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1383734617-10516-1-git-send-email-alex.bennee@linaro.org>
References: <1383734617-10516-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH v6] .travis.yml: basic compile and check
	recipes
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
X-List-Received-Date: Wed, 06 Nov 2013 10:43:57 -0000

From: Alex Bennée <alex@bennee.com>

This adds a build matrix definition for travis-ci.org continuous
integration service. It is usable on any public repository hosted on
GitHub. Once you have created an account signed into Travis you can
enable it on selected projects via travis-ci.org/profile. Alternatively
you can configure the service hooks on GitHub via the repository
Settings tab,then Service Hooks and selecting Travis.

Once setup Travis will automatically test every push as well as any pull
requests submitted to that repository.

The build matrix is currently split by target architecture (see TARGETS
environment variable) because a full build of QEMU can take some time.
This way you get quick feedback for any obvious errors. The additional
environment variables exist to allow additional builds to tweak the
environment. These are:

EXTRA_CONFIG - extra terms passed to configure
EXTRA_PKGS - extra dev packages to install
TEST_CMD - default "make check", can be overridden

I've confined the additional stuff to x86/x86_64 for convenience.

As Travis supports clang the main builds are done twice (once for gcc
and once for clang). However clang is disabled for the debug/trace
builds for the purposes of brevity.

Other wrinkles:

 * The lttng user-space tracing back-end is disabled
   (it is currently horribly broken)
 * The ftrace back-end doesn't run "make check"
   (it requires a mounted debugfs to work)
 * There are two debug enabled build (with and without TCG interpreter)

Signed-off-by: Alex Bennée <alex@bennee.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 .travis.yml | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 .travis.yml

diff --git a/.travis.yml b/.travis.yml
new file mode 100644
index 0000000..6e60d84
--- /dev/null
+++ b/.travis.yml
@@ -0,0 +1,71 @@
+language: c
+python:
+  - "2.4"
+compiler:
+  - gcc
+  - clang
+env:
+  global:
+    - TEST_CMD="make check"
+    - EXTRA_CONFIG=""
+    # Development packages, EXTRA_PKGS saved for additional builds
+    - CORE_PKGS="libusb-1.0-0-dev libiscsi-dev librados-dev libncurses5-dev"
+    - NET_PKGS="libseccomp-dev libgnutls-dev libssh2-1-dev  libspice-server-dev libspice-protocol-dev libnss3-dev"
+    - GUI_PKGS="libgtk-3-dev libvte-2.90-dev libsdl1.2-dev libpng12-dev libpixman-1-dev"
+    - EXTRA_PKGS=""
+  matrix:
+  - TARGETS=alpha-softmmu,alpha-linux-user
+  - TARGETS=arm-softmmu,arm-linux-user
+  - TARGETS=cris-softmmu
+  - TARGETS=i386-softmmu,x86_64-softmmu
+  - TARGETS=lm32-softmmu
+  - TARGETS=m68k-softmmu 
+  - TARGETS=microblaze-softmmu,microblazeel-softmmu
+  - TARGETS=mips-softmmu,mips64-softmmu,mips64el-softmmu,mipsel-softmmu
+  - TARGETS=moxie-softmmu
+  - TARGETS=or32-softmmu,
+  - TARGETS=ppc-softmmu,ppc64-softmmu,ppcemb-softmmu
+  - TARGETS=s390x-softmmu
+  - TARGETS=sh4-softmmu,sh4eb-softmmu
+  - TARGETS=sparc-softmmu,sparc64-softmmu
+  - TARGETS=unicore32-softmmu
+  - TARGETS=xtensa-softmmu,xtensaeb-softmmu
+before_install:
+  - git submodule update --init --recursive
+  - sudo apt-get update -qq
+  - sudo apt-get install -qq ${CORE_PKGS} ${NET_PKGS} ${GUI_PKGS} ${EXTRA_PKGS}
+script: "./configure --target-list=${TARGETS} ${EXTRA_CONFIG} && make && ${TEST_CMD}"
+matrix:
+  # We manually include a number of additional build for non-standard bits
+  include:
+    # Debug related options
+    - env: TARGETS=i386-softmmu,x86_64-softmmu
+           EXTRA_CONFIG="--enable-debug"
+      compiler: gcc
+    - env: TARGETS=i386-softmmu,x86_64-softmmu
+           EXTRA_CONFIG="--enable-debug --enable-tcg-interpreter"
+      compiler: gcc
+    # Currently configure doesn't force --disable-pie
+    - env: TARGETS=i386-softmmu,x86_64-softmmu
+           EXTRA_CONFIG="--enable-gprof --enable-gcov --disable-pie"
+      compiler: gcc
+    - env: TARGETS=i386-softmmu,x86_64-softmmu
+           EXTRA_PKGS="sparse"
+           EXTRA_CONFIG="--enable-sparse"
+      compiler: gcc
+    # All the trace backends (apart from dtrace)
+    - env: TARGETS=i386-softmmu,x86_64-softmmu
+           EXTRA_CONFIG="--enable-trace-backend=stderr"
+      compiler: gcc
+    - env: TARGETS=i386-softmmu,x86_64-softmmu
+           EXTRA_CONFIG="--enable-trace-backend=simple"
+      compiler: gcc
+    - env: TARGETS=i386-softmmu,x86_64-softmmu
+           EXTRA_CONFIG="--enable-trace-backend=ftrace"
+           TEST_CMD=""
+      compiler: gcc
+    # This disabled make check for the ftrace backend which needs more setting up
+    # Currently broken on 12.04 due to mis-packaged liburcu and changed API, will be pulled.
+    #- env: TARGETS=i386-softmmu,x86_64-softmmu
+    #       EXTRA_PKGS="liblttng-ust-dev liburcu-dev"
+    #       EXTRA_CONFIG="--enable-trace-backend=ust"
-- 
1.8.4.2


