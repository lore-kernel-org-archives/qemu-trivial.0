Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VxYVk-0007ke-8b
	for mharc-qemu-trivial@gnu.org; Mon, 30 Dec 2013 03:47:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1VxYVZ-0007YG-RQ
	for qemu-trivial@nongnu.org; Mon, 30 Dec 2013 03:47:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1VxYVR-00066t-5R
	for qemu-trivial@nongnu.org; Mon, 30 Dec 2013 03:47:33 -0500
Received: from mail-pb0-x22c.google.com ([2607:f8b0:400e:c01::22c]:42145)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>)
	id 1VxYV9-0005x0-Nt; Mon, 30 Dec 2013 03:47:07 -0500
Received: by mail-pb0-f44.google.com with SMTP id rq2so11411064pbb.3
	for <multiple recipients>; Mon, 30 Dec 2013 00:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1tG7Ox6/m730qGCxIjWXbqdBQExsmdXsmKG3nLRZeD0=;
	b=ofHNiB6AvbdZwEvQSP3pG5Ltd9jXE4P4gS6SfhknVpVyaid3lcnyECWzdf2Hpu9MTs
	3pLe6P4zjKYQldD+0rBfC9aYieI4P+xDGXLg3dJ4slp3nNELUbzOz3T/ovC8tLlDw2Lv
	7G7F/FmNbt9Z7rOvdJ4LxYtsQGXvAdyiPb779htkOxdEIHu0cMlCk6e6zsUjL/msVH7b
	MTlzVlxhWTLs92QqNo+i4qX4lMFgrnElVYfcxC+aotlwDuyBpgZ7QkbRCTgmifMD1JzQ
	mp7bokK+VJ1KnQNWS4iK97aTwkpCbGp1HSvt/73IRM+B92sf6KPYth4nfON6Ovp5v8zb
	IhFQ==
X-Received: by 10.68.189.197 with SMTP id gk5mr66902524pbc.37.1388393225924;
	Mon, 30 Dec 2013 00:47:05 -0800 (PST)
Received: from localhost.localdomain ([221.122.32.18])
	by mx.google.com with ESMTPSA id
	er3sm79810366pbb.40.2013.12.30.00.47.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Dec 2013 00:47:04 -0800 (PST)
From: Kewei Yu <keweihk@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 30 Dec 2013 16:46:55 +0800
Message-Id: <1388393215-27511-1-git-send-email-keweihk@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22c
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: [Qemu-trivial] [PATCH 1/1] qtest:Fix the bug about disabling vnc
	causes "make check" hang
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
X-List-Received-Date: Mon, 30 Dec 2013 08:47:42 -0000

When we disabling vnc from "./configure", the qemu can't use the vnc option.
So qtest can't use the "vnc -none ", otherwise "make check" will hang.

Signed-off-by: Kewei Yu <keweihk@gmail.com>
---
 tests/fdc-test.c |    4 ++++
 tests/ide-test.c |   11 ++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/tests/fdc-test.c b/tests/fdc-test.c
index 38b5b17..80dbdfb 100644
--- a/tests/fdc-test.c
+++ b/tests/fdc-test.c
@@ -538,7 +538,11 @@ int main(int argc, char **argv)
     /* Run the tests */
     g_test_init(&argc, &argv, NULL);
 
+#ifdef CONFIG_VNC
     cmdline = g_strdup_printf("-vnc none ");
+#else
+    cmdline = NULL;
+#endif
 
     qtest_start(cmdline);
     qtest_irq_intercept_in(global_qtest, "ioapic");
diff --git a/tests/ide-test.c b/tests/ide-test.c
index d5cec5a..da9e8dd 100644
--- a/tests/ide-test.c
+++ b/tests/ide-test.c
@@ -377,10 +377,15 @@ static void test_bmdma_no_busmaster(void)
     assert_bit_clear(inb(IDE_BASE + reg_status), DF | ERR);
 }
 
+#ifdef CONFIG_VNC
+#define QTEST_VNC_PARAM    "-vnc none ";
+#else
+#define QTEST_VNC_PARAM
+#endif
 static void test_bmdma_setup(void)
 {
     ide_test_start(
-        "-vnc none "
+        QTEST_VNC_PARAM
         "-drive file=%s,if=ide,serial=%s,cache=writeback "
         "-global ide-hd.ver=%s",
         tmp_path, "testdisk", "version");
@@ -410,7 +415,7 @@ static void test_identify(void)
     int ret;
 
     ide_test_start(
-        "-vnc none "
+        QTEST_VNC_PARAM
         "-drive file=%s,if=ide,serial=%s,cache=writeback "
         "-global ide-hd.ver=%s",
         tmp_path, "testdisk", "version");
@@ -455,7 +460,7 @@ static void test_flush(void)
     uint8_t data;
 
     ide_test_start(
-        "-vnc none "
+        QTEST_VNC_PARAM
         "-drive file=blkdebug::%s,if=ide,cache=writeback",
         tmp_path);
 
-- 
1.7.1


