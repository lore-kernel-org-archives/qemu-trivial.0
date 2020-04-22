Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRFUO-0006Tb-L3
	for mharc-qemu-trivial@gnu.org; Wed, 22 Apr 2020 09:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59296)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUK-0006PY-2a
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUD-0002iz-ND
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:27 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34238
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRFUD-0002e6-9T
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587562340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LVOONsEpk4U6LFttK9TygLseO38jIaZn5oKoHqGQGaQ=;
 b=DGa5zq6/loepDv1SiBtTTiHN5SI2ISvlt4yLBpUwTPmdyhxSGndXMrPSuto+EuHS0TCf3t
 /Mkz73XAGzXoWm7vniFeS7Fv4OmB3AF3dbNOVvS+n67xmBf+ok1K83w+Gn3a94G7EEyVps
 fuGm3uuoR5O1ETy7t7OHfzfDi2OeMAU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-QQ5AXSYoMaCGBzwsUIUwaQ-1; Wed, 22 Apr 2020 09:32:16 -0400
X-MC-Unique: QQ5AXSYoMaCGBzwsUIUwaQ-1
Received: by mail-wm1-f69.google.com with SMTP id q5so792618wmc.9
 for <qemu-trivial@nongnu.org>; Wed, 22 Apr 2020 06:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S6WvnF67wihOHFujRWuSLGe59jb6c00JiTbf8Rd3b+M=;
 b=EoiDEoBJe5UMThwnFZxLBMApPz2I0YO6qGO3sBsj7qa/h/16fl8lRFeTzcDq1hKoxZ
 eoGtUu8gN3UJFq2+WEVeVCG8KAR8zHPGggfYUU5gOTKI7Aa89C7ADKAHQXHnzauq8NVM
 dOdcWVgexB233o0PXzXR2r6g6f8cQJ3Js2AnIchY5bY7qLdKRRXaSrPx32v0rrbfQOa3
 OO3TTVY6ktbGToHD0jSjQO0hqBzIjHMXua18W/8SBTNHn570a3okptFw7/s7VFlFPya+
 DDkILE+Fe3T8JNsJ1S0PkdHggrZAcxfXkoGaaXxrtwhWf6n9DtZPIPYOH90sQ7mIG+W+
 NSBw==
X-Gm-Message-State: AGi0PubFVlvaXB22cF1XqMbUOTb+e8K1Kz6WzHkfs0z3uhMsdkuUKsMr
 Z5fX7H6rUgEvq8GFmZEXPT4+lnXbEviFkMVb7RKoBKp19AvKq2camzHyAeqUTdE4ctqOL+0dYzi
 Y+H7Kpf4ub/8Pe9pCYA==
X-Received: by 2002:a5d:5304:: with SMTP id e4mr28251640wrv.87.1587562335036; 
 Wed, 22 Apr 2020 06:32:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypKTeUTC6gkp8EoASB2jIwR7sEykaxaGUnt172xGztNTXm45k8P9Url5pwWP/8pb2/MDtjPKRA==
X-Received: by 2002:a5d:5304:: with SMTP id e4mr28251626wrv.87.1587562334830; 
 Wed, 22 Apr 2020 06:32:14 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm7542662wma.47.2020.04.22.06.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 06:32:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-ppc@nongnu.org (open list:Old World (g3beige))
Subject: [PATCH v3 4/9] hw/input/adb-kbd: Remove dead assignment
Date: Wed, 22 Apr 2020 15:31:47 +0200
Message-Id: <20200422133152.16770-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200422133152.16770-1-philmd@redhat.com>
References: <20200422133152.16770-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:57:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Wed, 22 Apr 2020 13:32:30 -0000

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
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
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


