Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VyXu0-0005um-Cq
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jan 2014 21:20:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1VyXtq-0005hk-FJ
	for qemu-trivial@nongnu.org; Wed, 01 Jan 2014 21:20:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1VyXti-00022d-0u
	for qemu-trivial@nongnu.org; Wed, 01 Jan 2014 21:20:42 -0500
Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230]:62104)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>)
	id 1VyXtQ-00020n-QK; Wed, 01 Jan 2014 21:20:16 -0500
Received: by mail-pd0-f176.google.com with SMTP id w10so13601570pde.21
	for <multiple recipients>; Wed, 01 Jan 2014 18:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9VuQxccnORvwzgmSIiUckLEzgK1CSWe6cs6hqlvrrvk=;
	b=ofNS7pNo1fI2bItRuqG12oYY5T1lYZF8vXqA8YEM6ijQC7BGIl0WBWmUs1bDl5tfyw
	TiLlns0KIR/nqOfWJoPZmqIUTl8dQahjYRqseVTjURtlmJj1Yyk1ZysZ/Y7aVsHw5fWo
	4XsxmmgLlOM2XLH+rCpp/xXn2TsxnNungFfMvEzWajMli7m8IS/O9RV14oU9SSg6R6Go
	esVAfXKsJsFeJ+0djEcY6LY8qLL/IrKbv9lnH0LvPIYFhLrUNaK/zCYk16gaHKqDRW0D
	gGSUOJWzp4u5Z4sXa3EogZRdKeq2iQz4Zgom2p2eiEgWkklLQc/rx++lt6C4sattiezT
	Co6Q==
X-Received: by 10.68.195.4 with SMTP id ia4mr62702457pbc.142.1388629215040;
	Wed, 01 Jan 2014 18:20:15 -0800 (PST)
Received: from localhost.localdomain ([221.122.32.18])
	by mx.google.com with ESMTPSA id
	qq5sm24672380pbb.24.2014.01.01.18.20.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 18:20:13 -0800 (PST)
From: Kewei Yu <keweihk@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 Jan 2014 10:20:02 +0800
Message-Id: <1388629202-29482-1-git-send-email-keweihk@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::230
Cc: qemu-trivial@nongnu.org, peter.crosthwaite@xilinx.com, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH v3 1/1] qtest: Fix the bug about disable vnc
	causes "make check" fail
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
X-List-Received-Date: Thu, 02 Jan 2014 02:20:51 -0000

When we disable vnc from "./configure", QEMU can't use the vnc option.
So qtest can't use the "vnc -none ", otherwise "make check" fails.

Signed-off-by: Kewei Yu <keweihk@gmail.com>
---
 v2: Consolidate VNC macro's #ifdef'ery to one central point (tests/libqtest.c).
 v3: Fix the spelling and terminology error: "s/disabling/disable; s/the\ qemu/QEMU; s/hangs/fails;"
---

 tests/fdc-test.c |    5 +----
 tests/ide-test.c |    3 ---
 tests/libqtest.c |    8 ++++++++
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/tests/fdc-test.c b/tests/fdc-test.c
index 38b5b17..37096dc 100644
--- a/tests/fdc-test.c
+++ b/tests/fdc-test.c
@@ -518,7 +518,6 @@ static void fuzz_registers(void)
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
-    char *cmdline;
     int fd;
     int ret;
 
@@ -538,9 +537,7 @@ int main(int argc, char **argv)
     /* Run the tests */
     g_test_init(&argc, &argv, NULL);
 
-    cmdline = g_strdup_printf("-vnc none ");
-
-    qtest_start(cmdline);
+    qtest_start(NULL);
     qtest_irq_intercept_in(global_qtest, "ioapic");
     qtest_add_func("/fdc/cmos", test_cmos);
     qtest_add_func("/fdc/no_media_on_start", test_no_media_on_start);
diff --git a/tests/ide-test.c b/tests/ide-test.c
index d5cec5a..4a0d97f 100644
--- a/tests/ide-test.c
+++ b/tests/ide-test.c
@@ -380,7 +380,6 @@ static void test_bmdma_no_busmaster(void)
 static void test_bmdma_setup(void)
 {
     ide_test_start(
-        "-vnc none "
         "-drive file=%s,if=ide,serial=%s,cache=writeback "
         "-global ide-hd.ver=%s",
         tmp_path, "testdisk", "version");
@@ -410,7 +409,6 @@ static void test_identify(void)
     int ret;
 
     ide_test_start(
-        "-vnc none "
         "-drive file=%s,if=ide,serial=%s,cache=writeback "
         "-global ide-hd.ver=%s",
         tmp_path, "testdisk", "version");
@@ -455,7 +453,6 @@ static void test_flush(void)
     uint8_t data;
 
     ide_test_start(
-        "-vnc none "
         "-drive file=blkdebug::%s,if=ide,cache=writeback",
         tmp_path);
 
diff --git a/tests/libqtest.c b/tests/libqtest.c
index 359d571..921391c 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -35,6 +35,12 @@
 
 #define MAX_IRQ 256
 
+#ifdef CONFIG_VNC
+static const char *qtest_vnc_param = "-vnc none ";
+#else
+static const char *qtest_vnc_param = NULL;
+#endif
+
 QTestState *global_qtest;
 
 struct QTestState
@@ -136,8 +142,10 @@ QTestState *qtest_init(const char *extra_args)
                                   "-pidfile %s "
                                   "-machine accel=qtest "
                                   "-display none "
+                                  "%s"
                                   "%s", qemu_binary, s->socket_path,
                                   s->qmp_socket_path, pid_file,
+                                  qtest_vnc_param ?: "",
                                   extra_args ?: "");
         execlp("/bin/sh", "sh", "-c", command, NULL);
         exit(1);
-- 
1.7.1


