Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRlq7-00009R-RE
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 13:10:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YRlq2-0008Px-Hq
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 13:10:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YRlpx-0006hJ-OU
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 13:10:06 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:54210)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YRlps-0006ej-Qy; Sat, 28 Feb 2015 13:09:56 -0500
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 04CEC17FDDC; Sat, 28 Feb 2015 19:09:52 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat, 28 Feb 2015 19:09:40 +0100
Message-Id: <1425146983-16015-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Amit Shah <amit.shah@redhat.com>, QEMU Developer <qemu-devel@nongnu.org>,
	Juan Quintela <quintela@redhat.com>
Subject: [Qemu-trivial] migration: Fix 32 bit compiler errors
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
X-List-Received-Date: Sat, 28 Feb 2015 18:10:10 -0000

Obviously that code was never before compiled on 32 bit hosts.
The RDMA API uses lots of uint64_t values and the code casts them
to and from pointers.

I tried to fix the compilation but did not run any runtime tests.

I think the first two patches are trivial, but the third one might
not be trivial, so please review it carefully.

Regards
Stefan

[PATCH 1/3] migration: Fix coding style (whitespace issues)
[PATCH 2/3] migration: Fix some 32 bit compiler errors
[PATCH 3/3] migration: Fix remaining 32 bit compiler errors

