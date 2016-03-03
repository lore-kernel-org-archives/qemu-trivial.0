Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abPpo-00063J-HA
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 04:46:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abPpm-0005z6-EU
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 04:46:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abPpl-0006Li-Lm
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 04:46:14 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:21863)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1abPpg-0006Et-Tl; Thu, 03 Mar 2016 04:46:09 -0500
Received: from 172.24.1.47 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.1.47])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DCN06150; Thu, 03 Mar 2016 17:45:58 +0800 (CST)
Received: from localhost (10.177.18.62) by SZXEML429-HUB.china.huawei.com
	(10.82.67.184) with Microsoft SMTP Server id 14.3.235.1; Thu, 3 Mar 2016
	17:43:53 +0800
From: Gonglei <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Mar 2016 17:43:43 +0800
Message-ID: <1456998223-12356-7-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 2.6.3.windows.1
In-Reply-To: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.18.62]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.56D807D7.015A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 1cccb3f39a264d9d17d4323b062d250f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH 6/6] smbus: fix memory leak
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
X-List-Received-Date: Thu, 03 Mar 2016 09:46:15 -0000

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/i2c/smbus_eeprom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
index 5b7bd89..83c6b27 100644
--- a/hw/i2c/smbus_eeprom.c
+++ b/hw/i2c/smbus_eeprom.c
@@ -156,4 +156,6 @@ void smbus_eeprom_init(I2CBus *smbus, int nb_eeprom,
         qdev_prop_set_ptr(eeprom, "data", eeprom_buf + (i * 256));
         qdev_init_nofail(eeprom);
     }
+
+    g_free(eeprom_buf);
 }
-- 
1.8.5.2



