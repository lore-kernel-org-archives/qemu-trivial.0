Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VONIF-00085Z-3w
	for mharc-qemu-trivial@gnu.org; Tue, 24 Sep 2013 03:44:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VONI8-0007u9-MM
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 03:44:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VONI4-0002Ov-7s
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 03:44:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13580)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1VONHd-0002J3-F7; Tue, 24 Sep 2013 03:43:45 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8O7hhuc011906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 24 Sep 2013 03:43:43 -0400
Received: from blackfin.pond.sub.org (ovpn-116-38.ams2.redhat.com
	[10.36.116.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8O7hfvk031675
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 Sep 2013 03:43:42 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 66D10200BF; Tue, 24 Sep 2013 09:43:40 +0200 (CEST)
From: armbru@redhat.com
To: qemu-devel@nongnu.org
Date: Tue, 24 Sep 2013 09:43:40 +0200
Message-Id: <1380008620-13796-3-git-send-email-armbru@redhat.com>
In-Reply-To: <1380008620-13796-1-git-send-email-armbru@redhat.com>
References: <1380008620-13796-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	r8O7hhuc011906
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, lersek@redhat.com, afaerber@suse.de,
	anthony@codemonkey.ws, qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PATCH v3 2/2] tests: Update .gitignore for
	test-int128 and test-bitops
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Sep 2013 07:44:21 -0000

From: Markus Armbruster <armbru@redhat.com>

Forgotten in commit 6046c62 and 3464700.

Cc: qemu-stable@nongnu.org
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index 75f06a1..425757c 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -5,9 +5,11 @@ check-qjson
 check-qlist
 check-qstring
 test-aio
+test-bitops
 test-throttle
 test-cutils
 test-hbitmap
+test-int128
 test-iov
 test-mul64
 test-qapi-types.[ch]
--=20
1.8.1.4


