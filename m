Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIHwH-0007Wy-LO
	for mharc-qemu-trivial@gnu.org; Wed, 09 Oct 2019 15:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57486)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iIHwE-0007SO-1v
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 15:47:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iIHwC-0003i5-TI
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 15:47:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45442)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iIHw8-0003gF-4O; Wed, 09 Oct 2019 15:47:52 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 531D93164683;
 Wed,  9 Oct 2019 19:47:51 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F1131001DC0;
 Wed,  9 Oct 2019 19:47:47 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 4/4] qemu-iotests: 044: remove inaccurate docstring class
 description
Date: Wed,  9 Oct 2019 15:47:40 -0400
Message-Id: <20191009194740.8079-5-crosa@redhat.com>
In-Reply-To: <20191009194740.8079-1-crosa@redhat.com>
References: <20191009194740.8079-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 09 Oct 2019 19:47:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Wed, 09 Oct 2019 19:48:00 -0000

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/qemu-iotests/044 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
index aa2a00ceed..bae99e25cf 100755
--- a/tests/qemu-iotests/044
+++ b/tests/qemu-iotests/044
@@ -31,7 +31,6 @@ import sys
 test_img =3D os.path.join(iotests.test_dir, 'test.img')
=20
 class TestRefcountTableGrowth(iotests.QMPTestCase):
-    '''Abstract base class for image mirroring test cases'''
=20
     def preallocate(self, name):
         fd =3D open(name, "r+b")
--=20
2.21.0


