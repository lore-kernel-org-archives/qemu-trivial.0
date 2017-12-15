Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgkT-00043S-8U
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:33:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgkO-0003xt-I1
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:33:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgkK-0007ER-1d
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:33:16 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:43815)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgkA-00072X-Kw; Thu, 14 Dec 2017 22:33:02 -0500
Received: by mail-qk0-x241.google.com with SMTP id j207so8866815qke.10;
	Thu, 14 Dec 2017 19:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rbHOlZnmUQS2aS1iqNV0ZqWi7RX5Al/E4fFRZZAeSBk=;
	b=Thmb63zF6x3J8jH6/x8LSrJWElCSu7ryq0/94KxryqmW2By0OmLd2TYtpV7DcFD/eb
	wQOCPrHz/Z7/Dea9DQakldAz8CBYlVXF7LBoAyFwOgeOkN0/Y8dWBtZ+JDvhHZ5D9Tfh
	tppUNofqKnnKNllB2IPKogpzeeQoLkjwADt0arcb5fM4KIHzX1hlizhXtT/JtAMvls9V
	8EWdDpeNpljsLZhYZA+S4qO8sdRMzQxkY/iq1O/wHuBRhQcxbWJCZ1OHZm0JnaGlLyhx
	+0PDa4QO2beHo3tryQ2Md+KdkbdNiqliM/ovnXpFTOUHzMMfUXq3p5brWa76NHSq77TK
	z4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=rbHOlZnmUQS2aS1iqNV0ZqWi7RX5Al/E4fFRZZAeSBk=;
	b=ZEBr/1WrskFzDKH/eCV2SINxJgvfQhZRn1OTSi9wmfv6W+bPG93A9thAeHpOQiU0Ju
	z0CVHi5ekQyUuzOHBxrbaGA/Y7aA4I4RBv31wqMpIHMwvU3fFvFwKPb7C9E9IE0sFAyM
	2v4aKQp19Gezvi7MoHpWPxL3oNAR49Hkj3XAxweauYTBpZNS/DWvtEy3wevFxhQsIipN
	I24MGxZUouCzpVPsh7B6ckc+VrE16nziawUBQmSlhC7q5N7W+VgOvalnqFqMoPSAtzHw
	tzeajQY8ia/nGgoP8ov/r8odRPjFO7ODzTCuq8IrczghMCxYkDE8HZu2Hol65xdQX4wq
	FTng==
X-Gm-Message-State: AKGB3mK7TAqYeuG6PGnD4WuKFuzwnEjyns+BHMsL7CH1nQrP3GQEFCHV
	4c5zQVAfxqQyUlnLnaq3kmk=
X-Google-Smtp-Source: ACJfBosc5iSQRFNfV2JyqyOKpYEfJ/UKAoJylGhdyAEJFtX0bPTA/HZmbuJk82s2UNcZyxXMDCSZDQ==
X-Received: by 10.55.99.5 with SMTP id x5mr19612352qkb.258.1513308782179;
	Thu, 14 Dec 2017 19:33:02 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.32.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:33:01 -0800 (PST)
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
Date: Fri, 15 Dec 2017 00:30:14 -0300
Message-Id: <20171215033015.738-43-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v4 42/43] hw/i386/vmport: replace fprintf()
 by trace events
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
X-List-Received-Date: Fri, 15 Dec 2017 03:33:20 -0000

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
index d43b4b6cd3..f0522ea5e5 100644
--- a/hw/i386/trace-events
+++ b/hw/i386/trace-events
@@ -113,3 +113,7 @@ amdvi_mode_invalid(uint8_t level, uint64_t addr)"error: translation level 0x%"PR
 amdvi_page_fault(uint64_t addr) "error: page fault accessing guest physical address 0x%"PRIx64
 amdvi_iotlb_hit(uint8_t bus, uint8_t slot, uint8_t func, uint64_t addr, uint64_t txaddr) "hit iotlb devid %02x:%02x.%x gpa 0x%"PRIx64" hpa 0x%"PRIx64
 amdvi_translation_result(uint8_t bus, uint8_t slot, uint8_t func, uint64_t addr, uint64_t txaddr) "devid: %02x:%02x.%x gpa 0x%"PRIx64" hpa 0x%"PRIx64
+
+# hw/i386/vmport.c
+vmport_register(unsigned char command, void *func, void *opaque) "command: 0x%02x func: %p opaque: %p"
+vmport_ioport_read_unknown_command(unsigned char command, hwaddr addr) "unknown command: 0x%02x addr: 0x" HWADDR_PRIx
-- 
2.15.1


