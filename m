Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk567-0005u8-Lv
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 03:59:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk564-0005oL-C6
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:59:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk562-0004bj-Jm
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:59:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38931)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk55y-0004WV-74; Wed, 14 Sep 2016 03:59:02 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 82E7C41846;
	Wed, 14 Sep 2016 10:58:58 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E227BAF1;
	Wed, 14 Sep 2016 10:58:57 +0300 (MSK)
Received: (nullmailer pid 17329 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:35 +0300
Message-Id: <220fb2842fea23e8c6d62f9243689c648bb62e5c.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 09/27] MAINTAINERS: Add some header files to
 the PC chipset section
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
X-List-Received-Date: Wed, 14 Sep 2016 07:59:09 -0000

From: Thomas Huth <thuth@redhat.com>

These header files obviously belong to the PC chipset (since
their names match the other .c files in this section).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 13dae75..2dcb58b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -719,6 +719,10 @@ F: hw/misc/pc-testdev.c
 F: hw/timer/hpet*
 F: hw/timer/i8254*
 F: hw/timer/mc146818rtc*
+F: include/hw/i2c/pm_smbus.h
+F: include/hw/timer/hpet.h
+F: include/hw/timer/i8254*
+F: include/hw/timer/mc146818rtc*
 
 Machine core
 M: Eduardo Habkost <ehabkost@redhat.com>
-- 
2.1.4


