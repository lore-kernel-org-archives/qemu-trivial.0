Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpIFe-0000Mf-3T
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 08:48:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIFU-0008T8-Fu
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 08:48:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIFO-0001S1-I8
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 08:48:48 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:59163
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIF9-0001QA-O1; Sat, 07 Dec 2013 08:48:27 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 35954180284; Sat,  7 Dec 2013 14:48:24 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sat,  7 Dec 2013 14:48:03 +0100
Message-Id: <1386424088-23196-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH v2 0/5] Replace sizeof(array) / sizeof(*array)
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
X-List-Received-Date: Sat, 07 Dec 2013 13:48:54 -0000

These patches were previously sent as single patches instead of
a patch series. They all replace sizeof(array) / sizeof(*array)
by macros.

v2: Fix typos in commit messages (thanks to Peter Maydell).

[PATCH v2 1/5] misc: Use macro ARRAY_SIZE where possible
[PATCH v2 2/5] ui/cocoa: Use macro ARRAY_SIZE where possible
[PATCH v2 3/5] exynos4210: Use macro ARRAY_SIZE where possible
[PATCH v2 4/5] target-mips: Use macro ARRAY_SIZE where possible
[PATCH v2 5/5] linux-user: Use macro TARGET_NSIG_WORDS where possible

