Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFcaz-0001wG-PI
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 07:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34983)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcax-0001qw-DH
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcaw-0006o7-E9
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:15 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:57702)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcaw-0006nl-Ad
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNR2u2S6oJHTNfAafS+3cPQs0kK7tiu5/JdDcxGLqd4=;
 b=dLbIMrOFCNCAoii6J6EKqCQha4fPlYv+kVB2HimPcMZiC4fPT/eAp427kz0WR3/sTE9Edq
 qkeeivToHbxr2iSacgq8YxVhMsh9GOvnwwA+rkVk7Da9903c114oaXD65StRLGf2lFw59S
 7bkJUrF4Vk7hE2Ac69fP2OvuJ23c1f4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-bQJescQIOXiJzHX0BxiINw-1; Sat, 21 Mar 2020 07:47:10 -0400
X-MC-Unique: bQJescQIOXiJzHX0BxiINw-1
Received: by mail-wr1-f72.google.com with SMTP id j12so334141wrr.18
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 04:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=10vzrd1KB4hBe4ZZMwH09166mQI1VXUjkd4JvuSfJzs=;
 b=SWx6MW7Crz+NszSXlc+2Q4hgic4yYWlTnStRtE4GZL+T/14oaHvqe4xNeLxcFU0CQS
 VNq2kRmnNUY0DQtdDxuL5otxQdf0a18PpDZqstRQR8zEsAUf8lHcnXHH2P95GS5SsQkO
 TSdmvS+mGDuRsXMvuOtfjvZ+kwH5XOJBO3omCa2sgAKfivLOqMnSp+C+8efRVxQ4gXxg
 WHWK2qOgX1VEId+N71AE8Yt1oFfMmVwn68OnOVb+ZT16gPTxydfiEXSzT3O+UfEsGZNd
 Pio9ppXVLlpk7VP8n00cLO/0f1zoI0gZgEVgxDCnhGb1k1gvtmtN9pRGaciX5CGl89+i
 7/lg==
X-Gm-Message-State: ANhLgQ3LQwZMvIVShK4IyDGG5NDya3xXoCBi5BrZRxf/8P7Vu0VEoxY+
 2CO8gmmkxGMt9gb/RUORsR7YWoenJLfZ73hsZ6HBieET6Mh7vSLpn/vT0amx9znEETGzXywyikK
 uZlPAUya61mph1U1svQ==
X-Received: by 2002:a1c:acc8:: with SMTP id
 v191mr16571796wme.185.1584791229019; 
 Sat, 21 Mar 2020 04:47:09 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuEZgHJ9R2CzOVD7FrVhKwfAt4ODRiXCw3f347rqB1NUIjLfREWV9rK0W33q2PNc68qUhcXew==
X-Received: by 2002:a1c:acc8:: with SMTP id
 v191mr16571770wme.185.1584791228755; 
 Sat, 21 Mar 2020 04:47:08 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id v7sm12822140wml.18.2020.03.21.04.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:47:08 -0700 (PDT)
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
Subject: [PATCH-for-5.0 06/11] hw/isa/i82378: Remove dead assignment
Date: Sat, 21 Mar 2020 12:46:10 +0100
Message-Id: <20200321114615.5360-7-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 11:47:17 -0000

Rename the unique variable assigned as 'pit' which better
represents what it holds, to fix a warning reported by the
Clang static code analyzer:

    CC      hw/isa/i82378.o
  hw/isa/i82378.c:108:5: warning: Value stored to 'isa' is never read
      isa =3D isa_create_simple(isabus, "i82374");
      ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/isa/i82378.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index dcb6b479ea..d9e6c7fa00 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -67,7 +67,7 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
     I82378State *s =3D I82378(dev);
     uint8_t *pci_conf;
     ISABus *isabus;
-    ISADevice *isa;
+    ISADevice *pit;
=20
     pci_conf =3D pci->config;
     pci_set_word(pci_conf + PCI_COMMAND,
@@ -99,13 +99,13 @@ static void i82378_realize(PCIDevice *pci, Error **errp=
)
     isa_bus_irqs(isabus, s->i8259);
=20
     /* 1 82C54 (pit) */
-    isa =3D i8254_pit_init(isabus, 0x40, 0, NULL);
+    pit =3D i8254_pit_init(isabus, 0x40, 0, NULL);
=20
     /* speaker */
-    pcspk_init(isabus, isa);
+    pcspk_init(isabus, pit);
=20
     /* 2 82C37 (dma) */
-    isa =3D isa_create_simple(isabus, "i82374");
+    isa_create_simple(isabus, "i82374");
 }
=20
 static void i82378_init(Object *obj)
--=20
2.21.1


