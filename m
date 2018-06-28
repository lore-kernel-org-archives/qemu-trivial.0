Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fYaAa-000330-Sh
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jun 2018 12:53:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fYaAY-00030L-3u
	for qemu-trivial@nongnu.org; Thu, 28 Jun 2018 12:53:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fYaAX-0001Wc-Ak
	for qemu-trivial@nongnu.org; Thu, 28 Jun 2018 12:53:18 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:40114)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fYaAS-0001IR-RA; Thu, 28 Jun 2018 12:53:12 -0400
Received: by mail-qk0-x244.google.com with SMTP id b129-v6so3355907qke.7;
	Thu, 28 Jun 2018 09:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=66gak/QdYxKmpBriFMY4MywCHehiSQ50EL++TLx8nrY=;
	b=TTb7CEitaJNoQrjZzkG/40a9T/72e7hlZRgs1uFwEP6DX9TQ0BpE0NojzN36VI1yfB
	WKD5zjytuR/EK8wy/Wa3oJMnvrEHQgLDnqVFvV6DFhFsfQBA+AgQJDeV2SQVJ3b4lyGc
	t9wUG0qwJIety6urOnQg39JDsp7BYx4jE1S9k5A8BIeeGVlhMR71elN6nGAcwxbAO0/G
	6/aNZpJqjnTiiyzfqE6hWeVimS7+FLgA2bTErvtNQpXfGeB7azUVNElmAoHrdSkkqEWT
	Eww5YDJ1HmL9N/0FWqnZJXv1iUM3sxbZE2Meeryv2pVE3VOr1FVpO8uZBTrky/zSdy8F
	rQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=66gak/QdYxKmpBriFMY4MywCHehiSQ50EL++TLx8nrY=;
	b=j+2lhjq7iN/3qN/VV2GkyP+oMD5GEwNjMu/FNrFXwfkJJmKdZ7W47f6Jm7xxkULj+V
	McVn9w5l7W464hiVK4U2kX5N9AQGDbjX0bNE+FU+eJa1uMCp4+xIPM6qOaoGFzH3ANj+
	TMZMv9E6sWNyv3r4IXpc9RIxD4Pywc20iWcp/CDFiO3Ub70d6E7Y53f13yWmDzd+ymmU
	Pm2+lYVb4shCd93mOP3C/SJ5kygWCbXjsgsBebZOvlvpHvnpwH1p7n7jrE6JNzr8QgJb
	SoDuU2ka6mjRuJpFyoCNEW75RaiHWfghYoRj4dXyk1D/KDXlYUFAqURXHOMCxhhWkkVb
	RC5A==
X-Gm-Message-State: APt69E3QuiroBYGFcpO2HO8RVxxT37ZNejZbQkEZrCtpLUYnVGH56qJJ
	g7l7OppN5tM2v+sdgPQBD8E=
X-Google-Smtp-Source: AAOMgpcQ83d5SeKhTM5KoSIQ9nOUGkT397OYwvDDu37QtGV37991wsrQhO0mVmh3O+vp2Re55KvVrQ==
X-Received: by 2002:a37:a20f:: with SMTP id
	l15-v6mr9523960qke.329.1530204792222; 
	Thu, 28 Jun 2018 09:53:12 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	c191-v6sm4811942qkb.22.2018.06.28.09.53.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jun 2018 09:53:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Walle <michael@walle.cc>,
	Jason Wang <jasowang@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 28 Jun 2018 13:52:54 -0300
Message-Id: <20180628165254.10374-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH] milkymist-minimac2: Use
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
X-List-Received-Date: Thu, 28 Jun 2018 16:53:19 -0000

qemu_log_mask(GUEST_ERROR) is more appropriate:

  $ qemu -d help
  Log items (comma separated):
  guest_errors    log when the guest OS does something invalid (eg accessing a non-existent register)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/milkymist-minimac2.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
index 3eaa19dfde..94c3bc6595 100644
--- a/hw/net/milkymist-minimac2.c
+++ b/hw/net/milkymist-minimac2.c
@@ -30,7 +30,7 @@
 #include "hw/sysbus.h"
 #include "trace.h"
 #include "net/net.h"
-#include "qemu/error-report.h"
+#include "qemu/log.h"
 
 #include <zlib.h>
 
@@ -214,7 +214,8 @@ static size_t assemble_frame(uint8_t *buf, size_t size,
     uint32_t crc;
 
     if (size < payload_size + 12) {
-        error_report("milkymist_minimac2: received too big ethernet frame");
+        qemu_log_mask(LOG_GUEST_ERROR, "milkymist_minimac2: frame too big "
+                      "(%zd bytes)\n", payload_size);
         return 0;
     }
 
@@ -347,8 +348,9 @@ minimac2_read(void *opaque, hwaddr addr, unsigned size)
         break;
 
     default:
-        error_report("milkymist_minimac2: read access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "milkymist_minimac2_rd%d: 0x%" HWADDR_PRIx "\n",
+                      size, addr << 2);
         break;
     }
 
@@ -413,8 +415,9 @@ minimac2_write(void *opaque, hwaddr addr, uint64_t value,
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


