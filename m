Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xcmpu-0006x0-Rn
	for mharc-qemu-trivial@gnu.org; Fri, 10 Oct 2014 22:55:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xcmpo-0006o1-ND
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 22:55:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xcmpj-0005Yl-Tu
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 22:55:08 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:52681)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XcmpY-0005T3-JY; Fri, 10 Oct 2014 22:54:53 -0400
Received: from 172.24.2.119 (EHLO szxeml409-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AVK52259; Sat, 11 Oct 2014 10:54:40 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml409-hub.china.huawei.com
	(10.82.67.136) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 11 Oct 2014 10:54:27 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 11 Oct 2014 10:54:08 +0800
Message-ID: <1412996048-6384-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.54389BF0.00D0, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 7c345069821d2f75e32bc2bf13b7bd18
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: kwolf@redhat.com, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	Gonglei <arei.gonglei@huawei.com>, stefanha@redhat.com, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] oslib-posix: change free to g_free
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
X-List-Received-Date: Sat, 11 Oct 2014 02:55:13 -0000

From: Gonglei <arei.gonglei@huawei.com>

The caller of qemu_vfree() maybe not check whether parameter
ptr pointer is NULL or not, such as vpc_open().
Using g_free() is more safe.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 util/oslib-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 016a047..ca435d0 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -153,7 +153,7 @@ void *qemu_anon_ram_alloc(size_t size)
 void qemu_vfree(void *ptr)
 {
     trace_qemu_vfree(ptr);
-    free(ptr);
+    g_free(ptr);
 }
 
 void qemu_anon_ram_free(void *ptr, size_t size)
-- 
1.7.12.4



