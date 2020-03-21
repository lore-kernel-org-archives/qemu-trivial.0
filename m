Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFcau-0001lV-GV
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 07:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34888)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcap-0001fl-0V
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcao-0006g0-44
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:06 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:45213)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcao-0006fb-0O
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s1bdYGQbWSZ25NCXl0o2KnO8CKQKA2aULoROOMscDe4=;
 b=c5NOgfR5zJb/C4n2uoTRrL5ETE/i5wJXzsjqTb6l7hhsoL3CKJvDAgTz/bRUHjJfqDN9ry
 bS+huaPGr0zFFK1Dhu75ddAKKPmk0K3hicu+0z1Y2Ga23ZuSdGPG2h/jPlw/W+AdAbc6cb
 Kf5Ie+36WPfLHoaiNWKRTCYEwQhnsko=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-8P1JgAOcMgOQP7AVkuU2LA-1; Sat, 21 Mar 2020 07:47:03 -0400
X-MC-Unique: 8P1JgAOcMgOQP7AVkuU2LA-1
Received: by mail-wr1-f71.google.com with SMTP id v7so4225464wrp.0
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 04:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dMq7n4VIHa1l961sBoHohhv0FobQ6UHjUiSLB6JZ4j0=;
 b=Zwt1amD5nnsZZ2NxBYgbNqqLGpgXYWc8znTLGTQsB/Cu34wx0SuaXWEw62JTDV5atW
 5Rbd0hpcYLs8v740FUT55EfQcebk7tWLgDhzSHN1c7m9eUDeTC32lgTLlD3aNsOBlMJ9
 FHWAn4E6t5lt5tk//jwSU5u/RbfkBkSFBoNCgBVvRLR54LB/xjDtL0fqnCJ+YOskfr9B
 mzgz+N1uvtCIcVFumovOMYnZfy3IA6nDn/KFVkJJjvtlagq7aH6bFPfbap7khLazZ8ih
 i/CbSjcHfJY69qHP5dyqrMFXBjRgw/q+fJrFKQcbGnccxoiRFxzh8p7vEOoo70YpbIWp
 ep3g==
X-Gm-Message-State: ANhLgQ0oYkBZQQUClXeWBp2DmNhc5DYAZguTl/vkfJJLFkcHsvriFUig
 B0vu5COtLkLgPo6tBUCPtjUamiyQ0UYuV0ajBy8rUoixhCOoQ0RsA4io9LS9vaIjeDx2d2NMo6P
 yAocr8+K87ENj+mP3Og==
X-Received: by 2002:a5d:628f:: with SMTP id k15mr10381950wru.404.1584791222594; 
 Sat, 21 Mar 2020 04:47:02 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv2RVU0hT38/VJsO9a/eu91+kjlougjMKfQ/gz0+1oWL8bmhhm7at7naNrtjfseEuRTaRxs0A==
X-Received: by 2002:a5d:628f:: with SMTP id k15mr10381909wru.404.1584791222291; 
 Sat, 21 Mar 2020 04:47:02 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id r16sm2136019wrv.33.2020.03.21.04.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:47:01 -0700 (PDT)
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
Subject: [PATCH-for-5.0 05/11] hw/ide/sii3112: Remove dead assignment
Date: Sat, 21 Mar 2020 12:46:09 +0100
Message-Id: <20200321114615.5360-6-philmd@redhat.com>
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
X-Received-From: 63.128.21.74
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
X-List-Received-Date: Sat, 21 Mar 2020 11:47:08 -0000

Fix warning reported by Clang static code analyzer:

    CC      hw/ide/sii3112.o
  hw/ide/sii3112.c:204:9: warning: Value stored to 'val' is never read
          val =3D 0;
          ^     ~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ide/sii3112.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 06605d7af2..36f1905ddb 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -125,7 +125,7 @@ static uint64_t sii3112_reg_read(void *opaque, hwaddr a=
ddr,
         val =3D (uint32_t)d->regs[1].sien << 16;
         break;
     default:
-        val =3D 0;
+        break;
     }
     trace_sii3112_read(size, addr, val);
     return val;
--=20
2.21.1


