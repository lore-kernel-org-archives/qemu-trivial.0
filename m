Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRFUg-0006xr-4z
	for mharc-qemu-trivial@gnu.org; Wed, 22 Apr 2020 09:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59586)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUb-0006sy-2E
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUa-0003wA-Gp
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:44 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20780
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRFUY-0003ns-Vo
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587562362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0kil7rh5PLCfhjtcevVysxbFfatlucuUN8GB4YOzVHM=;
 b=H0vLJ5d2YEnKS/TS154KBCk7ai+9qSk/0Sl2N4t9qBud8ocmsy4MrDsw2sXq4dtDKCqpED
 S3ugYeSKc/e/bNH74Kl+MY2iAbrbxmRy2r+X3PdCGw/v8XDMQpviuBgLFdwwSZXsAdqLnM
 wOcs3sQtq8wNuQt1TF7QsRHankYcakY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-v0fP7u29P3q8HX58LRu32Q-1; Wed, 22 Apr 2020 09:32:40 -0400
X-MC-Unique: v0fP7u29P3q8HX58LRu32Q-1
Received: by mail-wm1-f72.google.com with SMTP id 71so793925wmb.8
 for <qemu-trivial@nongnu.org>; Wed, 22 Apr 2020 06:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vNxCN6M06rXiAjKleOKzOmRwlxNeGgf99J9DO/nchhk=;
 b=bo/8hjzI/Au0KWcM4YpnGkxVYqNUGSoQ2aoN9O0lnzHtxbbto+ANslZyHstqrEKubH
 yZGPv0y5zTMqlTAOCHWyYOnywiKdGEEpmMMD8YrD/DowGYQjH7rj7ZTDXAwX2R4raolh
 62N3Q0sc82quIH1kvIzP/TPj2rq8U/2nunnaPHdhp9Y3nxcF2+5Mh2W5/tXInBhxqDKT
 MTCvEECovvQEcQfXzqgB0cd2H7kp8hg182Xrs1Z96mj84sIVq5w8IuqF6I27HuB67src
 1feBOkfUoNd8Gj0nad/WZPa3/akR+UF01poxXpm7A2Z8t6rcC3xyNZBM0Iv3reTRJTlk
 H7xA==
X-Gm-Message-State: AGi0PuZm4dfmERSML/twoLMrj7Ge3mbs6Szpc/uZOhPikKij3slJ4eDr
 LiGD8fY+oppHl6Hgq6JJfFd8JyZfS3NhsfKX10s7oodfNaXsTkkg8EsEQBh6AL4pUmVb37omBVG
 j0d12xb6VOUYqLk801Q==
X-Received: by 2002:adf:ea44:: with SMTP id j4mr32086531wrn.38.1587562359419; 
 Wed, 22 Apr 2020 06:32:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypLNL1kfi8mJTmgXfQFHY/uEF7HT0TawYfHGk35xmUGa5VK+gFzIu5dhO9Vpux9XAtjya1pDzA==
X-Received: by 2002:adf:ea44:: with SMTP id j4mr32086518wrn.38.1587562359264; 
 Wed, 22 Apr 2020 06:32:39 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id 19sm7525564wmo.3.2020.04.22.06.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 06:32:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:PXA2XX)
Subject: [PATCH v3 9/9] hw/timer/pxa2xx_timer: Add assertion to silent static
 analyzer warning
Date: Wed, 22 Apr 2020 15:31:52 +0200
Message-Id: <20200422133152.16770-10-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200422133152.16770-1-philmd@redhat.com>
References: <20200422133152.16770-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:12:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Wed, 22 Apr 2020 13:32:45 -0000

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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


