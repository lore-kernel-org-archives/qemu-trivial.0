Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gw7sf-0000eN-7D
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 11:04:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stephen.checkoway@oberlin.edu>) id 1gw7TA-0001zj-JI
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 10:38:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stephen.checkoway@oberlin.edu>) id 1gw7T9-0007UL-Mj
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 10:38:04 -0500
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142]:33881)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stephen.checkoway@oberlin.edu>)
	id 1gw7T9-0007OM-I9
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 10:38:03 -0500
Received: by mail-it1-x142.google.com with SMTP id d125so3266119ith.1
	for <qemu-trivial@nongnu.org>; Tue, 19 Feb 2019 07:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oberlin-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=jZJNTbP6ggfah6uqNjEd5io+ikIWTiX9E6n0SDI7Eu0=;
	b=ZIJkNVKTJTZsOAc3X9xcCRWQqifsXg+ImaGpnnc0t16LZjiX4VyHg3hX61j/nn0rcC
	4fwZ9xJzcJUzrwNF/8SDmBN2DKEhhI2bB1ckUtrhC9U6MUKdp6CzPMmMRoi2qDLJFTfS
	Y9NCEHyOs3jeP+lIDLc+ZctUf2UzDKKT239BovX239ghIb3tYTEEVeQLmE+lJnBE5Vx8
	7VwflQjYDRDNTzmxm5JAGdJ40qEtnOwcfHHqym/QhcO8zOYl/XGouQ0cP2lPoq8jU6Ba
	pKS8eDO7ZafVI4fMi/COtpoxUQRBtZriYbppbjMbF3HTz1Xgee42MrwyNBxUi09FlrG7
	jPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jZJNTbP6ggfah6uqNjEd5io+ikIWTiX9E6n0SDI7Eu0=;
	b=pKGg5xhdf9ki67KAy6p6qGqyofhkvGO4L8o2NEQxkOGH+FanN3R+7ensLW84ZC2zko
	Cbp9I0ZjweBxUTxA6gFjFhOpusGOTbbuLkhj1gg1rpDABSOr7kNfAsJBAzl3Iizy4SVI
	F1xQsUpemltx2UB8t40CPWOF4nB0vzEo1VFpOhXJnpqcz4I5j8TOsPIDsuXD7tVYpewI
	/Icwn9/+27hQRKlnDyOV/5V10MbKJZiJPx0Mzbgh8wekAoiuse4zbdYE3jsdrLs1OCJZ
	Any5cJOI+YMuBWKmWaeUGoCW8jjlB8VCQ8Wco9GknmV7OsPe2RkNkZmCV0WeL+YRzXDk
	32oQ==
X-Gm-Message-State: AHQUAuatbXbLgrOuLZpRlOBf+gafEsj7GqhnRr/nivjhZI2IvYatPAMU
	Fn8l+4P/m7fsHGBDe5SZYlEpjQ==
X-Google-Smtp-Source: AHgI3IYnCSOK1WVoXuvRFRb3D8oay9tcut8FIvPZmhyU0VP+hpQMvbnUsEJLa+5Nu11wvVVSFsqIlw==
X-Received: by 2002:a6b:2c6:: with SMTP id 189mr16233033ioc.205.1550590653895; 
	Tue, 19 Feb 2019 07:37:33 -0800 (PST)
Received: from worksec.oberlin.net (ip-210-181.oberlin.net. [208.66.210.181])
	by smtp.gmail.com with ESMTPSA id
	i14sm1457817itc.34.2019.02.19.07.37.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Feb 2019 07:37:33 -0800 (PST)
From: Stephen Checkoway <stephen.checkoway@oberlin.edu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:Block layer core)
Date: Tue, 19 Feb 2019 10:37:27 -0500
Message-Id: <20190219153727.62279-1-stephen.checkoway@oberlin.edu>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::142
X-Mailman-Approved-At: Tue, 19 Feb 2019 11:04:24 -0500
Subject: [Qemu-trivial] [PATCH] block/pflash_cfi02: Fix memory leak and
 potential use-after-free
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
X-List-Received-Date: Tue, 19 Feb 2019 15:38:05 -0000

Don't dynamically allocate the pflash's timer. But do use timer_del in
an unrealize function to make sure that the timer can't fire after the
pflash_t has been freed.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
---
 hw/block/pflash_cfi02.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 0f8b7b8c7b..1588aeff5a 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -84,7 +84,7 @@ struct pflash_t {
     uint16_t unlock_addr0;
     uint16_t unlock_addr1;
     uint8_t cfi_table[0x52];
-    QEMUTimer *timer;
+    QEMUTimer timer;
     /* The device replicates the flash memory across its memory space.  Emulate
      * that by having a container (.mem) filled with an array of aliases
      * (.mem_mappings) pointing to the flash memory (.orig_mem).
@@ -429,7 +429,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
             }
             pfl->status = 0x00;
             /* Let's wait 5 seconds before chip erase is done */
-            timer_mod(pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+            timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                       (NANOSECONDS_PER_SECOND * 5));
             break;
         case 0x30:
@@ -444,7 +444,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
             }
             pfl->status = 0x00;
             /* Let's wait 1/2 second before sector erase is done */
-            timer_mod(pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+            timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                       (NANOSECONDS_PER_SECOND / 2));
             break;
         default:
@@ -596,7 +596,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->rom_mode = 1;
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
 
-    pfl->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
+    timer_init_ns(&pfl->timer, QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
     pfl->wcycle = 0;
     pfl->cmd = 0;
     pfl->status = 0;
@@ -695,11 +695,18 @@ static Property pflash_cfi02_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void pflash_cfi02_unrealize(DeviceState *dev, Error **errp)
+{
+    pflash_t *pfl = CFI_PFLASH02(dev);
+    timer_del(&pfl->timer);
+}
+
 static void pflash_cfi02_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = pflash_cfi02_realize;
+    dc->unrealize = pflash_cfi02_unrealize;
     dc->props = pflash_cfi02_properties;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
-- 
2.17.2 (Apple Git-113)


