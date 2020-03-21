Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFfJd-0004ng-Me
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59692)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfJb-0004hS-51
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfJa-0007Gj-5p
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:31 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:32427)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfJa-0007GD-1O
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:41:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2U6ARuvMvLKS+fqGTEoijz7r0B3fBwOwTnOOBFQNRAw=;
 b=OcPR5Z8MaC/teIqHLYrkBtvCh/3ixO47hPlR6SsEbjxbANl5zCrQSKJc6neBDahnrxoSGL
 VQSxdpN6BrtgN20EssYpBLC9/Q+R+Kx3E54Q1GAzsYCt9i62Vu1coHFCAoGtqG/m6u+aIT
 klqjpXjuJN/5FAHzS16xpfv2c4X8AYU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-L3QNmkiTMA2NWO3Q38UKnQ-1; Sat, 21 Mar 2020 10:41:28 -0400
X-MC-Unique: L3QNmkiTMA2NWO3Q38UKnQ-1
Received: by mail-wr1-f72.google.com with SMTP id u12so4376567wrw.10
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 07:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ez+E9s5mwrT8B9y8nVUYgFPf3iN6ckUcWWVa90evmD4=;
 b=e8/klIxSgkLZ8wNz4L6dX3rgo1p3Z3cyENQHqDLtdPGB1m8xOCIVo++dVOly2VobmF
 J3qPT9asmrkFUgwQpTkib+ykmQVarUqBcmGdZSww4EFXMlsRWVhBj4kuzbb+GLuBie2+
 mfzJtm2zjWqtkg0n7/OKkHhJbve8MbBjvmrkTlTBl7hAzFl5MTTRUaA3KKMfWiXyj1nS
 j2AEa7dVrlyjtznXWGDJ4Viq2YbRVbcpgXlLlfWHOaFFPxETtmTB1f505KWZG2NKAyeT
 xiidQqsLB+kGDUUx9lCAsyEPcuW918LPZJvxKF/wRZOqcazXvkyZFrwN+O/z1xnaa1jh
 A90w==
X-Gm-Message-State: ANhLgQ0e2/SBzCRDcn/8cYUqlvuji4qv7npzV6Db+03ALF0dPTHAl8wr
 al339f3j9dnbCtZcxc1Ayo8UZu6SfqyujMTK8mhs/6ulncYpzYtCe/X9irUUrYTXMlBe8A85pil
 9iiAIIWcAnkufKtQMiw==
X-Received: by 2002:adf:9071:: with SMTP id
 h104mr17944860wrh.359.1584801686948; 
 Sat, 21 Mar 2020 07:41:26 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvT4CVQxA5nLMDXZhZEREy/9sQIXUlQ2wJ9ez38CCElrT64mFRDHk077ZFhB6T9v5dilo0t2Q==
X-Received: by 2002:adf:9071:: with SMTP id
 h104mr17944810wrh.359.1584801686647; 
 Sat, 21 Mar 2020 07:41:26 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id r3sm14054273wrw.76.2020.03.21.07.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:41:26 -0700 (PDT)
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
Subject: [PATCH-for-5.0 v2 02/11] blockdev: Remove dead assignment
Date: Sat, 21 Mar 2020 15:41:01 +0100
Message-Id: <20200321144110.5010-3-philmd@redhat.com>
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
X-List-Received-Date: Sat, 21 Mar 2020 14:41:32 -0000

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


