Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFfK4-0005e1-PQ
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59953)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfK0-0005YL-EG
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfJz-0007ZR-Cu
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:56 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:60983)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfJz-0007ZB-5w
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNR2u2S6oJHTNfAafS+3cPQs0kK7tiu5/JdDcxGLqd4=;
 b=GkLbJCp3xkKAVvhEtOVAOjPTmUq5nqu1gY7URdSfFsJ/s8IHnizvWtdTX5xv1cZ11xwsK9
 WJoceAgUcde6EhDAnG0bTu9fJoGn0qL9effTX4QvLZJsa6jC9Nq/Bu0Xf7f0PTau3ozFBl
 VTJmq8Uqajiam8BO2aeZpMcGWGmtMvk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-u2okiWwIOaSg9xmpGyNSaw-1; Sat, 21 Mar 2020 10:41:53 -0400
X-MC-Unique: u2okiWwIOaSg9xmpGyNSaw-1
Received: by mail-wr1-f70.google.com with SMTP id h17so4374799wru.16
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 07:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=10vzrd1KB4hBe4ZZMwH09166mQI1VXUjkd4JvuSfJzs=;
 b=f8UAYHyyYsgiB+rXj2+f3HO4NbMnj246XZ96Ielgiml0tj9pwwYkzMykJWtujjozDS
 a4OpcfhSal1YyJerwnJrJdw6GLiw1hbJKjQFnPSRlokJt7YVQhBpjaR/yGMOtD35X+ny
 uTcVNZr+jXnWO/keqIYd11lcOJ3npufVZdle57ALB723eCuQPH6i/m2s3DgTKZEq4AHN
 3+LuA4Tx6W/Or1M+VXb7vapFHLrd9PrifSPsrqD4l0hvZEWcR3N4u0Pmp1RlWwTsKZh8
 JffgP99xXjr79S3hmdt1bkJ29EkkQ6f93RUbnw866NsLXXI1ifztToHguE0t3Bb6aGWq
 P6vw==
X-Gm-Message-State: ANhLgQ2XyqURYHaHzssxt88Zx6df+CNgW7J9xLYFg6ejKytl7RD5iRy1
 7ijLIrfH3nV9UR2x4fFFzZNLiPA6+bV+Lz1P2WhbREqXor6RI7rPHmZLs5iR8peTcwwbj1zgNwe
 hpiSW7++BgZ+4XdhBnw==
X-Received: by 2002:adf:a490:: with SMTP id g16mr17744349wrb.42.1584801712172; 
 Sat, 21 Mar 2020 07:41:52 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvcdshd1gb0Sq4YqL62+G+0WKhBXbND0XSvaVf2BglTV01faEbdjx+USFWF7c7rg/A6yGHbRQ==
X-Received: by 2002:adf:a490:: with SMTP id g16mr17744313wrb.42.1584801711853; 
 Sat, 21 Mar 2020 07:41:51 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id l83sm12694424wmf.43.2020.03.21.07.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:41:51 -0700 (PDT)
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
Subject: [PATCH-for-5.0 v2 06/11] hw/isa/i82378: Remove dead assignment
Date: Sat, 21 Mar 2020 15:41:05 +0100
Message-Id: <20200321144110.5010-7-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 14:41:58 -0000

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


