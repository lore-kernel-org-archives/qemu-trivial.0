Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk5LA-0000u9-Kw
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 04:14:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5L8-0000r9-PA
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:14:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5L7-0000yv-Vd
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:14:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39069)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk5L1-0000vm-Gg; Wed, 14 Sep 2016 04:14:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F3E7441848;
	Wed, 14 Sep 2016 11:14:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 7BAB1B12;
	Wed, 14 Sep 2016 10:59:00 +0300 (MSK)
Received: (nullmailer pid 17358 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Laszlo Ersek <lersek@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:49 +0300
Message-Id: <b43ef89913ddf4df02ac2af04d99c2e4184dc37d.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 23/27] fw_cfg: remove useless casts
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2016 08:14:43 -0000

From: Laurent Vivier <lvivier@redhat.com>

This patch is the result of coccinelle script
scripts/coccinelle/typecast.cocci

CC: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/nvram/fw_cfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 6a68e59..1776b1b 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -180,7 +180,7 @@ static void fw_cfg_bootsplash(FWCfgState *s)
         temp = qemu_opt_get(opts, "splash-time");
         if (temp != NULL) {
             p = (char *)temp;
-            boot_splash_time = strtol(p, (char **)&p, 10);
+            boot_splash_time = strtol(p, &p, 10);
         }
     }
 
@@ -240,7 +240,7 @@ static void fw_cfg_reboot(FWCfgState *s)
         temp = qemu_opt_get(opts, "reboot-timeout");
         if (temp != NULL) {
             p = (char *)temp;
-            reboot_timeout = strtol(p, (char **)&p, 10);
+            reboot_timeout = strtol(p, &p, 10);
         }
     }
     /* validate the input */
-- 
2.1.4


