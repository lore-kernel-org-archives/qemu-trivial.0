Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFcad-00018b-TY
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 07:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34725)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcaZ-00013P-6f
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:46:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcaY-0006U5-8f
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:46:51 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:56877)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcaY-0006TX-5O
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:46:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQDd9EbUfb0uuK6iIsTzZMSp5qbZytglJrEh2QYroHU=;
 b=R21Rd9VFdZ5mtmU3ebmk0jiWjvTc0+L+XMHHW5i+CIZoZTU+5b5WyYfcIsVN0H6YlrHrwf
 BW7wdPwF48DSoFpJiMAQ8gCXSdclxcwEDyytiCAOOK2KX6PjIJ64/wFJ+/Za3KwlgV0izk
 gIUHcTq/9oTcqXD+btLlq6Qanrpl5gw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-jHtMp6B4NoqtlR-YkfKk7g-1; Sat, 21 Mar 2020 07:46:48 -0400
X-MC-Unique: jHtMp6B4NoqtlR-YkfKk7g-1
Received: by mail-wr1-f71.google.com with SMTP id e10so2409778wru.6
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 04:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7jHPzgLUxabSngeicFYbktzokTE6KbRJJJ5XQsCuGXA=;
 b=XLRfDHJtNNmYYMzlAiST7dOKQW28MPzRiG991S5l8yxdXpDyt3rRaDcWBxlRg3+yp8
 6t0ZjoL8UYywrs+7pbC/LDxm2+2EmhlUJVtw0ViXez1c4J0Ba/MCWC1o42hSSzM2/sOP
 aFwixoUQoR43eIjEI71laa+4m7G2tgdtRCLl9IR2Ys+Bp/HGjsgBE+aRTNJL9ZjdTuBM
 BK/DVhgo30U66hTiTifNWwWc5Ru3Zr9k//iZjzITX89l60JZAgGpAy08VEO21N0+HwU2
 BD6MvA3GpmFsCN0A7nJqJ94ywOvX8Ng/2Y0BBDVQPS0LPnsKEka4Nq/9DlwXtLe3iPts
 Mbwg==
X-Gm-Message-State: ANhLgQ3igCNmM18rCnX4fLwNWr8NH/cc86MnSs9GXwrRijOiOMqaDPuo
 dsgkW+JxQR/+TOXxSeenumPdKOUxJbLYWUG9S7liUvJMokFBwq97GtLaUQ+09XDANoYZoZGaROh
 U0euuIhyCSm33kSK62A==
X-Received: by 2002:a5d:66c2:: with SMTP id k2mr16786071wrw.408.1584791204441; 
 Sat, 21 Mar 2020 04:46:44 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuFSW+CXcA6YfLipptcKR9ABiJniuj3MZjBTWYLGZb0p+0Bf/8+S0d9XoeCUTxe7T9qj4FMdg==
X-Received: by 2002:a5d:66c2:: with SMTP id k2mr16786051wrw.408.1584791204274; 
 Sat, 21 Mar 2020 04:46:44 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id i67sm13424296wri.50.2020.03.21.04.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:46:43 -0700 (PDT)
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
Subject: [PATCH-for-5.0 03/11] hw/i2c/pm_smbus: Remove dead assignment
Date: Sat, 21 Mar 2020 12:46:07 +0100
Message-Id: <20200321114615.5360-4-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 11:46:52 -0000

Fix warning reported by Clang static code analyzer:

    CC      hw/i2c/pm_smbus.o
  hw/i2c/pm_smbus.c:187:17: warning: Value stored to 'ret' is never read
                  ret =3D 0;
                  ^     ~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i2c/pm_smbus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
index 36994ff585..4728540c37 100644
--- a/hw/i2c/pm_smbus.c
+++ b/hw/i2c/pm_smbus.c
@@ -184,7 +184,6 @@ static void smb_transaction(PMSMBus *s)
                 s->smb_stat |=3D STS_HOST_BUSY | STS_BYTE_DONE;
                 s->smb_data[0] =3D s->smb_blkdata;
                 s->smb_index =3D 0;
-                ret =3D 0;
             }
             goto out;
         }
--=20
2.21.1


