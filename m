Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFcbI-0002MQ-A2
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 07:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35132)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcbE-0002FL-Cq
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcbD-0006yf-7l
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:32 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:25186)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcbB-0006va-JK
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RrFXtWXIAKlsNCj4fxVkxendU8386lJ6GdPQwHKuZc=;
 b=YkUjYlu/TrEERFw/pJKQQ/DEKAC1g7mG1s1JUKoOuI1m34ugPoQqJ+tcCXERzWzxMLy1PC
 RNGNMDpuECdAS5Mokry7iD6A8X3vIABkik0iobe1zgzncUZ/xDMWVCHgLaiiHi8BpY8zHu
 ZIA9PdJ/cQfv6vqRt8qp1FnZDxL72Aw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-YoePT04hMES4x8fWRoSQLQ-1; Sat, 21 Mar 2020 07:47:23 -0400
X-MC-Unique: YoePT04hMES4x8fWRoSQLQ-1
Received: by mail-ed1-f69.google.com with SMTP id y14so7311713edq.22
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 04:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9gGzKQU/hca0N/HfH89YEyKKEwjuVATrynJmMDBqHuA=;
 b=jXAPnEOKNoWFd1t0eZfcX1inOZEaHobizzn04Z6UtIwT1hqqO8lwMdk8/ykVviUyWw
 0zKFe77ifAASbWPuIXMRAFuCsetl0byGP008TRx80O2CEL04LjwlwoUnj3voRa4OD8Lg
 G0vIUbiFwukJ6IMZl9lCiYmn7iXsbpqDnpE2H2JmTsXHaCkY3izaXqbCf0jvpnPI/lT2
 MvvjzpV9hunbPtBgmvN+YTdCmdHC98JpFoFEC7v1/VTqg5ySD90Bn1YYODhi1/lr8xWV
 pIEII1iVenTipi8NjsUxxHe0TkrZb8jJV5ylcUquKuMXHQ5Jne75MTrjX1aeBHnd6s+c
 Hq9g==
X-Gm-Message-State: ANhLgQ39czG7mONyjG6p5mbhoRESD3QoEKfCDRcqtljBK7c/s/W2LtLy
 RJ/pU8zSjt3SCqu+FodJHGwZrr/sj1bbd8mCYcE9dbAF62aXOHRb462YjIU3lBV3zJjtr2WS3CH
 Q7wErVmt2tIbVYbJPIA==
X-Received: by 2002:aa7:c0cd:: with SMTP id j13mr12145110edp.287.1584791242059; 
 Sat, 21 Mar 2020 04:47:22 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsNje2ZBWZggIXMm+1aJu4RAQiqKLCRY2id164eUSg0Un6tqRjsI5Yaw3McsVqiA0SKAsuv3g==
X-Received: by 2002:aa7:c0cd:: with SMTP id j13mr12145088edp.287.1584791241814; 
 Sat, 21 Mar 2020 04:47:21 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id d23sm540531ejk.26.2020.03.21.04.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:47:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 BALATON Zoltan <balaton@eik.bme.hu>, Andrew Jeffery <andrew@aj.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Fam Zheng <fam@euphon.net>, qemu-trivial@nongnu.org,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Kevin Wolf <kwolf@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.0 08/11] hw/timer/exynos4210_mct: Remove dead assignments
Date: Sat, 21 Mar 2020 12:46:12 +0100
Message-Id: <20200321114615.5360-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200321114615.5360-1-philmd@redhat.com>
References: <20200321114615.5360-1-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 11:47:33 -0000

Fix warnings reported by Clang static code analyzer:

  hw/timer/exynos4210_mct.c:1370:9: warning: Value stored to 'index' is nev=
er read
        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  hw/timer/exynos4210_mct.c:1399:9: warning: Value stored to 'index' is nev=
er read
        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  hw/timer/exynos4210_mct.c:1441:9: warning: Value stored to 'index' is nev=
er read
        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/exynos4210_mct.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 944120aea5..c0a25e71ec 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1367,7 +1367,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr=
 offset,
=20
     case L0_TCNTB: case L1_TCNTB:
         lt_i =3D GET_L_TIMER_IDX(offset);
-        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
=20
         /*
          * TCNTB is updated to internal register only after CNT expired.
@@ -1396,7 +1395,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr=
 offset,
=20
     case L0_ICNTB: case L1_ICNTB:
         lt_i =3D GET_L_TIMER_IDX(offset);
-        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
=20
         s->l_timer[lt_i].reg.wstat |=3D L_WSTAT_ICNTB_WRITE;
         s->l_timer[lt_i].reg.cnt[L_REG_CNT_ICNTB] =3D value &
@@ -1438,7 +1436,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr=
 offset,
=20
     case L0_FRCNTB: case L1_FRCNTB:
         lt_i =3D GET_L_TIMER_IDX(offset);
-        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
=20
         DPRINTF("local timer[%d] FRCNTB write %llx\n", lt_i, value);
=20
--=20
2.21.1


