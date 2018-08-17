Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fqdWw-0001kk-LA
	for mharc-qemu-trivial@gnu.org; Fri, 17 Aug 2018 08:07:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hans-erik.floryd@rt-labs.com>) id 1fqdWu-0001jn-5k
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 08:07:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hans-erik.floryd@rt-labs.com>) id 1fqdWq-00077f-LX
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 08:07:00 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:45036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hans-erik.floryd@rt-labs.com>)
	id 1fqdWq-00076u-Cn
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 08:06:56 -0400
Received: by mail-lf1-x134.google.com with SMTP id g6-v6so5713181lfb.11
	for <qemu-trivial@nongnu.org>; Fri, 17 Aug 2018 05:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rt-labs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Izq2mdrzh/1EFxKmE7OHVz/7844JiH+gH4SQwALvfrY=;
	b=OMgpd22wYaVryMjyJnylj9av2IM5qcAeakrHhkUy1PeuWr03h6JpMnAnWmonKxQaB7
	9Wio6dXXlJBIiDIm8cNE+9R4/afEyL+1sbQ9HPkQ9qRY02vVS1pvgekBNY8+3UCZ387d
	KSjSi+WDZ4J3RAzGjAt/ec3z4aCFXPJGixVvY+91OMahpmatSGDN7DJeHk3DtiLL1K7M
	MNMKmyQyO56mvpNiVtyyMYOfMS51kAGfRzFj4K7feLS7DTPVDS4D21bnRuzxyBToiXb+
	WSeNRWgELUv/6n96a5yE11qp5s/zRGTh7qYNDlviY8Gok644qSESqh4G5ztKdhqLO2qx
	AtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Izq2mdrzh/1EFxKmE7OHVz/7844JiH+gH4SQwALvfrY=;
	b=lCnnv6XY7GkPG7VFKukbhN3I+IEBjiQHL87nOPsH8N4mfJPjwEVmGp2fiXGmxlRgyU
	O3yz5D2HDy6nGvSgJcbWg0Vga1lf6Uy0VXcB8aSHOWFjw8zjfGjdqBQWfhnmL76LIzlj
	S1qMP2yDDQmgBd06LZYbGmTJJGkW5tKv44k/EBtZtGufExuN8/3D9/VLRfHDuI0FSfBE
	kXdWdeyzi92IZHQpC6zwEasWrY3jjjAGcpIOyiLXDZcyOwsRS8E+/LMDMBTAhr0SarCk
	hza1TZY5B1I6wMKsc0k0XHe09mwowq1O7ssYa4Qxn5k46nVCh1njwMTwFSqfIbEByuET
	N80g==
X-Gm-Message-State: AOUpUlFL+8I9hVmvHIsRIyoIUiA1mIWkG23EoH5Q0NI7YuPd+nflsPIM
	3i0egu1lwzL6u8SyvGXJ6AyPCX3INTM=
X-Google-Smtp-Source: AA+uWPxad1QQ8QFevzXoMflyOvUkaRf91DXQSuxcMUdHwhN07PyBwCGUHj8T/kunI2PvsXi21SqTVg==
X-Received: by 2002:a19:115b:: with SMTP id
	g88-v6mr1589576lfi.57.1534507614706; 
	Fri, 17 Aug 2018 05:06:54 -0700 (PDT)
Received: from rtlap25.rt-labs.intra (h-72-195.A137.corp.bahnhof.se.
	[212.116.72.195]) by smtp.gmail.com with ESMTPSA id
	q16-v6sm283451ljj.68.2018.08.17.05.06.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Aug 2018 05:06:53 -0700 (PDT)
From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
To: qemu-trivial@nongnu.org
Cc: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Fri, 17 Aug 2018 14:03:52 +0200
Message-Id: <1534507432-2873-1-git-send-email-hans-erik.floryd@rt-labs.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::134
Subject: [Qemu-trivial] [PATCH v2] sdhci: add i.MX SD Stable Clock bit
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
X-List-Received-Date: Fri, 17 Aug 2018 12:07:00 -0000

Add the ESDHC PRSSTAT_SDSTB bit, using the value of SDHC_CLOCK_INT_STABLE.
Freescale recommends checking this bit when changing clock frequency.

Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
---
 hw/sd/sdhci-internal.h | 2 ++
 hw/sd/sdhci.c          | 8 ++++++++
 2 files changed, 10 insertions(+)

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
index 8f58c31..23069e8 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1651,6 +1651,14 @@ static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
 
         break;
 
+    case SDHC_PRNSTS:
+       /* Add SDSTB (SD Clock Stable) bit to PRNSTS */
+       ret = sdhci_read(opaque, offset, size) & ~ESDHC_PRNSTS_SDSTB;
+       if (s->clkcon & SDHC_CLOCK_INT_STABLE) {
+          ret |= ESDHC_PRNSTS_SDSTB;
+       }
+       break;
+
     case ESDHC_DLL_CTRL:
     case ESDHC_TUNE_CTRL_STATUS:
     case ESDHC_UNDOCUMENTED_REG27:
-- 
2.7.4


