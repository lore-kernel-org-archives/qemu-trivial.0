Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWMJd-0006Ub-CW
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 09:41:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJa-0006RZ-Cm
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJZ-0003pX-Dt
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:26 -0400
Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236]:34695)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJU-0003ib-8r; Fri, 22 Jun 2018 09:41:20 -0400
Received: by mail-qt0-x236.google.com with SMTP id d3-v6so5938063qto.1;
	Fri, 22 Jun 2018 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2Rc5TAl46HafWUsGlR1lgCO1U+OFpadWowwoZjTJ3L0=;
	b=B4n3h7kLsaaPHmNHddM/x3CK6hEnb4viQPRXplCplFte+rQcGdPvAqAlAopbzmY1eN
	XPgsNw9ay+bNkBrFYh7ip3lumyMMdWXdiwsxwBmcwzs4bjgGedUVz/IKTx38NG413gEo
	bnc4qImTJ6cUGNLGNol+tW8knc6nnskPNuvxjXOgUIzGNIgHskDJq/nX3IEVru99VqVH
	+hx0GA+RRZn/lwlvDl7MiF/I+y0MrozsHG/hoNP91LRrhJ9B6nEZ2OyEcNrvv6OfL9ah
	OWiMYHLRiDJsYDKnPIkHelSCx37mQkXlO/KWiFQKCEiMkWNUmxXJtHPrf4PWz0hN9/G/
	zOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=2Rc5TAl46HafWUsGlR1lgCO1U+OFpadWowwoZjTJ3L0=;
	b=kyIeU2pTZnlq8FJrwUzdTuA3R/pf9M2CK4UtOc7O1+AR0c0tP14n9gzW6b49j5OCtR
	sjF2HKkRhEMky4EySR/flMapKtnvTd8Vga6HxwZp/VII66lsZCWWUXdrX8cEp84sZNDz
	E8GU8g8OZ5zszaQdnvEMgYVVVrAbL5Rer/h4vTzphDHhV56ZDYcSuMG/J8crufkW5hEM
	p+/wpaHxcmOaJkDWBdB/IuZbdcYzlvecEJ/d/y+yo1wM3l8UMofCDyq1NPbeaTANjkOs
	qLl+8PFrXIr6XB7TUDt+WVfxyxVdwe9vHFpC/osy3Wuvs/aoFgbBIO4mYRbU4okIrLq0
	InDQ==
X-Gm-Message-State: APt69E3uET2D55oSNdnLE7IWw8/+1e5+Xnp8wZuv0giCwpi8Wr9md+NT
	bgWi4EUZz4+RBc24ihkm0FE=
X-Google-Smtp-Source: ADUXVKJSD3Z8XFCWddskcpSU9++PJjZw1I9Xm9aO3Ox1u6rmQ+8/swiAn1AT/2IpCpOBrsm0hr9YSQ==
X-Received: by 2002:ac8:1285:: with SMTP id
	y5-v6mr1395122qti.164.1529674879570; 
	Fri, 22 Jun 2018 06:41:19 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.41.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:41:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Date: Fri, 22 Jun 2018 10:40:35 -0300
Message-Id: <20180622134036.23182-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::236
Subject: [Qemu-trivial] [PATCH v2 13/14] hw/net/smc91c111: Use
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
X-List-Received-Date: Fri, 22 Jun 2018 13:41:28 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/smc91c111.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 9094c0b47c..d2fd2040e8 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -362,10 +362,14 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
             SET_HIGH(gpr, value);
             return;
         case 12: /* Control */
-            if (value & 1)
-                fprintf(stderr, "smc91c111:EEPROM store not implemented\n");
-            if (value & 2)
-                fprintf(stderr, "smc91c111:EEPROM reload not implemented\n");
+            if (value & 1) {
+                qemu_log_mask(LOG_UNIMP,
+                              "smc91c111: EEPROM store not implemented\n");
+            }
+            if (value & 2) {
+                qemu_log_mask(LOG_UNIMP,
+                              "smc91c111: EEPROM reload not implemented\n");
+            }
             value &= ~3;
             SET_LOW(ctr, value);
             return;
-- 
2.18.0.rc2


