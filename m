Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ThweM-0006Hn-BX
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 01:15:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1ThweH-0006He-SK
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 01:15:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1ThweE-0002Kw-OL
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 01:15:29 -0500
Received: from furnace.wzff.de ([176.9.216.40]:58128)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>)
	id 1ThweE-0002Kq-IT; Mon, 10 Dec 2012 01:15:26 -0500
Received: from xdsl-188-155-204-150.adslplus.ch ([188.155.204.150]
	helo=[10.1.1.4])
	by furnace.wzff.de with esmtpsa (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	(Exim 4.80.1 (FreeBSD)) (envelope-from <maillist-qemu@barfooze.de>)
	id 1ThweC-000JkC-6W; Mon, 10 Dec 2012 07:15:25 +0100
Message-ID: <50C57E12.4070901@barfooze.de>
Date: Mon, 10 Dec 2012 07:15:46 +0100
From: John Spencer <maillist-qemu@barfooze.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110221 SUSE/3.1.8 Mail/1.0
MIME-Version: 1.0
To: qemu-trivial@nongnu.org
Content-Type: multipart/mixed; boundary="------------090103020104000607050109"
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 176.9.216.40
Cc: qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 3/4] fix implicit declaration of syscall() in
	linux-user/syscall.c
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
X-List-Received-Date: Mon, 10 Dec 2012 06:15:33 -0000

This is a multi-part message in MIME format.
--------------090103020104000607050109
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


--------------090103020104000607050109
Content-Type: text/x-patch;
 name="0003-fix-implicit-declaration-of-syscall-in-linux-user-sy.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0003-fix-implicit-declaration-of-syscall-in-linux-user-sy.pa";
 filename*1="tch"

From 5d410e6e92bbd3ab3a4fadec41a3d87cb9b0feea Mon Sep 17 00:00:00 2001
From: John Spencer <maillist-qemu@barfooze.de>
Date: Mon, 10 Dec 2012 06:58:48 +0100
Subject: [PATCH 3/4] fix implicit declaration of syscall() in linux-user/syscall.c

Signed-off-by: John Spencer <maillist-qemu@barfooze.de>

---
 linux-user/syscall.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 31d5276..fabbcd7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -39,6 +39,7 @@
 #include <sys/resource.h>
 #include <sys/mman.h>
 #include <sys/swap.h>
+#include <sys/syscall.h>
 #include <signal.h>
 #include <sched.h>
 #ifdef __ia64__
-- 
1.7.3.4


--------------090103020104000607050109--

