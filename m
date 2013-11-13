Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VgaE9-0002GI-7w
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 08:11:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgaE0-0001yC-32
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:11:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgaDv-0001nI-5C
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:11:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55072)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VgaDf-0001jt-Eq; Wed, 13 Nov 2013 08:10:55 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E404E41758;
	Wed, 13 Nov 2013 17:10:52 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BB7B652C;
	Wed, 13 Nov 2013 17:01:25 +0400 (MSK)
Received: (nullmailer pid 16050 invoked by uid 1000);
	Wed, 13 Nov 2013 13:01:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Wed, 13 Nov 2013 17:01:13 +0400
Message-Id: <1384347680-15976-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex@bennee.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 09/16] .travis.yml: basic compile and check
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
X-List-Received-Date: Wed, 13 Nov 2013 13:11:21 -0000

From: Alex Benn=C3=A9e <alex@bennee.com>

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

Signed-off-by: Alex Benn=C3=A9e <alex@bennee.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .travis.yml |   71 +++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
 1 file changed, 71 insertions(+)
 create mode 100644 .travis.yml

diff --git a/.travis.yml b/.travis.yml
new file mode 100644
index 0000000..90f1676
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
+    - TEST_CMD=3D"make check"
+    - EXTRA_CONFIG=3D""
+    # Development packages, EXTRA_PKGS saved for additional builds
+    - CORE_PKGS=3D"libusb-1.0-0-dev libiscsi-dev librados-dev libncurses=
5-dev"
+    - NET_PKGS=3D"libseccomp-dev libgnutls-dev libssh2-1-dev  libspice-s=
erver-dev libspice-protocol-dev libnss3-dev"
+    - GUI_PKGS=3D"libgtk-3-dev libvte-2.90-dev libsdl1.2-dev libpng12-de=
v libpixman-1-dev"
+    - EXTRA_PKGS=3D""
+  matrix:
+  - TARGETS=3Dalpha-softmmu,alpha-linux-user
+  - TARGETS=3Darm-softmmu,arm-linux-user
+  - TARGETS=3Dcris-softmmu
+  - TARGETS=3Di386-softmmu,x86_64-softmmu
+  - TARGETS=3Dlm32-softmmu
+  - TARGETS=3Dm68k-softmmu
+  - TARGETS=3Dmicroblaze-softmmu,microblazeel-softmmu
+  - TARGETS=3Dmips-softmmu,mips64-softmmu,mips64el-softmmu,mipsel-softmm=
u
+  - TARGETS=3Dmoxie-softmmu
+  - TARGETS=3Dor32-softmmu,
+  - TARGETS=3Dppc-softmmu,ppc64-softmmu,ppcemb-softmmu
+  - TARGETS=3Ds390x-softmmu
+  - TARGETS=3Dsh4-softmmu,sh4eb-softmmu
+  - TARGETS=3Dsparc-softmmu,sparc64-softmmu
+  - TARGETS=3Dunicore32-softmmu
+  - TARGETS=3Dxtensa-softmmu,xtensaeb-softmmu
+before_install:
+  - git submodule update --init --recursive
+  - sudo apt-get update -qq
+  - sudo apt-get install -qq ${CORE_PKGS} ${NET_PKGS} ${GUI_PKGS} ${EXTR=
A_PKGS}
+script: "./configure --target-list=3D${TARGETS} ${EXTRA_CONFIG} && make =
&& ${TEST_CMD}"
+matrix:
+  # We manually include a number of additional build for non-standard bi=
ts
+  include:
+    # Debug related options
+    - env: TARGETS=3Di386-softmmu,x86_64-softmmu
+           EXTRA_CONFIG=3D"--enable-debug"
+      compiler: gcc
+    - env: TARGETS=3Di386-softmmu,x86_64-softmmu
+           EXTRA_CONFIG=3D"--enable-debug --enable-tcg-interpreter"
+      compiler: gcc
+    # Currently configure doesn't force --disable-pie
+    - env: TARGETS=3Di386-softmmu,x86_64-softmmu
+           EXTRA_CONFIG=3D"--enable-gprof --enable-gcov --disable-pie"
+      compiler: gcc
+    - env: TARGETS=3Di386-softmmu,x86_64-softmmu
+           EXTRA_PKGS=3D"sparse"
+           EXTRA_CONFIG=3D"--enable-sparse"
+      compiler: gcc
+    # All the trace backends (apart from dtrace)
+    - env: TARGETS=3Di386-softmmu,x86_64-softmmu
+           EXTRA_CONFIG=3D"--enable-trace-backend=3Dstderr"
+      compiler: gcc
+    - env: TARGETS=3Di386-softmmu,x86_64-softmmu
+           EXTRA_CONFIG=3D"--enable-trace-backend=3Dsimple"
+      compiler: gcc
+    - env: TARGETS=3Di386-softmmu,x86_64-softmmu
+           EXTRA_CONFIG=3D"--enable-trace-backend=3Dftrace"
+           TEST_CMD=3D""
+      compiler: gcc
+    # This disabled make check for the ftrace backend which needs more s=
etting up
+    # Currently broken on 12.04 due to mis-packaged liburcu and changed =
API, will be pulled.
+    #- env: TARGETS=3Di386-softmmu,x86_64-softmmu
+    #       EXTRA_PKGS=3D"liblttng-ust-dev liburcu-dev"
+    #       EXTRA_CONFIG=3D"--enable-trace-backend=3Dust"
--=20
1.7.10.4


