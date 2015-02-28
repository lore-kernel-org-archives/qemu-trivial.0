Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRdMz-00058c-FZ
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 04:07:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YRdMu-0004vs-9n
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:07:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YRdMq-0004U4-3k
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:07:28 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:40063)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1YRdMp-0004Sg-Bf; Sat, 28 Feb 2015 04:07:24 -0500
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BCK79705; Sat, 28 Feb 2015 17:07:18 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 28 Feb 2015 17:07:11 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Sat, 28 Feb 2015 17:05:26 +0800
Message-ID: <1425114327-12136-5-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1425114327-12136-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1425114327-12136-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.54F18546.0087, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 9421284df28b29d1ebed55367201e8f4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, peter.huangpeng@huawei.com,
	eblake@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH RFC 4/5] pci-assign: Avoid
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
X-List-Received-Date: Sat, 28 Feb 2015 09:07:32 -0000

qerror_report_err() is a transitional interface to help with
converting existing monitor commands to QMP.  It should not be used
elsewhere.  Replace by error_report_err() in assigned_initfn().

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 hw/i386/kvm/pci-assign.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c
index bd92c69..f2f4e07 100644
--- a/hw/i386/kvm/pci-assign.c
+++ b/hw/i386/kvm/pci-assign.c
@@ -1831,8 +1831,7 @@ out:
 
 exit_with_error:
     assert(local_err);
-    qerror_report_err(local_err);
-    error_free(local_err);
+    error_report_err(local_err);
     return -1;
 }
 
-- 
1.7.12.4



