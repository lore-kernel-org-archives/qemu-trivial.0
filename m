Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRFUv-0007MF-P2
	for mharc-qemu-trivial@gnu.org; Wed, 22 Apr 2020 09:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59692)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUl-00077E-T2
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:33:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUW-0003gx-Op
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20449
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRFUW-0003cx-Bl
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587562359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2C4mjVc4GupZqidy/jN6Lg6n+I2oMBFVaLfmcbIurl0=;
 b=gEbPnGerQ2GIgQuwJ4s/bO+faHQhv20+icnqUsNXNLo0A/68v/8Glhs9TALIBgdB9qu7ds
 uNYbMZ4AlOaRGb8rXEV+5rvpHkIXFrlutfgI2XV4DCk73V8RSaXKQqcz5deDdhxX172HR2
 cYnOabv5VqU47xX6Hhwmt09n7O0SNms=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-Lo8_U1uoOAevEaiWRUUt8A-1; Wed, 22 Apr 2020 09:32:35 -0400
X-MC-Unique: Lo8_U1uoOAevEaiWRUUt8A-1
Received: by mail-wm1-f72.google.com with SMTP id 14so790791wmo.9
 for <qemu-trivial@nongnu.org>; Wed, 22 Apr 2020 06:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dq75PFzgynrFGY6/YI8kQB8GRBvNE4I9mXbmGtzIHFo=;
 b=Pz0H9jrLQbgVWkNVvzLidNsakhdpFq5LzLFkqPZBKofVmVubH04rf2neVyo2hH6D6n
 Zbjr55Gvfb5IfqTrS/wKNrphyUEpYQvexNmdPrkGrfd59BYuTkmGlD1VwDjNaUFyZ6rv
 IQNkIy9KrMdFYHNbURx43ZOkdLQs1cxXf7EjYdQ3Mhm6g/iIEZeqraFl0iXCLZAtStBb
 5V3gwP9cMIa+I7vwQzHXMyI5Zt8ICcUnXyjojboKviV37NR7qYKIl+Kf9mHcr6JhamKp
 w+7zel6ZclmkwdaUkSEKt9eQtFYR8OV8h2f1Y5+5hqACtXcwWe4n0yCWPTwOiqut+bX9
 hbqA==
X-Gm-Message-State: AGi0PuY941i0VQAKa2vjDifoQ/cE1fyJYBrL4KnT7hkKp81bF5cwafwz
 Iad7+VvpVlRak6wr13ixH2pVe92h0JKSusZcDO4/EsH9WJ6JcCrsTG29wLxZpkHFit9D0WseCh6
 9tnaOSRm7GZb5cFFlyw==
X-Received: by 2002:a05:6000:1001:: with SMTP id
 a1mr31239574wrx.9.1587562354686; 
 Wed, 22 Apr 2020 06:32:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypL5S5fiw1pjeVHXAqixPkISK1j3A4uJRvzr0tgSExLtCfCpYkFUbSeWRoEQ0hralI1T6KA8dA==
X-Received: by 2002:a05:6000:1001:: with SMTP id
 a1mr31239557wrx.9.1587562354470; 
 Wed, 22 Apr 2020 06:32:34 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id h5sm8860641wrp.97.2020.04.22.06.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 06:32:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:STM32F205)
Subject: [PATCH v3 8/9] hw/timer/stm32f2xx_timer: Remove dead assignment
Date: Wed, 22 Apr 2020 15:31:51 +0200
Message-Id: <20200422133152.16770-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200422133152.16770-1-philmd@redhat.com>
References: <20200422133152.16770-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 04:15:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Wed, 22 Apr 2020 13:33:05 -0000

Fix warning reported by Clang static code analyzer:

    CC      hw/timer/stm32f2xx_timer.o
  hw/timer/stm32f2xx_timer.c:225:9: warning: Value stored to 'value' is nev=
er read
          value =3D timer_val;
          ^       ~~~~~~~~~

Reported-by: Clang Static Analyzer
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


