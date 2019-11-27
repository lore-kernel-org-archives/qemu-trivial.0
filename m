Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iZzb9-0008Up-Bb
	for mharc-qemu-trivial@gnu.org; Wed, 27 Nov 2019 10:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54037)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iZzb6-0008R4-E4
 for qemu-trivial@nongnu.org; Wed, 27 Nov 2019 10:51:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iZzb5-0002sm-ED
 for qemu-trivial@nongnu.org; Wed, 27 Nov 2019 10:51:20 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59027
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iZzb5-0002qr-Ag
 for qemu-trivial@nongnu.org; Wed, 27 Nov 2019 10:51:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574869876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fMYtqfEPtvwR1oq2gVG2Msg0FfbaqLatOFvY14i/d6I=;
 b=eIIODQ9vY7OURgQJ3+E09ZYEm6Yc9NZOMxdQQMSHsgoazZKotxgC9uMbdRtn09oKSDp6eP
 MkXcuYfgwcHat5SiLem/ipejARI/RhHuzonlAeJT6wK/5yQ72Ovm8Lu5hBEVEQhcvzMsjw
 MkWocZWtVrCoRoExi1qWb+x1WP3puqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-nhUGtkGTMm-o17djqDQqlQ-1; Wed, 27 Nov 2019 10:51:10 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02F768BEF88;
 Wed, 27 Nov 2019 15:51:09 +0000 (UTC)
Received: from thuth.com (ovpn-117-186.ams2.redhat.com [10.36.117.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E751087ED6;
 Wed, 27 Nov 2019 15:51:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
	qemu-trivial@nongnu.org
Subject: [PATCH] gitlab-ci.yml: Run tcg test with tci
Date: Wed, 27 Nov 2019 16:51:05 +0100
Message-Id: <20191127155105.3784-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: nhUGtkGTMm-o17djqDQqlQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Wed, 27 Nov 2019 15:51:21 -0000

Since commit 2f160e0f9797c7522bfd0d09218d0c9340a5137c ("tci: Add
implementation for INDEX_op_ld16u_i64") has been included now, we
can also run the TCG tests with tci, so let's enable them in our
Gitlab CI now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index be57c6a454..125d4204b3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -73,6 +73,7 @@ build-tci:
  - ./configure --enable-tcg-interpreter
       --target-list=3D"$(for tg in $TARGETS; do echo -n ${tg}'-softmmu '; =
done)"
  - make -j2
+ - make run-tcg-tests-x86_64-softmmu
  - make tests/boot-serial-test tests/cdrom-test tests/pxe-test
  - for tg in $TARGETS ; do
      export QTEST_QEMU_BINARY=3D"${tg}-softmmu/qemu-system-${tg}" ;
--=20
2.18.1


