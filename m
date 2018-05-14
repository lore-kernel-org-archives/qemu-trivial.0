Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIHJL-0007BC-A8
	for mharc-qemu-trivial@gnu.org; Mon, 14 May 2018 13:30:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fIHJJ-0007AE-M3
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 13:30:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fIHJI-00067H-Ol
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 13:30:57 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:41642)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fIHJG-0005yO-59; Mon, 14 May 2018 13:30:54 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fIHJ7-0000Hu-NI; Mon, 14 May 2018 18:30:45 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Mon, 14 May 2018 18:30:42 +0100
Message-Id: <20180514173044.5025-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH 0/2] gdbstub: fix a couple of coverity nits
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
X-List-Received-Date: Mon, 14 May 2018 17:30:58 -0000

Fix a couple of coverity nits in gdbstub.c regarding failing
to check error returns.

Peter Maydell (2):
  gdbstub: Use qemu_set_cloexec()
  gdbstub: Handle errors in gdb_accept()

 gdbstub.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

-- 
2.17.0


