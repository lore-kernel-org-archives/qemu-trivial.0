Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIHwC-0007PX-RV
	for mharc-qemu-trivial@gnu.org; Wed, 09 Oct 2019 15:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57411)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iIHw7-0007IM-EK
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 15:47:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iIHw6-0003fQ-Av
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 15:47:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40340)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iIHvz-0003cZ-Td; Wed, 09 Oct 2019 15:47:44 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D96677FDFC;
 Wed,  9 Oct 2019 19:47:42 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD63E1001DC2;
 Wed,  9 Oct 2019 19:47:41 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 0/4] iotests: trivial cleanups
Date: Wed,  9 Oct 2019 15:47:36 -0400
Message-Id: <20191009194740.8079-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 09 Oct 2019 19:47:42 +0000 (UTC)
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
X-List-Received-Date: Wed, 09 Oct 2019 19:47:54 -0000

The most trivial set of cleanups to iotests common libraries and the
044 test.

Changes from v1:
 * Added emacs mode hints on tests/qemu-iotests/common.* files (Eric
   Blake)

Cleber Rosa (4):
  qemu-iotests: remove bash shebang from library files
  qemu-iotests: remove forceful execution success from library files
  qemu-iotests: 044: pass is actually a noop, so remove it
  qemu-iotests: 044: remove inaccurate docstring class description

 tests/qemu-iotests/044            | 4 ----
 tests/qemu-iotests/common.config  | 5 +----
 tests/qemu-iotests/common.filter  | 5 +----
 tests/qemu-iotests/common.nbd     | 3 +--
 tests/qemu-iotests/common.pattern | 2 +-
 tests/qemu-iotests/common.qemu    | 2 +-
 tests/qemu-iotests/common.rc      | 5 +----
 tests/qemu-iotests/common.tls     | 2 +-
 8 files changed, 7 insertions(+), 21 deletions(-)

--=20
2.21.0


