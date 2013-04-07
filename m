Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UOiZK-0004c8-78
	for mharc-qemu-trivial@gnu.org; Sun, 07 Apr 2013 01:55:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiZD-0004Nk-NA
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:55:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiZB-0001F6-CL
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:55:03 -0400
Received: from mail-pd0-f178.google.com ([209.85.192.178]:57635)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiZA-0001ES-PD
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:55:01 -0400
Received: by mail-pd0-f178.google.com with SMTP id w11so2651754pde.9
	for <qemu-trivial@nongnu.org>; Sat, 06 Apr 2013 22:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=nDzs4nKzRXni+yuyjpf/K5fkixoP2n4DvwYLhs94PaM=;
	b=LSnxh0esVvCBQPTPgv3OsGaJHkTdfcsDrQC+wfapNTU1S713P+zYTXtf+TGX2u13EQ
	6wB+mronSY8YOWAiUDcoJhJp7BzkOGa4FbQC49EpCwLWBrfgxSJrKQRieM00TEYzJu7o
	n+P4hkQmLtJ2KIaR6ycYPJWyGVzJB/UYagxcnH4x0F4CGDpoXcx9/hGpFyLycBej85km
	JCU6ma8Zux/88coWBKIGQ2quIjbhI9YH1xMpNUKC7WSXcsTK7wIgakK9KiTtKA2THanq
	j8IldwdRLUSdPuXFkxmEYJLtOMTDDOWEFbn5ykxwU82Rf/mRH6m4rnQKx9C2A+37GMnp
	E7tA==
X-Received: by 10.66.52.76 with SMTP id r12mr25737023pao.217.1365314099875;
	Sat, 06 Apr 2013 22:54:59 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id pa2sm25357666pac.9.2013.04.06.22.54.57
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Sat, 06 Apr 2013 22:54:59 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Sun,  7 Apr 2013 15:53:31 +1000
Message-Id: <a529715d1059b142a28ec277720da9e1f1fb32fd.1365313801.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
References: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
References: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQlUQrjnxpeJXote6yEXIOX70Rja3iR0HFioVtKcaS/j6AmgozTEsrhvMrpDZwzW03IYxPgW
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.192.178
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v2 2/4] m25p80: Convert guest errors to
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
X-List-Received-Date: Sun, 07 Apr 2013 05:55:09 -0000

Some of the debug printfs in m25p80 are really guest errors.
Changed over to qemu_log_mask(LOG_GUEST_ERROR accordingly.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/m25p80.c |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/m25p80.c b/hw/m25p80.c
index c395e98..44fc428 100644
--- a/hw/m25p80.c
+++ b/hw/m25p80.c
@@ -319,11 +319,12 @@ static void flash_erase(Flash *s, int offset, FlashCMD cmd)
 
     DB_PRINT("offset = %#x, len = %d\n", offset, len);
     if ((s->pi->flags & capa_to_assert) != capa_to_assert) {
-        hw_error("m25p80: %d erase size not supported by device\n", len);
+        qemu_log_mask(LOG_GUEST_ERROR, "M25P80: %d erase size not supported by"
+                      " device\n", len);
     }
 
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


