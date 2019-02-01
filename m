Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gpeYZ-00088F-7A
	for mharc-qemu-trivial@gnu.org; Fri, 01 Feb 2019 14:32:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gpeYX-00086K-60
	for qemu-trivial@nongnu.org; Fri, 01 Feb 2019 14:32:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gpeYV-0003yh-My
	for qemu-trivial@nongnu.org; Fri, 01 Feb 2019 14:32:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34746)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gpeYS-0003rH-Gx; Fri, 01 Feb 2019 14:32:48 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19DED284CB;
	Fri,  1 Feb 2019 19:32:38 +0000 (UTC)
Received: from blue.redhat.com (ovpn-117-44.phx2.redhat.com [10.3.117.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD2EF60123;
	Fri,  1 Feb 2019 19:32:37 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	qemu-trivial@nongnu.org
Date: Fri,  1 Feb 2019 13:32:34 -0600
Message-Id: <20190201193234.20796-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 01 Feb 2019 19:32:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] tests: Ignore fp test outputs
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2019 19:32:54 -0000

Commit 2cade3d wired up new tests, but did not exclude the
new *.out files produced by running the tests.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index 72c18aaab04..f2bf85c8c4c 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -5,6 +5,7 @@ benchmark-crypto-hmac
 check-*
 !check-*.c
 !check-*.sh
+fp/*.out
 qht-bench
 rcutorture
 test-*
--=20
2.20.1


