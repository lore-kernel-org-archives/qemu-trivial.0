Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCudw-00016J-8R
	for mharc-qemu-trivial@gnu.org; Tue, 24 Sep 2019 19:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50310)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iCu1J-00069k-7X
 for qemu-trivial@nongnu.org; Tue, 24 Sep 2019 19:14:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iCu1H-0007NF-FS
 for qemu-trivial@nongnu.org; Tue, 24 Sep 2019 19:14:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42420)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iCtzt-0006Wo-Bd; Tue, 24 Sep 2019 19:13:29 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 71BDC307D971;
 Tue, 24 Sep 2019 23:13:28 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-231.bos.redhat.com [10.18.17.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE28E6012C;
 Tue, 24 Sep 2019 23:13:25 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH] qemu-options.hx: remove stray quote
Date: Tue, 24 Sep 2019 19:13:25 -0400
Message-Id: <20190924231325.25444-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 24 Sep 2019 23:13:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 24 Sep 2019 23:54:51 -0000

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 2a04ca6ac5..629a7b1186 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1192,7 +1192,7 @@ Instead of @option{-fda}, @option{-fdb}, you can us=
e:
 By default, @var{interface} is "ide" and @var{index} is automatically
 incremented:
 @example
-@value{qemu_system_x86} -drive file=3Da -drive file=3Db"
+@value{qemu_system_x86} -drive file=3Da -drive file=3Db
 @end example
 is interpreted like:
 @example
--=20
2.21.0


