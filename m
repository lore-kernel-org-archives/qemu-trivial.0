Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g86LT-0005jb-Ou
	for mharc-qemu-trivial@gnu.org; Thu, 04 Oct 2018 12:19:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1g86LK-0005d3-VX
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:19:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1g86LH-0002Xh-LH
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:19:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39140)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1g86L1-0002Mp-6f; Thu, 04 Oct 2018 12:18:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 593C632B669;
	Thu,  4 Oct 2018 16:18:54 +0000 (UTC)
Received: from dhcp-17-10.bos.redhat.com (dhcp-17-10.bos.redhat.com
	[10.18.17.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CEE877BFE;
	Thu,  4 Oct 2018 16:18:52 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Cleber Rosa <crosa@redhat.com>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Date: Thu,  4 Oct 2018 12:18:42 -0400
Message-Id: <20181004161852.11673-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 04 Oct 2018 16:18:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 00/10] Trivial fixes and clean ups
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
X-List-Received-Date: Thu, 04 Oct 2018 16:19:18 -0000

Just a collection of trivial fixes and clean ups that have been lying
around here for some time.

Cleber Rosa (10):
  qemu-img.c: comment typo fix
  tests/tcg/README: fix location for lm32 tests
  qemu-iotests: make 218 executable
  qemu-iotests: fix filename containing checks
  docs/devel/testing.rst: add missing newlines after code block
  thunk.c: clean up commented out definition
  scripts/decodetree.py: remove unused imports
  scripts/decodetree.py: fix reference to attributes
  scripts/qemu.py: use a more consistent docstring style
  scripts/qemu.py: remove trailing quotes on docstring

 docs/devel/testing.rst       |  2 ++
 dtc                          |  2 +-
 qemu-img.c                   |  2 +-
 scripts/decodetree.py        |  4 +--
 scripts/qemu.py              | 67 ++++++++++++++++++++++--------------
 tests/qemu-iotests/218       |  0
 tests/qemu-iotests/common.rc |  4 +--
 tests/tcg/README             |  2 +-
 thunk.c                      |  2 --
 9 files changed, 50 insertions(+), 35 deletions(-)
 mode change 100644 => 100755 tests/qemu-iotests/218

-- 
2.17.1


