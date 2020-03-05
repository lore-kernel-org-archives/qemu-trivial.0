Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9ewn-0004Mw-TK
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 20:05:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39510)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9ewk-0004IM-2z
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 20:05:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9ewi-0005Sq-Vj
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 20:05:06 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38266
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9ewi-0005Sk-Sq
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 20:05:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583370304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fUQHY5u6EmUZcs/PU9+tDJ55yHeFQYfslboPGYA34ns=;
 b=Fl13SMVOHcjpI/lP7nzNpJg8uNINb6tAPJ/THz6McQdSwu+lDGa0TLf271xO31rqqdOFnX
 zb6lxpz33sq589Pba555g6k47OnnJP7tvaoD9vvIXKlSZdw/Qj65wJwP1vqA2Ipra7rywA
 H9pHzVpOoJ2/2WNkPsfIU0AAJud+PR0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-9CeHTC-rOG-KNt2slgKYLw-1; Wed, 04 Mar 2020 20:05:00 -0500
X-MC-Unique: 9CeHTC-rOG-KNt2slgKYLw-1
Received: by mail-wr1-f69.google.com with SMTP id 72so1628798wrc.6
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 17:05:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LqA3yPl/c3LrUeLcESiAMq8nwyp7UScHu+TeSWu0joQ=;
 b=aaav9rY8Wz9MGGrOGkDhy2TzMFPtR9akeyTvmJ3y78B+XcByMUAnDok5wU1XCjeG+5
 KuMSBEf/XgMqMky7NlINcsBFAn81LKSiwF4+LYXo8IYHMDtre8AoamVv1k9xMZ6DLk7h
 Ehtq1CPx1EtjbNBmviIRJbnFqoRbv5KfT+97OxgCrvnU5u6rDit1cdsqxHNha1Ykz7D9
 2xmGBWNwK9fNLiyOcKaCbNBzpxDYJfCfimBUs1vJcGV5QlWnn0XYZT7xAoOLdmlQjXW9
 H4zruK/nTenzZSntv4RiPjRHqT/gerkb3QIdAuuZQBha9IRXA5G8ekGPtOWY51hGJJ38
 nbJg==
X-Gm-Message-State: ANhLgQ0No0IawGY/QJG3HwcTHtXu9szWIinpwWRPoNGqUzCrK97S6KG0
 epWftng1tCvniP75/lb0tBrQEfsF5FX0fkDcm8vlm0BeXQADsS6kdpUkX1ip5DpSQs9Nt5m6SQM
 sHj95REelYn0YwdcYpw==
X-Received: by 2002:a1c:2504:: with SMTP id l4mr6259428wml.72.1583370299729;
 Wed, 04 Mar 2020 17:04:59 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsStLSEQ4P3ixqLsg5jOfE+knNZffWOwnVpTYXDptRIv35kd+x19v2hzB4MxmdF/78jFpo+5g==
X-Received: by 2002:a1c:2504:: with SMTP id l4mr6259406wml.72.1583370299545;
 Wed, 04 Mar 2020 17:04:59 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id p17sm39232183wre.89.2020.03.04.17.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 17:04:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 2/3] hw/net/e1000: Move macreg[] arrays to .rodata to save
 1MiB of .data
Date: Thu,  5 Mar 2020 02:04:45 +0100
Message-Id: <20200305010446.17029-3-philmd@redhat.com>
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
X-List-Received-Date: Thu, 05 Mar 2020 01:05:08 -0000

Each array consumes 256KiB of .data. As we do not reassign entries,
we can move it to the .rodata section, and save a total of 1MiB of
.data (size reported on x86_64 host).

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


