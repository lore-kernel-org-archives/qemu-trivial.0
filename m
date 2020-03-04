Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9cLZ-0000Fo-9a
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2020 17:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32999)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9cLS-0008Us-6V
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9cLR-0006ft-89
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27644
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9cLR-0006eg-53
 for qemu-trivial@nongnu.org; Wed, 04 Mar 2020 17:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583360303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfnT8d1lOc8oOW388s3B4mt/9tuFbIC8PeXMCcmaMOk=;
 b=IuRhitEcTKbe3mRD0HKsIrEXpAJI9Fx1YLYDNq3trgnQTyE2k8eSi2WP8ZFryHKKy0ofK0
 kIdzEille6oRzL6xA7iuIxWrNSLzAEgFGKnIMKktch8pa3Q5CYOPOKRByBa7/w/f6IR11w
 7Sfe2jALgQ9l56ls+9jQpUeCznbxbWc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-qLHvegPkPy2Un0J_OJGS9Q-1; Wed, 04 Mar 2020 17:18:21 -0500
X-MC-Unique: qLHvegPkPy2Un0J_OJGS9Q-1
Received: by mail-wr1-f72.google.com with SMTP id d7so1459738wrr.0
 for <qemu-trivial@nongnu.org>; Wed, 04 Mar 2020 14:18:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7WthtJEuF/N+eAMadHF0Sd51QGcmnmZoupRAgou8XDo=;
 b=MlYCS6E7pSMF4WkGGPxfPDO1xAqzEK74T/NiwTGlb5PE+ThY3s9xps/pAnvr6T178H
 oDc2y26o0FMffZAZpKmBt4Fy4kdR1HtNlq1AqFUXii3Vt/r12rS9xrSuYolkKxxzHc3t
 248qQE/dj63SsO5HBoGdXzbvr6p70DOjnriw2kvLOpZgBqQ8E+jSTai/3r9m3HpNCSxE
 R18fXZpNaskAmnYDeovcNB2Zpayuqx1d0ey3XwcwV6JHwE3qXaOI4utS6wOGh33A9Nj2
 Y1Txp7244R3j8g9efs5bKI00ezbsTFSA70ZrnLWaDGD0OC6fK9P7Y8obph2UDnuP7kll
 oPfA==
X-Gm-Message-State: ANhLgQ0Dq7F8taT34bKQtek96w8QGXiTurEgRhSWHnrySnS5lbyjjorY
 iGPbyyd8aL1VuPWhuOpcPkRDsT5+K1Xyb/uSc/WZFgwauHUw7Qdh8oI522SlVNpT/uSXANhi4n2
 WQghp/Y9nzvOBuzjo/A==
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr5409981wmc.67.1583360299678;
 Wed, 04 Mar 2020 14:18:19 -0800 (PST)
X-Google-Smtp-Source: ADFU+vslSkLYmU0p/p71iLp1NDP15gsZCNYU3xL69nA9zpOzAMa1N/ZkbHvZSvLrf1G1vtro/6DR/w==
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr5409970wmc.67.1583360299484;
 Wed, 04 Mar 2020 14:18:19 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id g129sm7333661wmg.12.2020.03.04.14.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 14:18:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 2/6] hw/audio/fmopl: Move ENV_CURVE to .heap to save 32KiB of
 .bss
Date: Wed,  4 Mar 2020 23:18:03 +0100
Message-Id: <20200304221807.25212-3-philmd@redhat.com>
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
X-List-Received-Date: Wed, 04 Mar 2020 22:18:27 -0000

This buffer is only used by the adlib audio device. Move it to
the .heap to release 32KiB of .bss (size reported on x86_64 host).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/audio/fmopl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index 173a7521f2..356d4dfbca 100644
--- a/hw/audio/fmopl.c
+++ b/hw/audio/fmopl.c
@@ -186,7 +186,7 @@ static int32_t *VIB_TABLE;
=20
 /* envelope output curve table */
 /* attack + decay + OFF */
-static int32_t ENV_CURVE[2*EG_ENT+1];
+static int32_t *ENV_CURVE;
=20
 /* multiple table */
 #define ML 2
@@ -1090,6 +1090,7 @@ FM_OPL *OPLCreate(int clock, int rate)
 =09OPL->clock =3D clock;
 =09OPL->rate  =3D rate;
 =09OPL->max_ch =3D max_ch;
+    ENV_CURVE =3D g_new(int32_t, 2 * EG_ENT + 1);
 =09/* init grobal tables */
 =09OPL_initialize(OPL);
 =09/* reset chip */
@@ -1127,6 +1128,7 @@ void OPLDestroy(FM_OPL *OPL)
 #endif
 =09OPL_UnLockTable();
 =09free(OPL);
+    g_free(ENV_CURVE);
 }
=20
 /* ----------  Option handlers ----------       */
--=20
2.21.1


