Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SGQ0A-0001wy-9p
	for mharc-qemu-trivial@gnu.org; Sat, 07 Apr 2012 03:24:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SGQ01-0001V2-2g
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 03:23:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SGPzw-0008IG-Ki
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 03:23:52 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:38691)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SGPzt-0008HP-Jo; Sat, 07 Apr 2012 03:23:45 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	CE8B972800B2; Sat,  7 Apr 2012 09:23:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id k9AUfUUu9EN2; Sat,  7 Apr 2012 09:23:43 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 7E8C472800B3; Sat,  7 Apr 2012 09:23:43 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat,  7 Apr 2012 09:23:35 +0200
Message-Id: <1333783419-7982-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	Anthony Liguori <aliguori@us.ibm.com>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH 0/4] Replace Qemu by QEMU
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
X-List-Received-Date: Sat, 07 Apr 2012 07:23:57 -0000

These patches try to establish the official spelling "QEMU".
There remain some old spellings "Qemu" in BIOS code
(use "grep -rw Qemu pc-bios" to see them).

Patch 4 also fixes a spelling bug and debug messages
which I did not mention in the commit message.

Regards,
Stefan W.

[PATCH 1/4] Replace Qemu by QEMU in user visible documentation
[PATCH 2/4] Replace Qemu by QEMU in internal documentation
[PATCH 3/4] Replace Qemu by QEMU in w32 installation path (prefix)
[PATCH 4/4] Replace Qemu by QEMU in comments

