Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Thwcm-0004eT-HS
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 01:13:56 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1Thwci-0004dL-LN
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 01:13:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1Thwcg-0001pc-4F
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 01:13:52 -0500
Received: from furnace.wzff.de ([176.9.216.40]:58176)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>)
	id 1Thwcf-0001lB-Te; Mon, 10 Dec 2012 01:13:50 -0500
Received: from xdsl-188-155-204-150.adslplus.ch ([188.155.204.150]
	helo=[10.1.1.4])
	by furnace.wzff.de with esmtpsa (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	(Exim 4.80.1 (FreeBSD)) (envelope-from <maillist-qemu@barfooze.de>)
	id 1ThwcP-000JhX-Ha; Mon, 10 Dec 2012 07:13:35 +0100
Message-ID: <50C57DA4.6070405@barfooze.de>
Date: Mon, 10 Dec 2012 07:13:56 +0100
From: John Spencer <maillist-qemu@barfooze.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110221 SUSE/3.1.8 Mail/1.0
MIME-Version: 1.0
To: qemu-trivial@nongnu.org
Content-Type: multipart/mixed; boundary="------------060501080608020800040706"
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 176.9.216.40
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
X-List-Received-Date: Mon, 10 Dec 2012 06:13:55 -0000

This is a multi-part message in MIME format.
--------------060501080608020800040706
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------060501080608020800040706
Content-Type: text/x-patch;
 name="0001-fix-implicit-declaration-of-syscall-in-linux-user-mm.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-fix-implicit-declaration-of-syscall-in-linux-user-mm.pa";
 filename*1="tch"

From f293c406dd2fe751244f2beef4782ccec65fd307 Mon Sep 17 00:00:00 2001
From: John Spencer <maillist-qemu@barfooze.de>
Date: Mon, 10 Dec 2012 06:49:57 +0100
Subject: [PATCH 1/4] fix implicit declaration of syscall() in linux-user/mmap.c

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


--------------060501080608020800040706--

