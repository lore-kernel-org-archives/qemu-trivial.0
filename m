Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRFUT-0006bQ-1L
	for mharc-qemu-trivial@gnu.org; Wed, 22 Apr 2020 09:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59392)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUP-0006Uj-F5
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUL-00034m-GQ
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:33 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36660
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRFUL-00031G-1N
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587562347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Flbegfe+XvQdIALgmwjud+bmSRqDw+xWJxrHvvD5T5c=;
 b=HFsWskXyU0IFsClpa7YgV3sT++9d5CApyIgEsdVtoMefI+cUG9LDaU2hfjANVTo5Z/C+m1
 tJgbU67KfbyQRg0bx+cdUDSbZ5YCU6MM4BEoYxrK2SqvmdY0kTG1j2N9gN4n9fmgYswXii
 GOYu9tbFmltTnMCSOzLBJkYk8QLCLRs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-d8j_e1v1MriVJjsfj6hp2g-1; Wed, 22 Apr 2020 09:32:25 -0400
X-MC-Unique: d8j_e1v1MriVJjsfj6hp2g-1
Received: by mail-wr1-f72.google.com with SMTP id e5so1024424wrs.23
 for <qemu-trivial@nongnu.org>; Wed, 22 Apr 2020 06:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IDUYtKOADkWG3CN25Uq5JJobV9Wdj+VxIMt3IxDdn/o=;
 b=fkebf/TN04TwnANW4pY1jcDUixPF1LBK28vbk6xe1/NT7Z4Fm4RncsEvbKdP7SiVU8
 xZtyZmHdnCQtlNiar+nbB21s149hOIS4LF+gAwvpqXGBaEViwXZXTiObpKuK2weHCw0B
 bFoZaYiHoFZJQmjiS7e+BDhwclpvGCP6aJxXIzTFm/deov2K03Ek7U9gNJOUrmpjb08c
 S76i3wuFM/ReNcTYvb5+SCMRH8alRNu7nby6+C3iuh9yEq10lT8/Ycd5nCJvEOsENNv3
 +fmOQsTxw+HC1OqnS5ugI+axUXxAD3zN08EFW1luFkgrw0jM9gWUdJLWh5fVLECSKQOq
 xc1A==
X-Gm-Message-State: AGi0PuYkywhzOLQkr0ngD9djgyr+7T+ticJCbZJ1o5h9Ws39pJ6dUUi/
 YkzpIxb1geRPwh/BnM9RLs/CpIlepT6CmROQyAITTP9RRsmP2yrMJkGH3hJTe/f+/RWqBY4/SLx
 uW4dwLCOtluW3daZXKw==
X-Received: by 2002:a05:600c:2941:: with SMTP id
 n1mr10810674wmd.25.1587562344696; 
 Wed, 22 Apr 2020 06:32:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypK7XDTD/6gL7xOy+W7IIyAp8MGKyH7Nh9z0DkzZBiiFlF4pLRNLxX+BVWqJa70s13YF7ZBNHA==
X-Received: by 2002:a05:600c:2941:: with SMTP id
 n1mr10810659wmd.25.1587562344515; 
 Wed, 22 Apr 2020 06:32:24 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id z1sm7749395wmf.15.2020.04.22.06.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 06:32:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org (open list:PReP)
Subject: [PATCH v3 6/9] hw/isa/i82378: Remove dead assignment
Date: Wed, 22 Apr 2020 15:31:49 +0200
Message-Id: <20200422133152.16770-7-philmd@redhat.com>
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
X-List-Received-Date: Wed, 22 Apr 2020 13:32:34 -0000

Rename the unique variable assigned as 'pit' which better
represents what it holds, to fix a warning reported by the
Clang static code analyzer:

    CC      hw/isa/i82378.o
  hw/isa/i82378.c:108:5: warning: Value stored to 'isa' is never read
      isa =3D isa_create_simple(isabus, "i82374");
      ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


