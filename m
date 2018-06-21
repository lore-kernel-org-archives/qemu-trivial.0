Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW39R-00054W-SJ
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 13:13:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39P-00052F-QZ
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39O-0002GJ-KB
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:39 -0400
Received: from mail-qk0-x236.google.com ([2607:f8b0:400d:c09::236]:38581)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39M-0002Ef-DG; Thu, 21 Jun 2018 13:13:36 -0400
Received: by mail-qk0-x236.google.com with SMTP id y4-v6so2171231qka.5;
	Thu, 21 Jun 2018 10:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/frgxobt9nSy6nD3uYgdNdqiXXOrz9xz5e63ZrBsHRw=;
	b=aD8Z85rdQ1Ux0qSyvzfZS1I2wvta8NRj0QBpLODYQZ+zA+45FhUGbvlTZe2O/w+VBw
	tlU07NUnLa9rlYR+QlVM1vQP/AXfqaRL7M3ZHsg9rSv19V8Ju5KVpxoD15JvHnwS1X9w
	TGobr5vjdldrdtUPC//WHWUyGkBn8HNFFjFqA0QmMexbWlnOKUS2amoLYjghT0OOKUtD
	xAHrbxktQ9dYIFoVFfiwrJRTGdJeCw/bs+B0uGMaQlTOre61DozT2uvNn+E8koTxQMHI
	qHuZqR9Mybdd4EnI9RIHvwrBqu6zCur6oT27NL2TjR7mxYRhopcSGtXq5yFo+AoH7xZ/
	voEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=/frgxobt9nSy6nD3uYgdNdqiXXOrz9xz5e63ZrBsHRw=;
	b=gHlWwUKtdfbUPi6DrmOfEYkFmXFU5nsiYHO6Mu4PpL9lprkx8qUpHePGM/3MPggfvY
	O6+/W5dMqkG8DNkzM0x9Z5EYR5gkSOfgEsAHoxaqLdwHKVl5DboWxyomwkE8PdczJvoT
	3g9eKjVw3jYoBDPGphRbBr2cWXa/EEjFWOfgVp+Jpxms13XvbGdm95sENc/68Z5NkL3w
	R/ZlRX6IOymTn/XxEGAvUZv/1HWI/b8nbogXixXqMF/BXYY3ErHKIsm0zIj6O8kuGANa
	fE3gSJzfZ0DgM9m5+e6Vez6Ph/kEexeXBJ0X9R7k1XCjTF6K/Hqfc1PpvUR07fN5hxvo
	v6hg==
X-Gm-Message-State: APt69E2I5KiXHdVTXDmY+N2h1zpBJvhH14kZlD1z9obhmZbTP3f3tfWn
	I9MuyRj/ZxR1P5bpS3iHtC0=
X-Google-Smtp-Source: ADUXVKKT6dJzUBcTMVMtAWcC6zdNrruZuOrR1bRxVQFVIOThybJbz9iXH2tXTecAYSek/adRkCEivw==
X-Received: by 2002:a37:350a:: with SMTP id
	c10-v6mr21748877qka.388.1529601215582; 
	Thu, 21 Jun 2018 10:13:35 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	t14-v6sm3166159qtp.65.2018.06.21.10.13.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 10:13:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org (open list:Floppy)
Date: Thu, 21 Jun 2018 14:12:56 -0300
Message-Id: <20180621171257.14897-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621171257.14897-1-f4bug@amsat.org>
References: <20180621171257.14897-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::236
Subject: [Qemu-trivial] [PATCH 10/11] hw/block/fdc: Convert from
 FLOPPY_DPRINTF() macro to trace events
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
X-List-Received-Date: Thu, 21 Jun 2018 17:13:40 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/fdc.c        | 6 +++---
 hw/block/trace-events | 4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index cd29e27d8f..c7b4fe9b3e 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -40,6 +40,7 @@
 #include "sysemu/blockdev.h"
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
+#include "trace.h"
 
 /********************************************************/
 /* debug Floppy devices */
@@ -934,7 +935,7 @@ static uint32_t fdctrl_read (void *opaque, uint32_t reg)
         retval = (uint32_t)(-1);
         break;
     }
-    FLOPPY_DPRINTF("read reg%d: 0x%02x\n", reg & 7, retval);
+    trace_fdc_ioport_read(reg, retval);
 
     return retval;
 }
@@ -943,9 +944,8 @@ static void fdctrl_write (void *opaque, uint32_t reg, uint32_t value)
 {
     FDCtrl *fdctrl = opaque;
 
-    FLOPPY_DPRINTF("write reg%d: 0x%02x\n", reg & 7, value);
-
     reg &= 7;
+    trace_fdc_ioport_write(reg, value);
     switch (reg) {
     case FD_REG_DOR:
         fdctrl_write_dor(fdctrl, value);
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 6b9e733412..d842c45409 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -1,5 +1,9 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
+# hw/block/fdc.c
+fdc_ioport_read(uint8_t reg, uint8_t value) "read reg 0x%02x val 0x%02x"
+fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02x"
+
 # hw/block/virtio-blk.c
 virtio_blk_req_complete(void *vdev, void *req, int status) "vdev %p req %p status %d"
 virtio_blk_rw_complete(void *vdev, void *req, int ret) "vdev %p req %p ret %d"
-- 
2.18.0.rc2


