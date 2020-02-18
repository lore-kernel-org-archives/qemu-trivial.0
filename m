Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zQd-0001ux-AN
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:44:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43536)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQa-0001m8-A7
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQZ-000619-Bn
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23487
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQZ-00060G-6v
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02HoXPXFSTUgu0KD081ip91ymagPAPyI1gRkeiKZ3KI=;
 b=DGdbktdcRzYdjDl8JFrbslXD8NAxlHL46zsXdAc0B97+K0NIznZyY81v71JW4k4LCOHeqy
 fBGeOv9QY84+k7EVtOeHbet5a0f6eGFHa+F4/JQ0rejbT79mjhXmkK6IxnUBtMC1YB86Xb
 XdLDFhMgIUsckUPDiIUJY7dXcAUg8vQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36--j94alaJMF67SjFEFogqqQ-1; Tue, 18 Feb 2020 04:44:23 -0500
Received: by mail-wm1-f72.google.com with SMTP id n17so797111wmk.1
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vA3IsJyKAQofk6HtSuxZl4Ss0klNULH/CRlFylcfG4k=;
 b=UJSXHikHkiR8K1r9TMvnmqabzWjsKycPHYmtofqQekJbJduUHIQWM6iE5tH9DxdDuR
 TuN/MsGzN0/r5UpRQroWy8yD5GYA737WBSozRHDwVn9YzIQviEy7CWecUFwxwWAnjPuA
 bkTy20THfJNQB7ET2e8zo9xFpKb7dFDGG8Pe+KQ8zV2yzaFwlVxxIj9VpPiqmI2FA7NX
 7O6jiS0SNWVFquFmJGiL4INjGwNcLYZQNHBMMwH/SoE/QtNLF0MeD4CIYf7+ZVis1e5H
 XgNRptgB3UwZ1W72dhggR32jPrW8UMEclotzeKdku3YAYvFPkXFlqbcShlYPpyOUOytm
 /wEw==
X-Gm-Message-State: APjAAAViIFOnOF2DgmAnq5um+p6hC88x+cgbD3RXL5O/Ns49ABTQotI0
 Gi1d5t9xfhRbees6py1IsXuI1KJsXhC+ZFjKwuYTKyEovO5uhmnuxNhG9zJTlkcShGe+jCVljr3
 5tW8Bbq7n/qr4eoZhvQ==
X-Received: by 2002:a7b:c76a:: with SMTP id x10mr2165447wmk.49.1582019061844; 
 Tue, 18 Feb 2020 01:44:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8AbM+RIvcf/JidHyXET+T174lnqvGndepiY9TnyXwDDhIhbfvoUB66i95qLpgeQifSxpRFw==
X-Received: by 2002:a7b:c76a:: with SMTP id x10mr2165430wmk.49.1582019061660; 
 Tue, 18 Feb 2020 01:44:21 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:21 -0800 (PST)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH RESEND 08/13] hw/vfio/display: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:43:57 +0100
Message-Id: <20200218094402.26625-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: -j94alaJMF67SjFEFogqqQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Tue, 18 Feb 2020 09:44:29 -0000

Fixes: 8b818e059bf
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/vfio/display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/display.c b/hw/vfio/display.c
index a5a608c5b2..f4977c66e1 100644
--- a/hw/vfio/display.c
+++ b/hw/vfio/display.c
@@ -287,7 +287,7 @@ static void vfio_display_dmabuf_update(void *opaque)
     VFIOPCIDevice *vdev =3D opaque;
     VFIODisplay *dpy =3D vdev->dpy;
     VFIODMABuf *primary, *cursor;
-    bool free_bufs =3D false, new_cursor =3D false;;
+    bool free_bufs =3D false, new_cursor =3D false;
=20
     primary =3D vfio_display_get_dmabuf(vdev, DRM_PLANE_TYPE_PRIMARY);
     if (primary =3D=3D NULL) {
--=20
2.21.1


