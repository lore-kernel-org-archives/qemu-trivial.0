Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9pt9-0007R0-A8
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 07:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41732)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9pt1-0007Aw-Vl
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:46:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9pt0-0001YO-RL
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20193
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9pt0-0001Xl-Nh
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 07:45:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583412358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bpO/T7UwPAvLhYM4LuPfNzVKKs4kmwvLsNBfOTPVceU=;
 b=FSUWYO0+BRW2EDPETDgQ3JAamjrnkxXVR7t379nMo/0uiXZtscsVUaJp03SHgZ1d0aE0co
 SddVhXbjIv3D+yLz70cOCiCkajQ4gMYH4Aku8iuCxfxh33jaEtb01wa7DICqxeingoFHt2
 naSDbdSSY7/oXDNpLqEBC8WHzOD5qEs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-F2zGgVV7MqGVPVYeTLam6g-1; Thu, 05 Mar 2020 07:45:57 -0500
X-MC-Unique: F2zGgVV7MqGVPVYeTLam6g-1
Received: by mail-wm1-f70.google.com with SMTP id g26so1526846wmk.6
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 04:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E/nIlQM3WrOtft5YLrhenWftF1BsF4c8+Al/4nVYdhE=;
 b=lwRCGezt5M98GjFAjb/Wt/AaSM/VnPZIlYRsZl+W/GxKVvzDfakDpGvW9ZegX678SG
 etr+zvjmznj84YdLFNStRkqmT1C+nvtg7X62LGlVIDw9P6I1Qhz7zNx2niJ3H36gM6Pj
 95k4J/0FOSzjwlBftUNoyadqvy0s9kOJti1kiLCywzPMEa0aWccZJ1iYiRA7Nsbk8BLg
 XFmk1Qy4yD90FdBH6AKpucS2UYAmu/Gg4Vd6J0l+60Aqd4K7yeZUaHba3xqZPlyGLBxn
 f7VRUDDmWprzwqHyHozWfWh9LxFt1b3Eq4ZcWSHRjN0sHIPHZiePJg/prEgPOeseWDfT
 0d+g==
X-Gm-Message-State: ANhLgQ2ULZtC9MQTsZ+Rv6cWjC7ZiXMxjlKxOVl6cyr0wCLz+2CMq/FE
 18YSdOiHoPwDMYGC9ZXXuiwsPZgxpXrbMgSwQVGVuSFU7oPwuSUd/cVxN/kwWQDbiXUeWk06wKQ
 Wbhwj0TiqErcS6R20IA==
X-Received: by 2002:a05:600c:218d:: with SMTP id
 e13mr4741076wme.127.1583412355474; 
 Thu, 05 Mar 2020 04:45:55 -0800 (PST)
X-Google-Smtp-Source: ADFU+vs1oX/E7fiCsD5PzTUeaRwCXmsMRvTr+x5pc79kbnj7zmdYKLg5JMMhcW6UJhtQzYxketXY/Q==
X-Received: by 2002:a05:600c:218d:: with SMTP id
 e13mr4741057wme.127.1583412355279; 
 Thu, 05 Mar 2020 04:45:55 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id z16sm43034175wrp.33.2020.03.05.04.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 04:45:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 5/9] hw/net/e1000: Move macreg[] arrays to .rodata to save
 1MiB of .data
Date: Thu,  5 Mar 2020 13:45:21 +0100
Message-Id: <20200305124525.14555-6-philmd@redhat.com>
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
X-List-Received-Date: Thu, 05 Mar 2020 12:46:01 -0000

Each array consumes 256KiB of .data. As we do not reassign entries,
we can move it to the .rodata section, and save a total of 1MiB of
.data (size reported on x86_64 host).

Reviewed-by: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/net/e1000.c       | 4 ++--
 hw/net/e1000e_core.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 972d9b5083..9233248c9a 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -1151,7 +1151,7 @@ set_ims(E1000State *s, int index, uint32_t val)
=20
 #define getreg(x)    [x] =3D mac_readreg
 typedef uint32_t (*readops)(E1000State *, int);
-static readops macreg_readops[] =3D {
+static const readops macreg_readops[] =3D {
     getreg(PBA),      getreg(RCTL),     getreg(TDH),      getreg(TXDCTL),
     getreg(WUFC),     getreg(TDT),      getreg(CTRL),     getreg(LEDCTL),
     getreg(MANC),     getreg(MDIC),     getreg(SWSM),     getreg(STATUS),
@@ -1207,7 +1207,7 @@ enum { NREADOPS =3D ARRAY_SIZE(macreg_readops) };
=20
 #define putreg(x)    [x] =3D mac_writereg
 typedef void (*writeops)(E1000State *, int, uint32_t);
-static writeops macreg_writeops[] =3D {
+static const writeops macreg_writeops[] =3D {
     putreg(PBA),      putreg(EERD),     putreg(SWSM),     putreg(WUFC),
     putreg(TDBAL),    putreg(TDBAH),    putreg(TXDCTL),   putreg(RDBAH),
     putreg(RDBAL),    putreg(LEDCTL),   putreg(VET),      putreg(FCRUC),
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 38bdb90114..df957e0c1a 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -2856,7 +2856,7 @@ e1000e_set_gcr(E1000ECore *core, int index, uint32_t =
val)
=20
 #define e1000e_getreg(x)    [x] =3D e1000e_mac_readreg
 typedef uint32_t (*readops)(E1000ECore *, int);
-static readops e1000e_macreg_readops[] =3D {
+static const readops e1000e_macreg_readops[] =3D {
     e1000e_getreg(PBA),
     e1000e_getreg(WUFC),
     e1000e_getreg(MANC),
@@ -3063,7 +3063,7 @@ enum { E1000E_NREADOPS =3D ARRAY_SIZE(e1000e_macreg_r=
eadops) };
=20
 #define e1000e_putreg(x)    [x] =3D e1000e_mac_writereg
 typedef void (*writeops)(E1000ECore *, int, uint32_t);
-static writeops e1000e_macreg_writeops[] =3D {
+static const writeops e1000e_macreg_writeops[] =3D {
     e1000e_putreg(PBA),
     e1000e_putreg(SWSM),
     e1000e_putreg(WUFC),
--=20
2.21.1


