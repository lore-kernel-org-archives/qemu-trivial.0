Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW39G-0004sR-7L
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 13:13:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39D-0004pW-Mu
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39C-00029M-Iu
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:27 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:44052)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39A-00027o-3Q; Thu, 21 Jun 2018 13:13:24 -0400
Received: by mail-qt0-x243.google.com with SMTP id x5-v6so2801718qte.11;
	Thu, 21 Jun 2018 10:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=eRMJDpqk0yCa6rHcwkCR6dFJMVqWYYnwID4tm/ziM8U=;
	b=ooCooruVqx+ZA+KwHH32Er3JDiYRNec+Zp+RjwNJFhvus4mT/T+Imlz4bnEsxXwayD
	Awb+I+sTxWlvkPcovYCRvRUCC6aYFwkgouQ5DIlFMNjCmx1kMxnWvq45l0Lkk1Wen+3J
	p5GRJzDLF1Qt4u/Xry18/i+V1+fGRlo1LGxhzmQQIsY6264+fi2JCKGX8n6Xohnk9oT1
	CCGmo6BQ/VTcaAAxTTu8dUcN0Nru+bZ3P+m0ntQqZ63DLsKFsRxdnRGc6EM/ZHT/tJzE
	iz2yGcQIQlFV28+UtYQQNIebH46vTjnZGDdt6aSgQPhVKbA2QYH31perBBwSME6ZvyeR
	QoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=eRMJDpqk0yCa6rHcwkCR6dFJMVqWYYnwID4tm/ziM8U=;
	b=TN0ZJ9gHbmhuZp+ulbxY5gSI7d/vx6LKcLilKnrUr5QZJ+od8e5ijrQLOEWV3QIsTN
	Kwo5rGZnvtK9SNnkvarw9d7ZGDTLvlaggKRc4hw2tognJg0RcsZpZB+5YJy5CT+CecLs
	sCKGEj1j2wxFjF9al12J6ZHPCwcCkR9YpAbEd6ovWuFVpDQ7ZSF6sfnfU1l/MPJcSpl2
	IskpnCfLCZUceVB8J08BdRyqU5Fbb11DC6AqvHPgHWkYt5VZ6D45veXmgQ7mvNw7eDFM
	FI4v4KUOr589e/hufNKQPjkIvhqv4XWzhBPM4MAJnPCgrKfUfvsWe+A4dRk1f7LZlRGt
	Rjdw==
X-Gm-Message-State: APt69E2qQd2kat5hrYEZzkmuT1exgbqSpoJvIv2S1W+qJcs031A6ourk
	GOylPGXBaMunpdwD5lZK1MFPH6tV
X-Google-Smtp-Source: ADUXVKKQwhNSzwLFpntzV/ErT3jZRNQ2E/ulcYIcCyBSBVNu8OeRMfTtpYPXRbun/L56gR4HEkZWPw==
X-Received: by 2002:a0c:ae63:: with SMTP id
	z32-v6mr23047245qvc.108.1529601203462; 
	Thu, 21 Jun 2018 10:13:23 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	t14-v6sm3166159qtp.65.2018.06.21.10.13.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 10:13:23 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 21 Jun 2018 14:12:52 -0300
Message-Id: <20180621171257.14897-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621171257.14897-1-f4bug@amsat.org>
References: <20180621171257.14897-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 06/11] hw/input/tsc2005: Convert a fprintf()
 call to trace events
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
 hw/input/tsc2005.c    | 7 +++----
 hw/input/trace-events | 3 +++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 7990954b6c..4e1ee756ed 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -23,6 +23,7 @@
 #include "qemu/timer.h"
 #include "ui/console.h"
 #include "hw/devices.h"
+#include "trace.h"
 
 #define TSC_CUT_RESOLUTION(value, p)	((value) >> (16 - (p ? 12 : 10)))
 
@@ -200,8 +201,7 @@ static void tsc2005_write(TSC2005State *s, int reg, uint16_t data)
         s->host_mode = (data >> 15) != 0;
         if (s->enabled != !(data & 0x4000)) {
             s->enabled = !(data & 0x4000);
-            fprintf(stderr, "%s: touchscreen sense %sabled\n",
-                            __func__, s->enabled ? "en" : "dis");
+            trace_tsc2005_sense(s->enabled ? "enabled" : "disabled");
             if (s->busy && !s->enabled)
                 timer_del(s->timer);
             s->busy = s->busy && s->enabled;
@@ -337,8 +337,7 @@ static uint8_t tsc2005_txrx_word(void *opaque, uint8_t value)
                 s->nextprecision = (value >> 2) & 1;
                 if (s->enabled != !(value & 1)) {
                     s->enabled = !(value & 1);
-                    fprintf(stderr, "%s: touchscreen sense %sabled\n",
-                                    __func__, s->enabled ? "en" : "dis");
+                    trace_tsc2005_sense(s->enabled ? "enabled" : "disabled");
                     if (s->busy && !s->enabled)
                         timer_del(s->timer);
                     s->busy = s->busy && s->enabled;
diff --git a/hw/input/trace-events b/hw/input/trace-events
index db72484a25..3965a842ae 100644
--- a/hw/input/trace-events
+++ b/hw/input/trace-events
@@ -41,5 +41,8 @@ milkymist_softusb_pulse_irq(void) "Pulse IRQ"
 hid_kbd_queue_full(void) "queue full"
 hid_kbd_queue_empty(void) "queue empty"
 
+# hw/input/tsc2005.c
+tsc2005_sense(const char *state) "touchscreen sense %s"
+
 # hw/input/virtio
 virtio_input_queue_full(void) "queue full"
-- 
2.18.0.rc2


