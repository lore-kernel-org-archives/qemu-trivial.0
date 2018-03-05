Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHr-0003es-I3
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHk-0003X2-2C
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHj-00072h-3v
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:04 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:51568)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHi-000715-T1; Mon, 05 Mar 2018 06:28:03 -0500
Received: by mail-wm0-x244.google.com with SMTP id h21so15065210wmd.1;
	Mon, 05 Mar 2018 03:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VW62OcbntjW3wzOc3Wg8kol3XBOhZTJtLygaT4lKmo4=;
	b=B3n/DOcD5wMEiwJyzBFAxxZAYrtm4Z+1ItWUztc0pmqnLSZ0fr9cTR44Xis8YJyA++
	G29k0DrFObAZPioGkyfDKWeZmiqwSnHB5FA9gAuNZt8qi6GqNP/XS1VzbAmdqriDHVFG
	F4r58e/MU7jUQ5udl2G/diB5Egx8Pkclj9/j/9fGilkuKF+tcoblopBY0FDoS3Q1ehWV
	Tpyxi5Au3wmKW8Vr9x9QfOP8St5Jcu5TROIhYETbMu54Z8md6OfOoyRHD0568yUL9aCb
	Q0yAcn6DmaDR5M30+IvyF4+gnrMRP0336+0/Y+xJDbEH18p4SvWiHwwtFYBltb9ilDeZ
	XHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=VW62OcbntjW3wzOc3Wg8kol3XBOhZTJtLygaT4lKmo4=;
	b=RsJvG63+JXsk+8KLyzZCSGXXdzL+uw/Ac1sXJepZ8+6zNRq1iz2AHjo+ryrn1SqYCd
	lwxbymd5NngoNsQCC0oxuylFjFhrc0Hrw8WyLxXDrqoUaljohR+n5k/qJkb+CZkT2EUU
	kmRN5GUdx7nLMs5AmWckHiaxfT9hj3MSW2O1TofIxc+K1M1NekNyH04F2j91evP7pWyR
	p94giI0Nn4zcTGDwvAEUMKJ3xl98wswOCx4qbl9IDMaaoryFmN9uQ/9kJRBZ/LHbSXQo
	qX/SoEWs03wAW1me46SVGjO/0Tw8HgjS7/6OlC0r/1VCoha+51rFDl3/xSie04kLGQIc
	MoYg==
X-Gm-Message-State: AElRT7F+E90rUirlGR4BjYvpQW/6Co9GVLvH1Mp1BsbvVaul4Wmf7q9t
	MzjOeTQ3fobm9FGJIjT4HynVNWST
X-Google-Smtp-Source: AG47ELszsm3qA3LYFCr0t7Cwr0yhB0Bx9alH5/ex2Fb/ofL/XypaN1TKkrYvc0tCRxOJRSql3oCAxg==
X-Received: by 10.28.156.67 with SMTP id f64mr8482297wme.11.1520249281566;
	Mon, 05 Mar 2018 03:28:01 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.28.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:28:01 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-block@nongnu.org (open list:Block layer core)
Date: Mon,  5 Mar 2018 08:27:18 -0300
Message-Id: <20180305112732.26471-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: [Qemu-trivial] [PATCH v2 16/30] hw/sh4: use the BYTE-based
 definitions
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:05 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/tc58128.c | 2 +-
 hw/sh4/r2d.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/tc58128.c b/hw/block/tc58128.c
index 1d9f7ee000..3e658d509f 100644
--- a/hw/block/tc58128.c
+++ b/hw/block/tc58128.c
@@ -26,7 +26,7 @@ typedef struct {
 
 static tc58128_dev tc58128_devs[2];
 
-#define FLASH_SIZE (16*1024*1024)
+#define FLASH_SIZE (16 * M_BYTE)
 
 static void init_dev(tc58128_dev * dev, const char *filename)
 {
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 458ed83297..720bd6ad04 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -292,7 +292,7 @@ static void r2d_init(MachineState *machine)
     dinfo = drive_get(IF_PFLASH, 0, 0);
     pflash_cfi02_register(0x0, NULL, "r2d.flash", FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          (16 * 1024), FLASH_SIZE >> 16,
+                          16 * K_BYTE, FLASH_SIZE >> 16,
                           1, 4, 0x0000, 0x0000, 0x0000, 0x0000,
                           0x555, 0x2aa, 0);
 
-- 
2.16.2


