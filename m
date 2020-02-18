Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zQX-0001ev-T7
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:44:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQV-0001Ub-3Y
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQT-0005wd-Vy
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:23 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46488
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQT-0005w8-S6
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCQCf8OR1kY+/p5b4mHJ3QG09v3lGeftuZ/e10MXqmo=;
 b=gNGybkKMcE9IS/zPnK3Hlkc7seItCheHZABrF0jHVtNA/aU2SnTRaArdq55SM0NkGE+iEV
 Q2KStO9Z2yz/bmm+9gg9PSGGxXx4S2CTbRlsuHppbwhXRn28epHUduxeram2koKpkWKled
 qzAmlVV6sgcuWabWVHhkYCrGjJDYOe8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-KSYeswstODevehzpYv4mRA-1; Tue, 18 Feb 2020 04:44:16 -0500
Received: by mail-wr1-f70.google.com with SMTP id d8so10456803wrq.12
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:44:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JTAYCeyl+pNe1lk0kNlsj14Fj0ev9DGEUp2oxJFg1Hs=;
 b=icPMV06fYvPDBXV24dFsRMFIYJ4D3DonkhDpY17p4WmUg5VGmy7mgGSTytkqXDikGf
 SSCVgH+bHHa4eGSwQAveS/TXCebgOCWwj4sGtFky0udF4luHV74H0vg6Jnc5i2QpKjr+
 iIcOfMYRgBLVqDqq7iW99cfSbRWoLgYPFkkcoJpJAoWNyiKsLtI3h4fKHIJAhNLj2nNG
 09euP7c2asbFiEW3/4/JvpmU6EEAq4VapyATCzuB6LVpAulE6lGxXwSOG1TiwsnjYYUq
 PR61htEFt+OSIrmwVlp8Tubc0sA4289jhWV35/EflZcFKrPFlGuePXAGOqzYwYWnwBmM
 xGpg==
X-Gm-Message-State: APjAAAWT7MOjLg2x79YHWXd8av/Gx+MsJc5+4GLUDkFZLqrFvyL5jeiF
 XYv+p3R/5991gXkvOeLH6EY67YAEjccPYkiEhHBOOTbenLREBipZDQCenhg7DPVJrpv5p2S3BXr
 bVuFqab7wTjVSXnwr/g==
X-Received: by 2002:adf:de86:: with SMTP id w6mr29018432wrl.115.1582019055864; 
 Tue, 18 Feb 2020 01:44:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqxzD3WAqCTdNNHxCg7SaFclNwM4okabSxUgrIr/k78N7Ojb2sIYWq5/FjLXEWQXGej3Q7K1WA==
X-Received: by 2002:adf:de86:: with SMTP id w6mr29018383wrl.115.1582019055600; 
 Tue, 18 Feb 2020 01:44:15 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:15 -0800 (PST)
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
Subject: [PATCH RESEND 05/13] hw/arm/xlnx-versal: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:43:54 +0100
Message-Id: <20200218094402.26625-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: KSYeswstODevehzpYv4mRA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Tue, 18 Feb 2020 09:44:24 -0000

Fixes: 6f16da53ffe
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/xlnx-versal-virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 462493c467..0d2e3bdda1 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -350,7 +350,7 @@ static void create_virtio_regions(VersalVirt *s)
     int i;
=20
     for (i =3D 0; i < NUM_VIRTIO_TRANSPORT; i++) {
-        char *name =3D g_strdup_printf("virtio%d", i);;
+        char *name =3D g_strdup_printf("virtio%d", i);
         hwaddr base =3D MM_TOP_RSVD + i * virtio_mmio_size;
         int irq =3D VERSAL_RSVD_IRQ_FIRST + i;
         MemoryRegion *mr;
--=20
2.21.1


