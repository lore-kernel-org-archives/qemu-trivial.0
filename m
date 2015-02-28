Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRdN5-0005N0-GD
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 04:07:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YRdN0-0005Aq-Gp
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:07:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YRdMq-0004UA-42
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:07:34 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:40040)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1YRdMp-0004OB-Bh; Sat, 28 Feb 2015 04:07:24 -0500
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BCK79701; Sat, 28 Feb 2015 17:07:14 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 28 Feb 2015 17:07:07 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Sat, 28 Feb 2015 17:05:23 +0800
Message-ID: <1425114327-12136-2-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1425114327-12136-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1425114327-12136-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.54F18542.0166, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: ddfdb0c958b004824d351b27791a94e4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, peter.huangpeng@huawei.com,
	eblake@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH RFC 1/5] serial-pci: Avoid
	qerror_report_err() outside QMP command handlers
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
X-List-Received-Date: Sat, 28 Feb 2015 09:07:38 -0000

qerror_report_err() is a transitional interface to help with
converting existing monitor commands to QMP.  It should not be used
elsewhere.  Replace by error_report_err() in serial_pci_init() and
multi_serial_pci_init().

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 hw/char/serial-pci.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index f05c9b4..2b0bf54 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -27,7 +27,6 @@
 
 #include "hw/char/serial.h"
 #include "hw/pci/pci.h"
-#include "qapi/qmp/qerror.h"
 
 #define PCI_SERIAL_MAX_PORTS 4
 
@@ -57,8 +56,7 @@ static int serial_pci_init(PCIDevice *dev)
     s->baudbase = 115200;
     serial_realize_core(s, &err);
     if (err != NULL) {
-        qerror_report_err(err);
-        error_free(err);
+        error_report_err(err);
         return -1;
     }
 
@@ -116,8 +114,7 @@ static int multi_serial_pci_init(PCIDevice *dev)
         s->baudbase = 115200;
         serial_realize_core(s, &err);
         if (err != NULL) {
-            qerror_report_err(err);
-            error_free(err);
+            error_report_err(err);
             return -1;
         }
         s->irq = pci->irqs[i];
-- 
1.7.12.4



