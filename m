Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwUld-0000Nf-7I
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 04:58:57 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1SwUlV-0008Nf-8r
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 04:58:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1SwUlP-0002j6-GF
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 04:58:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48103)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1SwUlE-0002hN-Na; Wed, 01 Aug 2012 04:58:32 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q718wV5n000729
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 1 Aug 2012 04:58:31 -0400
Received: from dhcp-8-167.nay.redhat.com ([10.66.7.126])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q718wSqB027838; Wed, 1 Aug 2012 04:58:29 -0400
From: Amos Kong <akong@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed,  1 Aug 2012 16:59:00 +0800
Message-Id: <1343811543-12137-1-git-send-email-akong@redhat.com>
In-Reply-To: <1342539951-30915-1-git-send-email-akong@redhat.com>
References: <1342539951-30915-1-git-send-email-akong@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: aliguori@us.ibm.com, quintela@redhat.com
Subject: [Qemu-trivial] [RESEND PATCH 0/3] trivial fix of qemu-sockets.c
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
X-List-Received-Date: Wed, 01 Aug 2012 08:58:55 -0000

Those patches fix trivial issues which were found
in the second review.

Amos Kong (3):
  socket: remove redundant check
  remove unused include of error.h
  socket: clean up redundant assignment

 qemu-sockets.c |    5 +----
 qemu_socket.h  |    1 -
 2 files changed, 1 insertions(+), 5 deletions(-)


