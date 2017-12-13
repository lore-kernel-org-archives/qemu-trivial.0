Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePDBt-0002vm-Bg
	for mharc-qemu-trivial@gnu.org; Wed, 13 Dec 2017 14:59:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDBq-0002t0-NS
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 14:59:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDBl-0005XQ-Ph
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 14:59:38 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:39075)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDBj-0005Vz-Bv; Wed, 13 Dec 2017 14:59:31 -0500
Received: by mail-qt0-x244.google.com with SMTP id k19so5215577qtj.6;
	Wed, 13 Dec 2017 11:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RmG/wUcbgmzb7Ka3YwOgkzKBo14/fgQtu6bUWRa0u7o=;
	b=HQL/gxvWh2MO1WXmnpdlaeao5l4bu63SouYSavcqzINt0kqdCaQok1nBio6TY4Orr8
	+585HO1EtGyRKI1NxR+uZX/LwmRknFKdp1sO38IREylJRwhVf5qTOGRi/lD2+EdDYFUg
	mN60kTfajgdYAt5XtpYII+Jn76yGSeiM+Njx8e4vYwBkoi4srIjipRXk8bApmv4LgMZc
	axu2rQwOTQmW4K4wPk5dBQ50H4SzDjTJPb7MAX19KyvfB1FCw8zirq8Ik0nqy1yYayIk
	amBbtX3Nbc7ecdALex2Pt92Qw27WwzpkDpbCRDEDWBSA0JJzBf7ZunacnNJNAF9hLZzC
	HZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=RmG/wUcbgmzb7Ka3YwOgkzKBo14/fgQtu6bUWRa0u7o=;
	b=nQV1ol/IhMzLxj7NKnJI7J71WTnXHAYQ9Wu7ECkqAJV0BN/1UYDuzO8E1wl+l7FrSU
	cgtcr5+/pUCmR1u2bmshS97reyDbA6/jG0/72/Up67kRYvJMqSTKXpWuK+VYHLOaqjPh
	gvOF8gr+VK7pY36Wptgxz+2F3Vgc9nWKvI1xfcU5H4NPAcmiEFveRbpGU/c0Yr+UpDw9
	vB6CxzACN+iEhJSgX29juRI4EVWGaUfmV60Rvu81uhkoyyxUP/n4C2mxP6ZGPLlvhu/3
	P5xZ6ZaarGlEBlW+C1DRlmRhD//w9cKO4BcZjGXks8jKtxvbi5CV07zud8ZYa+6kdfd6
	Hwfw==
X-Gm-Message-State: AKGB3mJEEJOOJYIWnSsOvU54ZKezi2x3afjk5EptyxXMltp193MP9wyR
	Jm9YQo9G2uYZb991b92UUKw=
X-Google-Smtp-Source: ACJfBosU9c+WbXNR/CIIPseqAZQhRPEDeeQPV3RdZj0OEDsgTDnb2rSpFb+UElRcjNW+uNWpiEmDBA==
X-Received: by 10.200.39.196 with SMTP id x4mr12269552qtx.246.1513195170769;
	Wed, 13 Dec 2017 11:59:30 -0800 (PST)
Received: from x1.local ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id o5sm1518876qtc.72.2017.12.13.11.59.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 11:59:30 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Sai Pavan Boddu <saipava@xilinx.com>
Date: Wed, 13 Dec 2017 16:58:43 -0300
Message-Id: <20171213195852.30439-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171213195852.30439-1-f4bug@amsat.org>
References: <20171213195852.30439-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 05/14] sdhci: move MASK_TRNMOD with other
 SDHC_TRN* defines in "sd-internal.h"
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
X-List-Received-Date: Wed, 13 Dec 2017 19:59:39 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci-internal.h | 1 +
 hw/sd/sdhci.c          | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 248fd027f9..e941bc2386 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -43,6 +43,7 @@
 #define SDHC_TRNS_ACMD12               0x0004
 #define SDHC_TRNS_READ                 0x0010
 #define SDHC_TRNS_MULTI                0x0020
+#define SDHC_TRNMOD_MASK               0x0037
 
 /* R/W Command Register 0x0 */
 #define SDHC_CMDREG                    0x0E
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 295a89e5d3..a56c0c273e 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -120,7 +120,6 @@
     (SDHC_CAPAB_BASECLKFREQ << 8) | (SDHC_CAPAB_TOUNIT << 7) | \
     (SDHC_CAPAB_TOCLKFREQ))
 
-#define MASK_TRNMOD     0x0037
 #define MASKED_WRITE(reg, mask, val)  (reg = (reg & (mask)) | (val))
 
 static uint8_t sdhci_slotint(SDHCIState *s)
@@ -1043,7 +1042,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         if (!(s->capareg & SDHC_CAN_DO_DMA)) {
             value &= ~SDHC_TRNS_DMA;
         }
-        MASKED_WRITE(s->trnmod, mask, value & MASK_TRNMOD);
+        MASKED_WRITE(s->trnmod, mask, value & SDHC_TRNMOD_MASK);
         MASKED_WRITE(s->cmdreg, mask >> 16, value >> 16);
 
         /* Writing to the upper byte of CMDREG triggers SD command generation */
-- 
2.15.1


