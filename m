Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WFzSJ-0000UQ-5k
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2014 00:12:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WFzSB-0000EK-7F
	for qemu-trivial@nongnu.org; Wed, 19 Feb 2014 00:12:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WFzS0-000599-N3
	for qemu-trivial@nongnu.org; Wed, 19 Feb 2014 00:12:15 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:42882
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WFzRo-0004tK-2X; Wed, 19 Feb 2014 00:11:52 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 36BFC1800EC; Wed, 19 Feb 2014 06:11:48 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Wed, 19 Feb 2014 06:11:43 +0100
Message-Id: <1392786705-9730-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 0/2] bswap: Clean prototypes of st* functions
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
X-List-Received-Date: Wed, 19 Feb 2014 05:12:21 -0000

These modifications avoid type conversions for non optimized code.

ld* function prototypes will follow later.

[PATCH 1/2] bswap: Modify prototype of stb_p (avoid type
[PATCH 2/2] bswap: Modify prototypes of st[wl]_{le,be}_p (avoid type

