Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gfTxe-0002IO-67
	for mharc-qemu-trivial@gnu.org; Fri, 04 Jan 2019 13:12:46 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTxb-0002E5-AB
	for qemu-trivial@nongnu.org; Fri, 04 Jan 2019 13:12:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTxY-0003Gf-Ao
	for qemu-trivial@nongnu.org; Fri, 04 Jan 2019 13:12:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50920)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfTxP-00035G-46; Fri, 04 Jan 2019 13:12:31 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 65BDB8666F;
	Fri,  4 Jan 2019 18:12:25 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0FAD4EE1F;
	Fri,  4 Jan 2019 18:12:11 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, qemu-trivial@nongnu.org,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
	qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Fri,  4 Jan 2019 19:12:05 +0100
Message-Id: <20190104181208.7809-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 04 Jan 2019 18:12:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 0/3] cutils: Cleanup, improve documentation
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
X-List-Received-Date: Fri, 04 Jan 2019 18:12:44 -0000

This series is a fairly trivial cleanup of "cutils.h"
(size_to_str() and ctype macros moved into it), and
some documentation improvements.

Since v1:
- Fixed checkpatch errors (patchew)
- Added Stefano R-b

There are still checkpatch warnings (due to 8c06fbdf36b) for using the
Doxygen '/**' comment opening:

    WARNING: Block comments use a leading /* on a separate line
    #42: FILE: include/qemu/cutils.h:160:
    +/**

v1: https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg05927.html

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (3):
  util/cutils: Move size_to_str() from "qemu-common.h" to "cutils.h"
  util/cutils: Move ctype macros to "cutils.h"
  util/cutils: Move function documentations to the header

 hw/core/bus.c                |   2 +-
 hw/core/qdev-properties.c    |   1 +
 hw/s390x/s390-virtio-ccw.c   |   1 +
 hw/scsi/scsi-generic.c       |   2 +-
 include/qemu-common.h        |  17 ---
 include/qemu/cutils.h        | 262 +++++++++++++++++++++++++++++++++++
 qapi/qapi-util.c             |   2 +-
 qapi/string-output-visitor.c |   2 +-
 qobject/json-parser.c        |   1 -
 target/ppc/monitor.c         |   1 +
 ui/keymaps.c                 |   1 +
 util/cutils.c                | 191 -------------------------
 util/id.c                    |   2 +-
 util/readline.c              |   1 -
 14 files changed, 271 insertions(+), 215 deletions(-)

--=20
2.17.2


