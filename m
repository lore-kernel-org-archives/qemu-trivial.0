Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTE0V-0002vG-Kr
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 13:26:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTE0S-0002nQ-Nr
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 13:26:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTE0R-00026d-UJ
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 13:26:52 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51229)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTE0A-00020g-1R; Wed, 04 Mar 2015 13:26:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DB199408D2;
	Wed,  4 Mar 2015 21:26:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 94FAC95E;
	Wed,  4 Mar 2015 20:07:09 +0300 (MSK)
Received: (nullmailer pid 17526 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:38 +0300
Message-Id: <c9b92d850c5e9c52b48dd22298716d75b16e2501.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 21/47] arm/digic_boards: Remove superfluous
	'\n' around error_report()
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
X-List-Received-Date: Wed, 04 Mar 2015 18:26:54 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


