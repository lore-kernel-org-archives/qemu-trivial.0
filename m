Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFfKQ-0006FT-Ug
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60169)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfKM-0006Af-3U
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:42:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfKK-0007rM-7y
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:42:17 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:44266)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfKJ-0007qE-Cn
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H2ZxNlM8IiHu0dxI+a0SAXUIREttoqtshJPpfqAJ9kA=;
 b=CbQSYqP0divIhSx3ibw/eLW6mVLWzEcsCXp3CDlbsuxvdAn5N7yIqn4NnPD1eAoNgvinWv
 wKpoStnKFZyCNGxC6bD1I1Lu0QU8WetAPH0eBsWVoGTH54NncQ8QlFjRZyI0ay9el0ShKP
 qSGcdqhkyQ/oF4+kUHm8rpETUay+gUE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-lr8V3oAUPK-JcxjKLUjiMg-1; Sat, 21 Mar 2020 10:42:13 -0400
X-MC-Unique: lr8V3oAUPK-JcxjKLUjiMg-1
Received: by mail-wr1-f72.google.com with SMTP id q18so4368445wrw.5
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 07:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=860B2IkAp+GSKWrMYmt9BxqMmpnco8VZzzV9xEgKT/A=;
 b=eF+m9MyvyJRc8EXpqRekVSAiDTcDsQZ/sOh6S5rQOJaEQ1YsM7rT/zK/2tr+Sa+SSG
 kz344r69xKLd/Wo3YE049aR48T+jkmkMtWeI2AvLLTfL7O1tjEG18C9FaniVF1FYf4X0
 GE0iiLj6Uhee4PPV0mxeXTZ5qU7Z1CLf02pFSHz5owdobOG+nmhru7BAeUQABqEc2lUy
 HSv0SdPNrZX+pDf8exy132w70fG2jkLiHzkqm+3i7Yc4b1+38KOsKE7/0gk7mnX2uZok
 gZ8nGi0Zbm/cwB6tCaPOObvCI+z6bpdGR1ZO+6T/Yx7getFJ3H4nGT//e60tUJm3BDqP
 xqNw==
X-Gm-Message-State: ANhLgQ3z5H5kyahhFLl3771QR6jsaqwZHG3mEBFKNN13WlY5ih5BO0NT
 /8m/yRTPDy3s0Kc6gmoayj+l1ml03jTCifuSvhHiRtD9Nfbr9u2IL/SI79emb/q+XrFmdvc3B0K
 ES/n1tQYsiW+/RsdfoA==
X-Received: by 2002:a1c:5452:: with SMTP id p18mr17120530wmi.102.1584801731394; 
 Sat, 21 Mar 2020 07:42:11 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt4MZYkQzsDodB4rBr8kRt7DKKHOWwCJhHaZsSeyVB7oP3PGVEPm9D09+Ax6eoZkWA0FA03pA==
X-Received: by 2002:a1c:5452:: with SMTP id p18mr17120502wmi.102.1584801731141; 
 Sat, 21 Mar 2020 07:42:11 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id k84sm13062950wmk.2.2020.03.21.07.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:42:10 -0700 (PDT)
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
Subject: [PATCH-for-5.0 v2 09/11] hw/timer/stm32f2xx_timer: Remove dead
 assignment
Date: Sat, 21 Mar 2020 15:41:08 +0100
Message-Id: <20200321144110.5010-10-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 14:42:19 -0000

Fix warning reported by Clang static code analyzer:

    CC      hw/timer/stm32f2xx_timer.o
  hw/timer/stm32f2xx_timer.c:225:9: warning: Value stored to 'value' is nev=
er read
          value =3D timer_val;
          ^       ~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/stm32f2xx_timer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c
index 06ec8a02c2..ba8694dcd3 100644
--- a/hw/timer/stm32f2xx_timer.c
+++ b/hw/timer/stm32f2xx_timer.c
@@ -222,7 +222,6 @@ static void stm32f2xx_timer_write(void *opaque, hwaddr =
offset,
     case TIM_PSC:
         timer_val =3D stm32f2xx_ns_to_ticks(s, now) - s->tick_offset;
         s->tim_psc =3D value & 0xFFFF;
-        value =3D timer_val;
         break;
     case TIM_CNT:
         timer_val =3D value;
--=20
2.21.1


