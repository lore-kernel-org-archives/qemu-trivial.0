Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TxamS-0008Mx-H7
	for mharc-qemu-trivial@gnu.org; Tue, 22 Jan 2013 05:08:36 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TxamH-0007x5-7z
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:08:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TxamB-0000Dm-0J
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:08:21 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:48325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Txam6-0000AM-9k; Tue, 22 Jan 2013 05:08:14 -0500
Received: from blackfin.pond.sub.org (p5B329A82.dip.t-dialin.net
	[91.50.154.130])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 359CBA0179;
	Tue, 22 Jan 2013 11:08:07 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 01358200AA; Tue, 22 Jan 2013 11:08:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Jan 2013 11:07:55 +0100
Message-Id: <1358849286-24750-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v3 00/11] Trivial memory allocation fixes &
	cleanups
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
X-List-Received-Date: Tue, 22 Jan 2013 10:08:32 -0000

v3: const tweak suggested by stefanha in PATCH 08/11, rest identical
    except 03/11's commit message mentions leak (thanks stefanha!)

v2: Windows compile fix in PATCH 08/11 (thanks eblake!), rest identical

Markus Armbruster (11):
  g_malloc(0) and g_malloc0(0) return NULL; simplify
  g_strdup(NULL) returns NULL; simplify
  hw/9pfs: Fix unchecked strdup() by converting to g_strdup()
  readline: Fix unchecked strdup() by converting to g_strdup()
  spice: Fix unchecked strdup() by converting to g_strdup()
  virtfs-proxy-helper: Fix unchecked strdup() by conv. to g_strdup()
  qemu-log: Fix unchecked strdup() by converting to g_strdup()
  qemu-log: Plug trivial memory leak in cpu_set_log_filename()
  libcacard: Fix unchecked strdup() by converting to g_strdup()
  qapi: Fix unchecked strdup() by converting to g_strdup()
  qemu-ga: Fix unchecked strdup() by converting to g_strdup()

 block/qcow2-refcount.c      |  6 +-----
 block/vdi.c                 |  4 +---
 fsdev/virtfs-proxy-helper.c |  4 ++--
 hw/9pfs/virtio-9p-device.c  |  8 ++------
 hw/9pfs/virtio-9p-local.c   |  8 ++++----
 hw/9pfs/virtio-9p.c         |  6 +-----
 hw/block-common.c           |  4 +---
 hw/vhost.c                  |  7 ++-----
 libcacard/vcard_emul_nss.c  |  4 ++--
 libcacard/vreader.c         |  2 +-
 libcacard/vscclient.c       |  4 ++--
 net/net.c                   |  4 +---
 qapi/qmp-registry.c         |  2 +-
 qemu-log.c                  | 15 ++++++++++-----
 qga/commands.c              |  2 +-
 readline.c                  |  4 ++--
 slirp/slirp.c               |  8 ++------
 ui/spice-core.c             |  4 ++--
 util/qemu-option.c          |  8 ++------
 19 files changed, 40 insertions(+), 64 deletions(-)

-- 
1.7.11.7


