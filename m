Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFcaM-0000WI-PE
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 07:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34518)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcaK-0000PU-2N
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:46:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcaI-0006JA-Uc
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:46:35 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:45657)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcaI-0006Ie-QW
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eMQ8dVIZnYJPrg4MRf01ROr1UWOuRMuavJ9h1G8fyNE=;
 b=OMfDhfGBrTPSZDPZ4Nl3XO6mYEV3Jrt7wwV5TCeZ+x/9mcmvnOl3S9mDiI3gFXGEasxOtI
 2OKm0MQyWlCNueHVHDb8DNbZmznUcNuVTy09RkDq7zIXR4cjlecwchWfEA25IvCSAIZl51
 FWjIqfMW/VBcspyTY5xM2r9TAdBMGas=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-K5DMshsFNUCmtoVHPHIMzQ-1; Sat, 21 Mar 2020 07:46:32 -0400
X-MC-Unique: K5DMshsFNUCmtoVHPHIMzQ-1
Received: by mail-wr1-f69.google.com with SMTP id v6so4136801wrg.22
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 04:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kX8C0eEcHvhI8rcexY79cvumv+xMMYTkKA4klDytxcc=;
 b=A+ujj8/QVrgEUYeI7oQDV05bRgguwyiAjYEpNfpK/ORRDoLtPDXba2TB6kAuSm07gB
 PNiK90cWWJdefMP9jHuqbb68NkoMLEO3/HUgPw3+Ao3AiMorT145MhNUzujTqUS9/3ND
 c7JDZCA1mUggPIeKSDG5CdM4FUWcxmstOkaFl+jgqKAzjP1/uIv64lfDR4raXOXDlv67
 MJq3EqIwVX43rNoIfXeG9VxaRIIQidOeiu5xZ6+lM5RK7U1wHYkpuSQvz2HFp3HGH0yH
 tzybyLhs16kersaYH03p/gcSBObeuLwXJxqNOIv7I5nwIq53YK+BzE09x7WeFQFXm2xZ
 qHiQ==
X-Gm-Message-State: ANhLgQ1CQUWtc6Rh/BQkmwd5l7YvUJ+3tGHPKUCrbzMis+QuXwf8qAxw
 3W0bCKYqS45lpPA2X2PQ3hjsvddIrmKvAnlXxQj68jhzay93OrAcsX4CRo/enH45J59wM/pqRzW
 gF1UEbO9sMj7ThGORLg==
X-Received: by 2002:adf:c44c:: with SMTP id a12mr17986433wrg.172.1584791191430; 
 Sat, 21 Mar 2020 04:46:31 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuT3XdAAValv75OTSe0ODvom2WIFeUB+FFeo0vbikqEyZ6JXGrJZ1M3aU7NlUmOl7P+zQMFFA==
X-Received: by 2002:adf:c44c:: with SMTP id a12mr17986387wrg.172.1584791191199; 
 Sat, 21 Mar 2020 04:46:31 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id d5sm2667163wrh.40.2020.03.21.04.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:46:30 -0700 (PDT)
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
Subject: [PATCH-for-5.0 01/11] block: Remove dead assignment
Date: Sat, 21 Mar 2020 12:46:05 +0100
Message-Id: <20200321114615.5360-2-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 11:46:37 -0000

Fix warning reported by Clang static code analyzer:

  block.c:3167:5: warning: Value stored to 'ret' is never read
      ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
      ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index a2542c977b..908c109a8c 100644
--- a/block.c
+++ b/block.c
@@ -3164,7 +3164,7 @@ static BlockDriverState *bdrv_open_inherit(const char=
 *filename,
                                     parent->open_flags, parent->options);
     }
=20
-    ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
+    bdrv_fill_options(&options, filename, &flags, &local_err);
     if (local_err) {
         goto fail;
     }
--=20
2.21.1


