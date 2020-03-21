Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFfKc-0006Vp-Iu
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60324)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfKZ-0006RO-Er
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:42:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfKX-00086t-VC
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:42:31 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:56278)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfKX-000865-SA
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:42:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GEdgbG/luCssALBIqG8TygafayDXTkEa0M3aN0ohCNI=;
 b=YM8HPqR7cjVw+ZsMdd479T7YunjW2fkkt41SZeHqHXRkVXSLEKVaHCeVieQSivwVfOfPPL
 9qCuBUyFBZKCtO2NdzHGpk1y1yK9subc+l6vWMtBnEPqHwb2H6H36a/NUd6/Re2pbS90ME
 xyNrzcbS1zXCsUEuIEzqEa7z9wTqnUY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-Hra2CjEENXeW8IrYWSPFOg-1; Sat, 21 Mar 2020 10:42:25 -0400
X-MC-Unique: Hra2CjEENXeW8IrYWSPFOg-1
Received: by mail-wr1-f70.google.com with SMTP id u12so4377608wrw.10
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 07:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RNYtNktAqDdDAs+EFJozo/fN2JmmaPRaAB7IeiBu7pw=;
 b=tghmFvrUhTQL09BjldM2eeOtQebMDH+UJHCo/OpFH+ahNhl/2jVhgLphIhEFGu3ZyN
 yw5M5sL1+ZN6+E6GrnfJ4jRIfGouid3f2m5wedIFl+CiHNL8o9oaj2oE+3XJYfGDd7sy
 i4fmYee0ICG+SfCB7t1qrM1AjzIFg9eXUQnOLbW62z1zNQxE2emxBCCA/Um1OmJ1jlLj
 y5masBAhiOEXKNMV1kshR4fDpC62no61Tm9TvMx6u/rqCXJen6PO40a+3TiHpBYwqgus
 VtwMCTlfWGPCygsvF5cS18sBUUVzEl9VbpGu17yusrAt1J6j7riN0NCSydqyT+zw2u9t
 Dwbg==
X-Gm-Message-State: ANhLgQ16ZNVLKYqDf14MLBAJIAbZX0eaR+8iwKt188fwFs0eopCiDgfs
 blltAFUS/UwAxh329zKb5XcC3miZTtCSPuRXD9AGflmqtNsVxN8/k31ZvjHu55s3/5H8KTLHtfz
 N/dcKtOYStQzXlWKFag==
X-Received: by 2002:a1c:5502:: with SMTP id j2mr16751329wmb.93.1584801744180; 
 Sat, 21 Mar 2020 07:42:24 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsKPDyLXi8pa8eig6PFPmkwgoDRyetmzS36AEYiO2EqK8vpko5c519XDDmnXRQ0gyQY3H9VPw==
X-Received: by 2002:a1c:5502:: with SMTP id j2mr16751309wmb.93.1584801743946; 
 Sat, 21 Mar 2020 07:42:23 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id v7sm13472822wml.18.2020.03.21.07.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:42:23 -0700 (PDT)
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
Subject: [PATCH-for-5.0 v2 11/11] hw/scsi/esp-pci: Remove dead assignment
Date: Sat, 21 Mar 2020 15:41:10 +0100
Message-Id: <20200321144110.5010-12-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 14:42:33 -0000

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


