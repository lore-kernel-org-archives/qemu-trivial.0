Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1HAs-00064z-4z
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2012 07:56:30 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1Gsf-0001lg-Vo
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 07:37:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1GsY-0002hG-4c
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 07:37:38 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:33559)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S1GsN-0002eh-UO; Sat, 25 Feb 2012 07:37:24 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	5BDF97280099; Sat, 25 Feb 2012 13:37:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 3FTtLWQHk-WF; Sat, 25 Feb 2012 13:37:17 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 959E5728009A; Sat, 25 Feb 2012 13:37:17 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Sat, 25 Feb 2012 13:37:11 +0100
Message-Id: <1330173433-32043-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 0/2] Trivial MemoryRegionOps patches
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
X-List-Received-Date: Sat, 25 Feb 2012 12:56:28 -0000

Please apply http://patchwork.ozlabs.org/patch/139660/ to the qemu-trivial
patch queue. Here are two additional trivial patches which also touch
MemoryRegionOps and make the code more uniform.

[PATCH 1/2] ppc: Add missing 'static' to spin_rw_ops
[PATCH 2/2] sh7750: Remove redundant 'struct' from MemoryRegionOps

Regards,

Stefan W.


