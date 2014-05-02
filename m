Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgKEx-0005jo-OH
	for mharc-qemu-trivial@gnu.org; Fri, 02 May 2014 16:39:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgKEr-0005Yu-EA
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:39:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgKEm-0003kE-7x
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:39:21 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:47124)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgKEm-0003k6-22
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:39:16 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 092421800ED; Fri,  2 May 2014 22:39:13 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri,  2 May 2014 22:39:12 +0200
Message-Id: <1399063152-3359-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] hw/s390x: Add missing 'static' attribute
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
X-List-Received-Date: Fri, 02 May 2014 20:39:26 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/s390x/event-facility.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
index 0777a93..2e9e62f 100644
--- a/hw/s390x/event-facility.c
+++ b/hw/s390x/event-facility.c
@@ -32,7 +32,7 @@ struct SCLPEventFacility {
     unsigned int receive_mask;
 };
 
-SCLPEvent cpu_hotplug;
+static SCLPEvent cpu_hotplug;
 
 /* return true if any child has event pending set */
 static bool event_pending(SCLPEventFacility *ef)
-- 
1.7.10.4


