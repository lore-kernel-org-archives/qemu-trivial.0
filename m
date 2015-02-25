Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQTVi-00068g-4l
	for mharc-qemu-trivial@gnu.org; Tue, 24 Feb 2015 23:23:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVW-0005bh-Uh
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVW-0006XJ-64
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:34 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:40085)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YQTVK-0006Qi-Cc; Tue, 24 Feb 2015 23:23:23 -0500
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHQ41238; Wed, 25 Feb 2015 12:23:20 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 25 Feb 2015 12:23:13 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 25 Feb 2015 12:22:36 +0800
Message-ID: <1424838157-5524-11-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
References: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH v2 10/11] arm/digic_boards: Remove
	superfluous '\n' around error_report()
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
X-List-Received-Date: Wed, 25 Feb 2015 04:23:36 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/digic_boards.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 2a4b872..7114c36 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -65,7 +65,7 @@ static void digic4_board_init(DigicBoard *board)
     s->digic = DIGIC(object_new(TYPE_DIGIC));
     object_property_set_bool(OBJECT(s->digic), true, "realized", &err);
     if (err != NULL) {
-        error_report("Couldn't realize DIGIC SoC: %s\n",
+        error_report("Couldn't realize DIGIC SoC: %s",
                      error_get_pretty(err));
         exit(1);
     }
@@ -104,13 +104,13 @@ static void digic_load_rom(DigicBoardState *s, hwaddr addr,
         char *fn = qemu_find_file(QEMU_FILE_TYPE_BIOS, filename);
 
         if (!fn) {
-            error_report("Couldn't find rom image '%s'.\n", filename);
+            error_report("Couldn't find rom image '%s'.", filename);
             exit(1);
         }
 
         rom_size = load_image_targphys(fn, addr, max_size);
         if (rom_size < 0 || rom_size > max_size) {
-            error_report("Couldn't load rom image '%s'.\n", filename);
+            error_report("Couldn't load rom image '%s'.", filename);
             exit(1);
         }
     }
-- 
1.7.12.4



