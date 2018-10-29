Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gH7AJ-000248-TH
	for mharc-qemu-trivial@gnu.org; Mon, 29 Oct 2018 09:01:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gH7AE-0001xT-6C
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2018 09:01:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gH7AC-0004Kg-9S
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2018 09:01:02 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45281)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gH7A6-000435-Q7; Mon, 29 Oct 2018 09:00:54 -0400
Received: by mail-wr1-x441.google.com with SMTP id n5-v6so8551858wrw.12;
	Mon, 29 Oct 2018 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tNjrC/pGw0eGeVtNQBbofdQUL+4ecHNO0puGOj16MlE=;
	b=VFve2bOKv43G+Gx0SV0675H2ZVk/ISVvrB1SNi3R1KwvXVkSfuy0yGa+nt+61InHo8
	MQ6+kdt88nC9q17Nsvkta6s6CARbN+Pz2+heNjkd/Pf6mj+OAKvSuD7IvuO0Fwtn7rWD
	WMihwVvim5WZCs/nJPSBy1ypOt3u9i95Op96HhMXvf17lSMHyMu24s4DqkJ5eTo2BY+u
	+sHaIXWojSUrRs3ggZvr0Rhq12wpxLUdg7Wm7CZyH+RcGXia/frp28MiNusM7zKSUYrg
	9gjqNHnOeQev4SM20g+4KBxfT6lL1toUphGY1FQzwQ6/wmbMDYgLQ/x2ImSUlRbL8MEe
	oD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=tNjrC/pGw0eGeVtNQBbofdQUL+4ecHNO0puGOj16MlE=;
	b=r+t30/PuMX3exf8GSee7N+OXusXNo5o9uEWt4fRTlLrGLPzUhj/PmXd3L3OMaKTTkS
	WJtI9IMH2KwKvCuHln48Nm3s9X6yb32nFRp8RX83Ec+FaYub5thqsS82sq7PmMgRiaxb
	ivd5ID7DM3sEltAJYxrsWY0rhyfK6Asvb6NJOKB5+ed+1VD07hjmYq8byz90Hp9C+DZK
	hpv/hsbehAkf89FgqY6NfxYb1xZ3bOB1xBFKtkRl7xG44VJoFdtsg0YliiJQQepQr0nm
	vItS9VlYjwJH65nvJg24vsyixmqF2e3OaDf8kIbY3+TctI87aS0LMWmDb6ADW0iw8wD4
	JTrw==
X-Gm-Message-State: AGRZ1gJqFxy3k03AFfz2N9g/O4TNJvV2vZejpcAuyn2ELgTKOq1nXz8k
	7mqUMY62VR4//YJhLnhdaFo=
X-Google-Smtp-Source: AJdET5cpg+ROpHANoHVAxcxh6DA4eI1L0qt5Ct3ska8ySn8VM/esSqRsWThhrfVXz/T60j8vdbC7kg==
X-Received: by 2002:adf:f74f:: with SMTP id
	z15-v6mr14789928wrp.237.1540818039021; 
	Mon, 29 Oct 2018 06:00:39 -0700 (PDT)
Received: from x1.redhat.com ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	n7-v6sm7441142wrr.81.2018.10.29.06.00.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 06:00:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Walle <michael@walle.cc>, Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 29 Oct 2018 14:00:34 +0100
Message-Id: <20181029130034.26750-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-trivial] [PATCH v3] milkymist-minimac2: Use
 qemu_log_mask(GUEST_ERROR) instead of error_report
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
X-List-Received-Date: Mon, 29 Oct 2018 13:01:06 -0000

qemu_log_mask(GUEST_ERROR) is more appropriate:

  $ qemu -d help
  Log items (comma separated):
  guest_errors    log when the guest OS does something invalid (eg accessing a non-existent register)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael Walle <michael@walle.cc>
---
v3: Fixed format string (Peter Maydell)

 hw/net/milkymist-minimac2.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
index 7ef1daee41..85c9fc0b65 100644
--- a/hw/net/milkymist-minimac2.c
+++ b/hw/net/milkymist-minimac2.c
@@ -30,6 +30,7 @@
 #include "hw/sysbus.h"
 #include "trace.h"
 #include "net/net.h"
+#include "qemu/log.h"
 #include "qemu/error-report.h"
 
 #include <zlib.h>
@@ -214,7 +215,8 @@ static size_t assemble_frame(uint8_t *buf, size_t size,
     uint32_t crc;
 
     if (size < payload_size + 12) {
-        error_report("milkymist_minimac2: received too big ethernet frame");
+        qemu_log_mask(LOG_GUEST_ERROR, "milkymist_minimac2: frame too big "
+                      "(%zd bytes)\n", payload_size);
         return 0;
     }
 
@@ -347,8 +349,9 @@ minimac2_read(void *opaque, hwaddr addr, unsigned size)
         break;
 
     default:
-        error_report("milkymist_minimac2: read access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "milkymist_minimac2_rd%d: 0x%" HWADDR_PRIx "\n",
+                      size, addr << 2);
         break;
     }
 
@@ -413,8 +416,10 @@ minimac2_write(void *opaque, hwaddr addr, uint64_t value,
         break;
 
     default:
-        error_report("milkymist_minimac2: write access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "milkymist_minimac2_wr%d: 0x%" HWADDR_PRIx
+                      " = 0x%" PRIx64 "\n",
+                      size, addr << 2, value);
         break;
     }
 }
-- 
2.19.1


