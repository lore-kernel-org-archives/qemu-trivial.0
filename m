Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNon-00035l-OF
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:40:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNog-00031M-Ix
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:40:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNob-0005TK-LV
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:40:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51879)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNoN-0005QT-4z; Mon, 05 May 2014 14:40:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 089C040757;
	Mon,  5 May 2014 22:40:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E029F6B3;
	Mon,  5 May 2014 22:02:07 +0400 (MSK)
Received: (nullmailer pid 24230 invoked by uid 1000);
	Mon, 05 May 2014 18:02:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:01:49 +0400
Message-Id: <1399312923-24129-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 08/22] hw/s390x: Add missing 'static' attribute
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
X-List-Received-Date: Mon, 05 May 2014 18:40:48 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


