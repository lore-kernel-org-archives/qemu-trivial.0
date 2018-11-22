Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPqj1-0006bC-8l
	for mharc-qemu-trivial@gnu.org; Thu, 22 Nov 2018 10:17:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gPqiz-0006aL-Dh
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 10:17:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gPqis-00074J-Nw
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 10:17:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37946)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gPqdw-0000Bg-Ht; Thu, 22 Nov 2018 10:11:48 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB9CCCF37;
	Thu, 22 Nov 2018 15:11:46 +0000 (UTC)
Received: from thuth.com (ovpn-116-181.ams2.redhat.com [10.36.116.181])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55A7F5C21E;
	Thu, 22 Nov 2018 15:11:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Thu, 22 Nov 2018 16:11:40 +0100
Message-Id: <1542899500-23346-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 22 Nov 2018 15:11:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add nios2-related files to the
 Nios2 section
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
X-List-Received-Date: Thu, 22 Nov 2018 15:17:02 -0000

nios2_iic.c and the default-configs/nios2-softmmu.mak file are
currently "unmaintained" according to the get_maintainers.pl script.
Move them to the Nios2 section where they obviously belong to.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1291c07..33245b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -226,7 +226,9 @@ M: Marek Vasut <marex@denx.de>
 S: Maintained
 F: target/nios2/
 F: hw/nios2/
+F: hw/intc/nios2_iic.c
 F: disas/nios2.c
+F: default-configs/nios2-softmmu.mak
 
 OpenRISC
 M: Stafford Horne <shorne@gmail.com>
-- 
1.8.3.1


