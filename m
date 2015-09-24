Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfAfj-0004rW-4M
	for mharc-qemu-trivial@gnu.org; Thu, 24 Sep 2015 13:51:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZfAfg-0004gB-JX
	for qemu-trivial@nongnu.org; Thu, 24 Sep 2015 13:51:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZfAff-0004wY-TH
	for qemu-trivial@nongnu.org; Thu, 24 Sep 2015 13:51:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35424)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZfAfb-0004pa-Rh; Thu, 24 Sep 2015 13:50:59 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id D095BAE5B5;
	Thu, 24 Sep 2015 17:50:58 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-163.bos.redhat.com
	[10.18.17.163])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8OHov7V031301; Thu, 24 Sep 2015 13:50:58 -0400
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 24 Sep 2015 13:50:55 -0400
Message-Id: <1443117055-29240-1-git-send-email-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>, mjt@tls.msk.ru
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Small IDE/FDC touchup
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
X-List-Received-Date: Thu, 24 Sep 2015 17:51:05 -0000

libqos/ahci and tests/fdc-test are under my purview also,
include them in the appropriate stanzas.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf02890..7d97bd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -634,6 +634,7 @@ F: hw/block/cdrom.c
 F: hw/block/hd-geometry.c
 F: tests/ide-test.c
 F: tests/ahci-test.c
+F: tests/libqos/ahci*
 T: git git://github.com/jnsnow/qemu.git ide
 
 Floppy
@@ -642,6 +643,7 @@ L: qemu-block@nongnu.org
 S: Supported
 F: hw/block/fdc.c
 F: include/hw/block/fdc.h
+F: tests/fdc-test.c
 T: git git://github.com/jnsnow/qemu.git ide
 
 OMAP
-- 
2.4.3


