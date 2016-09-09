Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1biTBx-0003Gn-UQ
	for mharc-qemu-trivial@gnu.org; Fri, 09 Sep 2016 17:18:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1biTBw-0003EK-GZ
	for qemu-trivial@nongnu.org; Fri, 09 Sep 2016 17:18:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1biTBu-00071M-O3
	for qemu-trivial@nongnu.org; Fri, 09 Sep 2016 17:18:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52796)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1biTBp-00070Q-7z; Fri, 09 Sep 2016 17:18:25 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF498C057FA6;
	Fri,  9 Sep 2016 21:18:24 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-63.ams2.redhat.com [10.36.116.63])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u89LIL1v001028; Fri, 9 Sep 2016 17:18:22 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
Date: Fri,  9 Sep 2016 23:18:21 +0200
Message-Id: <1473455901-27465-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 09 Sep 2016 21:18:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add include/hw/sh4/ to SH4
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
X-List-Received-Date: Fri, 09 Sep 2016 21:18:33 -0000

get_maintainer.pl now properly recognizes that the files in
include/hw/sh4/ belong to SH4.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dad82e7..ad70868 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -189,6 +189,7 @@ S: Odd Fixes
 F: target-sh4/
 F: hw/sh4/
 F: disas/sh4.c
+F: include/hw/sh4/
 
 SPARC
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
-- 
1.8.3.1


