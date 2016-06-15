Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bDDTt-00067A-8g
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jun 2016 12:15:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bDDTq-00065M-Lg
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:15:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bDDTl-0003vk-VO
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:15:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36623)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bDDTb-0003ru-7J; Wed, 15 Jun 2016 12:15:35 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4F4C63303;
	Wed, 15 Jun 2016 16:15:34 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5FGElUs011275; Wed, 15 Jun 2016 12:15:33 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Date: Wed, 15 Jun 2016 18:14:35 +0200
Message-Id: <1466007277-17525-6-git-send-email-lvivier@redhat.com>
In-Reply-To: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
References: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 15 Jun 2016 16:15:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 5/7] fw_cfg: remove useless casts
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
X-List-Received-Date: Wed, 15 Jun 2016 16:15:51 -0000

This patch is the result of coccinelle script
scripts/coccinelle/typecast.cocci

CC: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/nvram/fw_cfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 74a0079..9d84129 100644
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
2.5.5


