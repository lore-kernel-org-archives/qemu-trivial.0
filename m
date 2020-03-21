Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFfJZ-0004e7-PG
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59627)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfJX-0004Xv-1l
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfJW-0007Do-0w
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:26 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:50915)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfJV-0007DT-TS
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6MeQLKCK+LuR97mOw2w6FbyM0pW3k0RrlHbblQ2lvrE=;
 b=LZoqKGePKUFn0llp9+tHMwZw61NmMlus/rg/9yF7KO94oDj7rRhAzPXU0FwJEsC558IdkE
 DNZx8UNJLSC1hjlSGQrkt+zXBIj2w1WDLbLicKB4z3QsOHwYrb4xEE0urmlKM5XT6wJMJ2
 4+D20uYn+bns4gObYWiSSKYd2CqqFRI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-3PLrmK_AN82fExo6_c8fBw-1; Sat, 21 Mar 2020 10:41:21 -0400
X-MC-Unique: 3PLrmK_AN82fExo6_c8fBw-1
Received: by mail-wr1-f70.google.com with SMTP id g4so4364973wrv.12
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 07:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rRfIK8MnVsl+DYnTbm2DpmqG3rx4tJjk7CYNvTrwi2Q=;
 b=pTgboeYxUc7eJDxTz4JJQbbjWKqmg8/yOpuZW6BSxOJmHe1FXB6OuE4Wa1ghGkbxYD
 dJIoPkQCPOGL8kVqDifwof1iYcO8U5yBUt2ny7Ja1I+CdM7OYqod95W249+QQ+AEFC7J
 dK1XhDDAfVf3FfAzBgk7moPPR9RhUTZuKgu2ILNrUy6dKgPIJMOGbhihJW1nVw4c3dO3
 guEie15sa9ohDrLfmGoLkfViWbA+h55MJuOLsjKUo/qR6SrFzHodb0N9oNQfXQSzwufF
 owrM6jYvBAq+qO3IKC5LXSuellEtzGOJeSkMLfRad+aIMeyg0PbX1DY64i9aQJZVtksp
 zQoQ==
X-Gm-Message-State: ANhLgQ3DVqqzN+PJ/zm9TRLuEdAjkTmZ+bNyusdYOKLKkeblgqZ5kF4h
 eck6P18PxMKhkYc1+VW0zACnFcAaUWfqzC9bBPCudLcIJ4ZnCQPOLakJpK2gDoheKDV6MgfMB8j
 4WORvcEc2hjoQ8GsHBw==
X-Received: by 2002:a1c:9a82:: with SMTP id c124mr14832223wme.22.1584801680627; 
 Sat, 21 Mar 2020 07:41:20 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vucmBxxcI1me0oyxUGVj0nozGfJ5SenYW+m04rwHPopLbF6as7MiEM9Um8gxGayKY1KpNfIBw==
X-Received: by 2002:a1c:9a82:: with SMTP id c124mr14832189wme.22.1584801680439; 
 Sat, 21 Mar 2020 07:41:20 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id g8sm12548446wmk.26.2020.03.21.07.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:41:19 -0700 (PDT)
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
Subject: [PATCH-for-5.0 v2 01/11] block: Avoid dead assignment
Date: Sat, 21 Mar 2020 15:41:00 +0100
Message-Id: <20200321144110.5010-2-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 14:41:28 -0000

Fix warning reported by Clang static code analyzer:

  block.c:3167:5: warning: Value stored to 'ret' is never read
      ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
      ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 462f5bcf6
Reported-by: Clang Static Analyzer
Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Keep 'ret' assigned and check it (Markus)
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index a2542c977b..a6f069d8bd 100644
--- a/block.c
+++ b/block.c
@@ -3165,7 +3165,7 @@ static BlockDriverState *bdrv_open_inherit(const char=
 *filename,
     }
=20
     ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
-    if (local_err) {
+    if (ret < 0) {
         goto fail;
     }
=20
--=20
2.21.1


