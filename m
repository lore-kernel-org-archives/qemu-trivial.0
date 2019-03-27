Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h95Ie-0000wK-6k
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2019 05:56:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h95Ic-0000ue-9d
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 05:56:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h95Ib-0002qx-AN
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 05:56:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40216)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>)
	id 1h95IV-0002lP-Po; Wed, 27 Mar 2019 05:56:39 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E5974285B4;
	Wed, 27 Mar 2019 09:56:38 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7582B5E255;
	Wed, 27 Mar 2019 09:56:35 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
	qemu-trivial@nongnu.org, Jeff Cody <codyprime@gmail.com>,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Kevin Wolf <kwolf@redhat.com>
Date: Wed, 27 Mar 2019 10:56:32 +0100
Message-Id: <20190327095634.53038-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 27 Mar 2019 09:56:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 0/2] block/vhdx: Use IEC binary prefixes
 from "qemu/units.h"
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
X-List-Received-Date: Wed, 27 Mar 2019 09:56:47 -0000

v2:
- Included units.h directly in the vhdx.h header file (John, Philippe)
- Added a comment next to DEFAULT_LOG_SIZE definition (Kevin)
- Added a second patch where I fixed some size constants using IEC
  binary prefixes.
  Note: checkpatch is not happy about a change in vhdx.h but all the comm=
ents
  in that file doesn't respect the new coding style so I left the comment=
 as is

Stefano Garzarella (2):
  block/vhdx: Remove redundant IEC binary prefixes definition
  block/vhdx: Use IEC binary prefixes for size constants

 block/vhdx-log.c |  2 +-
 block/vhdx.c     |  7 ++++---
 block/vhdx.h     | 16 +++++++---------
 3 files changed, 12 insertions(+), 13 deletions(-)

--=20
2.20.1


