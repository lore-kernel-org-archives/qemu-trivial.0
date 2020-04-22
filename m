Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRFUU-0006f5-F0
	for mharc-qemu-trivial@gnu.org; Wed, 22 Apr 2020 09:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59426)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUQ-0006X1-US
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRFUP-0003E4-Tr
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28974
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRFUP-0003Bo-EP
 for qemu-trivial@nongnu.org; Wed, 22 Apr 2020 09:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587562352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OeM0cBach7mM1Er+F+BdNF9X8Ccb7WYWiy4rdEvvNOc=;
 b=fhwXBZYYHAaORZhy3KrTdCLre+3U7SdFr54J5qyq8YEuTBMUOFLmv8PoTggTasErViO/IR
 1aUu6e50LJh6azFRcOOG8w7UxE/oBIxtA18cNVeZzwEmRYUCSeshPyTzWU5wpxqCnv7nQy
 UwrJmi51O/ypmwcqloEmdIIIsaqdjqA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-pMlajhV8PCOEwObfkSyKRw-1; Wed, 22 Apr 2020 09:32:30 -0400
X-MC-Unique: pMlajhV8PCOEwObfkSyKRw-1
Received: by mail-wr1-f71.google.com with SMTP id f2so1047140wrm.9
 for <qemu-trivial@nongnu.org>; Wed, 22 Apr 2020 06:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vqpHgk+Qg3xtVikhp88gaWQSBTFh1RmAeJyt0Yb24RI=;
 b=R+jc7Yhc8cx2/IOeo5Oe+XHXLGrQbsIrvDRrZNeI59tVXaMCipiATQ52OcAen8RjnG
 mcB0SU9HzkKL0/Euh5Vz0ilSAWdJ36K8WbjQUyajgO1FHQUJwXZrQlJvSWyjtf+jLFec
 q2EWDmJJXKaLXzzfpkwC1p+K7+NkNQqcALTgk8egWB27WRGMcNHhxYjRZCRZn4yQa+9x
 kC2pW1ZIaUScusg1o4kLJPC8YbLYGdwPnR73XQTdJosfgC+Pe59GxXzAY7FrtvNexkMQ
 dD22bIU9C9P9NABelxpFb9609U5WuaOED+zenIiIJN8eQLcbIknekFBKbiV0CDEYqSG4
 2SEw==
X-Gm-Message-State: AGi0PuYr1b2YYyZMl05UJIBGi3w3z9UCnRqR6SVKDzTapbB41PuQIwCt
 pNK1SHfRYAwYLlBnYVo+os6isBntUYK88WkMQ2RBoFPV/9x0iW0eDo0EMI+nh65/kzSuJyDc2GA
 akzq2T9fscGfW6DFCBg==
X-Received: by 2002:adf:f2c5:: with SMTP id d5mr15624565wrp.285.1587562349781; 
 Wed, 22 Apr 2020 06:32:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypKqP2JZu0BSj/TOBCxs0BuAVzdLzpqe0YF5jw7OFRSHEkPS9oqHh93G6IaEAztiWfHc587sIQ==
X-Received: by 2002:adf:f2c5:: with SMTP id d5mr15624548wrp.285.1587562349602; 
 Wed, 22 Apr 2020 06:32:29 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id h2sm8578677wro.9.2020.04.22.06.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 06:32:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PATCH v3 7/9] hw/gpio/aspeed_gpio: Remove dead assignment
Date: Wed, 22 Apr 2020 15:31:50 +0200
Message-Id: <20200422133152.16770-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200422133152.16770-1-philmd@redhat.com>
References: <20200422133152.16770-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 09:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
X-List-Received-Date: Wed, 22 Apr 2020 13:32:35 -0000

Fix warning reported by Clang static code analyzer:

  hw/gpio/aspeed_gpio.c:717:18: warning: Value stored to 'g_idx' during its=
 initialization is never read
      int set_idx, g_idx =3D *group_idx;
                   ^~~~~   ~~~~~~~~~~

Reported-by: Clang Static Analyzer
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
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


