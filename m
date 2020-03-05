Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9ewg-0004C6-4w
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 20:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9ewd-00047d-9w
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 20:05:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9ewc-0005JF-74
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 20:04:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30591
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9ewc-0005Ix-3e
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 20:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583370297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G7z8C3H465JpVsN6Yw+fEi9EeJJjIsNf/qW73pA0nsU=;
 b=SR5mwoApc/nM5t+KzNBxcDGJCZOqV+Qt+3nhC7T5ohY10WSF7ARoMtG7f4xDSgv+sdXenh
 UY60qnkvc8JPWAAOwbx4XpsXc39six6tsbixTvPVLViA1zMrGUMWeyxlsK6YMpZuzDj5Wh
 aZzlfxGjtwstALyfILlhaQKYGz/lKp4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-U2nTIjiTO6GOVntE_aIE_w-1; Wed, 04 Mar 2020 20:04:55 -0500
X-MC-Unique: U2nTIjiTO6GOVntE_aIE_w-1
Received: by mail-wm1-f72.google.com with SMTP id y18so2358186wmi.1
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 17:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mERLJkA6KL9WHqzO6Je/w9Mt4U4fyGT4//wl15kUfLY=;
 b=g1L7ooTIdUCqAeO3w40TWAEnwrhXRJFZI7UmnT90PWK92nFw1z2GrEpawqam728sbd
 /3eYcwGhhxfgNWEVy9zIL5hiHGAJQ1Q4qbCvjYVQCHWQzeyeEOck7uXtQxOE2ADJuYqV
 wWnRTPd+KOs5Wvmz+XwdInbVE/ACC/cHNvFVdE6MEZ03O3c8Px8i/+coWXVT8YoVYD0n
 xCQ5/qJdemAd3UIlMk2umbfEs8qUZrjMNqNmaz3SvzDJGvdMMIGUJYnQDQczNspAUSDG
 8rx8yHHjUVTmu9fhAZAfggBmuG+zewQadu7kG5O48nAThuIIs2KrdG3qraiSdiYZ3tBn
 CeNA==
X-Gm-Message-State: ANhLgQ1A1pxST4oga0IYtQHFIQvV1kq72BfJ6k9hnD+vS6UR0jx/PgK0
 T41zGqoATKwEiAy2nV/4VlVQUvce/Tv8zyc9CgZyJ5kNg1Iu9zc1FzVADaeQbPNiSD7VncPEdiX
 Kx3BgTLAL9nFZlwK+kg==
X-Received: by 2002:adf:80cb:: with SMTP id 69mr6444520wrl.320.1583370294446; 
 Wed, 04 Mar 2020 17:04:54 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvJ90DV5759BkuoDYTgS2LzEz7rlCGQ76Yc2MdMX8Uuwxeu1ZXbzStpDEg3Jd8tWL72k4I3gw==
X-Received: by 2002:adf:80cb:: with SMTP id 69mr6444498wrl.320.1583370294189; 
 Wed, 04 Mar 2020 17:04:54 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id c23sm4561228wme.39.2020.03.04.17.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 17:04:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 1/3] hw/net/e1000: Add readops/writeops typedefs
Date: Thu,  5 Mar 2020 02:04:44 +0100
Message-Id: <20200305010446.17029-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200305010446.17029-1-philmd@redhat.com>
References: <20200305010446.17029-1-philmd@redhat.com>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 05 Mar 2020 01:05:00 -0000

Express the macreg[] arrays using typedefs.
No logical changes introduced here.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/net/e1000.c       | 6 ++++--
 hw/net/e1000e_core.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 0b833d5a15..972d9b5083 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -1150,7 +1150,8 @@ set_ims(E1000State *s, int index, uint32_t val)
 }
=20
 #define getreg(x)    [x] =3D mac_readreg
-static uint32_t (*macreg_readops[])(E1000State *, int) =3D {
+typedef uint32_t (*readops)(E1000State *, int);
+static readops macreg_readops[] =3D {
     getreg(PBA),      getreg(RCTL),     getreg(TDH),      getreg(TXDCTL),
     getreg(WUFC),     getreg(TDT),      getreg(CTRL),     getreg(LEDCTL),
     getreg(MANC),     getreg(MDIC),     getreg(SWSM),     getreg(STATUS),
@@ -1205,7 +1206,8 @@ static uint32_t (*macreg_readops[])(E1000State *, int=
) =3D {
 enum { NREADOPS =3D ARRAY_SIZE(macreg_readops) };
=20
 #define putreg(x)    [x] =3D mac_writereg
-static void (*macreg_writeops[])(E1000State *, int, uint32_t) =3D {
+typedef void (*writeops)(E1000State *, int, uint32_t);
+static writeops macreg_writeops[] =3D {
     putreg(PBA),      putreg(EERD),     putreg(SWSM),     putreg(WUFC),
     putreg(TDBAL),    putreg(TDBAH),    putreg(TXDCTL),   putreg(RDBAH),
     putreg(RDBAL),    putreg(LEDCTL),   putreg(VET),      putreg(FCRUC),
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 94ea34dca5..38bdb90114 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -2855,7 +2855,8 @@ e1000e_set_gcr(E1000ECore *core, int index, uint32_t =
val)
 }
=20
 #define e1000e_getreg(x)    [x] =3D e1000e_mac_readreg
-static uint32_t (*e1000e_macreg_readops[])(E1000ECore *, int) =3D {
+typedef uint32_t (*readops)(E1000ECore *, int);
+static readops e1000e_macreg_readops[] =3D {
     e1000e_getreg(PBA),
     e1000e_getreg(WUFC),
     e1000e_getreg(MANC),
@@ -3061,7 +3062,8 @@ static uint32_t (*e1000e_macreg_readops[])(E1000ECore=
 *, int) =3D {
 enum { E1000E_NREADOPS =3D ARRAY_SIZE(e1000e_macreg_readops) };
=20
 #define e1000e_putreg(x)    [x] =3D e1000e_mac_writereg
-static void (*e1000e_macreg_writeops[])(E1000ECore *, int, uint32_t) =3D {
+typedef void (*writeops)(E1000ECore *, int, uint32_t);
+static writeops e1000e_macreg_writeops[] =3D {
     e1000e_putreg(PBA),
     e1000e_putreg(SWSM),
     e1000e_putreg(WUFC),
--=20
2.21.1


