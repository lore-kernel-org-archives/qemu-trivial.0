Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFcbP-0002YT-5m
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 07:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcbL-0002SP-MU
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcbK-00074P-4d
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:39 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:38896)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcbK-000745-05
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TG3vD6dCJich6pAeWRU+T1xBswh8CnNUpTlBwJ1yiQM=;
 b=G/DIaUlNUcP3dmQoQbnXQSSG1IHUz8N/mF9RtEXZB90/BhS3hIhDJQiSisNoHsXHxX2GKg
 NNM51iEjI2gsUQImxbMrHKNcRRZPe/IwcIx1iGfvyxm+YVTQGLYcuC+c2lcS/AsWMeZNBZ
 8KlmG1BxqQTfzldXFtOPtG3fgKUexQE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-YSFfP5kuMOSqZrU2q2PAww-1; Sat, 21 Mar 2020 07:47:36 -0400
X-MC-Unique: YSFfP5kuMOSqZrU2q2PAww-1
Received: by mail-wr1-f70.google.com with SMTP id r9so2049686wrs.13
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 04:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zAAolWyXSH1ZCqRxa+9EfzNPi+VU6uagizFc7cEyMYQ=;
 b=Fvk845YE7xin/Lnsc4NUN8JrOqAB0Z8oBPIMPs6Siah5xBo8tXjp7yGWtC72EYmuvR
 02C7H7pxMijjVVUMoak1pYbpRRvjUyMGyjNl9SYJhbHKBJ+gjxhp2C1AdaaoWP7r1yGp
 JgKlsneBHGkXadYMFPRbYnOT2HDVisXv0pwtcNZlEEFCMRyTL4x/NS63/hpK6qD3F0jN
 Yiz3Q4xZ+aWNslcYmpHXucyICnU0Wb3CVL5qCbikYorbTbws0r0/tUsloTagXc4ubW94
 TsVaP2hsEZtPNwkucIYXqutyENLnhGFxSLiSarZYnp/SXoSyh+E8u48jTjz2GCuTEdct
 mVBQ==
X-Gm-Message-State: ANhLgQ3ESxkRaRHSE9WRrYlaGaEcwk32ciknlbbpsNL+V/1fzYo0Lp/2
 HQuuTKivM0S4AQV+z8IqS+S7zzyek4ir4S2ZasqLPqfIdYnGLElCLJk3R4PWB2Wfr2RfF8b5k61
 jy17QnXbTcOdxKC+xtA==
X-Received: by 2002:a5d:628f:: with SMTP id k15mr10384649wru.404.1584791254910; 
 Sat, 21 Mar 2020 04:47:34 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vunMup0EkhHY5Z4VqmUt/VLtiE0tE9EtlCM6177KdVJaaGEx8Tohte6eaOFXmY60+p5L/3iMQ==
X-Received: by 2002:a5d:628f:: with SMTP id k15mr10384613wru.404.1584791254676; 
 Sat, 21 Mar 2020 04:47:34 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id q13sm12849850wrs.91.2020.03.21.04.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:47:34 -0700 (PDT)
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
Subject: [PATCH-for-5.0 10/11] hw/timer/pxa2xx_timer: Add assertion to silent
 static analyzer warning
Date: Sat, 21 Mar 2020 12:46:14 +0100
Message-Id: <20200321114615.5360-11-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 11:47:41 -0000

pxa2xx_timer_tick4() takes an opaque pointer, then calls
pxa2xx_timer_update4(), so the static analyzer can not
verify that the 'n < 8':

  425 static void pxa2xx_timer_tick4(void *opaque)
  426 {
  427     PXA2xxTimer4 *t =3D (PXA2xxTimer4 *) opaque;
  428     PXA2xxTimerInfo *i =3D (PXA2xxTimerInfo *) t->tm.info;
  429
  430     pxa2xx_timer_tick(&t->tm);
  433     if (t->control & (1 << 6))
  434         pxa2xx_timer_update4(i, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)=
, t->tm.num - 4);

  135 static void pxa2xx_timer_update4(void *opaque, uint64_t now_qemu, int=
 n)
  136 {
  137     PXA2xxTimerInfo *s =3D (PXA2xxTimerInfo *) opaque;
  140     static const int counters[8] =3D { 0, 0, 0, 0, 4, 4, 6, 6 };
  142
  143     if (s->tm4[n].control & (1 << 7))
  144         counter =3D n;
  145     else
  146         counter =3D counters[n];

Add an assert() to give the static analyzer a hint, this fixes a
warning reported by Clang static code analyzer:

    CC      hw/timer/pxa2xx_timer.o
  hw/timer/pxa2xx_timer.c:146:17: warning: Assigned value is garbage or und=
efined
          counter =3D counters[n];
                  ^ ~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/pxa2xx_timer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index cd172cc1e9..944c165889 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -140,6 +140,7 @@ static void pxa2xx_timer_update4(void *opaque, uint64_t=
 now_qemu, int n)
     static const int counters[8] =3D { 0, 0, 0, 0, 4, 4, 6, 6 };
     int counter;
=20
+    assert(n < ARRAY_SIZE(counters));
     if (s->tm4[n].control & (1 << 7))
         counter =3D n;
     else
--=20
2.21.1


