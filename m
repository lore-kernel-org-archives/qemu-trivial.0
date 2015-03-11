Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVbtm-0006Ip-36
	for mharc-qemu-trivial@gnu.org; Wed, 11 Mar 2015 04:21:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YVbtg-00068u-HE
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 04:21:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YVbtf-000731-Kr
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 04:21:44 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:59442)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YVbtZ-0006zE-Mu; Wed, 11 Mar 2015 04:21:38 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BCY69559; Wed, 11 Mar 2015 16:21:23 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 11 Mar 2015 16:21:12 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 11 Mar 2015 16:21:00 +0800
Message-ID: <1426062061-12128-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1426062061-12128-1-git-send-email-arei.gonglei@huawei.com>
References: <1426062061-12128-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.54FFFB04.0061, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 634ed64929df4903fa3bb8c1a9a8a366
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH 1/2] ui/console: fix OVERFLOW_BEFORE_WIDEN
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
X-List-Received-Date: Wed, 11 Mar 2015 08:21:48 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 ui/console.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 87af6b5..b15ca87 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1285,9 +1285,9 @@ DisplaySurface *qemu_create_displaysurface_guestmem(int width, int height,
         linesize = width * PIXMAN_FORMAT_BPP(format) / 8;
     }
 
-    size = linesize * height;
+    size = (hwaddr)linesize * height;
     data = cpu_physical_memory_map(addr, &size, 0);
-    if (size != linesize * height) {
+    if (size != (hwaddr)linesize * height) {
         cpu_physical_memory_unmap(data, size, 0, 0);
         return NULL;
     }
-- 
1.7.12.4



