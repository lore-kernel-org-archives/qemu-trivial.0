Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFK21-0008KN-IZ
	for mharc-qemu-trivial@gnu.org; Fri, 20 Mar 2020 11:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37052)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFK1x-0008JE-Uk
 for qemu-trivial@nongnu.org; Fri, 20 Mar 2020 11:57:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFK1w-0003qb-Ue
 for qemu-trivial@nongnu.org; Fri, 20 Mar 2020 11:57:53 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:60983)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFK1w-0003on-RO
 for qemu-trivial@nongnu.org; Fri, 20 Mar 2020 11:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584719871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jY9hFXsRQKShgR6fFRHDQkteEgkZAWGBxIuQEuqC1Q8=;
 b=fkhTYMLwgGCjY47ahSOrkK5/xyt32bwngpZLClwSKedvQRf3/t6L0+IUGWd8alf84pP8sf
 r5kWnfX5QQPXahzp1rek7xtCA22IoCrKn5D4SuBH+qOWHoCwMYvkNyYpSZkAG0WJcC34gM
 ARPK1eeCpyWi3ocWZggW0yPeACVws/E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-wsUgF1T4NIqQr4u9lVvsrA-1; Fri, 20 Mar 2020 11:57:49 -0400
X-MC-Unique: wsUgF1T4NIqQr4u9lVvsrA-1
Received: by mail-wr1-f72.google.com with SMTP id c6so2806664wrm.18
 for <qemu-trivial@nongnu.org>; Fri, 20 Mar 2020 08:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yo0Dd1h/opLMkm38keM/qX9N7f08guLSjUkx4P9OCWI=;
 b=oolanLe926Fcwxt/SUDjA/K1eZx0FFKC8b43vwewVmjH1QYPsRnZQRr1tS5y9ddwjy
 n4itDOwIxIzJuE8yoFF34SoY+/pLk0BLQiTGV05d24QCw6DJVMr/RA71sBIZEY65RVQl
 5z1wmXbEc/lpipfQHd9lfifSy92h97URK/SNWvjaDaqwbT8KPuxypw7vUIj3MuIxIdUA
 nYL/HJLV8NjvMFoGOmj1RlHJ0zboFYMbYBoKPS9NuNLOEMJ4w0YKTdD5tbvA9cFOlsNn
 9fmDwTQwcqPrGfy+h51rt7cItb87ReJY+e9YXLR3WEZrBW1dwXbRANKCG26cF1/SVijm
 cUfA==
X-Gm-Message-State: ANhLgQ1IcBw/gjioYYGW2k2j27aYsCQmFTduLgiycNh7IV+vkCeVGomU
 mCGlkYWphUjZ7AdSCJW6QinSp2FBCMuPKH0B8qfDyBAlmCWT3Y3uRXmAWzIK8Cbw8BoNwPyqD1D
 Ty5Fp8Hvp7vQURujhDg==
X-Received: by 2002:adf:9ccd:: with SMTP id h13mr5342136wre.427.1584719868731; 
 Fri, 20 Mar 2020 08:57:48 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtKNIySo+0h9nKi1gF8SVhvWINxKpB6fvuZ/k49TAlOK+68wRu67Dh8yorrIbw24AcvMbgFaQ==
X-Received: by 2002:adf:9ccd:: with SMTP id h13mr5342111wre.427.1584719868467; 
 Fri, 20 Mar 2020 08:57:48 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id x5sm9117419wrv.67.2020.03.20.08.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 08:57:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] ppc/ppc405_boards: Remove unnecessary NULL check
Date: Fri, 20 Mar 2020 16:57:40 +0100
Message-Id: <20200320155740.5342-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Mar 2020 15:57:55 -0000

This code is inside the "if (dinfo)" condition, so testing
again here whether it is NULL is unnecessary.

Fixes: dd59bcae7 (Don't size flash memory to match backing image)
Reported-by: Coverity (CID 1421917)
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ppc/ppc405_boards.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index e6bffb9e1a..6198ec1035 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -191,7 +191,7 @@ static void ref405ep_init(MachineState *machine)
         bios_size =3D 8 * MiB;
         pflash_cfi02_register((uint32_t)(-bios_size),
                               "ef405ep.bios", bios_size,
-                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              blk_by_legacy_dinfo(dinfo),
                               64 * KiB, 1,
                               2, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, 0x=
2AA,
                               1);
@@ -459,7 +459,7 @@ static void taihu_405ep_init(MachineState *machine)
         bios_size =3D 2 * MiB;
         pflash_cfi02_register(0xFFE00000,
                               "taihu_405ep.bios", bios_size,
-                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              blk_by_legacy_dinfo(dinfo),
                               64 * KiB, 1,
                               4, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, 0x=
2AA,
                               1);
@@ -494,7 +494,7 @@ static void taihu_405ep_init(MachineState *machine)
     if (dinfo) {
         bios_size =3D 32 * MiB;
         pflash_cfi02_register(0xfc000000, "taihu_405ep.flash", bios_size,
-                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              blk_by_legacy_dinfo(dinfo),
                               64 * KiB, 1,
                               4, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, 0x=
2AA,
                               1);
--=20
2.21.1


