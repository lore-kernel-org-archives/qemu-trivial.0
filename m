Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7D4z-00064i-Gy
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 21:32:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Z7D4x-00064c-Fs
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 21:32:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Z7D4t-0000Nx-De
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 21:32:47 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:12542)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Z7D4s-0000J6-RZ
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 21:32:43 -0400
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BIA96562; Tue, 23 Jun 2015 09:32:31 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 23 Jun 2015 09:32:22 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Tue, 23 Jun 2015 09:31:51 +0800
Message-ID: <1435023111-8780-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.5588B730.0064, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 402e5d2c9794376882b4effaf7277ba5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: jiri@resnulli.us, sfeldma@gmail.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] rocker: Fix memory leak reported by coverity
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
X-List-Received-Date: Tue, 23 Jun 2015 01:32:48 -0000

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 hw/net/rocker/rocker.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 4d25842..d06116e 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -103,6 +103,7 @@ RockerSwitch *qmp_query_rocker(const char *name, Error **errp)
     if (!r) {
         error_set(errp, ERROR_CLASS_GENERIC_ERROR,
                   "rocker %s not found", name);
+        g_free(rocker);
         return NULL;
     }
 
-- 
1.7.12.4



