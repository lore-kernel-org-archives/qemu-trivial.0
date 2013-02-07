Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3YPx-0007ts-UM
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2013 15:50:01 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jlarrew@linux.vnet.ibm.com>) id 1U3YPl-0007VZ-4d
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2013 15:49:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jlarrew@linux.vnet.ibm.com>) id 1U3YPe-0006TP-KV
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2013 15:49:48 -0500
Received: from e7.ny.us.ibm.com ([32.97.182.137]:50625)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jlarrew@linux.vnet.ibm.com>) id 1U3YPe-0006RT-FK
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2013 15:49:42 -0500
Received: from /spool/local
	by e7.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <jlarrew@linux.vnet.ibm.com>;
	Thu, 7 Feb 2013 15:49:40 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
	by e7.ny.us.ibm.com (192.168.1.107) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 7 Feb 2013 15:49:38 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 9AA8938C801B;
	Thu,  7 Feb 2013 15:49:37 -0500 (EST)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r17KnaMt257424; Thu, 7 Feb 2013 15:49:37 -0500
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r17KnXjL014240; Thu, 7 Feb 2013 13:49:33 -0700
Received: from jlarrew.austin.ibm.com (jlarrew.austin.ibm.com [9.41.149.99])
	by d03av04.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r17KnWEj014183; Thu, 7 Feb 2013 13:49:33 -0700
From: Jesse Larrew <jlarrew@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Thu,  7 Feb 2013 14:49:26 -0600
Message-Id: <1360270167-15385-2-git-send-email-jlarrew@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1360270167-15385-1-git-send-email-jlarrew@linux.vnet.ibm.com>
References: <1360270167-15385-1-git-send-email-jlarrew@linux.vnet.ibm.com>
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13020720-5806-0000-0000-00001F535BD5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.182.137
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com,
	Jesse Larrew <jlarrew@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 1/2] hw/virtio-net: use existing macros to
	implement endof
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
X-List-Received-Date: Thu, 07 Feb 2013 20:49:59 -0000

Clarify the definition of endof() by using the offsetof() and sizeof()
macros to handle the pointer magic.

Signed-off-by: Jesse Larrew <jlarrew@linux.vnet.ibm.com>
---
 hw/virtio-net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio-net.c b/hw/virtio-net.c
index 8f521b3..663f33c 100644
--- a/hw/virtio-net.c
+++ b/hw/virtio-net.c
@@ -81,7 +81,7 @@ typedef struct VirtIONet
  * 'container'.
  */
 #define endof(container, field) \
-    ((intptr_t)(&(((container *)0)->field)+1))
+    (offsetof(container, field) + sizeof(((container *)0)->field))
 
 typedef struct VirtIOFeature {
     uint32_t flags;
-- 
1.7.11.7


