Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW39F-0004rC-3H
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 13:13:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39C-0004oi-Nt
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39B-00028x-Me
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:26 -0400
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:43086)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW395-00025f-9T; Thu, 21 Jun 2018 13:13:19 -0400
Received: by mail-qt0-x22f.google.com with SMTP id y89-v6so3508872qtd.10;
	Thu, 21 Jun 2018 10:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6CvE3yYP0kvg+qMRUJ8zBJVWPq9VSYq7hQpsi7xcM4w=;
	b=BdZwYSoh5GGdbgRhsDY4U+E7afnRjvmAoAM3U4nQcmv1aiDdPObAZLa1IJ5lubKzQc
	YcUQ9YZ46Zml1Ci5ZlJlb4Q3hklb4fZ97zDRsvOKX+jZw7bZ9yRJoKtAA08/vvdAEE2W
	4OLcDE23WCqYk+rTzStrSQBsDk/5jOQvZf2cGo7AXIT+7A48lvxlSYadtha4e7ld7Bzo
	3HO/zY6d77lgzNxCQcxXHHbjppQKYiJR+4s8ul/mWqTGrGYeHZChzi+ijsof/meUmWUa
	ZuT4U8EPQYQT2XQC79x5e+eDNAlGulM8rGIgW+ghpzpwbU5kW2Qtdt3UjvZ+Qr+dbR16
	0iJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=6CvE3yYP0kvg+qMRUJ8zBJVWPq9VSYq7hQpsi7xcM4w=;
	b=W5oTZoiRlrx0Lau5/o6337p3O1f16DzGsD83VoXwDF1Sg35n4C7LJXG7uG6eo2xMzt
	TOT+qSNgifEdJU6eQS1oNPy79FBvSUw9MKQoKlL2EVOIlqE6hj7/53Cq5BV9cjLJpmHZ
	IdxBk6b08IuBqnAVfQs0G09HntH5BEzrZjk71/EkOJRq1iZWa+sFhhlpCutL1DJ9qETA
	C/fEKQQFbdPdo0ozCV8dlrtnVheZwv7+DPtNCv1S9sYwtrHLHX7W9CwGktypb8hGaxzx
	bee6ru0DN8M6iTnkU6k4tsPw90vW7DYD7vOcXV/q/fnnoO0pE6skO9g4wOhNln8Tdkg1
	PDRw==
X-Gm-Message-State: APt69E28A1mJURNPkZitEbR3clYHGfBrRGbNGd3rweNIJxqlhvf9S43U
	WfPPH55sd1jM+GB+TawgI40=
X-Google-Smtp-Source: ADUXVKK6/kucoudSpUAPhPDXrU1Pw6y8sT62K8drprX8lxBFj8aV3Uy+QBMSjEVi+BHf2GjBqEVk1A==
X-Received: by 2002:ac8:2c23:: with SMTP id
	d32-v6mr23875980qta.54.1529601198554; 
	Thu, 21 Jun 2018 10:13:18 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	t14-v6sm3166159qtp.65.2018.06.21.10.13.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 10:13:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 21 Jun 2018 14:12:50 -0300
Message-Id: <20180621171257.14897-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621171257.14897-1-f4bug@amsat.org>
References: <20180621171257.14897-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: [Qemu-trivial] [PATCH 04/11] hw/char/parallel: Convert from
 pdebug() macro to trace events
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
X-List-Received-Date: Thu, 21 Jun 2018 17:13:28 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/parallel.c   | 16 +++++++++++++---
 hw/char/trace-events |  4 ++++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index 35748e6c1b..a80da47ecf 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -30,6 +30,7 @@
 #include "hw/isa/isa.h"
 #include "hw/char/parallel.h"
 #include "sysemu/sysemu.h"
+#include "trace.h"
 
 //#define DEBUG_PARALLEL
 
@@ -110,9 +111,8 @@ parallel_ioport_write_sw(void *opaque, uint32_t addr, uint32_t val)
 {
     ParallelState *s = opaque;
 
-    pdebug("write addr=0x%02x val=0x%02x\n", addr, val);
-
     addr &= 7;
+    trace_parallel_ioport_write("SW", addr, val);
     switch(addr) {
     case PARA_REG_DATA:
         s->dataw = val;
@@ -157,6 +157,7 @@ static void parallel_ioport_write_hw(void *opaque, uint32_t addr, uint32_t val)
     s->last_read_offset = ~0U;
 
     addr &= 7;
+    trace_parallel_ioport_write("HW", addr, val);
     switch(addr) {
     case PARA_REG_DATA:
         if (s->dataw == val)
@@ -230,6 +231,8 @@ parallel_ioport_eppdata_write_hw2(void *opaque, uint32_t addr, uint32_t val)
     struct ParallelIOArg ioarg = {
         .buffer = &eppdata, .count = sizeof(eppdata)
     };
+
+    trace_parallel_ioport_write("EPP", addr, val);
     if ((s->control & (PARA_CTR_DIR|PARA_CTR_SIGNAL)) != PARA_CTR_INIT) {
         /* Controls not correct for EPP data cycle, so do nothing */
         pdebug("we%04x s\n", val);
@@ -253,6 +256,8 @@ parallel_ioport_eppdata_write_hw4(void *opaque, uint32_t addr, uint32_t val)
     struct ParallelIOArg ioarg = {
         .buffer = &eppdata, .count = sizeof(eppdata)
     };
+
+    trace_parallel_ioport_write("EPP", addr, val);
     if ((s->control & (PARA_CTR_DIR|PARA_CTR_SIGNAL)) != PARA_CTR_INIT) {
         /* Controls not correct for EPP data cycle, so do nothing */
         pdebug("we%08x s\n", val);
@@ -299,7 +304,7 @@ static uint32_t parallel_ioport_read_sw(void *opaque, uint32_t addr)
         ret = s->control;
         break;
     }
-    pdebug("read addr=0x%02x val=0x%02x\n", addr, ret);
+    trace_parallel_ioport_read("SW", addr, ret);
     return ret;
 }
 
@@ -371,6 +376,7 @@ static uint32_t parallel_ioport_read_hw(void *opaque, uint32_t addr)
         }
         break;
     }
+    trace_parallel_ioport_read("HW", addr, ret);
     s->last_read_offset = addr;
     return ret;
 }
@@ -399,6 +405,7 @@ parallel_ioport_eppdata_read_hw2(void *opaque, uint32_t addr)
     }
     else
         pdebug("re%04x\n", ret);
+    trace_parallel_ioport_read("EPP", addr, ret);
     return ret;
 }
 
@@ -426,11 +433,13 @@ parallel_ioport_eppdata_read_hw4(void *opaque, uint32_t addr)
     }
     else
         pdebug("re%08x\n", ret);
+    trace_parallel_ioport_read("EPP", addr, ret);
     return ret;
 }
 
 static void parallel_ioport_ecp_write(void *opaque, uint32_t addr, uint32_t val)
 {
+    trace_parallel_ioport_write("ECP", addr & 7, val);
     pdebug("wecp%d=%02x\n", addr & 7, val);
 }
 
@@ -438,6 +447,7 @@ static uint32_t parallel_ioport_ecp_read(void *opaque, uint32_t addr)
 {
     uint8_t ret = 0xff;
 
+    trace_parallel_ioport_read("ECP", addr & 7, ret);
     pdebug("recp%d:%02x\n", addr & 7, ret);
     return ret;
 }
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 158957627e..b64213d4dd 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -1,5 +1,9 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
+# hw/char/parallel.c
+parallel_ioport_read(const char *desc, uint16_t addr, uint8_t value) "read [%s] addr 0x%02x val 0x%02x"
+parallel_ioport_write(const char *desc, uint16_t addr, uint8_t value) "write [%s] addr 0x%02x val 0x%02x"
+
 # hw/char/serial.c
 serial_ioport_read(uint16_t addr, uint8_t value) "read addr 0x%02x val 0x%02x"
 serial_ioport_write(uint16_t addr, uint8_t value) "write addr 0x%02x val 0x%02x"
-- 
2.18.0.rc2


