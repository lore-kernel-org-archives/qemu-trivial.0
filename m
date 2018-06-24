Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWwIj-000472-64
	for mharc-qemu-trivial@gnu.org; Sun, 24 Jun 2018 00:06:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIe-00044q-7b
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIZ-0003yL-BI
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:06:52 -0400
Received: from mail-qk0-x22b.google.com ([2607:f8b0:400d:c09::22b]:33965)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIW-0003tt-Ow; Sun, 24 Jun 2018 00:06:44 -0400
Received: by mail-qk0-x22b.google.com with SMTP id b66-v6so348569qkj.1;
	Sat, 23 Jun 2018 21:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zGB87WBZUxSYqYPuFSOnGGcEOOn/B+mDAgxK88CRyao=;
	b=tV5T+H4Dj8ANICMMuoasIMIFnuyPUBVIcbpjZLIpYM13neWGIp7M2mZO4zaRsSGFK/
	FHDHvVfvUz5faegE9Endy5Fc/rdo0fIcpmwPdwkkhTLKlCWpHIsW3TLdzwLDTe8wfbum
	WJUwfZcxYtkg5T76VRwxjiMELYi4MMkhzgWwqhZzIndwk7Be7AT5Rg4peefl8UVURFfO
	sGhsqfzc0HU34O+eyY15M48dLeYjGF7R3ofCHxpfYdZ2KMEpcCpBqk2CYm5U74VVuVEO
	qh6bMonvxSMi7w2kLZHq98DIqMhV9ujgCSX+yB3QSGupalVW1WMJT4nA5LMaoP+PdmCB
	ZbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=zGB87WBZUxSYqYPuFSOnGGcEOOn/B+mDAgxK88CRyao=;
	b=QGbbvNFyOr8mVLig30QvEQKUL41KE7sWBXWkhNXL3TK2FJNFM2EBeWt8DYYdu4YAkR
	IvemWGLIhcCQCArshFechU0+4/67PxAWCBfw58lnhuZ/TStF4rgKX19aLA5vTqAK2B/b
	hlA4x7KtIm7CPKEDJ4PCKjplLTAJd+URCzRLn8T8qF2TIVoI6U7E+qSzN8RsfKzqoea/
	TBctpM0V96TpVhxzUbKiMimugSedCJ/4LvTnt8m7iPocsfc2biEk6SiCnIDgMBuDfMVg
	/BjYJkK1BK6WheDTskSUtjJ2FxJc3DzP9xqzC6/fC+jMk45QCvEx1nZ31Rswyl5mC8zk
	lQMA==
X-Gm-Message-State: APt69E2zFagdMlJqddrB/4dX19wP3MVOxo4QkZt305wNgv4/H+T7ewY9
	8McA4feFagBetymCSGFxkOk=
X-Google-Smtp-Source: AAOMgpdOSd/j5HLUqaaAv8eNLPPl91LORHLwmOEcpmMlaziqSt+3jvdxnLB/OnxzI3fUL0SfvwLz/A==
X-Received: by 2002:a37:9286:: with SMTP id
	u128-v6mr6189282qkd.29.1529813204279; 
	Sat, 23 Jun 2018 21:06:44 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Sun, 24 Jun 2018 01:06:00 -0300
Message-Id: <20180624040609.17572-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22b
Subject: [Qemu-trivial] [PATCH v3 07/16] hw/i2c/omap_i2c: Use
 qemu_log_mask(UNIMP) instead of fprintf
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
X-List-Received-Date: Sun, 24 Jun 2018 04:06:53 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
Thomas: I used 4 <spaces> for 1 <tab> to keep checkpatch happy.

 hw/i2c/omap_i2c.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
index 26e3e5ebf6..cabd348b45 100644
--- a/hw/i2c/omap_i2c.c
+++ b/hw/i2c/omap_i2c.c
@@ -17,6 +17,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/hw.h"
 #include "hw/i2c/i2c.h"
 #include "hw/arm/omap.h"
@@ -339,14 +340,15 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
             }
             break;
         }
-        if ((value & (1 << 15)) && !(value & (1 << 10))) {	/* MST */
-            fprintf(stderr, "%s: I^2C slave mode not supported\n",
-                            __func__);
+        if ((value & (1 << 15)) && !(value & (1 << 10))) {    /* MST */
+            qemu_log_mask(LOG_UNIMP, "%s: I^2C slave mode not supported\n",
+                          __func__);
             break;
         }
-        if ((value & (1 << 15)) && value & (1 << 8)) {		/* XA */
-            fprintf(stderr, "%s: 10-bit addressing mode not supported\n",
-                            __func__);
+        if ((value & (1 << 15)) && value & (1 << 8)) {        /* XA */
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: 10-bit addressing mode not supported\n",
+                          __func__);
             break;
         }
         if ((value & (1 << 15)) && value & (1 << 0)) {		/* STT */
@@ -392,8 +394,10 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
                 s->stat |= 0x3f;
                 omap_i2c_interrupts_update(s);
             }
-        if (value & (1 << 15))					/* ST_EN */
-            fprintf(stderr, "%s: System Test not supported\n", __func__);
+        if (value & (1 << 15)) {                    /* ST_EN */
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: System Test not supported\n", __func__);
+        }
         break;
 
     default:
-- 
2.18.0


