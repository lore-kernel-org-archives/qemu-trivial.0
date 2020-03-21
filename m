Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFfJl-000543-Rd
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59787)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfJj-0004z7-R4
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfJi-0007Mc-TY
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:39 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:60826)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfJi-0007ME-Q0
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQDd9EbUfb0uuK6iIsTzZMSp5qbZytglJrEh2QYroHU=;
 b=X5DWlbPA32zOoZTe9yhVtJqQr5j5lfZaeugrncoTuhfkDfRcpkZzyNPZrBaEqVySp6BrBT
 e2EVszv+80dMNGj5Cr11CYCM6JkqkZuxgCQ+RTl/knvYbboBT1wwLuJ50yJugnKDffL7nA
 +C5HLnB6QMb6kTocUkvK1YfNXWwrK5k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-jmNeubw7Nni0zUC-g3WTjg-1; Sat, 21 Mar 2020 10:41:34 -0400
X-MC-Unique: jmNeubw7Nni0zUC-g3WTjg-1
Received: by mail-ed1-f72.google.com with SMTP id y14so7509811edq.22
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 07:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7jHPzgLUxabSngeicFYbktzokTE6KbRJJJ5XQsCuGXA=;
 b=Akspko0XLxTYJ2iBf99F9ofDw83TKbDuQVaQGppTb20iRGHP9Ks8nrdNItINRbIhn5
 N1fMv2cvsOCjvBEA+t2Bt1ZLZmaXCBGMOCSlYIimpWMdrRjWqSC2/lAC/VBXcVZFj9q+
 ztxyVgUULh2SmSi6LFYtzSdh01gSrSUqJj1JEypiD8WUSnL1fxPtEiDGpBUfVYZjFMQF
 K4whw9Z2QtTbWJDDaY0lJPIq2fEdhz6JccqweTiXsOR78jZB7Dm53HwTPqSb5jV5mMpX
 Ly9WzmAnXhbzjOa1xHybOTivPm1AZakgarYUhaaWEy+ni1ibCBueK67dklR4Vji1Injm
 V7HA==
X-Gm-Message-State: ANhLgQ20aujjCH4gapygV+j67kM29gfyltLqTL2zopAaCHuD7air5W3S
 I1cd9wB8GkycHXvC/EjWX/VcsItYJooJUSrR4yIe3Fi6C+yK91TB10S0NJgA1Vc1PvXBLqz7JQ0
 SXuyvky9+nB8pTFM1pQ==
X-Received: by 2002:a17:906:7007:: with SMTP id
 n7mr13189114ejj.108.1584801693258; 
 Sat, 21 Mar 2020 07:41:33 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsksJysO+mxl+t+W2X01D8GMrkrubmik0/M6jdDivq40kM5YY8jnEGED6sR24r5kt8kIt2ovg==
X-Received: by 2002:a17:906:7007:: with SMTP id
 n7mr13189101ejj.108.1584801693035; 
 Sat, 21 Mar 2020 07:41:33 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id a32sm603046edf.46.2020.03.21.07.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:41:32 -0700 (PDT)
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
Subject: [PATCH-for-5.0 v2 03/11] hw/i2c/pm_smbus: Remove dead assignment
Date: Sat, 21 Mar 2020 15:41:02 +0100
Message-Id: <20200321144110.5010-4-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 14:41:41 -0000

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


