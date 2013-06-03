Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjQbZ-0001XX-5M
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 04:59:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1UjQbR-0001IG-AC
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 04:59:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1UjQbK-0007iW-NJ
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 04:58:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32249)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1UjQb6-0007gh-S0; Mon, 03 Jun 2013 04:58:37 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r538wZUs009798
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 3 Jun 2013 04:58:36 -0400
Received: from localhost (ovpn-112-30.ams2.redhat.com [10.36.112.30])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r538wYCw010286; Mon, 3 Jun 2013 04:58:35 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Mon,  3 Jun 2013 10:58:29 +0200
Message-Id: <1370249911-19708-1-git-send-email-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 0/2] vhost-scsi and ivshmem fixes for
	Coverity issues
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
X-List-Received-Date: Mon, 03 Jun 2013 08:59:03 -0000

The following fixes address NULL pointer dereferences spotted by Coverity.

v2:
 * Dropped savevm.c popen(3) leak fix since Paolo has a better fix [eblake]

Stefan Hajnoczi (2):
  vhost-scsi: fix k->set_guest_notifiers() NULL dereference
  ivshmem: add missing error exit(2)

 hw/misc/ivshmem.c    | 1 +
 hw/scsi/vhost-scsi.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
1.8.1.4


