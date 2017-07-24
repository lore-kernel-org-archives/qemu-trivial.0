Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi6U-0000lY-0i
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:29:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6S-0000jM-6v
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6P-0005LI-3q
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:12 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35959)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6N-0005HV-2W; Mon, 24 Jul 2017 14:29:07 -0400
Received: by mail-qk0-x241.google.com with SMTP id d136so10667176qkg.3;
	Mon, 24 Jul 2017 11:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rS3tqT19YdULv0e9r4PvbAfIJexWBni5G2TDPShS8kQ=;
	b=W3hijY2HaCvuu7ZY0kc+Kgkegao9kPXej/+NBBom1XsOlgH/hhHUwj94/GGzdT/LJQ
	fhQxwMuwP12ICPY0396mOKZ7QfP/hnwsHO819ND/1tdiMl5ndV3iRyKfIhW/bN3zGu/d
	XjY7fKz84m8gOh9ZSbX6Q6iH5lZTztNbHUXS6y72RGnYCq0REpI1WAiLyWVcZGPtXrC3
	iHT6qFPempGuAVNGZa7/NUgmoLOMDoverzU2ftT3tOiQX9ulMd56J2tME+t3UPlXVmLy
	+ltMOyh0WGYakS3UOYPtWgzzo+SBGo+Oos2A+CptB7c3DPR657c1VA2CKVc9Y34usu7X
	UHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=rS3tqT19YdULv0e9r4PvbAfIJexWBni5G2TDPShS8kQ=;
	b=fHdNX2rsKiHMLiBb8acxQ6EmDDwvSfK1BBYYv/JEnyumj9n/1YtukiRw8hfZ7rGSsA
	EPbGcMWCXa5WYnXWtXt3Dzp/lW/K+5jrQiogat5QdTzlcRuD/ynCV8XJ84q8OEqN29yC
	pw0h7fYrZx2KemP6d740EdIyLUS1KZU1gsvjrlZbniWYjCHVjfQHXihEeFXTrWth04fh
	8yxRmraKzXh1Gom8KdqlHAXrGVrrwLbMbip3xLdNanRrZQBYbEug8a2Tf8gq7saGy+Zp
	3HQB8zH3/LD3INV9GibA5CKV8NVofZPG2Ck6YtCV/w3zEbaF4MVgUhfc5/1yOqroOh4D
	4mBA==
X-Gm-Message-State: AIVw1108kmX2NoGnrmANvTjnH0/At5x371BKPGR/BBBHV0zZUO9MvGK7
	Tq3qnjGVUxtbbw==
X-Received: by 10.55.42.104 with SMTP id q101mr20383599qkh.84.1500920946594;
	Mon, 24 Jul 2017 11:29:06 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.29.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:29:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Mon, 24 Jul 2017 15:27:36 -0300
Message-Id: <20170724182751.18261-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH for 2.10 20/35] arm/boot: fix undefined
 instruction on secondary smp cpu bootloader
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
X-List-Received-Date: Mon, 24 Jul 2017 18:29:13 -0000

In a ARM multicore system, write_secondary_boot() only initializes fixups for
FIXUP_GIC_CPU_IF and FIXUP_BOOTREG, while smpboot[] also uses FIXUP_DSB.
This results in write_bootloader() using uninitialized fixupcontext[FIXUP_DSB]
instruction in the bootloader code...
Zero-initialize fixupcontext[] to avoid this issue.

hw/arm/boot.c:157:18: warning: Assigned value is garbage or undefined
            insn = fixupcontext[fixup];
                 ^ ~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index c2720c8046..fb21f113c2 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -170,7 +170,7 @@ static void write_bootloader(const char *name, hwaddr addr,
 static void default_write_secondary(ARMCPU *cpu,
                                     const struct arm_boot_info *info)
 {
-    uint32_t fixupcontext[FIXUP_MAX];
+    uint32_t fixupcontext[FIXUP_MAX] = {};
 
     fixupcontext[FIXUP_GIC_CPU_IF] = info->gic_cpu_if_addr;
     fixupcontext[FIXUP_BOOTREG] = info->smp_bootreg_addr;
-- 
2.13.3


