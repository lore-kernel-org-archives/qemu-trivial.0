Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFcan-0001aW-Mo
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 07:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34860)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcal-0001Sp-3o
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcaj-0006d1-0v
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:03 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:27899)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcai-0006cc-TN
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c4GCDGuXxVBz+Q5fzhTo9pG6tPh9hgrqUC7e1TLGPOU=;
 b=gsjcjqu7FwfvAoI9aaO6Txw/uJUpEJXGA2I0N5JnB8DBLP2Oz0RLLQNVjNqsgfdATqnQp6
 CEoquSRrC3wSWJND24rUux/41jqcPwRh8fRZ6z8tHo5I3ALttoCHLEGeelFmLUvNuOqjvG
 Z+2WjWT7A5sTJxkfQ+O0Gy4fivIt/i8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-2ULmPAOHOdq8D5GsRUM4Ag-1; Sat, 21 Mar 2020 07:46:57 -0400
X-MC-Unique: 2ULmPAOHOdq8D5GsRUM4Ag-1
Received: by mail-wr1-f72.google.com with SMTP id l17so3772237wro.3
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 04:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EI7aeJF1EJiZnbf/LHlroG4oQCKwaeGXEJr4kT4GssI=;
 b=XOUmJ7WWBbd8aAQ/JxjZs+8oyI4vjXHpzKWFFGjEgF+UgqTvv8otqPO7P2xlhBS/CK
 rTLAt5VtKk+Zg/NQ7IETRM5tibMvwud1vf7W3XE1KMpQtcHqKOAGQUO+NLDhcVOm+v9f
 blr8lzYec/ELvPjscLJgZWn2vGmTdNFipmqb0nz97j/ah12rNexNdLXjsC6MVra5JKCw
 6LaZ8Y+XP1xXum9KopDDuCa5HNNweJR4MjWycMkSBA1Qvch6lQMN2vEcwjLTDusz+EgC
 M4sPipF6xM6aA35HNGV4bTw7jC1L0awoqwXKiV8snfH6lv5tHrqeTVgTLPd09U88N7bH
 WCJw==
X-Gm-Message-State: ANhLgQ0zaUpz+kXUTifxvYaJrOPOWz264NbOMom40R7d2W+K9nXjdphn
 sUMGW3F6ELQYlwKCUmb63jWOF/RRlJi46DQ9LSqty+zC2sZS99M/FwIfMGbCSyc+MX9ml/Eyci6
 aOItkDsZ++UiPTQXbMw==
X-Received: by 2002:a1c:a950:: with SMTP id s77mr15599446wme.176.1584791215862; 
 Sat, 21 Mar 2020 04:46:55 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvfQ4vrBm8KBgyUaD+hLChCbh5Ae2/d75e8M+xeE+5T8Oik5ZY2x5rINBu/X0yrYPRPHas5yw==
X-Received: by 2002:a1c:a950:: with SMTP id s77mr15599432wme.176.1584791215666; 
 Sat, 21 Mar 2020 04:46:55 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id y189sm12549500wmb.26.2020.03.21.04.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:46:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 BALATON Zoltan <balaton@eik.bme.hu>, Andrew Jeffery <andrew@aj.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Fam Zheng <fam@euphon.net>, qemu-trivial@nongnu.org,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Kevin Wolf <kwolf@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.0 04/11] hw/input/adb-kbd: Remove dead assignment
Date: Sat, 21 Mar 2020 12:46:08 +0100
Message-Id: <20200321114615.5360-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200321114615.5360-1-philmd@redhat.com>
References: <20200321114615.5360-1-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 11:47:04 -0000

Fix warning reported by Clang static code analyzer:

    CC      hw/input/adb-kbd.o
  hw/input/adb-kbd.c:200:5: warning: Value stored to 'olen' is never read
      olen =3D 0;
      ^      ~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/input/adb-kbd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/input/adb-kbd.c b/hw/input/adb-kbd.c
index 0ba8207589..b0565be21b 100644
--- a/hw/input/adb-kbd.c
+++ b/hw/input/adb-kbd.c
@@ -197,7 +197,6 @@ static int adb_kbd_poll(ADBDevice *d, uint8_t *obuf)
     int keycode;
     int olen;
=20
-    olen =3D 0;
     if (s->count =3D=3D 0) {
         return 0;
     }
--=20
2.21.1


