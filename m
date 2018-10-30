Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS9f-0002bd-Qf
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:25:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS9a-0002XO-G8
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS9Q-0004Dx-HG
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:40 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:56345)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS95-0003JJ-Pi; Tue, 30 Oct 2018 07:25:16 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MQNF3-1fvmNH26oj-00MJYZ; Tue, 30 Oct 2018 12:24:10 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MQNF3-1fvmNH26oj-00MJYZ; Tue, 30 Oct 2018 12:24:10 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org, Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>, Markus Armbruster <armbru@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Date: Tue, 30 Oct 2018 12:23:29 +0100
Message-Id: <20181030112337.17973-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CK9OXTJE+9thuJlqKWdjGkDP8vw7RWiFYDtHr6gxGOqXXP5Bgkg
	9Jn4bea8Ed7W7M9nZHG8+I7Cs9+2AXZ9HwgJXOzb83IDkQwiTlYuEkKiuQBH8yqlfHayn/7
	NEneP4dBqtBG2O9n5qdY1ctlwbkKIH618PAStzJ8Nrk9aEZqTX6HGwXZq8DwwAFPhJkoGlP
	4oCOvet1bfSZlcetBB6qg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:IgkFOeAYhao=:plejZj8JV4NgIKZXRsLSZY
	0dOUvVRCS6GgNTy72Y0H6R2zVMQu91SyizrX2vWRnHGBi/4u+APdHcjfQAFDi/uNrzAVtM6b3
	XFfDZSxnbT3kmK9Hrg9WS2HAvQeXUhPLghzoz/l7i9GwyroYQNRhJMI93Km+12BW5CZjLZa8f
	U4y6ksiWpGkEZ4VB6pyhrPxHIsBZpzu/ineFBdzlHkpIpSixyF4/YaPH4kO5kRXSisVvbiDd0
	ICDL4Orq6KbsQSsA43F65YVabpmwYLSu0Xh1IhExd/vtlD2cwyYtXObWi3bE5J+iqK+Vk648a
	OKcAT1M9GgdFFWWFIRirCsSwUpcA/TF8X1PR9YA7y2UtVnMAmXmNt7MEiUPURKuXGhfK3UWo8
	PhxSJsEdmp7+P4ZeRcjZ/Cj/2rW49K8ImWSlFm1YoieRtCreUZ1SSaGe0Vi1W2nI4k2n2Ltzd
	/HoTzRxLWDDua+YOhIkgDpP3gDNZKC5yPXNaPkxTkEZ9hUZpyh/nWGY6qE5PSc6tSla9cCfxI
	u1FmFvkRYxqTyrX2AAqHwiNxGpJyq0OGKw/aAnaYI1tDcLCcsF+2pGjQ/U9HYSMKfCzkp7Qkx
	HNtAurlNVTpGG8y2QI5K0A2v4ZUBdhvcNqLgdU9yeAs8dQfxn0FNLviNFJ7XwT6zstJkdevkX
	vIyRjB71xLPX/Haen0DFNztqTGmZdTI+pmaWnAaf9GI1YGryCg3NxndxGFda1wkmpBCrGghjv
	sLLzuwlKzOYEAb6y
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: [Qemu-trivial] [PULL v2 12/20] tests: Fix typos in comments and
 help message (found by codespell)
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
X-List-Received-Date: Tue, 30 Oct 2018 11:25:50 -0000

From: Stefan Weil <sw@weilnetz.de>

Fix also a grammar issue.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20180713054755.23323-1-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/bios-tables-test.c              | 2 +-
 tests/docker/Makefile.include         | 2 +-
 tests/docker/docker.py                | 4 ++--
 tests/guest-debug/test-gdbstub.py     | 2 +-
 tests/qemu-iotests/common.qemu        | 2 +-
 tests/tcg/Makefile.include            | 2 +-
 tests/tcg/Makefile.probe              | 2 +-
 tests/tcg/mips/mips64-dsp/subq_s_pw.c | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 4e24930c4b..af4b1fb6bd 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -390,7 +390,7 @@ try_again:
         if (g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
             exp_sdt.aml_file = aml_file;
         } else if (*ext != '\0') {
-            /* try fallback to generic (extention less) expected file */
+            /* try fallback to generic (extension less) expected file */
             ext = "";
             g_free(aml_file);
             goto try_again;
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 6e03235ab9..9467e9d088 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -41,7 +41,7 @@ docker-qemu-src: $(DOCKER_SRC_COPY)
 docker-image: ${DOCKER_TARGETS}
 
 # General rule for building docker images. If we are a sub-make
-# invoked with SKIP_DOCKER_BUILD we still check the image is upto date
+# invoked with SKIP_DOCKER_BUILD we still check the image is up to date
 # though
 ifdef SKIP_DOCKER_BUILD
 docker-image-%: $(DOCKER_FILES_DIR)/%.docker
diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 44d5f7493b..02d8a83847 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -97,7 +97,7 @@ def _get_so_libs(executable):
     return libs
 
 def _copy_binary_with_libs(src, dest_dir):
-    """Copy a binary executable and all its dependant libraries.
+    """Copy a binary executable and all its dependent libraries.
 
     This does rely on the host file-system being fairly multi-arch
     aware so the file don't clash with the guests layout."""
@@ -284,7 +284,7 @@ class SubCommand(object):
     name = None # Subcommand name
     def shared_args(self, parser):
         parser.add_argument("--quiet", action="store_true",
-                            help="Run quietly unless an error occured")
+                            help="Run quietly unless an error occurred")
 
     def args(self, parser):
         """Setup argument parser"""
diff --git a/tests/guest-debug/test-gdbstub.py b/tests/guest-debug/test-gdbstub.py
index 474d2c5c65..0e4ac01426 100644
--- a/tests/guest-debug/test-gdbstub.py
+++ b/tests/guest-debug/test-gdbstub.py
@@ -122,7 +122,7 @@ class CatchBreakpoint(gdb.Breakpoint):
 
 
 def run_test():
-    "Run throught the tests one by one"
+    "Run through the tests one by one"
 
     print ("Checking we can step the first few instructions")
     step_ok = 0
diff --git a/tests/qemu-iotests/common.qemu b/tests/qemu-iotests/common.qemu
index f285484951..dadde2a266 100644
--- a/tests/qemu-iotests/common.qemu
+++ b/tests/qemu-iotests/common.qemu
@@ -257,7 +257,7 @@ function _launch_qemu()
 }
 
 
-# Silenty kills the QEMU process
+# Silently kills the QEMU process
 #
 # If $wait is set to anything other than the empty string, the process will not
 # be killed but only waited for, and any output will be forwarded to stdout. If
diff --git a/tests/tcg/Makefile.include b/tests/tcg/Makefile.include
index 57470b2a2c..c581bd6ffc 100644
--- a/tests/tcg/Makefile.include
+++ b/tests/tcg/Makefile.include
@@ -2,7 +2,7 @@
 #
 # TCG tests (per-target rules)
 #
-# This Makefile fragement is included from the per-target
+# This Makefile fragment is included from the per-target
 # Makefile.target so will be invoked for each linux-user program we
 # build. We have two options for compiling, either using a configured
 # guest compiler or calling one of our docker images to do it for us.
diff --git a/tests/tcg/Makefile.probe b/tests/tcg/Makefile.probe
index 15c0412657..9dc654663d 100644
--- a/tests/tcg/Makefile.probe
+++ b/tests/tcg/Makefile.probe
@@ -2,7 +2,7 @@
 #
 # TCG Compiler Probe
 #
-# This Makefile fragement is included multiple times in the main make
+# This Makefile fragment is included multiple times in the main make
 # script to probe for available compilers. This is used to build up a
 # selection of required docker targets before we invoke a sub-make for
 # each target.
diff --git a/tests/tcg/mips/mips64-dsp/subq_s_pw.c b/tests/tcg/mips/mips64-dsp/subq_s_pw.c
index e8e0b0567e..4c080b785a 100644
--- a/tests/tcg/mips/mips64-dsp/subq_s_pw.c
+++ b/tests/tcg/mips/mips64-dsp/subq_s_pw.c
@@ -24,7 +24,7 @@ int main(void)
     rt = 0x123456789ABCDEF1;
     rs = 0x123456789ABCDEF2;
     result =  0x0000000000000001;
-    /* This time we do not set dspctrl, but it setted in pre-action. */
+    /* This time we do not set dspctrl, but set it in pre-action. */
     dspresult = 0x1;
 
     __asm
-- 
2.17.2


