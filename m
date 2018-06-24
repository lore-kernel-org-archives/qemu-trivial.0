Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWwIZ-0003xp-A7
	for mharc-qemu-trivial@gnu.org; Sun, 24 Jun 2018 00:06:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIW-0003u9-G5
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIU-0003rR-Ij
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:43 -0400
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c]:41520)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIR-0003q5-Hy; Sun, 24 Jun 2018 00:06:39 -0400
Received: by mail-qk0-x22c.google.com with SMTP id d22-v6so169262qkc.8;
	Sat, 23 Jun 2018 21:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LBtULdpVGZHXXdJeP9a2uG196NqZT+OU//3yrTeMnA8=;
	b=pOnkILMuWfO0HuAyo+XYeTUaMt2K6Qc75xN/WW+oUY3iEEab+Qbl4z3liVa6wc2WyQ
	8W7u/KsVqC/3tzOYDrUX1xaQISEBw9APaIKOqy64krxFsnCoV73XVWiDt+t5fyiGO9xW
	Jn45vvFox796GF39nwuHJL2mBdlr0Qq8v38lcChXPqJX+Ww7mDxHPtRzwRuWXLzTo870
	p9yOrt2iTQ7oKg2dEiypyAmlaXaB0fxYD++Ynj91+z3NxCu+b6Dc5ZLIypIasBEOGXUA
	QXIgOyvyFhO00lmQJCfDsw2xw21plWKTC5JIvR2Mm+bEw1lSFEaoQ3WjfvIB+p+KsPWG
	FOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=LBtULdpVGZHXXdJeP9a2uG196NqZT+OU//3yrTeMnA8=;
	b=cniuiamDKz+kMhVt+VG+jJZYy/6NI7xdm+uS6LZ2KzeGX+fAwYSe+zRNbIzP83mtxL
	TkCx84uVtfy74cZbQFtnVdGIZ2ju3LhofcmCkjgwqdTTkIwqaptHjfT/4WZsrDF1vHXI
	KmnqqgUHxL1WniTmU+C/9EQpT2GKu0lO09De3E0t4ZjZGqGbsGlaRSHhEHCqwwRCAv5M
	aDFr9s7mvx5o1GEs2ZFI5Tp3nXrx3eOj3+IrjjKRDeKzdpygj15gsdSmqmrICkyJn91K
	amVzaUVLhfooSHti7pkJlRR4VYlEeigm8UKSn65Xr702QlJfTqjnBQqERSNaw82XR8l/
	bSDw==
X-Gm-Message-State: APt69E1reYbEi/WHSUd+JPSdnmP+X75jmXsBnVWibGsGhYT+1N1saCZi
	0af7TOmH5jKnJzGd1xUM3GY=
X-Google-Smtp-Source: ADUXVKLhdu57UsJFQFnqcKeJbqyJbjBvWh7A/d/n/VcXfrn3ALNICpkXNIKMfbA+jKoy/kFNjQQzAQ==
X-Received: by 2002:a37:be06:: with SMTP id
	o6-v6mr6531255qkf.162.1529813199058; 
	Sat, 23 Jun 2018 21:06:39 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Date: Sun, 24 Jun 2018 01:05:58 -0300
Message-Id: <20180624040609.17572-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22c
Subject: [Qemu-trivial] [PATCH v3 05/16] hw/ssi/omap_spi: Use
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
X-List-Received-Date: Sun, 24 Jun 2018 04:06:45 -0000

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
2.18.0


