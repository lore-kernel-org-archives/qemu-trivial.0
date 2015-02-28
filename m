Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YReKX-0003kY-4G
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 05:09:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YReKV-0003iI-6Y
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 05:09:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YReKR-0008I1-5A
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 05:09:03 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:62141)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YReKQ-0008Hm-AF; Sat, 28 Feb 2015 05:08:59 -0500
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BCK85111; Sat, 28 Feb 2015 18:08:53 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 28 Feb 2015 18:08:46 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 28 Feb 2015 18:08:44 +0800
Message-ID: <1425118124-11888-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.54F193B6.0041, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: bcd4d1ddcf5ee819813f49645489f42d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, mjt@tls.msk.ru
Subject: [Qemu-trivial] [PATCH v2] e500: fix memory leak
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
X-List-Received-Date: Sat, 28 Feb 2015 10:09:04 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
v2: fix compilation complaint. (mjt)
---
 hw/ppc/e500.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 7e17d18..c060b50 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -309,8 +309,10 @@ static int ppce500_load_device_tree(MachineState *machine,
 
         fdt = load_device_tree(filename, &fdt_size);
         if (!fdt) {
+            g_free(filename);
             goto out;
         }
+        g_free(filename);
         goto done;
     }
 
-- 
1.7.12.4



