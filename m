Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9pt9-0007QN-2Z
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 07:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41683)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9psw-0006v4-Gg
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9psv-0001VW-BA
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:54 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41457
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9psv-0001VG-7D
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583412352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JfaE+0axlKWiznACDUVr5NFMk2fsnhKxXDiz+PMDV4Y=;
 b=d2INBvCrR7JEN+EwEfTfHnJfGHXKeKALsZhb50ZaATzupdUUC8XCdUTZ5HQg48u5ZZ4COk
 /UxzSy5ZwP7tOBokvpV+nwP4z9Y0urCq6jx/xCU23m8zvadHOHk2zWHiUSXrggtmzLrNyS
 u3JlkpkqjSxj3jsmnSEKQCHMLeNVUEc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-414KJD2TMICkYM6vf5AXUg-1; Thu, 05 Mar 2020 07:45:51 -0500
X-MC-Unique: 414KJD2TMICkYM6vf5AXUg-1
Received: by mail-wm1-f70.google.com with SMTP id y18so2833594wmi.1
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 04:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=42bbadqUAgxtcc+IIT/30qYCAcYJc9y0Vsbx4Pz3gIU=;
 b=WDfw90XjqjeUoYFFR7XCQrfr9h2J1fbTz7IyqV24JVmLrI+3aBHH1uUX3e6HG46517
 KJZyMbMSB3a6KubFsutHzR50VXxgrDs9iy0ouK8Zi9F/fkpmgaQaSnphDTVyK8hz6RIu
 xI3fbQ4j+HMBUWQuCJtlhA3fad2KmvnmtdhY2SFHC6WKGSL4QIufj+58NcUJLevuyNYy
 A6zjt4PIEVjDDoBIZaNowQKPSULtjuQs82SfIKPTzoKGDW0FY+/Cg8UkpaF3o1orhUJm
 dx73d2AF07GkE62jMfWzxEB4FqMjlWd0GqWqXVimqFFkRJHWdFQJIJMoQOwOXbf1qhtR
 8HDg==
X-Gm-Message-State: ANhLgQ3O9u2+7PvGzVx4prTqwiccevTC526cv7lexZ6HpmMGPDRQFzeG
 Z8NWVh1IPyhzlKzWCA75+5Tkf2ld7L5r28xZcKc4rEkcjzacM+MPyK42R6t8pjTN4fHdJlIDWun
 eR8X4SwCpTz4R01pORA==
X-Received: by 2002:a1c:e146:: with SMTP id y67mr9108382wmg.81.1583412350052; 
 Thu, 05 Mar 2020 04:45:50 -0800 (PST)
X-Google-Smtp-Source: ADFU+vthWhcpjJ0QtztZkI8eKhbEYA0N0BtUoJ9LPdGVIeSPURfmP7IqY9VKyto/DkMvQ6hUEDzqPA==
X-Received: by 2002:a1c:e146:: with SMTP id y67mr9108368wmg.81.1583412349872; 
 Thu, 05 Mar 2020 04:45:49 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id j14sm44924328wrn.32.2020.03.05.04.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 04:45:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 4/9] hw/net/e1000: Add readops/writeops typedefs
Date: Thu,  5 Mar 2020 13:45:20 +0100
Message-Id: <20200305124525.14555-5-philmd@redhat.com>
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
X-List-Received-Date: Thu, 05 Mar 2020 12:45:56 -0000

Express the macreg[] arrays using typedefs.
No logical changes introduced here.

Reviewed-by: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
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


