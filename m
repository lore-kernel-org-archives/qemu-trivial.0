Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zQi-00029p-LV
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43695)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQg-000246-Dt
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQf-000672-Dt
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20364
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQf-00066L-94
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2H4J2vu3KXwWqexWZLOkS7UYkLLeRSP92ejNeD36GIo=;
 b=R5mxrgWgdZ+5rnLVt6p2XoML+JP0klN7djEM/lzCbPbRruMq3taA9ydUhJvlFFHVOcZr6W
 fySgRhcu8USxcMLJEUOwSI15J6Flh6O6yz2+kvb6hhJ86Xsda6yiTdt41Wt+/Let8jJkpi
 6xHcNW38vHCLe5Ux1X5PvvV7bGOgps0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-Ulkkd-nCPUGrGP4Y3UX-wA-1; Tue, 18 Feb 2020 04:44:28 -0500
Received: by mail-wr1-f69.google.com with SMTP id m15so10436600wrs.22
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ueQmicwIeIWE9QVKujYvFp2EZixSOWD+HCjjhY2qH0=;
 b=tVBrDEAlhORNev/Yy7Bw1fsM9rAZA7ANoD9hRC6Zv1cjEeelIC6hO7Kf+nv3UBqmJS
 FyNaQ1F7DEzKGViiTcc96/ia9SBl9CzjBI1SC7Xw+FC8qXu59W2FO3mNP/WS+kkkYwy4
 N5bmYngiMh9Q/Jt5j41uFSq3shlrSfdqei4uNyVccQuiCxtaGV/ITIvFqekXAfdcTH61
 EBmLMPRIupB3AcMXHuJADgpA14JWBCdRlAdp/OGBMXFQSC3BwvOiRzFAdAh5LFiJyJHx
 p2Gc/dD5XgW6lQJ56uwLpotml32vLgPLAEX1dJPL43SOo94comWvm2rLTM9Mrt9PosFd
 Ahvw==
X-Gm-Message-State: APjAAAUoTv6h2HHrxbIXASxPw1/InYjwO+B91JURqRqXVQvk33WfMvN/
 O7d6mpFjEIxM3fAdRXedy4/Dq11lHSFBKDVBiyHjh/qAI2wrV35VBcAn/YKESqniNt9NT45IDm8
 AQeGxY9pCvd0SGH3Mdw==
X-Received: by 2002:a7b:c14d:: with SMTP id z13mr2148711wmi.71.1582019067828; 
 Tue, 18 Feb 2020 01:44:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqwCA059Ogn7CXouSGQm9+beUhkgs8qHWq3OziNenbn6goYgA3XySp+oQl0mgJ91wP5MvnEJ7A==
X-Received: by 2002:a7b:c14d:: with SMTP id z13mr2148654wmi.71.1582019067602; 
 Tue, 18 Feb 2020 01:44:27 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:27 -0800 (PST)
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
 Justin Terry <juterry@microsoft.com>
Subject: [PATCH RESEND 11/13] target/i386/whpx: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:44:00 +0100
Message-Id: <20200218094402.26625-12-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: Ulkkd-nCPUGrGP4Y3UX-wA-1
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
X-List-Received-Date: Tue, 18 Feb 2020 09:44:35 -0000

Fixes: 812d49f2a3e
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Justin Terry (VM) <juterry@microsoft.com>
---
 target/i386/whpx-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/whpx-all.c b/target/i386/whpx-all.c
index 3ed2aa1892..35601b8176 100644
--- a/target/i386/whpx-all.c
+++ b/target/i386/whpx-all.c
@@ -511,7 +511,7 @@ static void whpx_get_registers(CPUState *cpu)
     /* WHvX64RegisterPat - Skipped */
=20
     assert(whpx_register_names[idx] =3D=3D WHvX64RegisterSysenterCs);
-    env->sysenter_cs =3D vcxt.values[idx++].Reg64;;
+    env->sysenter_cs =3D vcxt.values[idx++].Reg64;
     assert(whpx_register_names[idx] =3D=3D WHvX64RegisterSysenterEip);
     env->sysenter_eip =3D vcxt.values[idx++].Reg64;
     assert(whpx_register_names[idx] =3D=3D WHvX64RegisterSysenterEsp);
--=20
2.21.1


