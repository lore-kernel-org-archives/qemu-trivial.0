Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFfJx-0005Ux-S7
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfJu-0005PB-Bt
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfJt-0007Uk-6s
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:50 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:56558)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfJt-0007UN-3U
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvtpmJoV32BEyOe596XwKOYG0GxD3I0LNs6dD0KNAUs=;
 b=PwrWHyty+z2be0trylMvwZNh5+qij8en53BGoIuCWa8yYFZZ4GmcIZZ0X++pVYc7MzFCWj
 /dlZQEy0mn/JU1s0yL2I+1txEy9kRxQxGIw0EbaWZiCkC7rjk8GDCIFD8pnZoKFHRmK0kj
 +bn4GRtLRx9/bPoA6fuW9Eces3pzWI8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-Z0MON0CYNK-n75zvjdyGvg-1; Sat, 21 Mar 2020 10:41:47 -0400
X-MC-Unique: Z0MON0CYNK-n75zvjdyGvg-1
Received: by mail-wm1-f70.google.com with SMTP id 20so3119983wmk.1
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 07:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bL5NUrmTjbHjm3pvKXbJpPZgk/5XIoNG4lJHv7ZuRaU=;
 b=cPEXncPIY4mMM5hSaN1rl13frQrBWHF8UQPs+Klhk0P4ChOnp+Z3E3CGQ1dTR5ex+f
 e/prQkjqKGKVYT5WTaYzSyhl7Z0jWmazGNkRvV7EC4IAGib6I9XxjhU62W2tHGtOvCbR
 ZtNxtLJaPenY21HhdXjFmogBW/O3SmMbXcgF7ZQxQtJjyoRhy1+kfTcs5uLRycMvsgXh
 uHjc0QCCycIVg3qFp0aRGOrmHGM9uw+7Px9iykw/hNPfiZzi2vXHuw4u7Rr23Tdm5VBE
 33f44UCmcvuzPkLx5jypDt00w8lD4r1vkFnX5CiCxOQyyfqNICE2dlDgtL5iVyW2GMN0
 efNQ==
X-Gm-Message-State: ANhLgQ20uBiYg+uKIepXbcEldXPdQbJrNSo1TfEqqwaA7Y2vO80LW1I7
 cqdmKtOXoFUXU9KharyqmWzsfscOpYGolHgxH8YqmHfXY7kLYmd7K5HfgNUd0zon8V2a/dSm5OF
 85l8zl0rudMx3HZBokA==
X-Received: by 2002:a7b:c5d9:: with SMTP id n25mr17193368wmk.160.1584801705930; 
 Sat, 21 Mar 2020 07:41:45 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvPBABnTVrFLPi9F6uhCW5QPfP0PaTUxHoC+sJfC9KClGy5HdXjRGO23/0BW9pONNYT7mVwuA==
X-Received: by 2002:a7b:c5d9:: with SMTP id n25mr17193337wmk.160.1584801705724; 
 Sat, 21 Mar 2020 07:41:45 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id n2sm14551205wro.25.2020.03.21.07.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:41:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Max Reitz <mreitz@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.0 v2 05/11] hw/ide/sii3112: Remove dead assignment
Date: Sat, 21 Mar 2020 15:41:04 +0100
Message-Id: <20200321144110.5010-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200321144110.5010-1-philmd@redhat.com>
References: <20200321144110.5010-1-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 14:41:51 -0000

Fix warning reported by Clang static code analyzer:

    CC      hw/ide/sii3112.o
  hw/ide/sii3112.c:204:9: warning: Value stored to 'val' is never read
          val =3D 0;
          ^     ~

Fixes: a9dd6604
Reported-by: Clang Static Analyzer
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Fix the correct function (Aleksandar review)
---
 hw/ide/sii3112.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 06605d7af2..b2ff6dd6d9 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -42,7 +42,7 @@ static uint64_t sii3112_reg_read(void *opaque, hwaddr add=
r,
                                 unsigned int size)
 {
     SiI3112PCIState *d =3D opaque;
-    uint64_t val =3D 0;
+    uint64_t val;
=20
     switch (addr) {
     case 0x00:
@@ -126,6 +126,7 @@ static uint64_t sii3112_reg_read(void *opaque, hwaddr a=
ddr,
         break;
     default:
         val =3D 0;
+        break;
     }
     trace_sii3112_read(size, addr, val);
     return val;
@@ -201,7 +202,7 @@ static void sii3112_reg_write(void *opaque, hwaddr addr=
,
         d->regs[1].sien =3D (val >> 16) & 0x3eed;
         break;
     default:
-        val =3D 0;
+        break;
     }
 }
=20
--=20
2.21.1


