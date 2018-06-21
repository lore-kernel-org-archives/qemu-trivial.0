Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW3vH-0000kR-SI
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 14:03:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v9-0000es-Eb
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:03:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v8-0006bU-H7
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:02:59 -0400
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:43344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v4-0006Y6-50; Thu, 21 Jun 2018 14:02:54 -0400
Received: by mail-qt0-x229.google.com with SMTP id y89-v6so3654524qtd.10;
	Thu, 21 Jun 2018 11:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zGA7Hc9q0oL5P8/T0PP2RkTpDI0zmJwsuY+vQQNtTZc=;
	b=lu0oe8BDLDxcM2JxR2p0cyeClXRsmjS/KjNlMuP9MjD1STX1YwHZqujO1NtdmIYdWB
	oYeubUT7HgV0R5YzvdmoJATGXQN5rWJlhvoHsPMz+t1k0uJDKmZZbltc/H0PsKCU70WO
	zeTp1xGcP+OQYsfDeBxpRxKBaq8dF2tunEBi+FKdqcfU8aKjgJ5v/cwbZaXeOjU5kdhe
	bAz+ZPnv/DOF2g0m5CDcBp3oOvAHY2RwQy7hVfejZgxmP3KCq6LJjoZebw5ZjERJhXV/
	wyteXY9l0GIhjAc/1oNpWqHtomtq+ZbUHvI+DQoal0eAuxlbxWK4OGWTl80s7dGcFtrt
	QrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=zGA7Hc9q0oL5P8/T0PP2RkTpDI0zmJwsuY+vQQNtTZc=;
	b=Z5gISRYmPyQiOQOZSN0VElUmG0T0avtFfE3tLywXAkYglN4gjFbTHNHf00x6yNh0o5
	loZPc1iOqh6/+dUCl5k5Hb/W0S58kWJOTdlT3H1NlrHTPGoKSZnkkYM2lZvkXHZy2CPA
	I/OUM2GI6q+3c8MEBJ43wA4CuccTlUiBwQGRqYNJ7yad6dSytxgzVvFx7pNV9J27bpZm
	dhkygB82P6nKeOKuJZf9IoudBeUhndfG+ygIl+nqbhAs3L4YLT+P3A96uVrnoO+jeJ6y
	XYQKKNJALpij6vxj+ReJ1iEZkKeyfVOdxvjygyKK3ADKTqXIp5Ap8W/GV7lnRWQl7Wul
	2yRA==
X-Gm-Message-State: APt69E2omZdtiZsepthYXoAI6J5CPEDlO//a2he4DioX3nZXDGYKyz2Z
	I2LQ1m61BLjbHEnsI0Eblso=
X-Google-Smtp-Source: ADUXVKL59FmIOmOOByOrWO6IglA7mQGs9bxZTmT0BWBvcWKjKS/bTr1FPnWZbfY7tuRmxgrsvdeKAA==
X-Received: by 2002:aed:3f6d:: with SMTP id
	q42-v6mr24126262qtf.375.1529604173428; 
	Thu, 21 Jun 2018 11:02:53 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.02.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:02:53 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Thu, 21 Jun 2018 15:02:19 -0300
Message-Id: <20180621180224.8312-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621180224.8312-1-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: [Qemu-trivial] [PATCH 06/11] hw/sd/omap_mmc: Use
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
X-List-Received-Date: Thu, 21 Jun 2018 18:03:04 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


