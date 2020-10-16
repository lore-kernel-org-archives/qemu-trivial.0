Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTUSl-0008Uz-1y
	for mharc-qemu-trivial@gnu.org; Fri, 16 Oct 2020 14:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTUSi-0008RF-Ea; Fri, 16 Oct 2020 14:28:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57652
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTUSg-0000HV-Pt; Fri, 16 Oct 2020 14:28:20 -0400
Received: from host86-148-246-80.range86-148.btcentralplus.com
 ([86.148.246.80] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTUSd-0003wP-TC; Fri, 16 Oct 2020 19:28:20 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, f4bug@amsat.org,
 hpoussin@reactos.org, qemu-ppc@nongnu.org, atar4qemu@gmail.com,
 david@gibson.dropbear.id.au
Date: Fri, 16 Oct 2020 19:27:39 +0100
Message-Id: <20201016182739.22875-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201016182739.22875-1-mark.cave-ayland@ilande.co.uk>
References: <20201016182739.22875-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.246.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 5/5] m48t59: remove legacy m48t59_init() function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Oct 2020 18:28:21 -0000

Now that all of the callers of this function have been switched to use qdev
properties, this legacy init function can now be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/rtc/m48t59.c         | 35 -----------------------------------
 include/hw/rtc/m48t59.h |  4 ----
 2 files changed, 39 deletions(-)

diff --git a/hw/rtc/m48t59.c b/hw/rtc/m48t59.c
index 6525206976..d54929e861 100644
--- a/hw/rtc/m48t59.c
+++ b/hw/rtc/m48t59.c
@@ -564,41 +564,6 @@ const MemoryRegionOps m48t59_io_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
-/* Initialisation routine */
-Nvram *m48t59_init(qemu_irq IRQ, hwaddr mem_base,
-                   uint32_t io_base, uint16_t size, int base_year,
-                   int model)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(m48txx_sysbus_info); i++) {
-        if (m48txx_sysbus_info[i].size != size ||
-            m48txx_sysbus_info[i].model != model) {
-            continue;
-        }
-
-        dev = qdev_new(m48txx_sysbus_info[i].bus_name);
-        qdev_prop_set_int32(dev, "base-year", base_year);
-        s = SYS_BUS_DEVICE(dev);
-        sysbus_realize_and_unref(s, &error_fatal);
-        sysbus_connect_irq(s, 0, IRQ);
-        if (io_base != 0) {
-            memory_region_add_subregion(get_system_io(), io_base,
-                                        sysbus_mmio_get_region(s, 1));
-        }
-        if (mem_base != 0) {
-            sysbus_mmio_map(s, 0, mem_base);
-        }
-
-        return NVRAM(s);
-    }
-
-    assert(false);
-    return NULL;
-}
-
 void m48t59_realize_common(M48t59State *s, Error **errp)
 {
     s->buffer = g_malloc0(s->size);
diff --git a/include/hw/rtc/m48t59.h b/include/hw/rtc/m48t59.h
index 9defe578d1..d9b45eb161 100644
--- a/include/hw/rtc/m48t59.h
+++ b/include/hw/rtc/m48t59.h
@@ -47,8 +47,4 @@ struct NvramClass {
     void (*toggle_lock)(Nvram *obj, int lock);
 };
 
-Nvram *m48t59_init(qemu_irq IRQ, hwaddr mem_base,
-                   uint32_t io_base, uint16_t size, int base_year,
-                   int type);
-
 #endif /* HW_M48T59_H */
-- 
2.20.1


