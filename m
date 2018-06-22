Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWMJM-0006D9-0b
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 09:41:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJJ-0006AN-KF
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJI-0003T9-Gs
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:09 -0400
Received: from mail-qk0-x232.google.com ([2607:f8b0:400d:c09::232]:40631)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJE-0003NV-7K; Fri, 22 Jun 2018 09:41:04 -0400
Received: by mail-qk0-x232.google.com with SMTP id b129-v6so3660966qke.7;
	Fri, 22 Jun 2018 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9sCP0/1z6bl6hGhJNNvahAaExTnmCvOayGAPqQXr47Y=;
	b=EEXDmLEPV6PIQuLJih3jmkeWYzOKMjAe2YEiJipUxwFsGVtHbKjjL9KFytIDmarVEH
	S2UzGp9TfZdSLOU8oox8Ne0B8DbyF/GIaRsTr4VTi45VYJJ6NavqaBMysg6e20aURf3g
	Ehy4RWG3i5g9+HAiBKi0DYPhu44amB8rAB4bEWZWlmf5OxquMA7H67P5wekkO0uItcBj
	Vful46VbtxoTwXxZdzf7UE3I69y0H5CoJB/fgnZVQwyzAtiz3tlH1h+99/6lOrYVwovM
	fFuwpJPcTLDFy7DO1/V42eoI+XsELiDkCWry2Vh0GrYEd++kAXzF8Y+hm/+pvklIU4uw
	KkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=9sCP0/1z6bl6hGhJNNvahAaExTnmCvOayGAPqQXr47Y=;
	b=PjQpygvXBkrUsdwE9Qsdy5ogGu77gtDiTouX5KcklGlQWZfvwpyUbdGizgN2tyFPK9
	jiMI27jDZwdTESjObEp6xxKeJPjbHU+pPuz6di8q/9muZItQRTVS3mBiqf0+RhJMRi2k
	N4prBRaTi20Z2Jx8t6D2V4FXREdcioHxmZhV1GCHjGgE0oj6wiIASGIN8DKYivjpgXaL
	VAd3z+/rlOCD/VQcBL5YBNq5p0d+V31QssyAZ4hAB2NeWt5Mlu1xhdSLzLgZr8qSXX/9
	W6cE3M/DsmGHLOKHN2LZgP7g6UdFSRbL7eZpTcPRTqk/UeZsvZLSnkhmpL6OzvIuQihf
	dERg==
X-Gm-Message-State: APt69E1SDWPBQLCUQCVj1M5JTxpiNbC/KvZ3kep61pvTLv4GLJidTuOe
	qSRPK8PNDkBpMdSHwRnscUU=
X-Google-Smtp-Source: ADUXVKI4Xwf1Q57XdGU4vSSGUfJMUjSL8sx1qbNk4ujUEx/IrgBStPD0AB2DDro+42mOGut507qcVA==
X-Received: by 2002:a37:2dc7:: with SMTP id
	t190-v6mr1258043qkh.229.1529674863464; 
	Fri, 22 Jun 2018 06:41:03 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.41.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:41:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 22 Jun 2018 10:40:29 -0300
Message-Id: <20180622134036.23182-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::232
Subject: [Qemu-trivial] [PATCH v2 07/14] hw/i2c/omap_i2c: Use
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
X-List-Received-Date: Fri, 22 Jun 2018 13:41:10 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/omap_i2c.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
index 26e3e5ebf6..690876e43e 100644
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
+        if ((value & (1 << 15)) && !(value & (1 << 10))) { /* MST */
+            qemu_log_mask(LOG_UNIMP, "%s: I^2C slave mode not supported\n",
+                          __func__);
             break;
         }
-        if ((value & (1 << 15)) && value & (1 << 8)) {		/* XA */
-            fprintf(stderr, "%s: 10-bit addressing mode not supported\n",
-                            __func__);
+        if ((value & (1 << 15)) && value & (1 << 8)) { /* XA */
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
+        if (value & (1 << 15)) { /* ST_EN */
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: System Test not supported\n", __func__);
+        }
         break;
 
     default:
-- 
2.18.0.rc2


