Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ThxMH-0000Uh-RU
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 02:00:57 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1ThxM8-0000H8-Mm
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 02:00:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1ThxM3-0005Po-FI
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 02:00:48 -0500
Received: from furnace.wzff.de ([2a01:4f8:150:63e2::9]:22418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>)
	id 1ThxM3-0005PR-5R; Mon, 10 Dec 2012 02:00:43 -0500
Received: from xdsl-188-155-204-150.adslplus.ch ([188.155.204.150]
	helo=localhost.localdomain)
	by furnace.wzff.de with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80.1 (FreeBSD)) (envelope-from <maillist-qemu@barfooze.de>)
	id 1ThxLt-000KiM-Vg; Mon, 10 Dec 2012 08:00:38 +0100
From: John Spencer <maillist-qemu@barfooze.de>
To: qemu-trivial@nongnu.org
Date: Mon, 10 Dec 2012 07:59:43 +0100
Message-Id: <1355122786-29243-1-git-send-email-maillist-qemu@barfooze.de>
X-Mailer: git-send-email 1.7.3.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:150:63e2::9
Cc: qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/4] fix implicit declaration of syscall() in
	linux-user/mmap.c
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
X-List-Received-Date: Mon, 10 Dec 2012 07:00:56 -0000

on glibc, this header is getting pulled in automatically via
another header, however on musl we need to include it explicitly.

linux-user/mmap.c:705:9: warning: implicit declaration of function 'syscall'
linux-user/mmap.c:705:9: warning: nested extern declaration of 'syscall'

Signed-off-by: John Spencer <maillist-qemu@barfooze.de>

---
 linux-user/mmap.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index b412e3f..171b449 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -25,6 +25,7 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/mman.h>
+#include <sys/syscall.h>
 #include <linux/mman.h>
 #include <linux/unistd.h>
 
-- 
1.7.3.4


