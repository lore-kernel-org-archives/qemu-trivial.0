Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRdN0-0005BF-NW
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 04:07:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YRdMr-0004pj-Ro
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:07:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YRdMn-0004T6-2a
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:07:25 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:7617)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1YRdMm-0004Sl-Ia; Sat, 28 Feb 2015 04:07:20 -0500
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHU78968; Sat, 28 Feb 2015 17:07:18 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 28 Feb 2015 17:07:10 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Sat, 28 Feb 2015 17:05:25 +0800
Message-ID: <1425114327-12136-4-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1425114327-12136-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1425114327-12136-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, peter.huangpeng@huawei.com,
	eblake@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH RFC 3/5] pci-hotplug-old: Avoid
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
X-List-Received-Date: Sat, 28 Feb 2015 09:07:33 -0000

qerror_report_err() is a transitional interface to help with
converting existing monitor commands to QMP. It should not be used
elsewhere.  Replace by error_report_err() in qemu_pci_hot_add_nic().

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 hw/pci/pci-hotplug-old.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/pci/pci-hotplug-old.c b/hw/pci/pci-hotplug-old.c
index beea6d2..477bafc 100644
--- a/hw/pci/pci-hotplug-old.c
+++ b/hw/pci/pci-hotplug-old.c
@@ -91,8 +91,7 @@ static PCIDevice *qemu_pci_hot_add_nic(Monitor *mon,
 
     ret = net_client_init(opts, 0, &local_err);
     if (local_err) {
-        qerror_report_err(local_err);
-        error_free(local_err);
+        error_report_err(local_err);
         return NULL;
     }
     if (nd_table[ret].devaddr) {
-- 
1.7.12.4



