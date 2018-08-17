Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fqdax-0006Wu-7Y
	for mharc-qemu-trivial@gnu.org; Fri, 17 Aug 2018 08:11:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hans-erik.floryd@rt-labs.com>) id 1fqdav-0006Wj-TI
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 08:11:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hans-erik.floryd@rt-labs.com>) id 1fqdas-00022A-Pa
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 08:11:09 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:32858)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hans-erik.floryd@rt-labs.com>)
	id 1fqdas-00020p-I1
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 08:11:06 -0400
Received: by mail-lj1-x230.google.com with SMTP id s12-v6so6189614ljj.0
	for <qemu-trivial@nongnu.org>; Fri, 17 Aug 2018 05:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rt-labs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=C630EjXGywW3R5T8Ph+gchKiZk8BCxuNsw+lx5GsFXk=;
	b=YEJ6i94l4QXFhQRnt4kZrDX5kmNO/eENJuwKehU0ZJPhWC/5PFGPip8xz0rRTiE8ZJ
	FTnmzSSuSJJkG0pmrPY/4jtVfr8MU+w4LLooGEpFIaAMv0vB8qH1tp2uIn7EyG9KBEK0
	YYe2OW+gaAOjaLJCix+QFR7y7Qlvdc599ZLyFdrmhMS0RkJ46e0rvsMFfrTWpkCnVM68
	3E+kuw9H3pP/EUCwJBy+PRQ0iKr3OK69c+mMkBzNdA/sSj+ocF0A/BxoEmQu+aKPU8gr
	oJV7Shln8oGDcNtl7xetHdksl6ZXkVOJdeuQ9SioO6BFbFsFpkdyPCYGraoGwAtc9LuE
	9gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C630EjXGywW3R5T8Ph+gchKiZk8BCxuNsw+lx5GsFXk=;
	b=AD4HKBMWjNLoYKscFw1eL5GutJRgKDc7HLxOtOam9dYTG9RUCXX16Hgd71JamI9Q+y
	cL8xKVqI0cCqs3oe3YqUMBfp5SwvYvlBis4ynTbmdlBBe+JV2PXYZs0MneLp6X+BwU6v
	lCVTS/bRylgxUVqx4Bzj8OVf7irygCVCvutZ25tj9WxA4AoqfJj6YAljOGWvH5qp73lK
	DiAsad42re9FAjUW4VkFs0LUPWap5IPuJNfyU5iJQORps+7q36O3QYZihrpjB/jkO2wJ
	7VKT8rmIM+58wCpNSPAcGH219oPHFdab27aY/7lOdgGL2sxX+kvQG3WJDHkuo46Ofb6A
	D0rw==
X-Gm-Message-State: AOUpUlEZDzRZQLs7p1SPUk7ifRCDF7+gbcJWWEPDWb3J7ZNaGCjdNMRG
	ggGBU92EFUtXm5LqK4QhxYgZFg9HPpY=
X-Google-Smtp-Source: AA+uWPyrxT504+JCg3qbkPeJUpceJ+xD1G5E4wAffjb/wWc+bNP6j2rbAYn63Ubmx7wzdKJ7s6PsoQ==
X-Received: by 2002:a2e:4d51:: with SMTP id
	a78-v6mr23296093ljb.106.1534507865078; 
	Fri, 17 Aug 2018 05:11:05 -0700 (PDT)
Received: from rtlap25.rt-labs.intra (h-72-195.A137.corp.bahnhof.se.
	[212.116.72.195]) by smtp.gmail.com with ESMTPSA id
	o11-v6sm373958lfl.1.2018.08.17.05.11.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Aug 2018 05:11:04 -0700 (PDT)
From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
To: qemu-trivial@nongnu.org
Cc: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Fri, 17 Aug 2018 14:10:43 +0200
Message-Id: <1534507843-4251-1-git-send-email-hans-erik.floryd@rt-labs.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::230
Subject: [Qemu-trivial] [PATCH v3] sdhci: add i.MX SD Stable Clock bit
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
X-List-Received-Date: Fri, 17 Aug 2018 12:11:10 -0000

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
index 8f58c31..5201f3c 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1651,6 +1651,14 @@ static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
 
         break;
 
+    case SDHC_PRNSTS:
+       /* Add SDSTB (SD Clock Stable) bit to PRNSTS */
+       ret = sdhci_read(opaque, offset, size) & ~ESDHC_PRNSTS_SDSTB;
+       if (s->clkcon & SDHC_CLOCK_INT_STABLE) {
+            ret |= ESDHC_PRNSTS_SDSTB;
+       }
+       break;
+
     case ESDHC_DLL_CTRL:
     case ESDHC_TUNE_CTRL_STATUS:
     case ESDHC_UNDOCUMENTED_REG27:
-- 
2.7.4


