Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RlLTQ-0004aK-GJ
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2012 09:17:48 -0500
Received: from eggs.gnu.org ([140.186.70.92]:41058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RlLTC-0003l1-QY
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 09:17:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RlLT2-00007z-L5
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 09:17:34 -0500
Received: from e06smtp14.uk.ibm.com ([195.75.94.110]:53081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RlLT2-00007Q-DS
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 09:17:24 -0500
Received: from /spool/local
	by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanha@linux.vnet.ibm.com>;
	Thu, 12 Jan 2012 14:17:21 -0000
Received: from d06nrmr1707.portsmouth.uk.ibm.com ([9.149.39.225])
	by e06smtp14.uk.ibm.com ([192.168.101.144]) with IBM ESMTP SMTP
	Gateway: Authorized Use Only! Violators will be prosecuted; 
	Thu, 12 Jan 2012 14:17:19 -0000
Received: from d06av08.portsmouth.uk.ibm.com (d06av08.portsmouth.uk.ibm.com
	[9.149.37.249])
	by d06nrmr1707.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id q0CEHIOI2719962; Thu, 12 Jan 2012 14:17:18 GMT
Received: from d06av08.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id q0CEHI1s011564; Thu, 12 Jan 2012 14:17:18 GMT
Received: from localhost (stefanha-thinkpad.manchester-maybrook.uk.ibm.com
	[9.174.219.31])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id q0CEHIgL011542; Thu, 12 Jan 2012 14:17:18 GMT
From: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 12 Jan 2012 14:17:04 +0000
Message-Id: <1326377824-23776-1-git-send-email-stefanha@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.7.3
x-cbid: 12011214-1948-0000-0000-0000009EE30F
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 195.75.94.110
Cc: qemu-trivial@nongnu.org, andrew.zaborowski@intel.com,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] bt-host: add missing break statement
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
X-List-Received-Date: Thu, 12 Jan 2012 14:17:41 -0000

The switch statement in bt_host_read() is missing a break in one case.
Andrzej Zaborowski <andrew.zaborowski@intel.com> confirmed that this is
not an intentional fall-through.

Signed-off-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
---
 bt-host.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/bt-host.c b/bt-host.c
index df5b7cd..0d3ad28 100644
--- a/bt-host.c
+++ b/bt-host.c
@@ -130,6 +130,7 @@ static void bt_host_read(void *opaque)
             pktlen = MIN(pkt[2] + 3, s->len);
             s->len -= pktlen;
             pkt += pktlen;
+            break;
 
         default:
         bad_pkt:
-- 
1.7.7.3


