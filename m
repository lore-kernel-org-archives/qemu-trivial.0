Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9cLv-0001Aa-CT
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 17:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33074)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9cLc-0000OR-Jr
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9cLb-0006sm-Dj
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42480
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9cLb-0006sM-AC
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583360314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8g6dQ3CpRHKhm3JtMqVTXiTXrin8V/riv5Rhf5txJno=;
 b=E9twJyhisnuT5O6bRTsNMu/xdTyZBdmUOaA4z5BZGKGhwibinxny+5RZDtcy1VuZi03c1+
 +PTB7/ABuTHWf/h6Iq6JiRDeifJOW8C/ZHdThCJw4/tl9U9RPIY1CwK9Lp+E40Scn0e6JQ
 OBNOBJPUfQ9wa1uwsh5I+C3Zj0VZWfw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-J1N2Vad9OxKy0Ja0edQidg-1; Wed, 04 Mar 2020 17:18:30 -0500
X-MC-Unique: J1N2Vad9OxKy0Ja0edQidg-1
Received: by mail-wm1-f72.google.com with SMTP id j130so1335106wmj.9
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 14:18:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ag/+xxkZSZEkgkSM8quJuguUY+bU0lgLQ4HQ0DMXWs=;
 b=m62Q9nupiPupo9tLAXHoGvdMk/tBBQVvDDS8Di2THj4TIJI4ALkdRrHKY+oJ60lPLO
 TZagpRjF0hdd9d0AyyG7tx+4x5BJ9+H39WR2+FmasLtjL9iXOIqrsrP6yEXHQouku3lP
 XnJ7m68+qvkT9vaJeTYKsn/gYce+74IfhdcFZBzxFu+yQW34gGJ6SvjMlSy6YW3lxn8H
 DnU1dmfHVogcr3kxPo9DYqgOCrCw1nIPk5CJG5LWQpMsokyTX8sZ277A8j2g0+sBoTc9
 sFLPJES6guJjlDMoyM9bJSNgMLZGWCDQyKB/WOR+v2psbq7VMY6aGVvcEPH/RdXfljU0
 qZ5A==
X-Gm-Message-State: ANhLgQ3aLq8y0HoIje+a3zsyXmerX1BRHui7vDyJo2YGm+Y0J2TGARsK
 4Z6RQ279FOEe7ANxnF5zrcy45S7b76eIbzOWhgDpRU2NnRoXs7f7R1Y3H55LqlNHPWOUyvqGCf9
 a4SHcMb+K554YBhgaEA==
X-Received: by 2002:a1c:9e85:: with SMTP id h127mr5311628wme.145.1583360309774; 
 Wed, 04 Mar 2020 14:18:29 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtKcWBVy9Ebsa5ZD89bCp6BN1joSIMvdFbksX94m3Mg3Rrj4N072ncdORfw0lP3e8sa5zBJbg==
X-Received: by 2002:a1c:9e85:: with SMTP id h127mr5311613wme.145.1583360309508; 
 Wed, 04 Mar 2020 14:18:29 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id q125sm6721082wme.19.2020.03.04.14.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 14:18:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 4/6] hw/audio/intel-hda: Use memory region alias to reduce
 .rodata by 4.34MB
Date: Wed,  4 Mar 2020 23:18:05 +0100
Message-Id: <20200304221807.25212-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200304221807.25212-1-philmd@redhat.com>
References: <20200304221807.25212-1-philmd@redhat.com>
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
X-List-Received-Date: Wed, 04 Mar 2020 22:18:38 -0000

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


