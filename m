Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWMJE-00065Y-Cd
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 09:41:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJC-000636-6e
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJB-0003Ii-Cr
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:02 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:47057)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJ8-0003AW-QE; Fri, 22 Jun 2018 09:40:58 -0400
Received: by mail-qt0-x243.google.com with SMTP id h5-v6so5888896qtm.13;
	Fri, 22 Jun 2018 06:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0mutGa0sDmrzFg5daZsr8Rt8Y88n2i/QbM/UUL4yJrc=;
	b=aDSkZroWWSODVCXrLp7bVTWLYCuA+caAGKpgSKO/3tWUBDbgPkIK2gLDIU72FjbyK4
	rP1IxC6p0a/nkqvV96tIJCu0L21jK6MPuECfMe7/eo2iuT7zoTSShSZWT40JCnCuDCRN
	UqoUUrM3WNH4JCV7f6JyCKsu1vBfKi6H2hktmW8ord4KF33Z2nGGvy3bVeIFaybMGfPQ
	DrSACd1eQeHu0O+5GoFQeRdtaSJHBSDCHeu8pqTlWaFyZwGYJg5e++yUaNPQOTF3sQXO
	8+LGgwsQy/1O2fls/CukZRTClmAmC2Ii5Y4heJcilBkY6Dt6ydUHgdRZeiXAWFKT5w5S
	1T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=0mutGa0sDmrzFg5daZsr8Rt8Y88n2i/QbM/UUL4yJrc=;
	b=hwh8Kdu43BfFQfDybZbywI5XDtEhZH6WWcJsrqtwdrwNS/D+nN6yjq/bsYh92YaRxB
	WZezwyG9mNh6LwjxgTKmT0FONF9iar1/6SjUK//pCEj93WdUFSwUEBmJhTO9kleZHdHY
	LnHiZA57S55R0J8iAh/kAaFJlZGGCRMozrarCPX9qauQ/buYRZ79y3PlZp/XutRUAYWt
	oPQU4E56T6/PByU8dpST4QMlhnvq7agGA+Ps9AUml+VjThuidX2lYoW+sduOJq770yzG
	bEgR71Y2H1P4HA0pqWzGsTEq3sDeC86IWFBeSHbyeA8ryN4tPoOs4XiYsWtqSmKCS8EU
	yxWw==
X-Gm-Message-State: APt69E0YY3fxWGPGsDL0HOT+iWh8CD5mgZad4cJM7I3rDgkr91ABGjoj
	wVBGhg1cn4iyjJhliwG3VsQ=
X-Google-Smtp-Source: AAOMgpfJxuritr8ixVtsc7QKjgPuKnflKTzsJnVLjd986S1ffUNfD/V1yY9lCmIBrHF1wsYX+mE31w==
X-Received: by 2002:a0c:f54d:: with SMTP id
	p13-v6mr1404371qvm.149.1529674858134; 
	Fri, 22 Jun 2018 06:40:58 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.40.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:40:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Date: Fri, 22 Jun 2018 10:40:27 -0300
Message-Id: <20180622134036.23182-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v2 05/14] hw/ssi/omap_spi: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
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
X-List-Received-Date: Fri, 22 Jun 2018 13:41:03 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/ssi/omap_spi.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/omap_spi.c b/hw/ssi/omap_spi.c
index 34163e5646..f278a55160 100644
--- a/hw/ssi/omap_spi.c
+++ b/hw/ssi/omap_spi.c
@@ -20,6 +20,7 @@
  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/hw.h"
 #include "hw/arm/omap.h"
 
@@ -294,11 +295,15 @@ static void omap_mcspi_write(void *opaque, hwaddr addr,
     case 0x2c:	/* MCSPI_CHCONF */
         if ((value ^ s->ch[ch].config) & (3 << 14))	/* DMAR | DMAW */
             omap_mcspi_dmarequest_update(s->ch + ch);
-        if (((value >> 12) & 3) == 3)			/* TRM */
-            fprintf(stderr, "%s: invalid TRM value (3)\n", __func__);
-        if (((value >> 7) & 0x1f) < 3)			/* WL */
-            fprintf(stderr, "%s: invalid WL value (%" PRIx64 ")\n",
-                            __func__, (value >> 7) & 0x1f);
+        if (((value >> 12) & 3) == 3) { /* TRM */
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid TRM value (3)\n",
+                          __func__);
+        }
+        if (((value >> 7) & 0x1f) < 3) { /* WL */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid WL value (%" PRIx64 ")\n",
+                          __func__, (value >> 7) & 0x1f);
+        }
         s->ch[ch].config = value & 0x7fffff;
         break;
 
-- 
2.18.0.rc2


