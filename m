Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRFhO-0002gW-8p
	for mharc-qemu-trivial@gnu.org; Fri, 27 Feb 2015 02:51:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFhI-0002SK-Qy
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:50:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFhD-0007Wf-8s
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:50:56 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:38303)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YRFhC-0007Vs-Gt; Fri, 27 Feb 2015 02:50:51 -0500
Received: from 172.24.2.119 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHS92362; Fri, 27 Feb 2015 15:50:41 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 27 Feb 2015 15:50:31 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 27 Feb 2015 15:50:18 +0800
Message-ID: <1425023419-12244-9-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: [Qemu-trivial] [PATCH 8/9] sysbus: fix memory leak
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
X-List-Received-Date: Fri, 27 Feb 2015 07:50:58 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/core/sysbus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 84af593..b53c351 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -91,6 +91,8 @@ bool sysbus_has_irq(SysBusDevice *dev, int n)
     ObjectProperty *r;
 
     r = object_property_find(OBJECT(dev), prop, NULL);
+    g_free(prop);
+
     return (r != NULL);
 }
 
-- 
1.7.12.4



