Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bnPRU-0002w3-DZ
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2016 08:19:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bnPRP-0002s3-FS
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 08:18:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bnPRO-0002Bk-IK
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 08:18:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38798)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bnPRE-00020i-HE; Fri, 23 Sep 2016 08:18:44 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3A417F7C0;
	Fri, 23 Sep 2016 12:18:39 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8NCIbcM007836; Fri, 23 Sep 2016 08:18:38 -0400
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 23 Sep 2016 14:18:37 +0200
Message-Id: <1474633117-5227-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 23 Sep 2016 12:18:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add some ARM related files to
 the corresponding sections
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
X-List-Received-Date: Fri, 23 Sep 2016 12:18:59 -0000

The file hw/misc/arm_integrator_debug.c seems to belong to Integrator
CP, and hw/cpu/realview_mpcore.c and hw/misc/arm_sysctl.c seem to
belong to Real View.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3879e1c..15bbd06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -405,6 +405,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/integratorcp.c
+F: hw/misc/arm_integrator_debug.c
 
 Musicpal
 M: Jan Kiszka <jan.kiszka@web.de>
@@ -429,7 +430,9 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/realview*
+F: hw/cpu/realview_mpcore.c
 F: hw/intc/realview_gic.c
+F: hw/misc/arm_sysctl.c
 F: include/hw/intc/realview_gic.h
 
 PXA2XX
-- 
1.8.3.1


