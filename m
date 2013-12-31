Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VxrAh-0007Ox-Qo
	for mharc-qemu-trivial@gnu.org; Mon, 30 Dec 2013 23:43:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1VxrAW-00078X-Rs
	for qemu-trivial@nongnu.org; Mon, 30 Dec 2013 23:43:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1VxrAO-0002WE-Do
	for qemu-trivial@nongnu.org; Mon, 30 Dec 2013 23:43:04 -0500
Received: from mail-pb0-x22e.google.com ([2607:f8b0:400e:c01::22e]:33645)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>)
	id 1VxrA7-0002Q4-5O; Mon, 30 Dec 2013 23:42:39 -0500
Received: by mail-pb0-f46.google.com with SMTP id md12so12324608pbc.33
	for <multiple recipients>; Mon, 30 Dec 2013 20:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RGp8O9l/PSFL6BS1STp/udjnkhZeIKWiRwjPAaQakEs=;
	b=gtiwotwQc66xShzVo+B5k4oxU0NctkDTwWEY7WUdVGRO0lXRKP6Eh18kFL3PClhlDj
	23OPOEnjPDA5S/0vRgpMJjQCPPEklvNu6HEZc3uqt/pZhtVa2fJSNEpHhrbIlcZVCAqt
	CfnEkV+TscFV2Kc7XkqI0+YQsNn+R7yQPBedCQasrk0lMP4uGbNn2iJcDKcaF2had4Y4
	/ebARmm4D29c0CnMLhlUVE7wg3UNYFNdXRzmqmhrmNMKzh0yRkhEAiPIXSLmXre8kLJz
	aKWWR/kEadMSnwFaCLzIsxr9fE8mmYWmIJQby1GzbZs7SmmfutOdtIzi3Q7c50t0jAb7
	Deug==
X-Received: by 10.66.136.101 with SMTP id pz5mr73545841pab.118.1388464957947; 
	Mon, 30 Dec 2013 20:42:37 -0800 (PST)
Received: from localhost.localdomain ([221.122.32.18])
	by mx.google.com with ESMTPSA id ki1sm85209601pbd.1.2013.12.30.20.42.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Dec 2013 20:42:34 -0800 (PST)
From: Kewei Yu <keweihk@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 31 Dec 2013 12:42:24 +0800
Message-Id: <1388464944-26911-1-git-send-email-keweihk@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22e
Cc: qemu-trivial@nongnu.org, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH v2 1/1] qtest: Fix the bug about disabling
	vnc causes "make check" hang
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
X-List-Received-Date: Tue, 31 Dec 2013 04:43:14 -0000

When we disabling vnc from "./configure", the qemu can't use the vnc option.
So qtest can't use the "vnc -none ", otherwise "make check" will hang.

Signed-off-by: Kewei Yu <keweihk@gmail.com>
---
 v2: Consolidate VNC macro's #ifdef'ery to one central point (tests/libqtest.c).

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


