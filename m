Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1r3d-0001QZ-Ef
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 04:38:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c1r3b-0001P3-01
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 04:38:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c1r3a-0003Vv-8J
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 04:38:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46218)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1c1r3U-0003T1-2o; Wed, 02 Nov 2016 04:37:56 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 547923DE3E;
	Wed,  2 Nov 2016 08:37:55 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-29.ams2.redhat.com [10.36.116.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uA28bqTt016362; Wed, 2 Nov 2016 04:37:53 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-trivial@nongnu.org
Date: Wed,  2 Nov 2016 09:37:52 +0100
Message-Id: <1478075872-11344-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 02 Nov 2016 08:37:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] sparc: Add slavio_misc.c and eccmemctl.c to
 the MAINTAINERS file
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
X-List-Received-Date: Wed, 02 Nov 2016 08:38:03 -0000

Both files seem to belong to the Sun4m machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b0712a8..79484ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -710,6 +710,8 @@ S: Maintained
 F: hw/sparc/sun4m.c
 F: hw/dma/sparc32_dma.c
 F: hw/dma/sun4m_iommu.c
+F: hw/misc/eccmemctl.c
+F: hw/misc/slavio_misc.c
 F: include/hw/sparc/sparc32_dma.h
 F: include/hw/sparc/sun4m.h
 F: pc-bios/openbios-sparc32
-- 
1.8.3.1


