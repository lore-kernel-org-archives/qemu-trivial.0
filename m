Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDEPM-0000gs-6E
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2020 17:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36813)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDEPJ-0000eM-IP
 for qemu-trivial@nongnu.org; Sat, 14 Mar 2020 17:33:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDEPG-0004tw-P2
 for qemu-trivial@nongnu.org; Sat, 14 Mar 2020 17:33:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22894
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDEPG-0004tg-LM
 for qemu-trivial@nongnu.org; Sat, 14 Mar 2020 17:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584221598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GGjOTkUYf+GX1/cPgSF/r+83O02JxtmGeXpWGAW3xLo=;
 b=iwbMOs/QYyvmXLGUhGslzDlDK8wHP0asE64wfjXFttUzfR8IUOTjo2U+ozkoiHz76E7NVu
 kvOLadzFplbOonB0AzxRVJJTFAYYnwYdflw+aZ/lwIy4hgAS6lj72x85TWv00YPTvOicAg
 V2wN4WNqaMw88OTDAxh7NEigSUTzsPQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-5PakZSDcM_Ol9bHK1HjSWg-1; Sat, 14 Mar 2020 17:33:16 -0400
X-MC-Unique: 5PakZSDcM_Ol9bHK1HjSWg-1
Received: by mail-wr1-f72.google.com with SMTP id t4so2153885wrr.1
 for <qemu-trivial@nongnu.org>; Sat, 14 Mar 2020 14:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PHFbYPhoT67HpiSc4k10hKbBfy6Vxq0LfMGIlrYmsqo=;
 b=bdvRpGsmXvxGNsQWy265Y5IQbvZIm0VKSdu6eycgHbTN4ASbmGtFc39E+mkCxfu1Cl
 PeNuAUXP9iz4i2wBkyJRyPvgTVXDoLVaA4r48ouEvOWoPt6sPbphJmsCeBy8wJCDzr9W
 eJ0Kmlpqc3IXO7ARPIrGP3JND/K1M063sa+RjNNlq8Yenu8DMMxkuXKdp62a/sU+iZJb
 vic3x6Bk8qwUbogJXDoQkGmyqJOCzHDWNI43TfNIUpDbmF2T29koD5ktrHKeAupR38tn
 NTOozjkuuXuAxn826uJNii061IHRwN6aYQBIwpp9i6sZOFnzVwoGn3NcKaWiCiYv4U5a
 qp6A==
X-Gm-Message-State: ANhLgQ3fgB3IXYwXdGMOxXawUSoa+GooCsc2AnfiVaruMcw2UsKQ3qGB
 zIa1GOhZlRH6JGqYcHWeNd0XjJRCLCbv66FSni2mOz1JN3TkMU1grUEwP9NmfxRfQskE1oLxxeO
 275lDLlGnQ3oyL6PK5g==
X-Received: by 2002:a5d:56c4:: with SMTP id m4mr12478566wrw.182.1584221595155; 
 Sat, 14 Mar 2020 14:33:15 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsZPHmGD9eTQUPW4RVHTlTbkppxAIOfyFE9DO2zxMf/UC9XH54p3fwf8k3A+C6N02vFtxgZNQ==
X-Received: by 2002:a5d:56c4:: with SMTP id m4mr12478553wrw.182.1584221594947; 
 Sat, 14 Mar 2020 14:33:14 -0700 (PDT)
Received: from localhost.localdomain (191.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.191])
 by smtp.gmail.com with ESMTPSA id i9sm23114290wmd.37.2020.03.14.14.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2020 14:33:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Arbuckle <programmingkidx@gmail.com>
Subject: [PATCH] qemu-common.h: Update copyright string to include 2020
Date: Sat, 14 Mar 2020 22:33:12 +0100
Message-Id: <20200314213312.28282-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
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
X-List-Received-Date: Sat, 14 Mar 2020 21:33:22 -0000

Extend the copyright range to include the current year.

Reported-by: John Arbuckle <programmingkidx@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/qemu-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 082da59e85..d0142f29ac 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -13,7 +13,7 @@
 #define TFR(expr) do { if ((expr) !=3D -1) break; } while (errno =3D=3D EI=
NTR)
=20
 /* Copyright string for -version arguments, About dialogs, etc */
-#define QEMU_COPYRIGHT "Copyright (c) 2003-2019 " \
+#define QEMU_COPYRIGHT "Copyright (c) 2003-2020 " \
     "Fabrice Bellard and the QEMU Project developers"
=20
 /* Bug reporting information for --help arguments, About dialogs, etc */
--=20
2.21.1


