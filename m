Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXVKh-0000Yl-L2
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 12:26:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dXVKg-0000X5-7L
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 12:26:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dXVKf-000125-Di
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 12:26:46 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dXVKd-0000zb-OZ; Tue, 18 Jul 2017 12:26:43 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dXVKV-00053y-IP; Tue, 18 Jul 2017 17:26:35 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Tue, 18 Jul 2017 17:26:30 +0100
Message-Id: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH for-2.10 0/4] bsd-user: silence warnings on
 OpenBSD
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
X-List-Received-Date: Tue, 18 Jul 2017 16:26:47 -0000

I've just managed to get an OpenBSD VM into my test set for processing
pull requests. There are a handful of minor compiler warnings in
bsd-user, which this patchset fixes, just to reduce the noise
in my logs.

thanks
-- PMM

Peter Maydell (4):
  bsd-user/mmap.c: Move __thread attribute to right place
  bsd-user/elfload.c: Fix set-but-not-used warnings
  bsd-user/bsdload.c: Remove write-only id_change variable
  bsd-user/main.c: Fix unused variable warning

 bsd-user/bsdload.c | 25 +------------------------
 bsd-user/elfload.c | 10 ++++------
 bsd-user/main.c    |  7 ++++---
 bsd-user/mmap.c    |  2 +-
 4 files changed, 10 insertions(+), 34 deletions(-)

-- 
2.7.4


