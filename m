Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIHwG-0007VP-Ia
	for mharc-qemu-trivial@gnu.org; Wed, 09 Oct 2019 15:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iIHw9-0007L0-E5
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 15:47:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iIHw8-0003gl-Ax
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 15:47:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59114)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iIHw4-0003dx-01; Wed, 09 Oct 2019 15:47:48 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0305A18CB919;
 Wed,  9 Oct 2019 19:47:47 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC99D1001DC0;
 Wed,  9 Oct 2019 19:47:45 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 3/4] qemu-iotests: 044: pass is actually a noop,
 so remove it
Date: Wed,  9 Oct 2019 15:47:39 -0400
Message-Id: <20191009194740.8079-4-crosa@redhat.com>
In-Reply-To: <20191009194740.8079-1-crosa@redhat.com>
References: <20191009194740.8079-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Wed, 09 Oct 2019 19:47:47 +0000 (UTC)
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
X-List-Received-Date: Wed, 09 Oct 2019 19:47:55 -0000

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/qemu-iotests/044 | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
index 8b2afa2a11..aa2a00ceed 100755
--- a/tests/qemu-iotests/044
+++ b/tests/qemu-iotests/044
@@ -102,17 +102,14 @@ class TestRefcountTableGrowth(iotests.QMPTestCase):
     def setUp(self):
         qemu_img('create', '-f', iotests.imgfmt, '-o', 'cluster_size=3D5=
12', test_img, '16G')
         self.preallocate(test_img)
-        pass
=20
=20
     def tearDown(self):
         os.remove(test_img)
-        pass
=20
     def test_grow_refcount_table(self):
         qemu_io('-c', 'write 3800M 1M', test_img)
         qemu_img_verbose('check' , test_img)
-        pass
=20
 if __name__ =3D=3D '__main__':
     iotests.main(supported_fmts=3D['qcow2'],
--=20
2.21.0


