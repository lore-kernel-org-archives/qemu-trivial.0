Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYm4-0006AK-Ut
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:43:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYm2-00066f-7j
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYm1-0008OQ-Jb
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:38 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:38230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlz-0008Ma-MS; Wed, 26 Jul 2017 22:43:35 -0400
Received: by mail-qk0-x242.google.com with SMTP id v76so5570784qka.5;
	Wed, 26 Jul 2017 19:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ayOHY3oVaYXRTdSJhc5n/47OYoN/gdbRSnnFUHp1NYI=;
	b=bDReCoq6b+p10Ho/yIn2pCOtnFrfLwFXFxULcMWuY8Ed/2emNd6kOV4wH5lQ9PM++l
	z4O541Z3f8XvFBntAtbwmFZULZFZSUuzWljgGh0CeeIYVaRi1BuTFAPgz7t72LhmxtQj
	oDkf5q7hdaRClcM3y4Rc1BE6VHn3hkbDl67mK8l1KxLnrDiXtnHjhVmlSLf5E2aSOyQc
	TZ31dLO/TEBQ2vEpMpYAcvaNSPTMxWP76iwA/wEzroDDj8HlPQTBfjTQYcOF9jpNCxE+
	ClAw9pi+8hfl82bxjCHrMEv6sTuCJR0aHfeTNnQkzE/aWY095XO+goOveUV+WIRquuY2
	o7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ayOHY3oVaYXRTdSJhc5n/47OYoN/gdbRSnnFUHp1NYI=;
	b=E5a/2Df95TZRSFB11gFIb9zd1LTL3+c7KaFlzNptA2gfrhi1T9NRqt8MZxATvsPaS7
	d5S9sZjKhLkFOnA9lYULCPAA8JyiZhJEPwfX169m2vnVZ4JNpyhJTRQM2g/skBeAEJE6
	WAoGGvp3XTe7aOIrn1lIHDaOu0Rwpu1HvaVhq3ZfRJcZgLI1XTb+/JSwKsXKT+5be8UZ
	2LYxtsbesIhdFdrotY9qvweiq3skCcBwpEn/48nN45ck/uwjx7Y0kvCJI0uaolXkWTUn
	v6fv3ZEFabp3F2llW9FVp0CBGJ6sm8sfcigVi0UxAme8ElZaGVHIhI0kUDrWkC+zfHPC
	hU+A==
X-Gm-Message-State: AIVw113nBmqtwZDwdle9v6XvSoTod79h/dYb3ahHONrtxT65kRZGXBmn
	3SGPjs1Bmo5wxA==
X-Received: by 10.55.156.9 with SMTP id f9mr4069641qke.141.1501123415206;
	Wed, 26 Jul 2017 19:43:35 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.43.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:43:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 26 Jul 2017 23:42:24 -0300
Message-Id: <20170727024224.22900-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH for 2.10 v2 20/20] i2c/exynos4210: fix write
 to I2CADD register, bit 0 is not mapped
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
X-List-Received-Date: Thu, 27 Jul 2017 02:43:39 -0000

From the Exynos4210 User Manual [1]:

14.4.1.3 I2CADDn (MULTI-MASTER I2C-Bus Address Register)
  [7-1] slave address, latched from the I2C-bus.
  bit [0] is not mapped.

[1]: Exynos_4_Dual_45nm_User_Manaul_Public_REV1.00-0.pdf

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/exynos4210_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c
index c96fa7d7be..e6a9ca8f03 100644
--- a/hw/i2c/exynos4210_i2c.c
+++ b/hw/i2c/exynos4210_i2c.c
@@ -243,7 +243,7 @@ static void exynos4210_i2c_write(void *opaque, hwaddr offset,
         break;
     case I2CADD_ADDR:
         if ((s->i2cstat & I2CSTAT_OUTPUT_EN) == 0) {
-            s->i2cadd = v;
+            s->i2cadd = v & ~1;
         }
         break;
     case I2CDS_ADDR:
-- 
2.13.3


