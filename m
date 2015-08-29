Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZVaaV-0005XJ-HG
	for mharc-qemu-trivial@gnu.org; Sat, 29 Aug 2015 03:30:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZVaaT-0005Tm-Jy
	for qemu-trivial@nongnu.org; Sat, 29 Aug 2015 03:30:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZVaaS-0002mR-Nt
	for qemu-trivial@nongnu.org; Sat, 29 Aug 2015 03:30:05 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:59171)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1ZVaaM-0002dH-Kj; Sat, 29 Aug 2015 03:29:58 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 07C2417F7E3; Sat, 29 Aug 2015 09:29:57 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: Riku Voipio <riku.voipio@iki.fi>
Date: Sat, 29 Aug 2015 09:29:52 +0200
Message-Id: <1440833392-5555-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] linux-user: Fix warnings caused by missing
	'static' attribute
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
X-List-Received-Date: Sat, 29 Aug 2015 07:30:06 -0000

Warnings from the Sparse static analysis tool:

linux-user/main.c:40:12: warning:
 symbol 'filename' was not declared. Should it be static?
linux-user/main.c:41:12: warning:
 symbol 'argv0' was not declared. Should it be static?
linux-user/main.c:42:5: warning:
 symbol 'gdbstub_port' was not declared. Should it be static?
linux-user/main.c:43:11: warning:
 symbol 'envlist' was not declared. Should it be static?

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 linux-user/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 2c9658e..b5eafef 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -37,10 +37,10 @@
 char *exec_path;
 
 int singlestep;
-const char *filename;
-const char *argv0;
-int gdbstub_port;
-envlist_t *envlist;
+static const char *filename;
+static const char *argv0;
+static int gdbstub_port;
+static envlist_t *envlist;
 static const char *cpu_model;
 unsigned long mmap_min_addr;
 unsigned long guest_base;
-- 
2.1.4


