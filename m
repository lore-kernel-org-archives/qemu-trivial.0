Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9psy-00072B-Md
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 07:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41654)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9psr-0006iS-Rc
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9psq-0001SH-8f
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48038
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9psq-0001RS-52
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583412347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8g6dQ3CpRHKhm3JtMqVTXiTXrin8V/riv5Rhf5txJno=;
 b=esLpdeUHOgQstwxLXbAnmQ52zeFAhnj/Yc+AJYSXzKtSiHDUqQwhZr4Zmbse1qMu550mv7
 QuQh25fMwxiveCmC78RfbrgPxHIsAsVaOrcWwLtB4BevZWNoBbI+BddTZ7MwXI4QIFXysL
 2AI+1pcj/Iu3dEfQcFFd8x5RpS9f8dk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-M8-IcKlEMI-pKENRZNOJSg-1; Thu, 05 Mar 2020 07:45:46 -0500
X-MC-Unique: M8-IcKlEMI-pKENRZNOJSg-1
Received: by mail-wm1-f71.google.com with SMTP id k65so1527496wmf.7
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 04:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ag/+xxkZSZEkgkSM8quJuguUY+bU0lgLQ4HQ0DMXWs=;
 b=XOGvu4iAQYc4cyQ6zB9+r36J2CqGR5q2189/3Ie9SrdsuHbWNdOgqAdsL2jhiLZqqT
 74BIoIRksL/DEcC11rjO0xu8LnmWg0sHcQa1w81ZTC9GbyO7ZX0Y/V5gp2cS8trMYrj0
 RxE6F4t/g8ZoxnEQyoFaVaaH57ogHxsf0FdRMSFGPvi5SWxw0Z/1QkW0F/NAgmw8PB5l
 oG8DD8jBWrgQPrqL1jfZjV50F44kqFlKK34tKfs1uGF4v/kQHWE6tdBobmwLS4UYBKwK
 /h4RYHqrCX714bTWq9KiQnPx3pWc5VUNMbjpkueBqTlifinn2Ow5bPZ7+vqQm/ZkqZE8
 X24A==
X-Gm-Message-State: ANhLgQ24xCJ4vnB8odhPVTIE7VMwz2ZAOxgjHfqtRq+23y0k6Sx7DRNn
 Bc3RiBIXW2M9uDmixi25HhLgJuWtvLWU8Sj7GMbWybxXkhyYr2uDH/REK8AcPfB2KcOA2leKDWH
 2S2snsr9Lx55dTD2qbA==
X-Received: by 2002:adf:c44a:: with SMTP id a10mr9610706wrg.279.1583412344762; 
 Thu, 05 Mar 2020 04:45:44 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvV45icIeKnJohi2wwznflJoac7ddAA7c8GDji6ulzoJK4tbHIpm7Ij2Vs4WTB93r6z1hLpEA==
X-Received: by 2002:adf:c44a:: with SMTP id a10mr9610688wrg.279.1583412344548; 
 Thu, 05 Mar 2020 04:45:44 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id w16sm10557400wrp.8.2020.03.05.04.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 04:45:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 3/9] hw/audio/intel-hda: Use memory region alias to reduce
 .rodata by 4.34MB
Date: Thu,  5 Mar 2020 13:45:19 +0100
Message-Id: <20200305124525.14555-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200305124525.14555-1-philmd@redhat.com>
References: <20200305124525.14555-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Thu, 05 Mar 2020 12:45:51 -0000

The intel-hda model uses an array of register indexed by the
register address. This array also contains a pair of aliased
registers at offset 0x2000. This creates a huge hole in the
array, which ends up eating 4.6MiB of .rodata (size reported
on x86_64 host, building with --extra-cflags=3D-Os).

By using a memory region alias, we reduce this array to 132kB.

Before:

  (qemu) info mtree
    00000000febd4000-00000000febd7fff (prio 1, i/o): intel-hda

After:

  (qemu) info mtree
    00000000febd4000-00000000febd7fff (prio 1, i/o): intel-hda
    00000000febd4000-00000000febd7fff (prio 1, i/o): intel-hda-container
      00000000febd4000-00000000febd5fff (prio 0, i/o): intel-hda
      00000000febd6000-00000000febd7fff (prio 0, i/o): alias intel-hda-alia=
s @intel-hda 0000000000000000-0000000000001fff

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/audio/intel-hda.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 1bcc3e5cf8..e8d18b7c58 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -181,7 +181,9 @@ struct IntelHDAState {
     IntelHDAStream st[8];
=20
     /* state */
+    MemoryRegion container;
     MemoryRegion mmio;
+    MemoryRegion alias;
     uint32_t rirb_count;
     int64_t wall_base_ns;
=20
@@ -670,12 +672,6 @@ static const struct IntelHDAReg regtab[] =3D {
         .offset   =3D offsetof(IntelHDAState, wall_clk),
         .rhandler =3D intel_hda_get_wall_clk,
     },
-    [ ICH6_REG_WALLCLK + 0x2000 ] =3D {
-        .name     =3D "WALLCLK(alias)",
-        .size     =3D 4,
-        .offset   =3D offsetof(IntelHDAState, wall_clk),
-        .rhandler =3D intel_hda_get_wall_clk,
-    },
=20
     /* dma engine */
     [ ICH6_REG_CORBLBASE ] =3D {
@@ -837,12 +833,6 @@ static const struct IntelHDAReg regtab[] =3D {
         .size     =3D 4,                                                \
         .offset   =3D offsetof(IntelHDAState, st[_i].lpib),             \
     },                                                                \
-    [ ST_REG(_i, ICH6_REG_SD_LPIB) + 0x2000 ] =3D {                     \
-        .stream   =3D _i,                                               \
-        .name     =3D _t stringify(_i) " LPIB(alias)",                  \
-        .size     =3D 4,                                                \
-        .offset   =3D offsetof(IntelHDAState, st[_i].lpib),             \
-    },                                                                \
     [ ST_REG(_i, ICH6_REG_SD_CBL) ] =3D {                               \
         .stream   =3D _i,                                               \
         .name     =3D _t stringify(_i) " CBL",                          \
@@ -1125,9 +1115,15 @@ static void intel_hda_realize(PCIDevice *pci, Error =
**errp)
         error_free(err);
     }
=20
+    memory_region_init(&d->container, OBJECT(d),
+                       "intel-hda-container", 0x4000);
     memory_region_init_io(&d->mmio, OBJECT(d), &intel_hda_mmio_ops, d,
-                          "intel-hda", 0x4000);
-    pci_register_bar(&d->pci, 0, 0, &d->mmio);
+                          "intel-hda", 0x2000);
+    memory_region_add_subregion(&d->container, 0x0000, &d->mmio);
+    memory_region_init_alias(&d->alias, OBJECT(d), "intel-hda-alias",
+                             &d->mmio, 0, 0x2000);
+    memory_region_add_subregion(&d->container, 0x2000, &d->alias);
+    pci_register_bar(&d->pci, 0, 0, &d->container);
=20
     hda_codec_bus_init(DEVICE(pci), &d->codecs, sizeof(d->codecs),
                        intel_hda_response, intel_hda_xfer);
--=20
2.21.1


