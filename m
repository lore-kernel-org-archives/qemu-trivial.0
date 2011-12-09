Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RZ9kS-0003Il-KK
	for mharc-qemu-trivial@gnu.org; Fri, 09 Dec 2011 18:21:00 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RZ9kP-00039L-Ii
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 18:20:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RZ9kO-0000aZ-OJ
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 18:20:57 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46490)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RZ9kM-0000Xb-Mk; Fri, 09 Dec 2011 18:20:54 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	7829A728188A; Sat, 10 Dec 2011 00:20:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Cyccl1iilzqn; Sat, 10 Dec 2011 00:19:56 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id E2228728188B; Sat, 10 Dec 2011 00:19:56 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 10 Dec 2011 00:19:40 +0100
Message-Id: <1323472786-26821-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 0/6] New fixes for some misspellings
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
X-List-Received-Date: Fri, 09 Dec 2011 23:20:58 -0000

This patch series tries to fix the most common misspellings
using the tool 'codespell'.

See http://wiki.qemu.org/Contribute/SpellCheck for more information
on using codespell with QEMU.

Regards,
Stefan Weil

[PATCH 1/6] Add spelling exceptions for codespell
[PATCH 2/6] fmopl: Fix spelling in code and comments
[PATCH 3/6] hw: Fix spelling (licenced->licensed)
[PATCH 4/6] hw: Fix spelling in comments
[PATCH 5/6] hw: Fix spelling in comments and code
[PATCH 6/6] Fix spelling in comments, documentation and messages

