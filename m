Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abPpr-000681-6J
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 04:46:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abPpo-00062s-BV
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 04:46:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abPpn-0006MM-K4
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 04:46:16 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:13947)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1abPpg-0006Em-Fo; Thu, 03 Mar 2016 04:46:09 -0500
Received: from 172.24.1.48 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.1.48])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DFU06310; Thu, 03 Mar 2016 17:44:54 +0800 (CST)
Received: from localhost (10.177.18.62) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.235.1; Thu, 3 Mar 2016
	17:43:53 +0800
From: Gonglei <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Mar 2016 17:43:38 +0800
Message-ID: <1456998223-12356-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 2.6.3.windows.1
In-Reply-To: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.18.62]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.56D807D6.0169, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 15fca7963ce1defc081cf523ebc16a49
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH 1/6] egl-helpers: fix possible resource leak
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
X-List-Received-Date: Thu, 03 Mar 2016 09:46:17 -0000

CID 1352419, using g_strdup_printf instead of asprintf.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 ui/egl-helpers.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index 54be44c..2da1930 100644
--- a/ui/egl-helpers.c
+++ b/ui/egl-helpers.c
@@ -50,18 +50,15 @@ int qemu_egl_rendernode_open(void)
             continue;
         }
 
-        r = asprintf(&p, "/dev/dri/%s", e->d_name);
-        if (r < 0) {
-            return -1;
-        }
+        p = g_strdup_printf("/dev/dri/%s", e->d_name);
 
         r = open(p, O_RDWR | O_CLOEXEC | O_NOCTTY | O_NONBLOCK);
         if (r < 0) {
-            free(p);
+            g_free(p);
             continue;
         }
         fd = r;
-        free(p);
+        g_free(p);
         break;
     }
 
-- 
1.8.5.2



