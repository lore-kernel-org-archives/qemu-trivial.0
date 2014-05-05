Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhGd7-0000cY-KH
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 07:00:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WhGd0-0000QO-8T
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 07:00:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WhGcu-00006J-2O
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 07:00:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1WhGch-0008Mv-5d; Mon, 05 May 2014 06:59:51 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s45AxmeK027355
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 5 May 2014 06:59:48 -0400
Received: from T430.nay.redhat.com (dhcp-14-247.nay.redhat.com [10.66.14.247])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with
	ESMTP id s45AxcUW009117; Mon, 5 May 2014 06:59:45 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 18:59:51 +0800
Message-Id: <1399287591-6525-3-git-send-email-famz@redhat.com>
In-Reply-To: <1399287591-6525-1-git-send-email-famz@redhat.com>
References: <1399287591-6525-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 2/2] docs/memory.txt: Fix document on MMIO
	operations
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
X-List-Received-Date: Mon, 05 May 2014 11:00:16 -0000

.impl.valid should be .impl.unaligned and the description needs some
fixes.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 docs/memory.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/memory.txt b/docs/memory.txt
index d5abc92..4c7bc43 100644
--- a/docs/memory.txt
+++ b/docs/memory.txt
@@ -232,7 +232,8 @@ various constraints can be supplied to control how these callbacks are called:
    (in bytes) supported by the *implementation*; other access sizes will be
    emulated using the ones available. For example a 4-byte write will be
    emulated using four 1-byte writes, if .impl.max_access_size = 1.
- - .impl.valid specifies that the *implementation* only supports unaligned
-   accesses; unaligned accesses will be emulated by two aligned accesses.
+ - .impl.unaligned specifies that the *implementation* supports unaligned
+   accesses; if false, an unaligned access will be emulated by two aligned
+   accesses.
  - .old_mmio can be used to ease porting from code using
    cpu_register_io_memory(). It should not be used in new code.
-- 
1.9.2


