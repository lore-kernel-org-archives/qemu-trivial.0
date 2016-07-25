Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bRWn0-0003Ey-HR
	for mharc-qemu-trivial@gnu.org; Sun, 24 Jul 2016 23:42:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bRWmx-0003CP-R3
	for qemu-trivial@nongnu.org; Sun, 24 Jul 2016 23:42:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bRWmv-0007y0-Uv
	for qemu-trivial@nongnu.org; Sun, 24 Jul 2016 23:42:42 -0400
Received: from [59.151.112.132] (port=14112 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1bRWmo-0007vB-Mb; Sun, 24 Jul 2016 23:42:36 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9032221"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jul 2016 11:42:33 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 75CBE4295F9A;
	Mon, 25 Jul 2016 11:42:30 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Mon, 25 Jul 2016 11:42:33 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
To: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman <dmitry@daynix.com>,
	qemu devel <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>
Date: Mon, 25 Jul 2016 11:48:00 +0800
Message-ID: <1469418480-18574-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 75CBE4295F9A.AA13B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] hw/net/e1000: Fix compiler warning
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
X-List-Received-Date: Mon, 25 Jul 2016 03:42:44 -0000

slave:~/.xie/qemu-colo # gcc --version
gcc (SUSE Linux) 4.3.4 [gcc-4_3-branch revision 152973]

slave:~/.xie/qemu-colo # make -j8
CC    hw/net/e1000e_core.o
hw/net/e1000e_core.c:56: warning: ‘e1000e_set_interrupt_cause’ declared inline after being called
hw/net/e1000e_core.c:56: warning: previous declaration of ‘e1000e_set_interrupt_cause’ was here
LINK  x86_64-softmmu/qemu-system-x86_64

Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
 hw/net/e1000e_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index badb1fe..e0bd31c 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -52,7 +52,7 @@
                                      second according to spec 10.2.4.2 */
 #define E1000E_MAX_TX_FRAGS (64)
 
-static void
+static inline void
 e1000e_set_interrupt_cause(E1000ECore *core, uint32_t val);
 
 static inline void
-- 
1.9.3




