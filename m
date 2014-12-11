Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8Qh-0003O8-0J
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:25:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8QZ-00039e-JH
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:25:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8QU-00069H-LV
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:25:27 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46964)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8QJ-00066V-Gb; Thu, 11 Dec 2014 13:25:11 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5295241D43;
	Thu, 11 Dec 2014 21:25:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 57BAF8C4;
	Thu, 11 Dec 2014 21:16:17 +0300 (MSK)
Received: (nullmailer pid 22993 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:16:07 +0300
Message-Id: <97c61fb78ad22bbedc34da2af1db2fd9aa1cbff9.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PULL 19/20] hpet: increase spelling precision
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
X-List-Received-Date: Thu, 11 Dec 2014 18:25:32 -0000

From: Stefan Hajnoczi <stefanha@redhat.com>

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/timer/hpet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index e160e8f..d8bc231 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -1,5 +1,5 @@
 /*
- *  High Precisition Event Timer emulation
+ *  High Precision Event Timer emulation
  *
  *  Copyright (c) 2007 Alexander Graf
  *  Copyright (c) 2008 IBM Corporation
-- 
2.1.3


