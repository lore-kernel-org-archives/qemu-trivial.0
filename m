Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ehg9Z-0003Fm-3w
	for mharc-qemu-trivial@gnu.org; Fri, 02 Feb 2018 13:33:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ehg8a-0002N6-GG
	for qemu-trivial@nongnu.org; Fri, 02 Feb 2018 13:33:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ehg7D-00037O-RO
	for qemu-trivial@nongnu.org; Fri, 02 Feb 2018 13:32:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47678)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1ehg3P-0006zU-5U; Fri, 02 Feb 2018 13:27:15 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BBD92FCD;
	Fri,  2 Feb 2018 18:27:14 +0000 (UTC)
Received: from t460.redhat.com (unknown [10.33.36.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C2656D011;
	Fri,  2 Feb 2018 18:27:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Date: Fri,  2 Feb 2018 18:26:59 +0000
Message-Id: <20180202182659.32033-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 02 Feb 2018 18:27:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH=5D_mailmap=3A_set_preferred_spe?=
 =?utf-8?q?lling_for_Daniel_Berrang=C3=A9?=
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
X-List-Received-Date: Fri, 02 Feb 2018 18:33:35 -0000

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 .mailmap | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.mailmap b/.mailmap
index ee81ac801e..cf689b9ec9 100644
--- a/.mailmap
+++ b/.mailmap
@@ -18,3 +18,7 @@ malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c=
8c-71466251a162>
 # There is also a:
 #    (no author) <(no author)@c046a42c-6fe2-441c-8c8c-71466251a162>
 # for the cvs2svn initialization commit e63c3dc74bf.
+#
+# Also list preferred name forms where people have changed their
+# git author config
+Daniel P. Berrang=C3=A9 <berrange@redhat.com>
--=20
2.14.3


