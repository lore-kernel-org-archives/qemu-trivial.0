Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gcCmp-0006yW-AW
	for mharc-qemu-trivial@gnu.org; Wed, 26 Dec 2018 12:16:03 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gcCmm-0006v9-V5
	for qemu-trivial@nongnu.org; Wed, 26 Dec 2018 12:16:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gcCmm-0005HV-59
	for qemu-trivial@nongnu.org; Wed, 26 Dec 2018 12:16:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38954)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gcCmg-00055D-0n; Wed, 26 Dec 2018 12:15:55 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FB7E58E51;
	Wed, 26 Dec 2018 17:15:52 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-51.brq.redhat.com [10.40.204.51])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 161B45D9C9;
	Wed, 26 Dec 2018 17:15:41 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Wed, 26 Dec 2018 18:15:35 +0100
Message-Id: <20181226171538.21984-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 26 Dec 2018 17:15:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/3] cutils: Cleanup, improve documentation
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
X-List-Received-Date: Wed, 26 Dec 2018 17:16:01 -0000

This series is a fairly trivial cleanup of "cutils.h"
(size_to_str() and ctype macros moved into it), and
some documentation improvements.

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
 include/qemu/cutils.h        | 261 +++++++++++++++++++++++++++++++++++
 qapi/qapi-util.c             |   2 +-
 qapi/string-output-visitor.c |   2 +-
 qobject/json-parser.c        |   1 -
 target/ppc/monitor.c         |   1 +
 ui/keymaps.c                 |   1 +
 util/cutils.c                | 191 -------------------------
 util/id.c                    |   2 +-
 util/readline.c              |   1 -
 14 files changed, 270 insertions(+), 215 deletions(-)

--=20
2.17.2


