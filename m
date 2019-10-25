Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNxLe-00027E-F4
	for mharc-qemu-trivial@gnu.org; Fri, 25 Oct 2019 07:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40301)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNxLX-0001vT-92
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 07:01:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNxLW-0001IK-6h
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 07:01:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23741
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNxLW-0001I8-3G
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 07:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572001289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZCMZbY3BXuLAM/Zus+tvhIQnQM13usxdBSN4vCiZ85E=;
 b=C/t8fnutLwLFgNDkoBrq+2ft9R4Ajdin7Qfo5DLtmALndoYnDCAy4NNjhy91G/1eFARvCA
 x/BwHsgGLKErH1zpEOO2Ko+KfK/tgNQuspO1nQo2DIFtThY8bTCLllkkPMxM3xCwOVFvhN
 Ou9yyD1Vee2hNzI433zydb3io6HW7Xc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-ssyFhbnKMDutZZ3z4SsUIw-1; Fri, 25 Oct 2019 07:01:27 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 684111005509;
 Fri, 25 Oct 2019 11:01:26 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E6745D9CA;
 Fri, 25 Oct 2019 11:01:24 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-devel@nongnu.org,
 KONRAD Frederic <frederic.konrad@adacore.com>
Cc: qemu-trivial@nongnu.org, Jiri Gaisler <jiri@gaisler.se>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 2/2] hw/misc/grlib_ahb_apb_pnp: Fix 8-bit accesses
Date: Fri, 25 Oct 2019 13:01:14 +0200
Message-Id: <20191025110114.27091-3-philmd@redhat.com>
In-Reply-To: <20191025110114.27091-1-philmd@redhat.com>
References: <20191025110114.27091-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ssyFhbnKMDutZZ3z4SsUIw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 25 Oct 2019 11:01:35 -0000

The Plug & Play region of the AHB/APB bridge can be accessed
by various word size, however the implementation is clearly
restricted to 32-bit:

  static uint64_t grlib_apb_pnp_read(void *opaque, hwaddr offset, unsigned =
size)
  {
      APBPnp *apb_pnp =3D GRLIB_APB_PNP(opaque);

      return apb_pnp->regs[offset >> 2];
  }

Set the MemoryRegionOps::impl min/max fields to 32-bit, so
memory.c::access_with_adjusted_size() can adjust when the
access is not 32-bit.

This is required to run RTEMS on leon3, the grlib scanning
functions do byte accesses.

Reported-by: Jiri Gaisler <jiri@gaisler.se>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/misc/grlib_ahb_apb_pnp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c
index f3c015d2c3..e230e25363 100644
--- a/hw/misc/grlib_ahb_apb_pnp.c
+++ b/hw/misc/grlib_ahb_apb_pnp.c
@@ -242,6 +242,10 @@ static const MemoryRegionOps grlib_apb_pnp_ops =3D {
     .read       =3D grlib_apb_pnp_read,
     .write      =3D grlib_apb_pnp_write,
     .endianness =3D DEVICE_BIG_ENDIAN,
+    .impl =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 4,
+    },
 };
=20
 static void grlib_apb_pnp_realize(DeviceState *dev, Error **errp)
--=20
2.21.0


