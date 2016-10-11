Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btyqU-0005FW-Vg
	for mharc-qemu-trivial@gnu.org; Tue, 11 Oct 2016 11:19:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1btyqP-0005BO-JQ
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 11:19:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1btyqN-0004HJ-Kj
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 11:19:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43296)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1btyqD-0004D6-Cb; Tue, 11 Oct 2016 11:19:41 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A158C0467D0;
	Tue, 11 Oct 2016 15:19:40 +0000 (UTC)
Received: from thh440s.str.redhat.com. (dhcp-192-218.str.redhat.com
	[10.33.192.218])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9BFJbML002507; Tue, 11 Oct 2016 11:19:38 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Sascha Silbe <x-qemu@se-silbe.de>, qemu-trivial@nongnu.org,
	Michael Tsirkin <mst@redhat.com>, qemu-ppc@nongnu.org,
	Victor Kaplansky <victork@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Date: Tue, 11 Oct 2016 17:19:34 +0200
Message-Id: <1476199177-32411-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 11 Oct 2016 15:19:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/3] Improvements for the boot-sector tester
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
X-List-Received-Date: Tue, 11 Oct 2016 15:19:57 -0000

Here are two patches that try to improve the situation with the
slow pxe-test on ppc64 a little bit, and one patch that fixes
a potential race condition between tests that run in parallel
by using a random filename instead of an invariant one.

Thomas Huth (3):
  tests/boot-sector: Use minimum length for the Forth boot script
  tests/boot-sector: Use mkstemp() to create a unique file name
  tests/boot-sector: Increase time-out to 90 seconds

 tests/bios-tables-test.c |  2 +-
 tests/boot-sector.c      | 25 ++++++++++++++++---------
 tests/boot-sector.h      |  4 ++--
 tests/pxe-test.c         |  2 +-
 4 files changed, 20 insertions(+), 13 deletions(-)

-- 
1.8.3.1


