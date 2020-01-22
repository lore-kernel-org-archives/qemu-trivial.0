Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuJhV-0007WJ-Cc
	for mharc-qemu-trivial@gnu.org; Wed, 22 Jan 2020 12:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55162)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iuJhT-0007Tu-BL
 for qemu-trivial@nongnu.org; Wed, 22 Jan 2020 12:21:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iuJhS-0007wd-Fp
 for qemu-trivial@nongnu.org; Wed, 22 Jan 2020 12:21:55 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43421
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iuJhS-0007wO-Co
 for qemu-trivial@nongnu.org; Wed, 22 Jan 2020 12:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579713714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=81TkLNXfmbOYYGG0HEzvgfCJtTEvF70HIv7HTaQpniQ=;
 b=dEmcaHDO2Y7ufeWVmvW+e+3bJzREAXnfG6GAtHLt7pzDcYv84AucmX9GbvHkDV9ehQDzkU
 Uocmg2VZ2s4RxFdjfWQHCdqU7TeSPslrj35y/25oe4Wc/ozY9wOrp8qUw56lW3GqWQuPC+
 8sLOEI1BxMkhYmtnQtzK14BZc9iPMC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-oTFEtTClOhi5LEZTvRyCdg-1; Wed, 22 Jan 2020 12:21:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B03E2108594E;
 Wed, 22 Jan 2020 17:21:47 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-78.brq.redhat.com [10.40.204.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E634160F8D;
 Wed, 22 Jan 2020 17:21:40 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] Makefile: List the sphinx documentation in 'make help'
Date: Wed, 22 Jan 2020 18:21:37 +0100
Message-Id: <20200122172137.7282-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: oTFEtTClOhi5LEZTvRyCdg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Wed, 22 Jan 2020 17:21:56 -0000

In commit 5f71eac06e1 we started to support the rST documentation.
List the build target we need to call to generate the rST files in
the 'make help' output.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6562b0dc97..b777f7fcdd 100644
--- a/Makefile
+++ b/Makefile
@@ -1197,7 +1197,7 @@ endif
 =09@echo  '  vm-help         - Help about targets running tests inside VM'
 =09@echo  ''
 =09@echo  'Documentation targets:'
-=09@echo  '  html info pdf txt'
+=09@echo  '  html info pdf txt sphinxdocs'
 =09@echo  '                  - Build documentation in specified format'
 ifdef CONFIG_GCOV
 =09@echo  '  coverage-report - Create code coverage report'
--=20
2.21.1


