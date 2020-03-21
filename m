Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFcbJ-0002Oi-6r
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 07:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35153)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcbE-0002Gd-Vb
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcbD-0006zS-VE
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:32 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:25430)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcbD-0006z6-Qy
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H2ZxNlM8IiHu0dxI+a0SAXUIREttoqtshJPpfqAJ9kA=;
 b=dmWpPGut6F+AowOqExDr/GZiXf7BpJqqZ89L04aOfUQchr3HXz+Q2lIjxpm70n3I23uMMQ
 LZ2DqttqMPgHJNtdJXLdwFvKzQlxbZo62SloqVM6MbgC8QwPriGSEolcipVwptjpE21ba3
 vXw9UyzPkMwaacDwq/Ucjr7iClTMc6I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-eZZy1AiVN9GvfyGNHRH8Fw-1; Sat, 21 Mar 2020 07:47:29 -0400
X-MC-Unique: eZZy1AiVN9GvfyGNHRH8Fw-1
Received: by mail-wm1-f69.google.com with SMTP id g9so690995wmh.1
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 04:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=860B2IkAp+GSKWrMYmt9BxqMmpnco8VZzzV9xEgKT/A=;
 b=neN5CnFY4l4DNHyTD+p7V38aOLHtPf1haH6sOy2Bhf334eL2TVsqvzOoz48c9carPB
 DLr+8xSyEUY0VFSKpOUSipz50UjGMqkUlB5nyAacoOLgPXPVOTzPj1bhO/X1OoapXwrL
 /DZAYS0bz5sjgwP68Bnup446sdbns8KWQmoGeWjjXIbMXZ7GD3+EBP8oHsoBXBYnX2Bm
 sBk17RTX+yzW6kwf9UstWmTohrF6nyUdCM6uU6zVLrg5F1N9xArwl+xGcO3NpqipCGzX
 WpaSyhTX0DaiL6EP/S8i3joRel1evwP5jQzCieqCgqauAb+v8rQssKy7YazEfNivyIDm
 j/7A==
X-Gm-Message-State: ANhLgQ0lkhKTXbQoz7QLK+DGdTJrKQ495JTsBiwMTK1xTDYKFz9/1gW5
 SOoNA2I66EU8n9oc/k05s238IUt0Jwj2RJPLfUe//AlyM32r0VN7RPT5gYV8rv+2D87J8C9nDUd
 XDGburv/23fwyBC8XLQ==
X-Received: by 2002:a5d:6082:: with SMTP id w2mr17078551wrt.300.1584791248577; 
 Sat, 21 Mar 2020 04:47:28 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsvu5wfvhRuM6jVgboSn3IbxzjQxhFrW0gmXdleJclIAtsXaDBlpnQ+JjoWQKg5OAX+ODoNhA==
X-Received: by 2002:a5d:6082:: with SMTP id w2mr17078523wrt.300.1584791248363; 
 Sat, 21 Mar 2020 04:47:28 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id s22sm11269798wmc.16.2020.03.21.04.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:47:27 -0700 (PDT)
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
Subject: [PATCH-for-5.0 09/11] hw/timer/stm32f2xx_timer: Remove dead assignment
Date: Sat, 21 Mar 2020 12:46:13 +0100
Message-Id: <20200321114615.5360-10-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 11:47:34 -0000

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


