Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7epP-0002BH-61
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 07:33:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47527)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7epM-00029T-3h
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 07:33:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7epK-00042h-T2
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 07:33:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25811
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7epK-00042E-OJ
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 07:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582893189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vm+aNNOWd75exghh6UEIZXw8DMFqqm4EGT73R+r5OW0=;
 b=SJVWVnfXKJ5PmwSniITMg8LJ+Lm3FhzTcnD2vfCvrhsISOoWZsnKW13uurWHPQi5/8FroV
 EdnMXspUlphtn0X5wrOwCG+q9S7N/hpIHlwIqNj8Uip85dlvi8wsJpvkghEl9wjeGa4vzU
 3ONQARuUcf7/EfoG28tfBNBBNP9td8s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-WKA9G6czPIubPAoqS3gO9w-1; Fri, 28 Feb 2020 07:33:07 -0500
X-MC-Unique: WKA9G6czPIubPAoqS3gO9w-1
Received: by mail-wr1-f70.google.com with SMTP id r1so1257838wrc.15
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 04:33:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rhr6+r2tfY9AQJ5VKaVuxzDS32T1jjUavdB/SnDaCLY=;
 b=C/GKtE/KEvv1n7lbjhjV7kz/wgn6JUsex2GmG0G7UNzTIz8TX8LdTWpQjjHwCnR9Zl
 GMIhwpuWPHqqv+ekgaK505kwlqj65DtSeQMAR3zuAc6zqR+ntl2vTgUFsIDvogR2YpMr
 fFes4aUToSVj+koywpig5gEY5qFIJrjc9DqjmyswAveTJKtF2Hc1izS+U3Y0oNJn8RPA
 8zn+cPwLCGL6o8B4O1j/jht18Y8jUtIXnqwiRl/RKMo1NBhpDfpElW5uz/MDz/FbuWwP
 hvkj8+6F+4jpcYeUIehwc6MCANTc+Lwpy/JCylcrGSiNXjFdRQTTENpEEWVy8+gmZ/ar
 Fncg==
X-Gm-Message-State: APjAAAVfkKUCiTF+1JqZ8Wxfdhm0kPDZB6w4Fl0GPJur94Tizx5ZXJfU
 oK9wtxqRId39GzpOe90Nro+ema85fBkGkyrmUi5ttR8bIzK7NBnJyuFm/Iw/uwiwHd1xwJ+Z4ty
 M5JvxuDSAaHcBUKEYfA==
X-Received: by 2002:a1c:9a13:: with SMTP id c19mr4584486wme.134.1582893186746; 
 Fri, 28 Feb 2020 04:33:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqw2Ef8TpQQT+Wdpy+qlrAYFnikp8Q+5VIeOArFBRmanDvK4L9Z6oFZXNDdcmwtW4ChwSCpy+w==
X-Received: by 2002:a1c:9a13:: with SMTP id c19mr4584460wme.134.1582893186460; 
 Fri, 28 Feb 2020 04:33:06 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id z16sm12054016wrp.33.2020.02.28.04.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 04:33:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/ppc/pnv: Fix typo in comment
Date: Fri, 28 Feb 2020 13:33:03 +0100
Message-Id: <20200228123303.14540-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
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
X-List-Received-Date: Fri, 28 Feb 2020 12:33:13 -0000

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ppc/pnv_lpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
index f150deca34..b5ffa48dac 100644
--- a/hw/ppc/pnv_lpc.c
+++ b/hw/ppc/pnv_lpc.c
@@ -829,7 +829,7 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, bool =
use_cpld, Error **errp)
     bool hostboot_mode =3D !!pnv->fw_load_addr;
=20
     /* let isa_bus_new() create its own bridge on SysBus otherwise
-     * devices speficied on the command line won't find the bus and
+     * devices specified on the command line won't find the bus and
      * will fail to create.
      */
     isa_bus =3D isa_bus_new(NULL, &lpc->isa_mem, &lpc->isa_io, &local_err)=
;
--=20
2.21.1


