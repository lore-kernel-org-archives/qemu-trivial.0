Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNP1V-0005f4-Uy
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2018 16:18:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gNP1U-0005dx-5t
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 16:18:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gNP1T-00051A-IQ
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 16:18:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48870)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gNP1O-0004oQ-L2; Thu, 15 Nov 2018 16:17:54 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E3C74C05D40C;
	Thu, 15 Nov 2018 21:17:53 +0000 (UTC)
Received: from red.redhat.com (ovpn-123-32.rdu2.redhat.com [10.10.123.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D13061D0F;
	Thu, 15 Nov 2018 21:17:53 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	armbru@redhat.com
Date: Thu, 15 Nov 2018 15:17:50 -0600
Message-Id: <20181115211752.1295571-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 15 Nov 2018 21:17:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/2] typedefs.h cleanup
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
X-List-Received-Date: Thu, 15 Nov 2018 21:18:00 -0000

Prompted by my review of xiezhide's work.  No semantic change, but
not technically a bug fix, so I don't care if it goes in 3.1 or
waits for 4.0.

Eric Blake (2):
  typedefs: (Re-)sort entries alphabetically
  numa: Match struct to typedef name

 include/qemu/typedefs.h | 12 ++++++------
 include/sysemu/numa.h   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.17.2


