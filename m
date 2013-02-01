Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U1KBj-0000c6-6S
	for mharc-qemu-trivial@gnu.org; Fri, 01 Feb 2013 12:14:07 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1U1KBg-0000aO-Rh
	for qemu-trivial@nongnu.org; Fri, 01 Feb 2013 12:14:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1U1KBZ-0008EU-KB
	for qemu-trivial@nongnu.org; Fri, 01 Feb 2013 12:14:04 -0500
Received: from mel.act-europe.fr ([194.98.77.210]:47115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1U1KBY-0008B5-PJ
	for qemu-trivial@nongnu.org; Fri, 01 Feb 2013 12:13:57 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 90A382900C6;
	Fri,  1 Feb 2013 18:14:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at eu.adacore.com
Received: from mel.act-europe.fr ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aAJy0zJ2QxUT; Fri,  1 Feb 2013 18:14:05 +0100 (CET)
Received: from PomPomGalli.act-europe.fr (pompomgalli.act-europe.fr
	[10.10.1.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mel.act-europe.fr (Postfix) with ESMTP id 637A22900B1;
	Fri,  1 Feb 2013 18:14:05 +0100 (CET)
From: Fabien Chouteau <chouteau@adacore.com>
To: qemu-trivial@nongnu.org
Date: Fri,  1 Feb 2013 18:13:51 +0100
Message-Id: <1359738831-7232-1-git-send-email-chouteau@adacore.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 194.98.77.210
Cc: kwolf@redhat.com, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH] get_tmp_filename: add explicit error message
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
X-List-Received-Date: Fri, 01 Feb 2013 17:14:05 -0000


Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
---
 block.c |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index ba67c0d..3bf8eda 100644
--- a/block.c
+++ b/block.c
@@ -428,9 +428,16 @@ int get_tmp_filename(char *filename, int size)
     /* GetTempFileName requires that its output buffer (4th param)
        have length MAX_PATH or greater.  */
     assert(size >= MAX_PATH);
-    return (GetTempPath(MAX_PATH, temp_dir)
-            && GetTempFileName(temp_dir, "qem", 0, filename)
-            ? 0 : -GetLastError());
+    if (GetTempPath(MAX_PATH, temp_dir) == 0) {
+        fprintf(stderr, "GetTempPath() error: %d\n", GetLastError());
+        return -GetLastError();
+    }
+    if (GetTempFileName(temp_dir, "qem", 0, filename) == 0) {
+        fprintf(stderr, "GetTempFileName(%s) error: %d\n", temp_dir,
+                GetLastError());
+        return -GetLastError();
+    }
+    return 0;
 #else
     int fd;
     const char *tmpdir;
-- 
1.7.9.5


