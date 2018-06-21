Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW3vA-0000fb-5H
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 14:03:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v7-0000cv-D6
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:02:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v5-0006Yj-5I
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:02:57 -0400
Received: from mail-qk0-x232.google.com ([2607:f8b0:400d:c09::232]:37057)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v1-0006W6-BX; Thu, 21 Jun 2018 14:02:51 -0400
Received: by mail-qk0-x232.google.com with SMTP id j12-v6so2259641qkk.4;
	Thu, 21 Jun 2018 11:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5wFXK/Bo0FmCAyfAQjAU8aog0F/qXtyqX/hHJsEafOw=;
	b=Upqi53/+8AiYAVAxebGqwb1y9gKf+dgkSBBtqpWqsYLv5GyZX9uC3hUr0G2WPihaM6
	y2DTEvPkGdgJjW+B7lSz970umH67goRpUv9foaJMNH1imLNyYRb9b0F5+UVJVBY+9/CR
	iDW+R2OSbMd7leGKiREbVioADZH12EpbkkcGjtFUaY7GOHs0n8elpxxVh1CHi263/Ifz
	n0TRPQnyoXu7doSz6jXsbfkb/QOIe+9Jk51BLH48VJTj7xhc8drxUutixuqdcx7v18gs
	ilvXgGSx4ryHH3hlIJueYspa0PKEs0WFLCs8DeGM1WFfcGpgDDmL0qDz9v41wqdwQoMu
	HrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=5wFXK/Bo0FmCAyfAQjAU8aog0F/qXtyqX/hHJsEafOw=;
	b=FlWNMmoIu0/WL6MapkbCLHuH/PBK4EqiLJphiNtuP+DNicB03kse4sjfwFd9gvl9rf
	8vyvyYt+fze9bf5kIxCmU27qZdaDOymh3ZFmKOE++41FoK2ZlvWholxhiUGu/+81ONUY
	da5d+hITFZzikafqjnr0x3zKtfuMUh51KVkR9ZfcVkWqJfqmAFFPv+Q641wXKmjwRmA6
	PNIRFuuMFNGDNPJPR9Y0zs2I0mfnafPwuiJzLCTb4LYqvQn+Ngf387lj9oJy9L2mNbml
	1FtDVEabmllQsdQMZ0Hi6r71zKUH4NgUPfhxQ5KUREdwARTfwrOzO8/8gcEv1NCPJRG3
	i1SQ==
X-Gm-Message-State: APt69E0Prkz4b1d0pdNRe9AcUeL7vEZV0RVOiBKlKFz3jNu7gOqsZjyE
	6N/s/OO3X4RipXSpGEHVFaU=
X-Google-Smtp-Source: ADUXVKKWcV23fRK6uJ9/ouiPqBUDcxgWsz91sxZ/KQ3d/nXdkIV37BX4quo79R3/sR8A51jFvME88Q==
X-Received: by 2002:a37:1f08:: with SMTP id
	f8-v6mr22409913qkf.304.1529604170527; 
	Thu, 21 Jun 2018 11:02:50 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.02.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:02:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Date: Thu, 21 Jun 2018 15:02:18 -0300
Message-Id: <20180621180224.8312-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621180224.8312-1-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::232
Subject: [Qemu-trivial] [PATCH 05/11] hw/ssi/omap_spi: Use
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
X-List-Received-Date: Thu, 21 Jun 2018 18:02:58 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


