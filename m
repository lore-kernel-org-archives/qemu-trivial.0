Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFfJq-0005FI-Tn
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfJo-00058E-5D
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfJn-0007Oe-0f
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:44 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:29759)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfJm-0007OK-SU
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HG9aIClnSQgwbfwrNWlQigZ+p9jo+t2veKUaX85pzII=;
 b=alEv05n2sfcCenreaQ42B7wM3I9K2QyGTYZ/MOk7pImV/CRtija0xP0/vTgOt924/374W/
 hjzjKpX3p9ZcA4DNLwdbhllifUP3ywBB28RsAa8H1xW0BeLH4ckw7OrvOTki6Q1JQJJKos
 aUSHudgDfdfkUbKKzOpK4AOInkioVWg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-m5OTi1VhM2OD7xGpGSbxFQ-1; Sat, 21 Mar 2020 10:41:40 -0400
X-MC-Unique: m5OTi1VhM2OD7xGpGSbxFQ-1
Received: by mail-wm1-f70.google.com with SMTP id f8so2569359wmh.4
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 07:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eqn1OJZAYDlLgDc90kBVx1WWSAviOqkIwIwDScG0wiQ=;
 b=BdfqGyTuHNM5t1qQGvKt3395NpGAx2HOL0X9hzMicFcR07DZYohH/HIAzJq/AseQ10
 A8n+cGcJv4j1IYuqicvb2g13rrip8oFK4D4g5HgKtBGuQX9D8EC6q0apjySQs+Wf4XRr
 wkx6Or91s2c10+x3JULMc2e6qx0ynl8EG5cqvZLxlcYlUKxEIFHV0edO5K6tMDFi6O1O
 hzXom3pakHKUyZWX9Egbs7r7LTJ9VN2V3mD2mkpBQriw1cGV27aEpCw/3n6dYB+G6dsh
 6INLfkE8ozB+vSiqu897KWkZun0u7uiDTbsHLVFm1zIDk82dSapGWuIzFCp4D/MGT9bd
 jdWg==
X-Gm-Message-State: ANhLgQ3FJSGhumL4HsNBjgzTC9SORZirDY4zP53nUPCRpCNNgzKFceH7
 sJaQg7Y3FnlDLuz70WRjmaskF+SaCqBHYbrceuObp+djVOLJrxFGo3ac0f3cqz9lN8G9BdaHKS/
 72eaqZ9k4gFNv8WSUOg==
X-Received: by 2002:a05:600c:4145:: with SMTP id
 h5mr16372093wmm.3.1584801699577; 
 Sat, 21 Mar 2020 07:41:39 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsFAJVC1HBS34XteUQ0Qhlp+mZ6lovZPo5MIfUGGv+y3kPDMfyEF1bRg2/TCyRoOapzMf1fsQ==
X-Received: by 2002:a05:600c:4145:: with SMTP id
 h5mr16372067wmm.3.1584801699378; 
 Sat, 21 Mar 2020 07:41:39 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id a13sm14020382wrh.80.2020.03.21.07.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:41:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Max Reitz <mreitz@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.0 v2 04/11] hw/input/adb-kbd: Remove dead assignment
Date: Sat, 21 Mar 2020 15:41:03 +0100
Message-Id: <20200321144110.5010-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200321144110.5010-1-philmd@redhat.com>
References: <20200321144110.5010-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
X-List-Received-Date: Sat, 21 Mar 2020 14:41:45 -0000

Since commit 5a1f49718 the 'olen' variable is not really
used. Remove it to fix a warning reported by Clang static
code analyzer:

    CC      hw/input/adb-kbd.o
  hw/input/adb-kbd.c:200:5: warning: Value stored to 'olen' is never read
      olen =3D 0;
      ^      ~

Fixes: 5a1f49718 (adb: add support for QKeyCode)
Reported-by: Clang Static Analyzer
Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Remove 'olen' (Zoltan)
---
 hw/input/adb-kbd.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/input/adb-kbd.c b/hw/input/adb-kbd.c
index 0ba8207589..a6d5c9b7c9 100644
--- a/hw/input/adb-kbd.c
+++ b/hw/input/adb-kbd.c
@@ -195,9 +195,7 @@ static int adb_kbd_poll(ADBDevice *d, uint8_t *obuf)
 {
     KBDState *s =3D ADB_KEYBOARD(d);
     int keycode;
-    int olen;
=20
-    olen =3D 0;
     if (s->count =3D=3D 0) {
         return 0;
     }
@@ -216,7 +214,6 @@ static int adb_kbd_poll(ADBDevice *d, uint8_t *obuf)
     if (keycode =3D=3D 0x7f) {
         obuf[0] =3D 0x7f;
         obuf[1] =3D 0x7f;
-        olen =3D 2;
     } else {
         obuf[0] =3D keycode;
         /* NOTE: the power key key-up is the two byte sequence 0xff 0xff;
@@ -224,10 +221,9 @@ static int adb_kbd_poll(ADBDevice *d, uint8_t *obuf)
          * byte, but choose not to bother.
          */
         obuf[1] =3D 0xff;
-        olen =3D 2;
     }
=20
-    return olen;
+    return 2;
 }
=20
 static int adb_kbd_request(ADBDevice *d, uint8_t *obuf,
--=20
2.21.1


