Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UNF2Q-0005rq-Vv
	for mharc-qemu-trivial@gnu.org; Wed, 03 Apr 2013 00:11:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNF2M-0005lB-HT
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 00:11:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNF2J-0007pw-TH
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 00:11:02 -0400
Received: from mail-pb0-f42.google.com ([209.85.160.42]:35284)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNF2J-0007pf-Dc
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 00:10:59 -0400
Received: by mail-pb0-f42.google.com with SMTP id up7so613431pbc.29
	for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2013 21:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=r21Zv1bNl5FV9+hhtQcQP1Zu2VcGL4scDl/5h3upWio=;
	b=CED7PPbrl+QiCqZ5BIW3SyZykuT+WQZMzMqG4qx3YCJoejGDPveI/BBa/Kf3J6EkPU
	P4kgpMWrbiUU57Ws5p4djQ98qN5TgEfUOKuwAgioD8WM3OJ2yipTdTZ+OOXXdt7RcZuj
	NclceyPaKpHCcTtEYycEom6hDiEMkrUIy97gJZyMlXyCkt7bCuIN8jT0O0OH1UCEJTnC
	Noat8Ll80AfN73FlKRjwJdSKzP0oz4h1wWHuDOSc/tlJBlqe4ZMvnqWxLJ6OkI5vgVNL
	R52L434F+YnME2WTST+Lr6MArNGM2toqp/f1vj/GvKebbmp8SAfNInPHmWrE6Ptt6pLp
	hUIA==
X-Received: by 10.66.241.71 with SMTP id wg7mr794283pac.155.1364962258815;
	Tue, 02 Apr 2013 21:10:58 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id ux10sm5100290pab.1.2013.04.02.21.10.56
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 21:10:57 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Wed,  3 Apr 2013 14:09:17 +1000
Message-Id: <74e6ed5ed66174c668342f8e1ed9875192834a94.1364961975.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
References: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
References: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQmgEyuQCBsumd1ENcBRZIR3MLkHnG0Ygvy1WaFtJHfozeY4FjgfVJ+ZlaFM+iKpzzni78WW
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.160.42
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v1 2/4] m25p80: Convert guest errors to
	LOG_GUEST_ERROR
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
X-List-Received-Date: Wed, 03 Apr 2013 04:11:06 -0000

Some of the debug printfs in m25p80 are really guest errors.
Changed over to qemu_log_mask(LOG_GUEST_ERROR accordingly.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/m25p80.c |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/m25p80.c b/hw/m25p80.c
index 34b476b..1f7fb28 100644
--- a/hw/m25p80.c
+++ b/hw/m25p80.c
@@ -319,11 +319,12 @@ static void flash_erase(Flash *s, int offset, FlashCMD cmd)
 
     DB_PRINT("offset = %#x, len = %d\n", offset, len);
     if ((s->pi->flags & capa_to_assert) != capa_to_assert) {
-        hw_error("m25p80: %dk erase size not supported by device\n", len);
-    }
+        qemu_log_mask(LOG_GUEST_ERROR, "M25P80: %dk erase size not supported by"
+                      " device\n", len);
+    };
 
     if (!s->write_enable) {
-        DB_PRINT("erase with write protect!\n");
+        qemu_log_mask(LOG_GUEST_ERROR, "M25P80: erase with write protect!\n");
         return;
     }
     memset(s->storage + offset, 0xff, len);
@@ -345,7 +346,7 @@ void flash_write8(Flash *s, uint64_t addr, uint8_t data)
     uint8_t prev = s->storage[s->cur_addr];
 
     if (!s->write_enable) {
-        DB_PRINT("write with write protect!\n");
+        qemu_log_mask(LOG_GUEST_ERROR, "M25P80: write with write protect!\n");
     }
 
     if ((prev ^ data) & data) {
@@ -503,13 +504,14 @@ static void decode_new_cmd(Flash *s, uint32_t value)
             DB_PRINT("chip erase\n");
             flash_erase(s, 0, BULK_ERASE);
         } else {
-            DB_PRINT("chip erase with write protect!\n");
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: chip erase with write "
+                          "protect!\n");
         }
         break;
     case NOP:
         break;
     default:
-        DB_PRINT("Unknown cmd %x\n", value);
+        qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
         break;
     }
 }
-- 
1.7.0.4


