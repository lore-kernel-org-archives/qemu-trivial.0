Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zQZ-0001iQ-32
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43460)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQW-0001aT-Jv
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQV-0005y1-L1
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:24 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24908
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQV-0005xl-HI
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFwSqFOqQSCSww1xvrmrTjGR2tB5knkZUpnBFKdTlOc=;
 b=Pg2xzB+GFwXNnz2ELBVPqPZmUDpISaWHyPO+QDWtq5gp1+RfBJXS/s/wiSnNSAZSAw83x3
 EY5FIzyddITCBLT7muEKaZOQTLPE7vGuPW2kJr+NhV63k7OHBwYw/CFjQWdkCJoQx/38oL
 oLE//XP5K6eP5neE3eJMgBMsrrBUjyI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-QT4HKdmVPveSnsibW4TzsQ-1; Tue, 18 Feb 2020 04:44:21 -0500
Received: by mail-wm1-f69.google.com with SMTP id y125so691333wmg.1
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:44:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EdIcfUQ/U2hHF17TjP9T3eQu8UrcSLlBv6lIHRbb1ng=;
 b=fYpFEaau86TFTfYrzu2EhjAckWyGbUwMagFNmEF1IGjKH6N9Zvfc2Uj4Ey7oRkQO8e
 gbqn7TG9RZAg0Ro8PJZAA3ty3PcWXir+7CAqgo1xAye8khkjRX5qiUj5KHQwgQCo/1PN
 lXwU7j2ATqV6qgSIDWYjqzzaQ+BA9fqIUKQjtbTREOYQkDNaUvEBJR62/4rH7CizXebX
 Oqhja1n+VSvG/JhX4WDtVKTbEtRBHaZUxRtjrl1PhjCwAHzaxQT6yOCYDW/GtHP4XwmN
 quoRqmKSb056t/1PfPh61hewKRerxDLE6U/bx/sGnaS+uB4YH911bnbPNl2ebIdGC6tI
 YsjQ==
X-Gm-Message-State: APjAAAVuAgDfPZSRiefxFdOz1BbFEWM1Oo/1akQgUgpB9h2G8ja2kTq8
 vkptJR+Vxo/imt6SKM9jsfOsJABPo+IDkv59fvq/1X6ue7HY+GwWZSCzbpJIyVyakr4agJBI8bj
 PTA/p/kkL6Y+mkn8Zkw==
X-Received: by 2002:a05:600c:299:: with SMTP id
 25mr2223547wmk.68.1582019059915; 
 Tue, 18 Feb 2020 01:44:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqxKMOFmz8WuMxWwTBTyCBST4g/cP1AY409LS+ZZl+FoOdhI+u7Ak15lTGc2mNST2Qgj7Z9wbg==
X-Received: by 2002:a05:600c:299:: with SMTP id
 25mr2223512wmk.68.1582019059684; 
 Tue, 18 Feb 2020 01:44:19 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Julia Suvorova <jusual@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH RESEND 07/13] hw/scsi/esp: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:43:56 +0100
Message-Id: <20200218094402.26625-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: QT4HKdmVPveSnsibW4TzsQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Tue, 18 Feb 2020 09:44:26 -0000

Fixes: 74d71ea16bc
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index f8fc30cccb..405f8b7cbc 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -293,7 +293,7 @@ static void handle_satn_stop(ESPState *s)
         s->dma_cb =3D handle_satn_stop;
         return;
     }
-    s->pdma_cb =3D satn_stop_pdma_cb;;
+    s->pdma_cb =3D satn_stop_pdma_cb;
     s->cmdlen =3D get_cmd(s, s->cmdbuf, sizeof(s->cmdbuf));
     if (s->cmdlen) {
         trace_esp_handle_satn_stop(s->cmdlen);
--=20
2.21.1


