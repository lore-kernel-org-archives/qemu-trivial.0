Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW39C-0004nx-1m
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 13:13:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW395-0004kp-Eb
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW394-00025X-I9
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:19 -0400
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:39824)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW392-00023w-8u; Thu, 21 Jun 2018 13:13:16 -0400
Received: by mail-qt0-x22b.google.com with SMTP id p23-v6so3518816qtn.6;
	Thu, 21 Jun 2018 10:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VEREwn8P3qjkPzd9HobzY+v6bsUXXjo+USQTx3+J3wg=;
	b=LN0a9oODeIw2VEpenjHcxLmMlSp9kJTLfvwpeGr0M8wWxbfVQzaXteuqUBCS882dtJ
	l0bijGodL2WnBk3bg0/rZ3FXG4u3QZtHzQHO4CLaTer6axVIkFVzPKZOVrI/sGmYrble
	tn2FsTqKsncfJfFXSDontN7kGxkHSGBVEoTxwnBJSuEatiWOMygu4X4Tdth01YyB5aTj
	sIVQFLUkNKX/y5aiAug0xCLUovmQF4ZdTFSyaM/7tUU/EDTHFdNoALC4hspcSGVfR+He
	+jkRcHqxNbfA4ANyfOSBLLui3fd3dqHvnbmwbbEOB9G3zBqs2gU5A9lHREdfPZ5xNy1+
	FNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=VEREwn8P3qjkPzd9HobzY+v6bsUXXjo+USQTx3+J3wg=;
	b=bCS63HmIXHOjSlNAABhfaBDaLyThv4ay+xoJ+501CDfJQo/qjJZ/C+dsoLald41BtP
	kt0+eCKRrzMqokBo7oBFyMKScStvh19wSIJzYpKcMcnmYjskYBedX8dNo7rAGeH1pjGm
	17zg+govNorRURmCWk6Tuf5X3Anf9uAlgd9zIWnvSdfjc2nTe1g1wJQf9vxVonNL+0AC
	7WwRlAoeim0NZn625/yZzR4PIa+QRUiEW/gAxHUuHwfezyJ/hEkmbuHeF7heN8WgUr+X
	MeBkn3X9Ts1Grwk3CfdZQDLluyrjZx/itpFHNv49fsQq2tYmsNaSiNligqeFLchsNisV
	Au3g==
X-Gm-Message-State: APt69E2AnUipY7NOMjOu03mxNZJuLEd6rRCT60IBMBj9o1VTAXBeFP96
	HqJfX/bnWwohflJykitNNH5iT6+H
X-Google-Smtp-Source: ADUXVKI3luIbPYjxNqkRrzo4VUIJ4W3YYETCuRhyF9oPWLB9c/puN3i71RX8l3OdLBxiEY9wOUmcEg==
X-Received: by 2002:ac8:5317:: with SMTP id
	t23-v6mr23621082qtn.388.1529601195738; 
	Thu, 21 Jun 2018 10:13:15 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	t14-v6sm3166159qtp.65.2018.06.21.10.13.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 10:13:15 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 21 Jun 2018 14:12:49 -0300
Message-Id: <20180621171257.14897-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621171257.14897-1-f4bug@amsat.org>
References: <20180621171257.14897-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: [Qemu-trivial] [PATCH 03/11] hw/char/serial: Convert from DPRINTF
 macro to trace events
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
X-List-Received-Date: Thu, 21 Jun 2018 17:13:25 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/serial.c     | 5 +++--
 hw/char/trace-events | 4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 605b0d02f9..26f53ba02f 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -29,6 +29,7 @@
 #include "qapi/error.h"
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
+#include "trace.h"
 
 //#define DEBUG_SERIAL
 
@@ -335,7 +336,7 @@ static void serial_ioport_write(void *opaque, hwaddr addr, uint64_t val,
     SerialState *s = opaque;
 
     addr &= 7;
-    DPRINTF("write addr=0x%" HWADDR_PRIx " val=0x%" PRIx64 "\n", addr, val);
+    trace_serial_ioport_write(addr, val);
     switch(addr) {
     default:
     case 0:
@@ -548,7 +549,7 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr addr, unsigned size)
         ret = s->scr;
         break;
     }
-    DPRINTF("read addr=0x%" HWADDR_PRIx " val=0x%02x\n", addr, ret);
+    trace_serial_ioport_read(addr, ret);
     return ret;
 }
 
diff --git a/hw/char/trace-events b/hw/char/trace-events
index ebd8a92450..158957627e 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -1,5 +1,9 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
+# hw/char/serial.c
+serial_ioport_read(uint16_t addr, uint8_t value) "read addr 0x%02x val 0x%02x"
+serial_ioport_write(uint16_t addr, uint8_t value) "write addr 0x%02x val 0x%02x"
+
 # hw/char/virtio-serial-bus.c
 virtio_serial_send_control_event(unsigned int port, uint16_t event, uint16_t value) "port %u, event %u, value %u"
 virtio_serial_throttle_port(unsigned int port, bool throttle) "port %u, throttle %d"
-- 
2.18.0.rc2


