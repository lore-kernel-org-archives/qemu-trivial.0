Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bnT22-00017S-Ef
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2016 12:08:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bnT20-000154-OQ
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 12:08:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bnT1z-0007th-QE
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 12:08:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1499)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bnT1s-0007nX-JP; Fri, 23 Sep 2016 12:08:48 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1AB29384B;
	Fri, 23 Sep 2016 16:08:48 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8NG8kbG017494; Fri, 23 Sep 2016 12:08:47 -0400
From: Thomas Huth <thuth@redhat.com>
To: Edgar E Iglesias <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri, 23 Sep 2016 18:08:46 +0200
Message-Id: <1474646926-30346-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 23 Sep 2016 16:08:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add header files to CRIS section
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
X-List-Received-Date: Fri, 23 Sep 2016 16:08:57 -0000

etraxfs_dma.h and etraxfs.h in include/hw/cris/ obviously belong
to the CRIS section in MAINTAINERS.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ea6f70..d8a0cfc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -117,6 +117,7 @@ M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 S: Maintained
 F: target-cris/
 F: hw/cris/
+F: include/hw/cris/
 F: tests/tcg/cris/
 F: disas/cris.c
 
-- 
1.8.3.1


