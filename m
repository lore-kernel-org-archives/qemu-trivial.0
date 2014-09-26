Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXbTX-0005Sl-3i
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 15:46:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1XXbTP-0005GM-RX
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 15:46:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1XXbTJ-0007Fw-Ij
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 15:46:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40834)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1XXbT7-0007Co-1D; Fri, 26 Sep 2014 15:46:17 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8QJkBji023625
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 26 Sep 2014 15:46:11 -0400
Received: from localhost (ovpn-113-54.phx2.redhat.com [10.3.113.54])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8QJk9hW005524; Fri, 26 Sep 2014 15:46:10 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 26 Sep 2014 16:46:01 -0300
Message-Id: <1411760764-18292-1-git-send-email-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH 0/3] bitops: Header dependency fixes
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
X-List-Received-Date: Fri, 26 Sep 2014 19:46:42 -0000

This series adds a missing include, kills a circular header dependency, and
avoid including qemu-common.h from a header to avoid new circular dependencies.

Eduardo Habkost (3):
  tests: Add missing include to test-bitops.c
  bitops.h: Don't include qemu-common.h
  bitmap.h: Don't include qemu-common.h

 include/qemu/bitmap.h | 5 ++++-
 include/qemu/bitops.h | 4 +++-
 tests/test-bitops.c   | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

-- 
1.9.3


