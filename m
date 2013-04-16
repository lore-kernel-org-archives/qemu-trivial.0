Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1URtsJ-0001uh-II
	for mharc-qemu-trivial@gnu.org; Mon, 15 Apr 2013 20:35:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1URtsG-0001sT-Jy
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 20:35:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1URtsD-0002yR-1h
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 20:35:52 -0400
Received: from mail-da0-x22b.google.com ([2607:f8b0:400e:c00::22b]:33032)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1URtsC-0002yC-LO
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 20:35:48 -0400
Received: by mail-da0-f43.google.com with SMTP id u36so2323402dak.16
	for <qemu-trivial@nongnu.org>; Mon, 15 Apr 2013 17:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=ixTZb9xHco8AVKOdb5hYb98ub/QoJjs6tpXUSkB0pQ8=;
	b=PYwhhHB6miMerVHFWYG3ILBtMqpqMlxpLzsS8m+FUiVI4a4a7yc03ahAr6HvrQ0Nbi
	u+/SToeJGG6Ms7XhdBpmX6MU3WNm8KG1Ti6dnIXWKlFyl6abmK5P6fpKfbPCxhSn9s64
	dwAg9jpuHEwOxR2D6jtQAZSWmH+g/HyHoc21Wy07TqfgP9m8d2cL87LhW1TLSkLWUMo2
	u/rLJz5RNhM6OYMAdNUh/t4O7YDOJvypr9v4+0KbobD+eNHkbF9qpt4q3fULJP2kAgz7
	jBDR2OUEFW9vZYn9hHNxSyilcRWuSxkvuBSPc84WSUcO8eZsaX2ksL5vl7tPE5Csv8K9
	TKyQ==
X-Received: by 10.66.150.35 with SMTP id uf3mr684631pab.34.1366072547699;
	Mon, 15 Apr 2013 17:35:47 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id ya4sm22176212pbb.24.2013.04.15.17.35.45
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 17:35:46 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: peter.crosthwaite@xilinx.com
To: qemu-devel@nongnu.org
Date: Tue, 16 Apr 2013 10:33:32 +1000
Message-Id: <1b7a4e4c6a0c132a02b3207455826265677e713b.1366071713.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1366071713.git.peter.crosthwaite@xilinx.com>
References: <cover.1366071713.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQnDy5tiX3kTSfGL4epIhO7lYUb7380Jrs+XpMKfvWm4rumpm+jv0wKT0Eab6BcU/KAvLog9
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c00::22b
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com
Subject: [Qemu-trivial] [PATCH v3 2/4] m25p80: Convert guest errors to
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
X-List-Received-Date: Tue, 16 Apr 2013 00:35:54 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Some of the debug printfs in m25p80 are really guest errors.
Changed over to qemu_log_mask(LOG_GUEST_ERROR accordingly.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/block/m25p80.c |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index a524bde..9a24a31 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
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


