Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xokdw-0008Sz-Ex
	for mharc-qemu-trivial@gnu.org; Wed, 12 Nov 2014 22:00:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xokdo-0008I2-RG
	for qemu-trivial@nongnu.org; Wed, 12 Nov 2014 22:00:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xokdj-0002XE-Sm
	for qemu-trivial@nongnu.org; Wed, 12 Nov 2014 22:00:12 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:59347)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XokdZ-0002HP-Ia; Wed, 12 Nov 2014 21:59:58 -0500
Received: from 172.24.2.119 (EHLO szxeml457-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CEI99585; Thu, 13 Nov 2014 10:59:49 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml457-hub.china.huawei.com
	(10.82.67.200) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 13 Nov 2014 10:59:40 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 13 Nov 2014 10:59:36 +0800
Message-ID: <1415847577-5820-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1415847577-5820-1-git-send-email-arei.gonglei@huawei.com>
References: <1415847577-5820-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, peter.huangpeng@huawei.com,
	mst@redhat.com
Subject: [Qemu-trivial] [PATCH 1/2] acpi-build: adjust indention 8 -> 4
	spaces
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
X-List-Received-Date: Thu, 13 Nov 2014 03:00:19 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/i386/acpi-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4003b6b..4ab44bf 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -272,12 +272,12 @@ build_header(GArray *linker, GArray *table_data,
 
 static inline GArray *build_alloc_array(void)
 {
-        return g_array_new(false, true /* clear */, 1);
+    return g_array_new(false, true /* clear */, 1);
 }
 
 static inline void build_free_array(GArray *array)
 {
-        g_array_free(array, true);
+    g_array_free(array, true);
 }
 
 static inline void build_prepend_byte(GArray *array, uint8_t val)
-- 
1.7.12.4



