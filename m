Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFcbT-0002l4-Nn
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 07:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35289)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcbR-0002fc-Nu
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcbQ-00079W-MM
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:45 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:25233)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcbQ-000794-JI
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GEdgbG/luCssALBIqG8TygafayDXTkEa0M3aN0ohCNI=;
 b=Aeljr/TqdJrW03xZZM4tOGzYDFf5As6//+5Re/GwqhLvD5Cgv3jid2fyazmOmVyB/nVB60
 xGZtFcaR+E99CtezBFa7GZbTHPw8g1t8PZjFnLwvjVM4+ZCws6mcUNbQWsFccZxM0Op5M5
 q7Yrze7/IACBLVJN6nlycx2OSeItuJA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-BiLy5L7QPcSrySqKoYsJlg-1; Sat, 21 Mar 2020 07:47:42 -0400
X-MC-Unique: BiLy5L7QPcSrySqKoYsJlg-1
Received: by mail-wr1-f69.google.com with SMTP id p2so4175124wrw.8
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 04:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RNYtNktAqDdDAs+EFJozo/fN2JmmaPRaAB7IeiBu7pw=;
 b=TxqUfiEZrrlhD3bH6qGoffW5ROxw0H2Jb7UqAFB1jHbzva/9A/TkL59UeJowsnEM6K
 4ie1FEFdDsEFkOC0QaVLHXYTs79yf3xNV18VvePc0JotD0mZdZfPlAMXMMmyo/ABU604
 ZBnsxi8NRqJY+8Z/OI2C+Og3qLQtTzU8h3lPyZh2HRdZ/8s76z7cQZm37t6TOtErZmTl
 75IPZim4P/VYwbtfXg+RPt2yQv4DbbIVqSb6zFVHCo6kXKWoGievgDfLmcITFdEx+32K
 +KOXUSLzL0jVM2Ntw+S91t2shjkU/Y0tIuNf6Cu9ilu0bGsUu97fKyJ3kgkF/SPOY8IG
 kZAA==
X-Gm-Message-State: ANhLgQ10kEQThcgU8ZdKf4uvwtgdw0XpxjLIZa0kokfM2mVBySOiYo4/
 3KaMEwx+XXgTlpUSUKvzUADSGLkDs2Tul5f2P6sZ9qSamjaK52oOP9GxT5Jwp5Mnbk3TfPFq7PN
 N81FNDeL9TnN1Pc7wJw==
X-Received: by 2002:adf:82f7:: with SMTP id 110mr16733202wrc.373.1584791261269; 
 Sat, 21 Mar 2020 04:47:41 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vubbmq/qIpJmOqmMG8os2wSMw39sfHglC6xWNohsFGnLp3+N7OMkezA8fRZyCRCUVesI83LnA==
X-Received: by 2002:adf:82f7:: with SMTP id 110mr16733166wrc.373.1584791261035; 
 Sat, 21 Mar 2020 04:47:41 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id a11sm13098686wrx.54.2020.03.21.04.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:47:40 -0700 (PDT)
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
Subject: [PATCH-for-5.0 11/11] hw/scsi/esp-pci: Remove dead assignment
Date: Sat, 21 Mar 2020 12:46:15 +0100
Message-Id: <20200321114615.5360-12-philmd@redhat.com>
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
 [fuzzy]
X-Received-From: 216.205.24.74
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
X-List-Received-Date: Sat, 21 Mar 2020 11:47:47 -0000

Fix warning reported by Clang static code analyzer:

    CC      hw/scsi/esp-pci.o
  hw/scsi/esp-pci.c:198:9: warning: Value stored to 'size' is never read
          size =3D 4;
          ^      ~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/scsi/esp-pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index d5a1f9e017..2e6cc07d4e 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -195,7 +195,6 @@ static void esp_pci_io_write(void *opaque, hwaddr addr,
         val <<=3D shift;
         val |=3D current & ~(mask << shift);
         addr &=3D ~3;
-        size =3D 4;
     }
=20
     if (addr < 0x40) {
--=20
2.21.1


