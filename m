Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3YtR-00050e-WB
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2013 16:20:29 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jlarrew@linux.vnet.ibm.com>) id 1U3YtK-0004lz-DA
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2013 16:20:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jlarrew@linux.vnet.ibm.com>) id 1U3YtI-0004kK-Ko
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2013 16:20:22 -0500
Received: from e37.co.us.ibm.com ([32.97.110.158]:57387)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jlarrew@linux.vnet.ibm.com>) id 1U3YtI-0004ip-DZ
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2013 16:20:20 -0500
Received: from /spool/local
	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <jlarrew@linux.vnet.ibm.com>;
	Thu, 7 Feb 2013 13:50:07 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
	by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 7 Feb 2013 13:49:55 -0700
Received: from d03relay05.boulder.ibm.com (d03relay05.boulder.ibm.com
	[9.17.195.107])
	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id F180EC40003;
	Thu,  7 Feb 2013 13:49:51 -0700 (MST)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay05.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r17KnbC7105818; Thu, 7 Feb 2013 13:49:39 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r17KnXiq014268; Thu, 7 Feb 2013 13:49:33 -0700
Received: from jlarrew.austin.ibm.com (jlarrew.austin.ibm.com [9.41.149.99])
	by d03av04.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r17KnWEk014183; Thu, 7 Feb 2013 13:49:33 -0700
From: Jesse Larrew <jlarrew@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Thu,  7 Feb 2013 14:49:27 -0600
Message-Id: <1360270167-15385-3-git-send-email-jlarrew@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1360270167-15385-1-git-send-email-jlarrew@linux.vnet.ibm.com>
References: <1360270167-15385-1-git-send-email-jlarrew@linux.vnet.ibm.com>
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13020720-7408-0000-0000-00000C9CB521
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.158
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com,
	Jesse Larrew <jlarrew@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 2/2] hw/virtio-net: fix config_size data type
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
X-List-Received-Date: Thu, 07 Feb 2013 21:20:28 -0000

Since the new config_size member of struct VirtIONet specifies a size, it
should be declared as size_t.

Signed-off-by: Jesse Larrew <jlarrew@linux.vnet.ibm.com>
---
 hw/virtio-net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio-net.c b/hw/virtio-net.c
index 663f33c..573c669 100644
--- a/hw/virtio-net.c
+++ b/hw/virtio-net.c
@@ -73,7 +73,7 @@ typedef struct VirtIONet
     int multiqueue;
     uint16_t max_queues;
     uint16_t curr_queues;
-    int config_size;
+    size_t config_size;
 } VirtIONet;
 
 /*
-- 
1.7.11.7


