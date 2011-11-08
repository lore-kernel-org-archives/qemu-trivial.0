Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNmnb-0004Vc-QD
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 09:37:15 -0500
Received: from eggs.gnu.org ([140.186.70.92]:49308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RNmnT-0003yO-MD
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 09:37:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RNmnO-0006aZ-Qs
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 09:37:07 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:46456)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RNmnF-0006WN-9i; Tue, 08 Nov 2011 09:36:53 -0500
Received: from blackfin.pond.sub.org (p5B32AA7E.dip.t-dialin.net
	[91.50.170.126])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 344659FFC5;
	Tue,  8 Nov 2011 15:36:51 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 9BC666006D; Tue,  8 Nov 2011 15:36:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  8 Nov 2011 15:36:47 +0100
Message-Id: <1320763010-10024-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 0/3] x86/cpuid: A few trivial fixes
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
X-List-Received-Date: Tue, 08 Nov 2011 14:37:13 -0000

Markus Armbruster (3):
  x86/cpuid: Convert remaining strdup() to g_strdup()
  x86/cpuid: Plug memory leak in cpudef_setfield()
  x86/cpuid: Fix crash on -cpu ""

 target-i386/cpuid.c |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

-- 
1.7.6.4


