Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpsDm-0007a1-Td
	for mharc-qemu-trivial@gnu.org; Fri, 30 Sep 2016 03:27:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bpsDl-0007ZE-BV
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 03:27:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bpsDk-0003JI-J7
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 03:27:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33530)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bpsDf-0003Ho-OM; Fri, 30 Sep 2016 03:26:55 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A849B6267F;
	Fri, 30 Sep 2016 07:26:54 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-62.ams2.redhat.com [10.36.116.62])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8U7QqhB004794; Fri, 30 Sep 2016 03:26:52 -0400
From: Thomas Huth <thuth@redhat.com>
To: Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>, qemu-devel@nongnu.org
Cc: Leon Alrae <leon.alrae@imgtec.com>, qemu-trivial@nongnu.org
Date: Fri, 30 Sep 2016 09:26:51 +0200
Message-Id: <1475220411-22873-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 30 Sep 2016 07:26:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add some more MIPS related files
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
X-List-Received-Date: Fri, 30 Sep 2016 07:27:02 -0000

The MIPS section is missing some related header files, and files
in the hw/misc/, hw/intc/ and hw/timer/ folders.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 977e96e..4e86539 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -151,6 +151,13 @@ M: Leon Alrae <leon.alrae@imgtec.com>
 S: Maintained
 F: target-mips/
 F: hw/mips/
+F: hw/misc/mips_*
+F: hw/intc/mips_gic.c
+F: hw/timer/mips_gictimer.c
+F: include/hw/mips/
+F: include/hw/misc/mips_*
+F: include/hw/intc/mips_gic.h
+F: include/hw/timer/mips_gictimer.h
 F: tests/tcg/mips/
 F: disas/mips.c
 
-- 
1.8.3.1


