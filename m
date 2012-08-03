Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sx8DS-0005PA-Sg
	for mharc-qemu-trivial@gnu.org; Thu, 02 Aug 2012 23:06:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1Sx8DA-0004cJ-SE
	for qemu-trivial@nongnu.org; Thu, 02 Aug 2012 23:06:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1Sx8DA-00066X-2r
	for qemu-trivial@nongnu.org; Thu, 02 Aug 2012 23:06:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51869)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1Sx8D7-00065q-W0; Thu, 02 Aug 2012 23:05:58 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7335uks016002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 2 Aug 2012 23:05:56 -0400
Received: from dhcp-8-167.nay.redhat.com ([10.66.7.126])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q7335pTV024767; Thu, 2 Aug 2012 23:05:53 -0400
From: Amos Kong <akong@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri,  3 Aug 2012 11:06:20 +0800
Message-Id: <1343963182-28297-1-git-send-email-akong@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: aliguori@us.ibm.com, quintela@redhat.com
Subject: [Qemu-trivial] [PATCH v2 0/2] trivial fix of qemu-sockets.c
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
X-List-Received-Date: Fri, 03 Aug 2012 03:06:07 -0000

Those patches fix trivial issues which were found
in the second review.

Amos Kong (2):
  remove unused include of error.h
  socket: clean up redundant assignment

 qemu-sockets.c |    1 -
 qemu_socket.h  |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

Changes from v1:
- drop wrong patch: [PATCH] socket: remove redundant check

