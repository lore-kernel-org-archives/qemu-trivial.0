Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFfKV-0006Lo-Ml
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60232)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfKS-0006GP-BM
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:42:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfKP-0007xK-SS
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:42:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:45486)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfKO-0007wD-QQ
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TG3vD6dCJich6pAeWRU+T1xBswh8CnNUpTlBwJ1yiQM=;
 b=f73Fq9/MIQv8adz/ZgYmdwv/FqPikMBkNM4np1GwS6MkLvUUZeJQZOd0XVs0mhfgT50Az8
 zCiPih4HsFYrlOOweUzR356hxUKHdymRGkdWuq1AXl0H8Xc+oCJP+S1K3O//K8qengtI1V
 xh4oOBv7KVBXAooiRqLrxmWWYEnChac=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-BHFY6_ONPuiv6dAeRQFDzg-1; Sat, 21 Mar 2020 10:42:18 -0400
X-MC-Unique: BHFY6_ONPuiv6dAeRQFDzg-1
Received: by mail-wr1-f71.google.com with SMTP id h17so4375229wru.16
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 07:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zAAolWyXSH1ZCqRxa+9EfzNPi+VU6uagizFc7cEyMYQ=;
 b=OO/XbqvPjZz4Y5L6yrKaOwaPs3VNL0W4w0zn3/1fhCpQQkUIWVUHTEr5lg2N8jAqpK
 9o43E8JERC/tD/fbQEbtVrngMifs7aJ2s/IkyKkl88yo2vyPBaqNJCWlrGgdC68BLtNY
 L5R3kBnt0c0NpqLluMNztYO8mYlfruzXjVRQ1TYftGpnWpP6HEtKMZJlDgzR26xeHMrn
 M7Wa0eMSMD8H4NDDJn1YWNAlfsyaSR/BDKdSv5Py7L4BmI6nLaQ0Tp3wAiVk6kaiSWju
 IuKg9D8kOd41GDyPw9Ba5rCdzs29pauD9XRWbKIVQtmkqTXtStCZgXDFBTbLpSkfCXDS
 EMig==
X-Gm-Message-State: ANhLgQ1Y6YWkOpvGSM1XfR81jI67pbwZBvbv9JRzNXvmMaJhTjYHj0so
 xez6GKq3OeA5JkBalbVDtSU5TTRKKPCQyeZME70/rfFsB92dMPU+UOmgR0qEvZdxWstHQ1LLSW3
 1EjkdfXrd5/K3nBxbYA==
X-Received: by 2002:a5d:6992:: with SMTP id g18mr18118307wru.426.1584801737792; 
 Sat, 21 Mar 2020 07:42:17 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsl+3ePkFRoRlIgn8f/HqRo7liy9CnmPsdS2QHY2gZeAqtjiG+Hn+C7e13XG+1vA7HdxTVxDA==
X-Received: by 2002:a5d:6992:: with SMTP id g18mr18118265wru.426.1584801737585; 
 Sat, 21 Mar 2020 07:42:17 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id k84sm13063251wmk.2.2020.03.21.07.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:42:17 -0700 (PDT)
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
Subject: [PATCH-for-5.0 v2 10/11] hw/timer/pxa2xx_timer: Add assertion to
 silent static analyzer warning
Date: Sat, 21 Mar 2020 15:41:09 +0100
Message-Id: <20200321144110.5010-11-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 14:42:26 -0000

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


