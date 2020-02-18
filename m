Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zQX-0001d1-AC
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:44:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43406)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQU-0001Sr-DS
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQT-0005ve-BZ
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53544
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQT-0005vP-7V
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPePaRqkaWNyhfXeO+GdlIKEGlxMZTPmi+n7OlsW4E8=;
 b=ids7fY6rA5BpE8PMb1nylvWHocjAcJUUzUdXfe1hXx8R+/E+dwnljiy14ZxEXnJe1S3Xnm
 +xQWYnQmjo6z6FMHJRFPeSMgBRY4vZ/MJmrTRSqjy/7ogZNycgpwlAYa9iB0wPAGA/V36S
 vtQCtCSghX37n5I8xUo9DZ4lRXDu9SI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-ozb0Bm6cNlmlHzl-h5PHLw-1; Tue, 18 Feb 2020 04:44:19 -0500
Received: by mail-wr1-f70.google.com with SMTP id w6so10508147wrm.16
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:44:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y3Lefu65TV2Zn/tMAo2R8DrtAEmfr+gqWeC3XzYh9go=;
 b=FHzg2Ok0FsZYeXVrkJexg/+cJwYBPrF+qtwxtaxRdTlmTSmC8SvyMFtJ1PJFEFAkUi
 JEGYpKB2zCGlph6mwQfnolzr+a89RpuRFhVU9RUE3f+efd1dgFltxWI5g1ovCdMGAWXg
 alWb0W7YKA8YISLVvkDH91k7Bpvu5tpBRKMXUaUq6oo+iTw7f/29ewdiXke4+MlN0EDn
 hi0kaIM/mm0f7J7SAftfbVkpaS4P2p/RiTCzMXpiWBWuaDBnRD++LnTLrARV/YPL7ppt
 TeI5Y+PnE2uLNu69ynimQShlRLTFvXlSnkkJJGbO8apieOgulwaIBRRdv40/mYhaHwG4
 VmBw==
X-Gm-Message-State: APjAAAU3zdjqerHlC14vCJJhzbVN6nO0v0RWe/fzBP+Hyr3dOSYvmXoJ
 FzaLorxYkmSbuNuThNtHPEtJpcb2eBXyEL4ZV1yi+TXrLGEcLk0EndPeMSzmUURn8zhPt0pnlXB
 AAj3BjIZq9fhKOI8JhA==
X-Received: by 2002:a1c:7ec5:: with SMTP id z188mr2131173wmc.52.1582019057880; 
 Tue, 18 Feb 2020 01:44:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqwjTtT9QKMDVMnwaag5Zq053OrsGaWDS9MMGXhR2QDJAV5hwIy5om9Z1ROzEb1lQaYYh9VbEw==
X-Received: by 2002:a1c:7ec5:: with SMTP id z188mr2131136wmc.52.1582019057681; 
 Tue, 18 Feb 2020 01:44:17 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:17 -0800 (PST)
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
Subject: [PATCH RESEND 06/13] hw/m68k/next-cube: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:43:55 +0100
Message-Id: <20200218094402.26625-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: ozb0Bm6cNlmlHzl-h5PHLw-1
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
X-List-Received-Date: Tue, 18 Feb 2020 09:44:23 -0000

Fixes: 956a78118bf
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/m68k/next-cube.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index e5343348d0..350c6fec78 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -734,7 +734,7 @@ void next_irq(void *opaque, int number, int level)
     switch (number) {
     /* level 3 - floppy, kbd/mouse, power, ether rx/tx, scsi, clock */
     case NEXT_FD_I:
-        shift =3D 7;;
+        shift =3D 7;
         break;
     case NEXT_KBD_I:
         shift =3D 3;
--=20
2.21.1


