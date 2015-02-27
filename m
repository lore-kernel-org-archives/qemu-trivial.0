Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRFhQ-0002mH-Nc
	for mharc-qemu-trivial@gnu.org; Fri, 27 Feb 2015 02:51:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFhH-0002QF-U8
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:51:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFhC-0007WB-6z
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:50:55 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:38302)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YRFhB-0007Vp-DU; Fri, 27 Feb 2015 02:50:50 -0500
Received: from 172.24.2.119 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHS92363; Fri, 27 Feb 2015 15:50:42 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 27 Feb 2015 15:50:32 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 27 Feb 2015 15:50:19 +0800
Message-ID: <1425023419-12244-10-git-send-email-arei.gonglei@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 9/9] microblaze: fix memory leak
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
X-List-Received-Date: Fri, 27 Feb 2015 07:51:02 -0000

From: Gonglei <arei.gonglei@huawei.com>

When not assign a -dtb argument, the variable dtb_filename
storage returned from qemu_find_file(), which should be freed
after using.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/microblaze/boot.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index a2843cd..4c1e3a9 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -205,5 +205,7 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
                             kernel_cmdline,
                             dtb_filename);
     }
-
+    if (!dtb_arg) {
+        g_free(dtb_filename);
+    }
 }
-- 
1.7.12.4



