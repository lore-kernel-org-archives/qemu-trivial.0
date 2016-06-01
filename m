Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b80IP-0005c1-63
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jun 2016 03:10:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1b80IM-0005Y8-Ho
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 03:10:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1b80IH-0006Kg-Eq
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 03:10:25 -0400
Received: from [59.151.112.132] (port=37255 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>)
	id 1b80I6-0006AH-Uf; Wed, 01 Jun 2016 03:10:11 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7194174"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Jun 2016 15:09:58 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 6C0BE41C0B83;
	Wed,  1 Jun 2016 15:09:52 +0800 (CST)
Received: from localhost.localdomain (10.167.226.50) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 1 Jun 2016 15:09:52 +0800
From: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-block@nongnu.org>, <qemu-trivial@nongnu.org>, <kwolf@redhat.com>,
	<mreitz@redhat.com>, Wei Jiangang <weijg.fnst@cn.fujitsu.com>
Date: Wed, 1 Jun 2016 15:08:21 +0800
Message-ID: <1464764901-8773-1-git-send-email-weijg.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.50]
X-yoursite-MailScanner-ID: 6C0BE41C0B83.AF473
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: weijg.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [Qemu-devel][PATCH] block/raw-posix: Fix
 error_report of mounting message
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
X-List-Received-Date: Wed, 01 Jun 2016 07:10:28 -0000

Use a single error_printf to replace triple error_report.

Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
---
 block/raw-posix.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/raw-posix.c b/block/raw-posix.c
index a4f5a1b..141b01a 100644
--- a/block/raw-posix.c
+++ b/block/raw-posix.c
@@ -2061,11 +2061,11 @@ static bool setup_cdrom(char *bsd_path, Error **errp)
 /* Prints directions on mounting and unmounting a device */
 static void print_unmounting_directions(const char *file_name)
 {
-    error_report("If device %s is mounted on the desktop, unmount"
-                 " it first before using it in QEMU", file_name);
-    error_report("Command to unmount device: diskutil unmountDisk %s",
-                 file_name);
-    error_report("Command to mount device: diskutil mountDisk %s", file_name);
+    error_printf("If device %s is mounted on the desktop, unmount"
+        " it first before using it in QEMU\n"
+        "Command to unmount device: diskutil unmountDisk %s\n"
+        "Command to mount device: diskutil mountDisk %s\n",
+        file_name, file_name, file_name);
 }
 
 #endif /* defined(__APPLE__) && defined(__MACH__) */
-- 
1.9.3




