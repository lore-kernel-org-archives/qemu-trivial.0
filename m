Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk5BY-0001e6-GD
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 04:04:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5BU-0001aA-7P
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:04:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5BS-00063C-BO
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:04:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39836)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk5BL-0005zY-GX; Wed, 14 Sep 2016 04:04:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C59F941848;
	Wed, 14 Sep 2016 11:04:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id B1E16AEA;
	Wed, 14 Sep 2016 10:58:58 +0300 (MSK)
Received: (nullmailer pid 17323 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:32 +0300
Message-Id: <c9bcc51712481b1d99858675bec3523c224bca24.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 06/27] MAINTAINERS: Add include/hw/sh4/ to SH4
 section
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
X-List-Received-Date: Wed, 14 Sep 2016 08:04:45 -0000

From: Thomas Huth <thuth@redhat.com>

get_maintainer.pl now properly recognizes that the files in
include/hw/sh4/ belong to SH4.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8f6e8a2..3d3098c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -187,6 +187,7 @@ S: Odd Fixes
 F: target-sh4/
 F: hw/sh4/
 F: disas/sh4.c
+F: include/hw/sh4/
 
 SPARC
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
-- 
2.1.4


