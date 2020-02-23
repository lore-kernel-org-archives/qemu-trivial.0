Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j60Op-0001QL-C0
	for mharc-qemu-trivial@gnu.org; Sun, 23 Feb 2020 18:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36646)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j60Ok-0001Hv-FB
 for qemu-trivial@nongnu.org; Sun, 23 Feb 2020 18:10:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j60Oj-0008AC-G1
 for qemu-trivial@nongnu.org; Sun, 23 Feb 2020 18:10:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22313
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j60Oj-00089u-D2
 for qemu-trivial@nongnu.org; Sun, 23 Feb 2020 18:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582499453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2JtFWCLlvKrPzw6359S9afKJXhhVBFgj6XfWSRDbCzY=;
 b=FKBO/yn5IUlM4D1Lb8RgKMTCeS6yhOvnSIXzEoPdRMNasarIpVXMrnA8Rt4AMP4/9tgtW+
 0hyV9LIg5B1hiywcOBnrLHuLAUMMuHjZCrOyMyAVNHSz4aWCyUon3HQcJ0KnRdgKsz1XDe
 Gi7z1VqZZdP2z2crrSfSLyLLu/WtOcY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-UTAs4BMCOQ630i0nd-VG2w-1; Sun, 23 Feb 2020 18:10:49 -0500
X-MC-Unique: UTAs4BMCOQ630i0nd-VG2w-1
Received: by mail-wr1-f69.google.com with SMTP id d15so4648194wru.1
 for <qemu-trivial@nongnu.org>; Sun, 23 Feb 2020 15:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r73RMxZRMG+NmOKyR3pA63JKzPvw0kuX26+4+fo0u6k=;
 b=R5QlbwdXbjZsmmnfVQTqkNb8gc+UUoJLCcA94ThPUhAQXkp/xVBaPRHWEMZ7XHLbKW
 6eYWbf3QqdQfSXADHMm627+fTb37ZivVeMXlpVl7Sr4En7UOt8WvwNsgC3TQiipEyPvl
 ytb1+O9NJuIYIHrGNOTzxjDaHx0rKPhLF9TbRb/P3kGHPLvHjBTzTTDNKiDU2ybWnXrS
 RMiH6UpJO8d9Gz+Bq8qUSX9BUfoN2VKt8YYTC4feci42oh395Vjma5ec2s2N4P4Q95hA
 /JEjOrqQjy4GW/ZEYSmJYRHrGv3Q+T8KbanImNNrVTVBlYDfZIkSO0AnA/20PhdqVqoB
 W1Cw==
X-Gm-Message-State: APjAAAUZfEw54KqZx5SuyILMBryXvdwpN149qzsjLGXkJjJXwCDKJC80
 s0nawoqz8CH9omCQWrh/8gErddtud4vEy3+uO4fuBLNuO/eStJLUKJp3wTgeeRoqOlbb9zYJxcI
 kmTqjl74xLv5/y3UpEw==
X-Received: by 2002:a05:600c:299:: with SMTP id
 25mr18350036wmk.68.1582499447809; 
 Sun, 23 Feb 2020 15:10:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqwRR2QcjHY5wzv5ITqtwhlIu6dQ65kERAg2OHxjt7EdpPNvV+QAqS1dn4GqrazGjFTftx5m+w==
X-Received: by 2002:a05:600c:299:: with SMTP id
 25mr18350022wmk.68.1582499447603; 
 Sun, 23 Feb 2020 15:10:47 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id r6sm15777598wrp.95.2020.02.23.15.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 15:10:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/2] hw/arm/gumstix: Trivial cleanups
Date: Mon, 24 Feb 2020 00:10:42 +0100
Message-Id: <20200223231044.8003-1-philmd@redhat.com>
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
X-List-Received-Date: Sun, 23 Feb 2020 23:10:55 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Two house keeping patches while looking at the Gumstix boards,
to make the code slightly more readable/documented.

Philippe Mathieu-Daud=C3=A9 (2):
  hw/arm/gumstix: Simplify since the machines are little-endian only
  hw/arm/gumstix: Use the IEC binary prefix definitions

 hw/arm/gumstix.c | 42 ++++++++++++++----------------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

--=20
2.21.1


