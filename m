Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fZnpZ-0002NH-6E
	for mharc-qemu-trivial@gnu.org; Sun, 01 Jul 2018 21:40:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fZnpX-0002Kp-3s
	for qemu-trivial@nongnu.org; Sun, 01 Jul 2018 21:40:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fZnpW-0004F9-7e
	for qemu-trivial@nongnu.org; Sun, 01 Jul 2018 21:40:39 -0400
Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236]:44548)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fZnpQ-0004C4-UG; Sun, 01 Jul 2018 21:40:33 -0400
Received: by mail-qt0-x236.google.com with SMTP id b15-v6so2664408qtp.11;
	Sun, 01 Jul 2018 18:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5da+v3lq8BtHbKkuc9n6zYHMD2rXbuEsJOBpjy9BhHw=;
	b=oLtJsPrGPXFLHQhWXredqx7khyOH5PQndylGyH6N2fU+fS9WETYwUoYIial85ZNe3n
	j7n+C07NOL8CAoCyX8F5ygFJW2++e7qvweNPMNI//l2QUJhGTBPkyjo+6poUp0HoPUxI
	2chTZSk1R7l15tsjxF/45hrDqfT7ZRHcngpBQFnJetmwOs8CY8gS56IjaItm/NDWJ4zh
	hc25ssR9UxQuDXKsCEcfbUdLPYR7+UeRheKPJ2954LPwJDIoVHhK/9YJUrQzNLYVh9rb
	yB4yTxUf8OlKCQD0IbqWhOWjJmZ9Oi532WOGF3K2D5W6MkKiR2rwmACSsbYME7d/Ir/M
	UEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=5da+v3lq8BtHbKkuc9n6zYHMD2rXbuEsJOBpjy9BhHw=;
	b=e2GttBFdIdEqNMAVo2floBm9a1/nyCTPj15ILe9rYd3IZNXE+KVjJFcxcWN8Rb9Bka
	3lVBZKDAGfCgkTHaWJ3jO/E5aglircskfxTLGaufVukoWhukcWC/+4DH4fNKtuo2fxgR
	5DiQ659GYdcCgfuU4zdF7uadGaB3AL3XsIKpdE4Hb5nkQ6Q+prmrHYlYaFBGGRB4NsvC
	mwmJwqfGwMcXZarrhxPDfFU3KmcLPfohZ0BJNDh2mP4vDu9xM3ExhXdERSd2LXXXZc6H
	P2wWfDsNYPm2MHUbb9H+pVo1frjdA5svjxHz7+3zYMKGsOa8GNdARIierwkGxD9wmWzS
	TvRg==
X-Gm-Message-State: APt69E2eMoYJ//JWtQhgoBEHk982oajaZrLBB9LtlgY540sev0669YLd
	9YKtIoTm5NgCP5S4g2qMqGY=
X-Google-Smtp-Source: AAOMgperfVOgYCzSv+qDk6p3HiV7kwTYB312RQQefl2zzQWqw5gxDKKTiVpx0jfKVa+ko16gtYjYtA==
X-Received: by 2002:ac8:7319:: with SMTP id
	x25-v6mr11713796qto.375.1530495632210; 
	Sun, 01 Jul 2018 18:40:32 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	c93-v6sm3510440qkh.90.2018.07.01.18.40.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Jul 2018 18:40:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Walle <michael@walle.cc>,
	Jason Wang <jasowang@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sun,  1 Jul 2018 22:40:22 -0300
Message-Id: <20180702014022.12395-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::236
Subject: [Qemu-trivial] [PATCH v2] milkymist-minimac2: Use
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
X-List-Received-Date: Mon, 02 Jul 2018 01:40:40 -0000

qemu_log_mask(GUEST_ERROR) is more appropriate:

  $ qemu -d help
  Log items (comma separated):
  guest_errors    log when the guest OS does something invalid (eg accessing a non-existent register)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: do not remove "qemu/error-report.h" (patchew)

 hw/net/milkymist-minimac2.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
index 3eaa19dfde..322fb77e46 100644
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
 
@@ -413,8 +416,9 @@ minimac2_write(void *opaque, hwaddr addr, uint64_t value,
         break;
 
     default:
-        error_report("milkymist_minimac2: write access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "milkymist_minimac2_wr%d: 0x%" HWADDR_PRIx " = 0x%lx\n",
+                      size, addr << 2, value);
         break;
     }
 }
-- 
2.18.0


