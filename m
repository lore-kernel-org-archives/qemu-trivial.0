Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fqHPC-0005tu-Nv
	for mharc-qemu-trivial@gnu.org; Thu, 16 Aug 2018 08:29:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hans-erik.floryd@rt-labs.com>) id 1fqHPA-0005sX-Gl
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2018 08:29:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hans-erik.floryd@rt-labs.com>) id 1fqHP4-0008FJ-QY
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2018 08:29:32 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:34445)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hans-erik.floryd@rt-labs.com>)
	id 1fqHOz-00088Z-5O
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2018 08:29:24 -0400
Received: by mail-lj1-x244.google.com with SMTP id f8-v6so3519759ljk.1
	for <qemu-trivial@nongnu.org>; Thu, 16 Aug 2018 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rt-labs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=W8XY0EP9ae+WqaLnakGIReV/uWFOMxsmGsoGS45KijM=;
	b=TvU4MPFneunoS0beW9pDUh0Tlrtbbbk5js02sBWWwdVdMK4Rmc0j7Uxx+x9DtKG3SR
	BhmneqH1X4oR6pc5KZzFgOquQsRICZXm42A84N5ekbBW8FSZ6jdTNsgpK/oTmrlfQCB9
	ytGEqrgnOpWsHV9U3MyVWC2Dgj6Y8SC+DXx85sFF8VMVdhCajdhaVz4rS0ZC7h2UZFpa
	pxgguZMDq30rOgFMhtfKAN8VuNcGPBa38jtIqQVgdBWWn3Pnhpln6lVJy2ZA5oKXZM5Q
	MG7okCr7iUm7aZGCuSfhTMPwWBj/XLciRuJctihgbBl2WtXJfOMNgQD/Wt5+0r4O91Ih
	nEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=W8XY0EP9ae+WqaLnakGIReV/uWFOMxsmGsoGS45KijM=;
	b=oR0h/18cCvPtIjZnhduqbMJuMy934uFhT8GGHT/2JOaZ1ghUkzYKVf+g5DMW6iq2mV
	kFdjYlVKSfCVsEqlRJRm9AHgo4g2zmmIVyoqkG5lYytEa2f9/VbIvPbriWggtJq+qxJH
	BYFxb0mTxEuC8wwMIEa2cd0Fds3jbdo0t4kxEIhzlixxC08Kx4XT8/LFAvn6ZcqEHyXc
	gIi5jZ+hMbmXKw2PXVyamfv9Yh27d6TS8VLK8FgwwFwH0SvctFlRqWuNV9tKIedJK7uE
	/s4r4UZ/ybLwolzhuJpkyDIxqbWz+j3rFzzHjkbyJ6Kn4cd3eC9doSszM4Kwq9NDAAva
	KjLQ==
X-Gm-Message-State: AOUpUlEn65Ld/07QQx8gTEvjSx3BOlIT+PZ92Bf0iO9TZhSLx/ThvpPR
	j2domNx/YOoJSJPJW2MB5tn2zQ0eMjo=
X-Google-Smtp-Source: AA+uWPyvHeU1yrEHrc5FU6MDmai/UUQIS1iqSaDboTeHRMIqyyQWEBaIzROXL992Lr4KWjTmerwPyA==
X-Received: by 2002:a2e:91d6:: with SMTP id
	u22-v6mr20562185ljg.64.1534422554330; 
	Thu, 16 Aug 2018 05:29:14 -0700 (PDT)
Received: from rtlap25.rt-labs.intra (h-72-195.A137.corp.bahnhof.se.
	[212.116.72.195]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm4314721ljc.56.2018.08.16.05.29.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Aug 2018 05:29:13 -0700 (PDT)
From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
To: qemu-trivial@nongnu.org
Cc: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Thu, 16 Aug 2018 14:29:00 +0200
Message-Id: <1534422540-18815-1-git-send-email-hans-erik.floryd@rt-labs.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: [Qemu-trivial] [PATCH] sdhci: add i.MX SD Stable Clock bit
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
X-List-Received-Date: Thu, 16 Aug 2018 12:29:33 -0000

Add the ESDHC PRSSTAT_SDSTB bit, using the value of SDHC_CLOCK_INT_STABLE.
Freescale recommends checking this bit when changing clock frequency.

Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
---
 hw/sd/sdhci-internal.h | 2 ++
 hw/sd/sdhci.c          | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 756ef3f..19665fd 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -302,4 +302,6 @@ extern const VMStateDescription sdhci_vmstate;
 #define ESDHC_CTRL_4BITBUS              (0x1 << 1)
 #define ESDHC_CTRL_8BITBUS              (0x2 << 1)
 
+#define ESDHC_PRNSTS_SDSTB              (1 << 3)
+
 #endif
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 8f58c31..cb82782 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1651,6 +1651,13 @@ static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
 
         break;
 
+    case SDHC_PRNSTS:
+       /* Add SDSTB (SD Clock Stable) bit to PRNSTS */
+       ret = sdhci_read(opaque, offset, size) & ~ESDHC_PRNSTS_SDSTB;
+       if (s->clkcon & SDHC_CLOCK_INT_STABLE)
+          ret |= ESDHC_PRNSTS_SDSTB;
+       break;
+
     case ESDHC_DLL_CTRL:
     case ESDHC_TUNE_CTRL_STATUS:
     case ESDHC_UNDOCUMENTED_REG27:
-- 
2.7.4


