Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWwIO-0003nk-C2
	for mharc-qemu-trivial@gnu.org; Sun, 24 Jun 2018 00:06:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIM-0003lH-E2
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIL-0003l3-Ek
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:34 -0400
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d]:36336)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIJ-0003jG-98; Sun, 24 Jun 2018 00:06:31 -0400
Received: by mail-qk0-x22d.google.com with SMTP id a195-v6so5836119qkg.3;
	Sat, 23 Jun 2018 21:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QxVwz/wTVhtCIfXlL0zThFvKYmMH8n7LNs7GLwqQ1Eg=;
	b=HV/gd35JsXB3wJ+TFyJmd/0AAPWEBn9J6kyjBvpsloteZ40FZv0Qn/tgK02AprdcqY
	2jxcNlZGXK0cLNyoR02nK6B8yMT3w0pPaYgElvReYWj6654Uqb/RoDspxx1oycvffRee
	VDz9uYBFIljblZkgrAgguHDZsCC6mYYgIORxCn2cCNZEIgcIJ2OjEsTedef4r2LpQq6Y
	K6PLYbakl6dvxHinL2tEou7PjPkUMdXuv28QdlyK0T0Ni486T60WnLvGuGzpSgSK4HqU
	wRK8d113E0v8d1y+z/6skkXTDwAT8tqStV9+igHHn8JdaiLr5/yLyDsw+8gMi05ASGpC
	fj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=QxVwz/wTVhtCIfXlL0zThFvKYmMH8n7LNs7GLwqQ1Eg=;
	b=pB598FItlOfOw8PfY2r9I1jN4yf5gvObfCdgQrBYAWhCGFfifgdgcvZVUlC5HY7QsS
	rdNCyHwS8WgiZKnlo6p0rGkVqBRMfmBfKW4761yKyrS0L6uklBWr6T2dJGSFlXgT9xo9
	hflb8UgHFJi05B0XLMRNU1nVM+KLb0uIgZ1e5gb6Yqy7sw7nilrWFHHNAZNasHwtI4u4
	am0QcTiRorDeSHmF/nIIevRtvWNE2AJQ1FkSsaSQkTVwAeEoF430SDL6B2Ii1M74YW8Y
	Wp4O2t4vSCu4mYYM2T1jqgxtyZclhyOsIu7ArVyztV7w9BZFsjia/cpMcIboFxiju7QZ
	i+QQ==
X-Gm-Message-State: APt69E1qXkdvLgNk2P10Ldb9TdrxZKCzaFnZzotCaA8Vec3umjVakedc
	naQ7aYu5JaDlox2+61VEndI=
X-Google-Smtp-Source: ADUXVKJuksannAkDWIrBbiamfKgU8az+McEOv8G9ppyj3iCdF06jGdoZOGURtAW1yEVNYYGMrbeVyg==
X-Received: by 2002:a37:5b87:: with SMTP id
	p129-v6mr6666344qkb.178.1529813190781; 
	Sat, 23 Jun 2018 21:06:30 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:30 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Sun, 24 Jun 2018 01:05:55 -0300
Message-Id: <20180624040609.17572-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22d
Subject: [Qemu-trivial] [PATCH v3 02/16] hw/input/tsc2005: Use
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
X-List-Received-Date: Sun, 24 Jun 2018 04:06:35 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/input/tsc2005.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 7990954b6c..4dd95596ab 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/hw.h"
 #include "qemu/timer.h"
 #include "ui/console.h"
@@ -208,9 +209,10 @@ static void tsc2005_write(TSC2005State *s, int reg, uint16_t data)
         }
         s->nextprecision = (data >> 13) & 1;
         s->timing[0] = data & 0x1fff;
-        if ((s->timing[0] >> 11) == 3)
-            fprintf(stderr, "%s: illegal conversion clock setting\n",
-                            __func__);
+        if ((s->timing[0] >> 11) == 3) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "tsc2005_write: illegal conversion clock setting\n");
+        }
         break;
     case 0xd:	/* CFR1 */
         s->timing[1] = data & 0xf07;
@@ -221,8 +223,9 @@ static void tsc2005_write(TSC2005State *s, int reg, uint16_t data)
         break;
 
     default:
-        fprintf(stderr, "%s: write into read-only register %x\n",
-                        __func__, reg);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: write into read-only register 0x%x\n",
+                      __func__, reg);
     }
 }
 
-- 
2.18.0


