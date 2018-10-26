Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4JZ-00056n-Tm
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4JM-00041t-9b
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:46:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46p-0005MO-Gm
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:13 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:33755)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46b-0004uO-3G; Fri, 26 Oct 2018 11:32:57 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MgARS-1ffLh50QDG-00hbtl; Fri, 26 Oct 2018 17:32:05 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MgARS-1ffLh50QDG-00hbtl; Fri, 26 Oct 2018 17:32:05 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>, Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>
Date: Fri, 26 Oct 2018 17:31:17 +0200
Message-Id: <20181026153125.24738-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ex2+kfocSHYiSFatyHnbgYg6PbpKVY9xitw2Vhe2SRwOK5wFpye
	WzTXWFeZycPBflsRTUQCJdfJIfYS9wEbxqIdLf56LCf/IQvTYsruo8snUVasRtP0S0J2GDm
	aIK9o7o9Xqjm5SH65Y1gwW7/diBtR9KEvlXschdEGuYXQ0Utfn/dtKaQlokYxvqWmBzEnIK
	mIyPtVj6UdDrWmQD06JLA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:detTgguHPt0=:Ec7dYIeTiXiizbwBWjVA82
	1bhjC0EtY+xf53OOXuG7Q9VOa+aBJgKppIySlxiVx4ci0aLVXddBuGtRgBBa6snQutylLHcGh
	E6GV8BiZ8jZY6JgU4cdjPTFR8Y0/0ZSF+1ARF6IqT31mrHv3C95ZSpt7RR5w7I3cK09ki8I72
	iTvOjHV1YBt2E0sXxUE6L5rqeI/tS6EPVX61VpUBs47PPnNclH6vuGIWeem2FK4IIXHQZPX6p
	lDOkTX2T/RRTjasH4Xof6elqb+e2hfDpLQbQt+HRJQJw+5FjgJStOeKDAsVIXWhLRVbiZjuSq
	cjZGKBS7JuTmrYoCQb6zy8O90746NWCVLrSuSkwTurxJL59kRYyUu9Ml4MQnrsGqd/f7IjYhS
	fYrcj9yYO+zAOdusUjkIuV9I0I0k0RMFlvMoXyUIu10Q62ivYAe+8qhm4gvT9IyLNp/6wpwOQ
	QHQPwrsSBcz+lNzIzt2Yd31cGQffdPF2hy3PInHpfrLhz7e7rMUXaX6QruTR1YL3hK5IU3Dx4
	rXaUG+WpG+co3oGpHj+ywZMaKhs9Ho3RoAvMBAfIl2HSb0XFiOTBfeFSj89I+NIMJJbu1JB1Q
	qdBPxuMpcI7kzT2rUvBbz6q5EfKAXCyRcVDlWSFwjRHxJtpMG6fVYPqH4Qz8t1sWxBXwHhUAK
	HUBzn/KyLcw2aGvS0aPRuDzhnr/Vbxg+ef/m1To4nq01zVCYJ4tt42FgZ/XuR0HKBLFumdPlB
	0spzLrBGT41oirWY
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 12/20] tests: Fix typos in comments and help
 message (found by codespell)
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
X-List-Received-Date: Fri, 26 Oct 2018 15:46:12 -0000

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


