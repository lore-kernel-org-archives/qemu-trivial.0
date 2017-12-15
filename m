Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgv2-0005wp-TT
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:44:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgv0-0005uf-JA
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:44:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePguz-0005Yl-NK
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:44:14 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePguu-0005TX-UV; Thu, 14 Dec 2017 22:44:09 -0500
Received: by mail-qt0-x242.google.com with SMTP id u10so10640795qtg.2;
	Thu, 14 Dec 2017 19:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NPxC3dFVyA7VOxwRxho+OnuY660hRVqp4FzeXDJ/5w4=;
	b=rJbn6E7rU92Czgc1U/tyvUGkbLKCBJ6Tf9UBfoAX9UUBS0wXtYd/MDefZUDhsui3LR
	DYlkH7Crn4KlVlisGUDQEXxeZydjnUw5U9XcpEfK6+AJsPbzEBLZ56BtglrYFf43maDu
	DTqaxee4uHlxkLCZCoSjElUvPmaLzQhQv+0LmDt4fMd4k0ON+SAw/3xRr07q5XQiqIlS
	9moGPQDa4vlrDJdJB+x4VuYU+7lS3lNEq5RrGKa/mfgeuJG9BOSvQTnbdRuMLDQGaFHl
	sdDu//+0tftxxKLmGIaI/XSF/Kzk6Gi6u0mMMqSjaxi3ldM++zpTLet6esb6pygOSLSB
	pH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=NPxC3dFVyA7VOxwRxho+OnuY660hRVqp4FzeXDJ/5w4=;
	b=RUni8xRjKeMRtVEen9CX1LCxEaLJgrxfnw9JGzw5t3whqmfxMkPiMjdTmtoHWGUhTu
	sxFZpQzar9HuL/aEE4NrHmuh4FBKlRg5own3QaSduVCj4sSLS75cWIjZP/LvxaRGZ6N7
	AD4lI0TeQoYfq4tUyohsf2bK91mfS+/BBerOCKq60oP49uFFId/erJPm1HGhZVBxlnOC
	QzR/qirEv2gsY6Jxf+ljEd/jyrY65ynePWqJQmvGu+7Uo5eueB554kQIMmpcjWeHzQUj
	tCeJrDTCgUgCqbdA8JqTyRX4ASVQaBvTn14BE1ojYkWLy0JMx3/pthpD9yGeKzbBcBT/
	is3w==
X-Gm-Message-State: AKGB3mIL9aI9KAqtLk1JGrkZpVwuJiP0VdeolxqYtrVsFLLchNvnbUe9
	jG6LXtfBM3+PHLeu5alsW4I=
X-Google-Smtp-Source: ACJfBotpqHdW6zOb9QxImbnQz5XiovXpBkhAXm0LNAOBmg30K5CLv3mB7NBE/N04rJAx/57jrvRE2w==
X-Received: by 10.237.63.59 with SMTP id p56mr19124159qtf.322.1513309448378;
	Thu, 14 Dec 2017 19:44:08 -0800 (PST)
Received: from x1.local ([181.91.222.165])
	by smtp.gmail.com with ESMTPSA id n3sm3543633qte.14.2017.12.14.19.44.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:44:07 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Date: Fri, 15 Dec 2017 00:43:55 -0300
Message-Id: <20171215034356.4449-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215034356.4449-1-f4bug@amsat.org>
References: <20171215034356.4449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v5 1/2] hw/i386/vmport: replace fprintf() by
 trace events
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
X-List-Received-Date: Fri, 15 Dec 2017 03:44:15 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/vmport.c     | 8 +++-----
 hw/i386/trace-events | 4 ++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index eb880c6def..b5585a009a 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -27,8 +27,7 @@
 #include "hw/i386/pc.h"
 #include "sysemu/hw_accel.h"
 #include "hw/qdev.h"
-
-/* #define VMPORT_DEBUG */
+#include "trace.h"
 
 #define VMPORT_CMD_GETVERSION 0x0a
 #define VMPORT_CMD_GETRAMSIZE 0x14
@@ -54,6 +53,7 @@ void vmport_register(unsigned char command, VMPortReadFunc *func, void *opaque)
         return;
     }
 
+    trace_vmport_register(command, func, opaque);
     port_state->func[command] = func;
     port_state->opaque[command] = opaque;
 }
@@ -80,9 +80,7 @@ static uint64_t vmport_ioport_read(void *opaque, hwaddr addr,
         return eax;
     }
     if (!s->func[command]) {
-#ifdef VMPORT_DEBUG
-        fprintf(stderr, "vmport: unknown command %x\n", command);
-#endif
+        trace_vmport_ioport_read_unknown_command(command, addr);
         return eax;
     }
 
diff --git a/hw/i386/trace-events b/hw/i386/trace-events
index d43b4b6cd3..150549c15e 100644
--- a/hw/i386/trace-events
+++ b/hw/i386/trace-events
@@ -113,3 +113,7 @@ amdvi_mode_invalid(uint8_t level, uint64_t addr)"error: translation level 0x%"PR
 amdvi_page_fault(uint64_t addr) "error: page fault accessing guest physical address 0x%"PRIx64
 amdvi_iotlb_hit(uint8_t bus, uint8_t slot, uint8_t func, uint64_t addr, uint64_t txaddr) "hit iotlb devid %02x:%02x.%x gpa 0x%"PRIx64" hpa 0x%"PRIx64
 amdvi_translation_result(uint8_t bus, uint8_t slot, uint8_t func, uint64_t addr, uint64_t txaddr) "devid: %02x:%02x.%x gpa 0x%"PRIx64" hpa 0x%"PRIx64
+
+# hw/i386/vmport.c
+vmport_register(unsigned char command, void *func, void *opaque) "command: 0x%02x func: %p opaque: %p"
+vmport_ioport_read_unknown_command(unsigned char command, hwaddr addr) "unknown command: 0x%02x addr: 0x%" HWADDR_PRIx
-- 
2.15.1


