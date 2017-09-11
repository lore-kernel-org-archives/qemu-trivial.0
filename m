Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1drSWB-000765-2R
	for mharc-qemu-trivial@gnu.org; Mon, 11 Sep 2017 13:29:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41931)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1drSW8-00073i-EW
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 13:29:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1drSW5-0005y3-An
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 13:29:04 -0400
Received: from mout.gmx.net ([212.227.15.19]:55125)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1drSW5-0005wk-0K; Mon, 11 Sep 2017 13:29:01 -0400
Received: from localhost.localdomain ([185.58.161.191]) by mail.gmx.com
	(mrgmx003 [212.227.17.184]) with ESMTPSA (Nemesis) id
	0LiDrv-1d4hIo1rSV-00nOSM; Mon, 11 Sep 2017 19:28:57 +0200
From: Kamil Rytarowski <n54@gmx.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, jperkin@joyent.com, peter.maydell@linaro.org,
	Kamil Rytarowski <n54@gmx.com>
Date: Mon, 11 Sep 2017 19:16:39 +0200
Message-Id: <20170911171639.22005-1-n54@gmx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170903164952.26760-1-n54@gmx.com>
References: <20170903164952.26760-1-n54@gmx.com>
X-Provags-ID: V03:K0:tFQ8LyO7mIgWyEwQVsNmdpbsXcj4jSrSiWlbLtb38HYOGhH+Fdk
	aZpFTSPUsjBp51VeprKf6n0fN6iX5jm1k8JbiAGimJI+/aCSzQ/WhByuDU7ks6ztY76qb/k
	rS40NSgY5xnlt07mSqk1f89MgcvSghazVMfyYYka8dWsvWTFqZEIIHJzFk0hS1FKtcXS17d
	ddP2KbeHqvGIyTR8sGNEA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:IF+4N/kQpgc=:B6+mW7IdvT/uxKvsU7ShT7
	TYrNELMFPXDs0HSTgdGW+Nq+XEM+djQgiAdCa+ARpxI5eEy87NOtmHE9wt5FnZhhalTWbM1iE
	zTrT9WASlQstn5a42PwcpsSPdJ2KweULNs1FWTMbJbp4nf4vhFdqSSkpYRffRyex+UcfEbULw
	LbhBvGZmccEQgoVTJKSaejGXvFCcyLLN0GaSwCeGF86pi0bRZdDACy697aFChK/v3jdVIjR4Y
	Xkf8dREb0r9Dcg5InGbClnkGxBG87rqV1pEmOJYWZzFwtoAJ6IkP8rMafG8AT5SzSMEo509VC
	JDI5TD4HpydzIHoZe7Pr5jUJ2fVvQ6HcH9pI4rdBg4DsKeIaQM460t0naPFypfj3ODcHxAtxg
	uvs9KDDiYjED7nLQmD3l5zw4uCtmBEjEDIY83YvNRq/lD9t0UsB0mwtCruGDRVNyqRrCaPc/y
	GZnI3CuMouus3Ct+YJJSwJyTIQ6DzznoryM/y4FX15ZSiTvGX9rgCZa4XUyOjrxiWkZzy95/e
	iefjCp7UjFP0T4BBerDX70upSkWVavZMXp1l6qISuQNX/0cDskH90GJSuShusKY80RmS9W/yR
	stROMGTadk6OEmEs2xrHi2mUtZxMQuBOTJoa7L6W4Sg8UwMeWyrmCguhW49plFE+YBSpFSlsg
	LPZfjvUW8lErHwNV7RShniMyouShFuIvpZDCbU7Qmzp4XX6tZDTv8/qs4nX7YytNKvnO52bQP
	m6HH83Mkjo40WbWQmzVpNcPczUEpcUT1kvQBjm84EpQUukNy8tg75864iGxsLtjzQyR5SZqXE
	DfUImB4Qa9Om/9GpvmUOXx1D42A7w==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.15.19
Subject: [Qemu-trivial] [PATCH v2] Discover openpty(3) dynamically in
 configure
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Sep 2017 17:29:05 -0000

openpty(3) might:
 - exists in libc (OSX)
 - exists in libutil (GNU, BSD)
 - does not exist (SmartOS)

Add a function to discover this function in the ./configure script.
Add new config types: CONFIG_OPENPTY_LIBC and CONFIG_OPENPTY_LIBUTIL,
respectively defined when openpts(3) links with -lc or -lutil.

Replace the condition adding -lutil in tests (for openpty(3)) from
CONFIG_POSIX to CONFIG_OPENPTY_LIBUTIL.

Replace the fallback openpty(3) impelementation comment from Solaris
to SmartOS. Solaris is EOL'ed and it's confirmed that it does not work
on Oracle Solaris.
---
 configure              | 25 +++++++++++++++++++++++++
 tests/Makefile.include |  2 +-
 util/qemu-openpty.c    |  4 ++--
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index fd7e3a5e81..a614adcd29 100755
--- a/configure
+++ b/configure
@@ -3819,6 +3819,25 @@ EOF
   fi
 fi
 
+##########################################
+# openpty probe
+openpty_libc=no
+openpty_libutil=no
+cat > $TMPC << EOF
+extern int openpty(int *amaster, int *aslave, char *name, void *termp, void *winp);
+
+int main(void)
+{
+    int master_fd, slave_fd;
+    return openpty(&master_fd, &slave_fd, 0, 0, 0) == 0;
+}
+EOF
+if compile_prog "" "" ; then
+  openpty_libc=yes
+elif compile_prog "" "-lutil" ; then
+  openpty_libutil=yes
+fi
+
 ##########################################
 # signalfd probe
 signalfd="no"
@@ -5788,6 +5807,12 @@ fi
 if test "$fdt" = "yes" ; then
   echo "CONFIG_FDT=y" >> $config_host_mak
 fi
+if test "$openpty_libc" = "yes" ; then
+  echo "CONFIG_OPENPTY_LIBC=y" >> $config_host_mak
+fi
+if test "$openpty_libutil" = "yes" ; then
+  echo "CONFIG_OPENPTY_LIBUTIL=y" >> $config_host_mak
+fi
 if test "$signalfd" = "yes" ; then
   echo "CONFIG_SIGNALFD=y" >> $config_host_mak
 fi
diff --git a/tests/Makefile.include b/tests/Makefile.include
index fae5715e9c..e7e0bc2724 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -814,7 +814,7 @@ tests/migration/initrd-stress.img: tests/migration/stress$(EXESUF)
 	rm $(INITRD_WORK_DIR)/init
 	rmdir $(INITRD_WORK_DIR)
 
-ifeq ($(CONFIG_POSIX),y)
+ifeq ($(CONFIG_OPENPTY_LIBUTIL),y)
 LIBS += -lutil
 endif
 
diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c
index 2e8b43bdf5..62c87e5563 100644
--- a/util/qemu-openpty.c
+++ b/util/qemu-openpty.c
@@ -51,8 +51,8 @@
 # include <termios.h>
 #endif
 
-#ifdef __sun__
-/* Once Solaris has openpty(), this is going to be removed. */
+/* The fallback implementation is needed at least on SmartOS. */
+#if !defined(CONFIG_OPENPTY_LIBC) && !defined(CONFIG_OPENPTY_LIBUTIL)
 static int openpty(int *amaster, int *aslave, char *name,
                    struct termios *termp, struct winsize *winp)
 {
-- 
2.14.1


