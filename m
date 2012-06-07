Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sckbj-00048l-KM
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jun 2012 17:51:07 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <harsh@linux.vnet.ibm.com>) id 1Sckbg-00042d-8o
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2012 17:51:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <harsh@linux.vnet.ibm.com>) id 1Sckbd-0008Bi-IV
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2012 17:51:03 -0400
Received: from e28smtp05.in.ibm.com ([122.248.162.5]:59493)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <harsh@linux.vnet.ibm.com>) id 1Sckbc-00085J-UZ
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2012 17:51:01 -0400
Received: from /spool/local
	by e28smtp05.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <harsh@linux.vnet.ibm.com>;
	Fri, 8 Jun 2012 03:20:52 +0530
Received: from d28relay01.in.ibm.com (9.184.220.58)
	by e28smtp05.in.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 8 Jun 2012 03:20:50 +0530
Received: from d28av02.in.ibm.com (d28av02.in.ibm.com [9.184.220.64])
	by d28relay01.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	q57LoniB6488426; Fri, 8 Jun 2012 03:20:49 +0530
Received: from d28av02.in.ibm.com (loopback [127.0.0.1])
	by d28av02.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	q583LRMT007618; Fri, 8 Jun 2012 13:21:27 +1000
Received: from harshbora.in.ibm.com ([9.77.121.234])
	by d28av02.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	q583LRIQ007597; Fri, 8 Jun 2012 13:21:27 +1000
From: Harsh Prateek Bora <harsh@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri,  8 Jun 2012 03:20:42 +0530
Message-Id: <1339105843-30064-2-git-send-email-harsh@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.10.2
In-Reply-To: <1339105843-30064-1-git-send-email-harsh@linux.vnet.ibm.com>
References: <1339105843-30064-1-git-send-email-harsh@linux.vnet.ibm.com>
x-cbid: 12060721-8256-0000-0000-000002D71E68
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.5
Cc: Harsh Prateek Bora <harsh@linux.vnet.ibm.com>, stefanha@linux.vnet.ibm.com,
	aneesh.kumar@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH 1/2] trace/simple.c: fix deprecated glib2
	interface
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
X-List-Received-Date: Thu, 07 Jun 2012 21:51:05 -0000


Signed-off-by: Harsh Prateek Bora <harsh@linux.vnet.ibm.com>
---
 trace/simple.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/trace/simple.c b/trace/simple.c
index 33ae486..b4a3c6e 100644
--- a/trace/simple.c
+++ b/trace/simple.c
@@ -161,8 +161,11 @@ static void trace(TraceEventID event, uint64_t x1, uint64_t x2, uint64_t x3,
     }
 
     timestamp = get_clock();
-
+#if GLIB_CHECK_VERSION(2, 30, 0)
+    idx = g_atomic_int_add((gint *)&trace_idx, 1) % TRACE_BUF_LEN;
+#else
     idx = g_atomic_int_exchange_and_add((gint *)&trace_idx, 1) % TRACE_BUF_LEN;
+#endif
     trace_buf[idx] = (TraceRecord){
         .event = event,
         .timestamp_ns = timestamp,
-- 
1.7.10.2


