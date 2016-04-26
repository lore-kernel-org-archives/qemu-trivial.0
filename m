Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1av35R-0005jB-JR
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2016 09:31:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>) id 1aurm4-0002LT-2k
	for qemu-trivial@nongnu.org; Mon, 25 Apr 2016 21:26:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>) id 1aurm3-0003g8-Cn
	for qemu-trivial@nongnu.org; Mon, 25 Apr 2016 21:26:48 -0400
Received: from [59.151.112.132] (port=62161 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>)
	id 1aurly-0003cN-Qg; Mon, 25 Apr 2016 21:26:43 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5948396"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Apr 2016 09:26:33 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 07EE6408D262;
	Tue, 26 Apr 2016 09:26:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.45) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 26 Apr 2016 09:26:27 +0800
From: Zhou Jie <zhoujie2011@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <jasowang@redhat.com>, <qemu-trivial@nongnu.org>, Zhou Jie
	<zhoujie2011@cn.fujitsu.com>
Date: Tue, 26 Apr 2016 09:26:01 +0800
Message-ID: <1461633961-31713-1-git-send-email-zhoujie2011@cn.fujitsu.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.45]
X-yoursite-MailScanner-ID: 07EE6408D262.A6D2B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhoujie2011@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Tue, 26 Apr 2016 09:31:31 -0400
Subject: [Qemu-trivial] [PATCH] net/tap: Allocating Large sized arrays to
 heap
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
X-List-Received-Date: Tue, 26 Apr 2016 01:26:49 -0000

net_init_tap has a huge stack usage of 8192 bytes approx.
Moving large arrays to heap to reduce stack usage.

Signed-off-by: Zhou Jie <zhoujie2011@cn.fujitsu.com>
---
 net/tap.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/tap.c b/net/tap.c
index 740e8a2..49817c7 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -769,8 +769,8 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
             return -1;
         }
     } else if (tap->has_fds) {
-        char *fds[MAX_TAP_QUEUES];
-        char *vhost_fds[MAX_TAP_QUEUES];
+        char **fds = g_new(char *, MAX_TAP_QUEUES);
+        char **vhost_fds = g_new(char *, MAX_TAP_QUEUES);
         int nfds, nvhosts;
 
         if (tap->has_ifname || tap->has_script || tap->has_downscript ||
@@ -818,6 +818,8 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
                 return -1;
             }
         }
+        g_free(fds);
+        g_free(vhost_fds);
     } else if (tap->has_helper) {
         if (tap->has_ifname || tap->has_script || tap->has_downscript ||
             tap->has_vnet_hdr || tap->has_queues || tap->has_vhostfds) {
-- 
2.5.5




