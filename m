Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW3v2-0000ZJ-BV
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 14:02:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v0-0000XW-9D
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:02:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3uz-0006VS-Ca
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:02:50 -0400
Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a]:39055)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3us-0006Rk-FO; Thu, 21 Jun 2018 14:02:42 -0400
Received: by mail-qt0-x22a.google.com with SMTP id p23-v6so3664821qtn.6;
	Thu, 21 Jun 2018 11:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=20S3Xkkd93/Tx2cPXPL3ZOOODl6AKIi4sPb+FLH6a4c=;
	b=mPwEI2qGoyjzFcnaOP66Uwxt+6+NBn3EQAikftZcuyen2c0UHCYrVf/h3yHvr2sanZ
	vPe0cSm7QgZ4uTb7ZKlPGu94dPVwxr9y6q+wytC97L/9+Kg3Ow6drvtZzuKKi6qdkByd
	jj/uY+GmfaezCdqm85WA7ahynMgbDUxSSxsOrq/PN+PF84wgl4w4sQcsE7MjzG2I2a6N
	mQkM9rejHCbaMbm9jneCe6YZDvbQWYGgpkLFd77KYEur1bgS+PK7enwvFumSng9zvzPw
	hnmwFjJM0KepWCQo/BGHPOGyOIvw6UopR5vakB/Uu4wbxLizvGkQ/A2L6Odd16XOEXlx
	qIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=20S3Xkkd93/Tx2cPXPL3ZOOODl6AKIi4sPb+FLH6a4c=;
	b=EExpCYQ56nCPu2RSgoIt6wc1gEk7RdiWWEREQbXGbXpK4HHLon1I+Va9XKsaBQH6Ei
	MXGLNSw+ncxBthNmYuxzzNNU0I44fGcIl286g44WS1hLuax57pimSixOG3AEM0HR8mrM
	4ugAjSHa6AoIKwDeUN+9a9ch0i4FuIBc5v+7Api6LEyaN1q+6oaSRPcy5Jy7qD7X+gal
	e/SPGjzBlqcsItB9sc8OphqgUXx6S0pVzPQfiXx/YYU4ATQli00wTitpi4/+pmyC5+Y8
	O09hXpExg/y9YDUEcSqZIgH0gYFTYb4MfmTtlPjcSoQ7ucgKbcyR3lWLyA1SB0wZ0oLS
	FkTA==
X-Gm-Message-State: APt69E2RABO6mmLejGk9NJKTbD6Kec4jACeMzY9LrjMinWKrfZLcaYes
	igrdPkFVlmQrmh0SYC+pwS7UnS7C
X-Google-Smtp-Source: ADUXVKLATOXWSS/37jTf1r8M4NLy70H2o7TJH4zUzGtGMtMjjV6s2MtEuYJmR+zbD+L9PZgNDtOLuQ==
X-Received: by 2002:ac8:914:: with SMTP id
	t20-v6mr5743567qth.298.1529604161819; 
	Thu, 21 Jun 2018 11:02:41 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.02.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:02:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Thu, 21 Jun 2018 15:02:15 -0300
Message-Id: <20180621180224.8312-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621180224.8312-1-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22a
Subject: [Qemu-trivial] [PATCH 02/11] hw/input/tsc2005: Use
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
X-List-Received-Date: Thu, 21 Jun 2018 18:02:51 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/tsc2005.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 7990954b6c..8e1d6b6f21 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/hw.h"
 #include "qemu/timer.h"
 #include "ui/console.h"
@@ -208,9 +209,11 @@ static void tsc2005_write(TSC2005State *s, int reg, uint16_t data)
         }
         s->nextprecision = (data >> 13) & 1;
         s->timing[0] = data & 0x1fff;
-        if ((s->timing[0] >> 11) == 3)
-            fprintf(stderr, "%s: illegal conversion clock setting\n",
-                            __func__);
+        if ((s->timing[0] >> 11) == 3) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: illegal conversion clock setting\n",
+                          __func__);
+        }
         break;
     case 0xd:	/* CFR1 */
         s->timing[1] = data & 0xf07;
@@ -221,8 +224,9 @@ static void tsc2005_write(TSC2005State *s, int reg, uint16_t data)
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
2.18.0.rc2


