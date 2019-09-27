Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDr4B-00019p-2W
	for mharc-qemu-trivial@gnu.org; Fri, 27 Sep 2019 10:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iDr44-00012m-Qn
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 10:17:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iDr43-0003U8-Pf
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 10:17:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51902)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iDr3y-0003OR-1F; Fri, 27 Sep 2019 10:17:38 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6FB7310C0925;
 Fri, 27 Sep 2019 14:17:34 +0000 (UTC)
Received: from dhcp-17-179.bos.redhat.com (dhcp-17-179.bos.redhat.com
 [10.18.17.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 926D760BE2;
 Fri, 27 Sep 2019 14:17:33 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH 4/4] qemu-iotests: 044: remove inaccurate docstring class
 description
Date: Fri, 27 Sep 2019 10:17:28 -0400
Message-Id: <20190927141728.7137-5-crosa@redhat.com>
In-Reply-To: <20190927141728.7137-1-crosa@redhat.com>
References: <20190927141728.7137-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Fri, 27 Sep 2019 14:17:34 +0000 (UTC)
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
X-List-Received-Date: Fri, 27 Sep 2019 14:17:48 -0000

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/qemu-iotests/044 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
index eb42df0fe1..0ca4bcfc6d 100755
--- a/tests/qemu-iotests/044
+++ b/tests/qemu-iotests/044
@@ -34,7 +34,6 @@ if sys.version_info.major =3D=3D 2:
 test_img =3D os.path.join(iotests.test_dir, 'test.img')
=20
 class TestRefcountTableGrowth(iotests.QMPTestCase):
-    '''Abstract base class for image mirroring test cases'''
=20
     def preallocate(self, name):
         fd =3D open(name, "r+b")
--=20
2.21.0


