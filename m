Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWMJJ-0006AY-OY
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 09:41:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJH-00067a-22
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJD-0003Ng-Uu
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:07 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:43057)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJB-0003IA-Di; Fri, 22 Jun 2018 09:41:01 -0400
Received: by mail-qt0-x244.google.com with SMTP id y89-v6so5899367qtd.10;
	Fri, 22 Jun 2018 06:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uRGpaP9vdmbS62h1hqhwUmyNT6CxmmALvdK2uBT+F0w=;
	b=YDTeY0k9OxY2ngRZhTxeKECzsEbYi0v7gQrJnwyr02pGpZUnaSK0eBB+gO+INPOAeO
	pS2wLlqlo3nncJ00ld7vXEwz7ge8uIzql3VB2pH+rLkumlJMSKwGou+bxwpPY+b9r8lw
	qHEPN6mn9U10/rsmzYvt1vHFg/bkDJmPS18IHrw96iyTLJzK+PhOFNNp4AE6MRheW8pS
	qnNdKztAnxcL1XzwMO+vqkNYyfPfli3rTEdRRjBe8b9wlb/ppwE9dXUk+4vm3/cfIu4Z
	l3ck4lMwUkovWncy1wk3CVfe5MgwVfbTFZUZpqTTKbvb3ghXGGm2xYwIwDZUJnFL1fJm
	CKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=uRGpaP9vdmbS62h1hqhwUmyNT6CxmmALvdK2uBT+F0w=;
	b=XEUf5IDJq2C7NG+jUhgn8ne3FhuxZBLdO8hI/F0FCgHzn7ZXSLApUlOZ4Cm/iyo32p
	oJIxACbk74BwGZUxaJTw0CRCMtZQ7J3SBp5ky3O23f5vNJzw2EK8ZBv00vRSsPdmB7d8
	bHKNf4l3LE1s3XswqGPjFtRo9BI/P04LbBjhCL1rCAqB8g2/NJtpdJRhcur3O3fSdn8w
	KwbowXs2Cb7/kZ+4JH6vIcZ9L9d/dTpxPBwck3TFgL4EJZuymw8aBijiJZWJ7iOvuu1w
	CpC3tO98aHFQrbBAvI+w+bm//RkcP8vKONqWoQJ2SaMgrDuPSgNveXGdR73gcSkVkdJd
	6sWg==
X-Gm-Message-State: APt69E31Vl6UKFhUgLTFTiIFc2saaAFxPoscrhxthLLiWsu10zIYmy/1
	7xAmm/rC29hq7RlkglX/wJE=
X-Google-Smtp-Source: AAOMgpcV4ywzJ7Cy3l7VBUWCEQOQZRiFGPXA302BwpQO8BjlrXZZ0gGGDaAc9XKNkHf9xPrDC2SCRg==
X-Received: by 2002:a0c:e0c7:: with SMTP id
	x7-v6mr1411553qvk.113.1529674860903; 
	Fri, 22 Jun 2018 06:41:00 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.40.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:41:00 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 22 Jun 2018 10:40:28 -0300
Message-Id: <20180622134036.23182-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v2 06/14] hw/sd/omap_mmc: Use
 qemu_log_mask(UNIMP) instead of printf
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
X-List-Received-Date: Fri, 22 Jun 2018 13:41:08 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/sd/omap_mmc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index 5b47cadf11..aa2a816f76 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -17,6 +17,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/hw.h"
 #include "hw/arm/omap.h"
 #include "hw/sd/sd.h"
@@ -449,10 +450,14 @@ static void omap_mmc_write(void *opaque, hwaddr offset,
         s->enable = (value >> 11) & 1;
         s->be = (value >> 10) & 1;
         s->clkdiv = (value >> 0) & (s->rev >= 2 ? 0x3ff : 0xff);
-        if (s->mode != 0)
-            printf("SD mode %i unimplemented!\n", s->mode);
-        if (s->be != 0)
-            printf("SD FIFO byte sex unimplemented!\n");
+        if (s->mode != 0) {
+            qemu_log_mask(LOG_UNIMP,
+                          "omap_mmc_wr: mode #%i unimplemented\n", s->mode);
+        }
+        if (s->be != 0) {
+            qemu_log_mask(LOG_UNIMP,
+                          "omap_mmc_wr: Big Endian not implemented\n");
+        }
         if (s->dw != 0 && s->lines < 4)
             printf("4-bit SD bus enabled\n");
         if (!s->enable)
-- 
2.18.0.rc2


