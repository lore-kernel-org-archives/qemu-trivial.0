Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFfKB-0005v1-BR
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60054)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfK9-0005pk-5T
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:42:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfK7-0007fA-Su
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:42:05 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:51340)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfK7-0007en-Pn
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wabz9ShZfSLuxIv0MTXDbxATC0FT6q8THWUJCXN/WkY=;
 b=HqmbJ+7N1rTCcZ5+EwUufytQ6gCIdvNRX3uodWRcDec5iShUZu3N/VELBzHa9I5Iuo0r08
 DdxGEM+jkIcXYNJleAcFXmQNTl+zdHNXdNsmxsZn/4VyRItVJD1VrT08wLySsr1ThRBNjY
 5+G4FicjCYIgLCMI2Y2VM+QD/nIew9E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-08N9-sn_OdG0sf-hVw_NuQ-1; Sat, 21 Mar 2020 10:41:59 -0400
X-MC-Unique: 08N9-sn_OdG0sf-hVw_NuQ-1
Received: by mail-wr1-f72.google.com with SMTP id g4so4365620wrv.12
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 07:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eDep/UAh9LxMQ+p+ZbiwORp8mGO979hnIy8cu0Ibo6A=;
 b=Gm/mP0rkPS6Yl05TVzFoLAtZUCZF5wT6CeEw0NT/46LSjgckPl6UozquRDD8TmvF4g
 S06O18S2XYEvlqaHrYyNIZFvaOO1vzwTt/9HH5ztFqj+7i5PRBBiDXfsYpLBDmEx52b1
 ZrahzAQJ0jWbkQNSoHuD9mnu/OLv8J1oEmguRN3V5rDP5A2WcQm4qy0POE05Q41BtFYi
 oIUABzgNrCZzz4RAznA+j/Aa9wSb1tExaovLuEZ5KqCe3h3J0CEaYHK1MyYUn2PmhjOh
 XCrtBiSlqG85T9+62zuARlGxuR0Vv2tCjMiPLpNbErUDz3yfpZjxgjlYMymzsSpPDXxz
 UyZQ==
X-Gm-Message-State: ANhLgQ2RRZLElrCicgAkcTXPWMVlpa/fyRbZlcH20JmRgJVqxuaSstbv
 rwWv8Uxefpzx+rf3SNV26M7P1Nowc4wF1H3/J2TPoskawRIrUwShgVgnPE0HNWOLMm4Dk5Z+hSz
 iC4THwY6Vin5ScXWIYQ==
X-Received: by 2002:adf:b307:: with SMTP id j7mr18622696wrd.128.1584801718378; 
 Sat, 21 Mar 2020 07:41:58 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtfnFMlK5o2AUliKihnwwfvHrClOE3oeCNEnuVDhJ9fRMly5LXyQNqsh5zSzzZ49D+7xGs/WA==
X-Received: by 2002:adf:b307:: with SMTP id j7mr18622686wrd.128.1584801718221; 
 Sat, 21 Mar 2020 07:41:58 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id l8sm12553155wmj.2.2020.03.21.07.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:41:57 -0700 (PDT)
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
Subject: [PATCH-for-5.0 v2 07/11] hw/gpio/aspeed_gpio: Remove dead assignment
Date: Sat, 21 Mar 2020 15:41:06 +0100
Message-Id: <20200321144110.5010-8-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 14:42:06 -0000

Fix warning reported by Clang static code analyzer:

  hw/gpio/aspeed_gpio.c:717:18: warning: Value stored to 'g_idx' during its=
 initialization is never read
      int set_idx, g_idx =3D *group_idx;
                   ^~~~~   ~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Do not declare g_idx in for() (Zoltan)
---
 hw/gpio/aspeed_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 41e11ea9b0..bd19db31f4 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -714,7 +714,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offs=
et, uint64_t data,
 static int get_set_idx(AspeedGPIOState *s, const char *group, int *group_i=
dx)
 {
     AspeedGPIOClass *agc =3D ASPEED_GPIO_GET_CLASS(s);
-    int set_idx, g_idx =3D *group_idx;
+    int set_idx, g_idx;
=20
     for (set_idx =3D 0; set_idx < agc->nr_gpio_sets; set_idx++) {
         const GPIOSetProperties *set_props =3D &agc->props[set_idx];
--=20
2.21.1


