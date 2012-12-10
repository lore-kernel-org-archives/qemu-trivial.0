Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ThxME-0000NR-5V
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 02:00:54 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1ThxM9-0000H9-34
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 02:00:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1ThxM3-0005Pt-Fs
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 02:00:49 -0500
Received: from furnace.wzff.de ([2a01:4f8:150:63e2::9]:22421)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>)
	id 1ThxM3-0005PV-61; Mon, 10 Dec 2012 02:00:43 -0500
Received: from xdsl-188-155-204-150.adslplus.ch ([188.155.204.150]
	helo=localhost.localdomain)
	by furnace.wzff.de with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80.1 (FreeBSD)) (envelope-from <maillist-qemu@barfooze.de>)
	id 1ThxM0-000KiM-U2; Mon, 10 Dec 2012 08:00:42 +0100
From: John Spencer <maillist-qemu@barfooze.de>
To: qemu-trivial@nongnu.org
Date: Mon, 10 Dec 2012 07:59:45 +0100
Message-Id: <1355122786-29243-3-git-send-email-maillist-qemu@barfooze.de>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1355122786-29243-1-git-send-email-maillist-qemu@barfooze.de>
References: <1355122786-29243-1-git-send-email-maillist-qemu@barfooze.de>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:150:63e2::9
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
X-List-Received-Date: Mon, 10 Dec 2012 07:00:51 -0000

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


