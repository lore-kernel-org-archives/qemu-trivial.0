Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWJtq-0003XX-E8
	for mharc-qemu-trivial@gnu.org; Thu, 01 Dec 2011 22:34:58 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhihuili@linux.vnet.ibm.com>) id 1RWJtn-0003Qw-11
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 22:34:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhihuili@linux.vnet.ibm.com>) id 1RWJtl-0004Th-8m
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 22:34:54 -0500
Received: from e23smtp05.au.ibm.com ([202.81.31.147]:56067)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhihuili@linux.vnet.ibm.com>) id 1RWJtk-0004TR-Op
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 22:34:53 -0500
Received: from /spool/local
	by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <zhihuili@linux.vnet.ibm.com>;
	Fri, 2 Dec 2011 03:32:26 +1000
Received: from d23relay03.au.ibm.com ([202.81.31.245])
	by e23smtp05.au.ibm.com ([202.81.31.211]) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 2 Dec 2011 03:32:20 +1000
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay03.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pB23YROQ5070858; Fri, 2 Dec 2011 14:34:30 +1100
Received: from d23av04.au.ibm.com (loopback [127.0.0.1])
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pB23YRrB001071; Fri, 2 Dec 2011 14:34:27 +1100
Received: from mm.cn.ibm.com (mm.cn.ibm.com [9.115.116.119] (may be forged))
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pB23YP0E000990; Fri, 2 Dec 2011 14:34:25 +1100
From: Li Zhi Hui <zhihuili@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Fri,  2 Dec 2011 11:34:23 +0800
Message-Id: <1322796863-3475-1-git-send-email-zhihuili@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.4.1
x-cbid: 11120117-1396-0000-0000-000000558675
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 202.81.31.147
Cc: qemu-trivial@nongnu.org, Li Zhi Hui <zhihuili@linux.vnet.ibm.com>,
	stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH] qemu-nbd.c : fix memory leak
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
X-List-Received-Date: Fri, 02 Dec 2011 03:34:56 -0000

Signed-off-by: Li Zhi Hui <zhihuili@linux.vnet.ibm.com>
---
 qemu-nbd.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index 291cba2..ab7fa6c 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -500,8 +500,10 @@ int main(int argc, char **argv)
         sharing_fds[0] = tcp_socket_incoming(bindto, port);
     }
 
-    if (sharing_fds[0] == -1)
+    if (sharing_fds[0] == -1) {
+        g_free(sharing_fds);
         return 1;
+    }
 
     if (device) {
         int ret;
-- 
1.7.4.1


