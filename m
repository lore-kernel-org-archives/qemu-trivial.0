Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFcaT-0000oC-I9
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 07:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34635)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcaQ-0000fe-Cs
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:46:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcaP-0006MY-95
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:46:42 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:37597)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcaP-0006M4-5X
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 07:46:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2U6ARuvMvLKS+fqGTEoijz7r0B3fBwOwTnOOBFQNRAw=;
 b=hG0rl2bjnZjvxE4P50y5Ax9avstqt+14e6VKPuifVfdsJmMbHwnwA8mnytOUZ8uCHC0XF6
 AuC3kiLod4yzLfr5p9ID183qnCizLkHOUUXufosbiP/VT7j7DaOuTnTJ1rFSE9jQ18yXH0
 RyNxrcSnUmn9azrARJnwHwPW5nlGTeQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-wORuGJx3PXy9bxwZ2v6ixw-1; Sat, 21 Mar 2020 07:46:39 -0400
X-MC-Unique: wORuGJx3PXy9bxwZ2v6ixw-1
Received: by mail-wr1-f72.google.com with SMTP id w11so4170681wrp.20
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 04:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ez+E9s5mwrT8B9y8nVUYgFPf3iN6ckUcWWVa90evmD4=;
 b=F4L22nyhQkCUpafWT2YpmGAyDNBcuoXs0F5ADbrgDB+VgaPEau1t/hwE0oJGPjpc9/
 f/BJdzFwdutAGKgpKpgZrGZHiBRNq9wt6AN/Y3vNJNNXZZ5IOx+8gqjvmuDlzyMdkKz3
 mFFzEOycCD9UBGVy7e13si1vrYoj9r6MheoE3sSuOl+Z7l6ATxgXQ/0V+ZJ9P3laBCO9
 GbULbbEGA9TVEZlZftE+mRUnp3O8lZF+7TQpsYCCKCPQl2/NfuiF9MYj/wv5pGZBOvlx
 v4DZXY9pivIso8P4ks9wZ0+jVsdVjTjSYwQTl4ncRWRjSsd7SLDKiHOQcAB5bORRz2Uv
 +thw==
X-Gm-Message-State: ANhLgQ3j457GcRzpqpTIXGeE/I6ILQYD9zO2SjaDCjqFR1WoR6xU15pA
 0ckOsScXjdnLSpoBl2SISOmYeqz0dLtem/Q4eselVSwf1/X7a8lylR6TXehdwA6wDgNGlbDAGuy
 keVclqYbHTjZw0dJtiQ==
X-Received: by 2002:adf:fe4c:: with SMTP id m12mr17443676wrs.96.1584791197953; 
 Sat, 21 Mar 2020 04:46:37 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vve8rRdAc9j+mXkmu1X1eacNa+hVewhm4BXzBkCSSJNfv/v/it6Xfe4h3p5TbOBoIKzQ44UBQ==
X-Received: by 2002:adf:fe4c:: with SMTP id m12mr17443653wrs.96.1584791197777; 
 Sat, 21 Mar 2020 04:46:37 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id c5sm15737698wma.3.2020.03.21.04.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:46:37 -0700 (PDT)
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
Subject: [PATCH-for-5.0 02/11] blockdev: Remove dead assignment
Date: Sat, 21 Mar 2020 12:46:06 +0100
Message-Id: <20200321114615.5360-3-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 11:46:43 -0000

Fix warning reported by Clang static code analyzer:

    CC      blockdev.o
  blockdev.c:2744:5: warning: Value stored to 'ret' is never read
      ret =3D blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
      ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 blockdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index fa8630cb41..6effd5afaa 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2741,7 +2741,7 @@ void qmp_block_resize(bool has_device, const char *de=
vice,
     }
=20
     bdrv_drained_begin(bs);
-    ret =3D blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
+    blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
     bdrv_drained_end(bs);
=20
 out:
--=20
2.21.1


