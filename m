Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQTVk-0006Dl-6J
	for mharc-qemu-trivial@gnu.org; Tue, 24 Feb 2015 23:23:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVb-0005oK-6k
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVW-0006XY-DN
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:39 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:11234)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YQTVK-0006Q3-JX; Tue, 24 Feb 2015 23:23:23 -0500
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BCH13691; Wed, 25 Feb 2015 12:23:15 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 25 Feb 2015 12:23:08 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 25 Feb 2015 12:22:29 +0800
Message-ID: <1424838157-5524-4-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
References: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.54ED4E36.00A7, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: da3e2ab0692a8b9d3c71dd3f6f1775e6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH v2 03/11] pl330.c: remove superfluous '\n'
	around error_setg
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
X-List-Received-Date: Wed, 25 Feb 2015 04:23:40 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 hw/dma/pl330.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 16cf77e..5be3df5 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -1566,7 +1566,7 @@ static void pl330_realize(DeviceState *dev, Error **errp)
         s->cfg[1] |= 5;
         break;
     default:
-        error_setg(errp, "Bad value for i-cache_len property: %" PRIx8 "\n",
+        error_setg(errp, "Bad value for i-cache_len property: %" PRIx8,
                    s->i_cache_len);
         return;
     }
@@ -1601,7 +1601,7 @@ static void pl330_realize(DeviceState *dev, Error **errp)
         s->cfg[CFG_CRD] |= 0x4;
         break;
     default:
-        error_setg(errp, "Bad value for data_width property: %" PRIx8 "\n",
+        error_setg(errp, "Bad value for data_width property: %" PRIx8,
                    s->data_width);
         return;
     }
-- 
1.7.12.4



