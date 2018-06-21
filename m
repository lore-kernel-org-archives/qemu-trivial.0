Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW3vF-0000hz-Jk
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 14:03:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v9-0000fG-Vl
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:03:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v9-0006bj-3k
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:03:00 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:36196)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v6-0006ZE-HO; Thu, 21 Jun 2018 14:02:56 -0400
Received: by mail-qt0-x241.google.com with SMTP id o9-v6so3670668qtp.3;
	Thu, 21 Jun 2018 11:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=P2cGOMv5XASCs/xIsDsvutILn8yhZDT+T0Q4s9XeIZQ=;
	b=XSV/S6tWmTuiXzTO2MsW4mXTpWw1Z09En11/T7BUrh33txT3f7Y9P/N+8fSr7tkw0v
	fDGFk1UcZ+4snlQgVbcTPkWXTF2FZTEpr7EhGzwnF52ygvweVOxOma5rQXC/V2LQ0goL
	MmWau8xrds/aMJLRebZyFK+sjcUhZYAoXTg2N2K2aYF4FMbG2hKy+1FlZ66tyln9NuU5
	3m06cJSKLl8beq9YXZpprzwZ3cSA8pwNq1PPQUWs7yhLkcP0uVa65TQcj3Wan++0DdPD
	oDTeJmkDGus8N0MQj23nnYCxeb0ZLPnIajd1NpLYd77+aWUfTBGBbSyJewq6QeAd6QNx
	9AQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=P2cGOMv5XASCs/xIsDsvutILn8yhZDT+T0Q4s9XeIZQ=;
	b=Iybpm7AH63dN5YR9SKADtR58hKRJfzvL5QxTImFmkGE9bT3bCRVUnUFZbaFvTTfbIr
	oX5h/G0R8dMhI1Ktu6r6ZIpGL67L+fi1suGccDl0Ar62yNht4VZfjeh/8TEBwm8JTkpo
	+hql+Rx6tSxTvm+Fkxtsb8JjDgmXGw6HXw3AMAsLkKMT3hK83QqGJtV75kWzDdAAOjWj
	qZDLnjQcqtZnEHs0SprfiMr8BtPvdjGo2jUiOOCnhZGCxUbsHBbxGpcPyL+QJK29LlJX
	J1dta+t50Q4SM0YIbc2qRhklD+NKAz9+a0Y9P0NCQZVd9WaZSU2r4inT0gKpstTDhZT2
	oFwQ==
X-Gm-Message-State: APt69E1yuHFbJBsCN+rR1MDryRDQ1iIC1s/0ILZEZdcb2S43Qo6l0JbO
	9WiLUqouJwXUf384ka284xEcVjVR
X-Google-Smtp-Source: ADUXVKKOn1QOw7iC+lr/EBIVNZLo+mJQDgPoj1KpsAOLFi2xI9rB1s7Tu9MEgy33hMUgEywjbXXapA==
X-Received: by 2002:a0c:ab18:: with SMTP id
	h24-v6mr23291616qvb.138.1529604175868; 
	Thu, 21 Jun 2018 11:02:55 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.02.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:02:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Thu, 21 Jun 2018 15:02:20 -0300
Message-Id: <20180621180224.8312-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621180224.8312-1-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 07/11] hw/i2c/omap_i2c: Use
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
X-List-Received-Date: Thu, 21 Jun 2018 18:03:04 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/omap_i2c.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
index 26e3e5ebf6..e6f34fe31f 100644
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
@@ -339,14 +340,17 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
             }
             break;
         }
-        if ((value & (1 << 15)) && !(value & (1 << 10))) {	/* MST */
-            fprintf(stderr, "%s: I^2C slave mode not supported\n",
-                            __func__);
+        if ((value & (1 << 15)) && !(value & (1 << 10))) {
+            /* MST */
+            qemu_log_mask(LOG_UNIMP, "%s: I^2C slave mode not supported\n",
+                          __func__);
             break;
         }
-        if ((value & (1 << 15)) && value & (1 << 8)) {		/* XA */
-            fprintf(stderr, "%s: 10-bit addressing mode not supported\n",
-                            __func__);
+        if ((value & (1 << 15)) && value & (1 << 8)) {
+            /* XA */
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: 10-bit addressing mode not supported\n",
+                          __func__);
             break;
         }
         if ((value & (1 << 15)) && value & (1 << 0)) {		/* STT */
@@ -392,8 +396,11 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
                 s->stat |= 0x3f;
                 omap_i2c_interrupts_update(s);
             }
-        if (value & (1 << 15))					/* ST_EN */
-            fprintf(stderr, "%s: System Test not supported\n", __func__);
+        if (value & (1 << 15)) {
+            /* ST_EN */
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: System Test not supported\n", __func__);
+        }
         break;
 
     default:
-- 
2.18.0.rc2


