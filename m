Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1r7j-0003h7-UT
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 04:42:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c1r7i-0003ff-3X
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 04:42:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c1r7h-0005Yd-Ev
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 04:42:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33886)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1c1r7c-0005WV-02; Wed, 02 Nov 2016 04:42:12 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26E1C81236;
	Wed,  2 Nov 2016 08:42:11 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-29.ams2.redhat.com [10.36.116.29])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uA28g97s016381; Wed, 2 Nov 2016 04:42:09 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org
Date: Wed,  2 Nov 2016 09:42:08 +0100
Message-Id: <1478076128-11661-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 02 Nov 2016 08:42:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] m68k: Add include/hw/m68k/ and disas/m68k.c
 to the MAINTAINERS file
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
X-List-Received-Date: Wed, 02 Nov 2016 08:42:18 -0000

The include/hw/m68k/ folder and disas/m68k.c obviously belong to
the m68k section in the MAINTAINERS file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 79484ed..5d45160 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -149,6 +149,8 @@ M: Laurent Vivier <laurent@vivier.eu>
 S: Maintained
 F: target-m68k/
 F: hw/m68k/
+F: include/hw/m68k/
+F: disas/m68k.c
 
 MicroBlaze
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
-- 
1.8.3.1


