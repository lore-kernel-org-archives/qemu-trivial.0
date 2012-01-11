Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rl30i-0007sq-1v
	for mharc-qemu-trivial@gnu.org; Wed, 11 Jan 2012 13:34:56 -0500
Received: from eggs.gnu.org ([140.186.70.92]:53261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rl30Z-0007KU-Br
	for qemu-trivial@nongnu.org; Wed, 11 Jan 2012 13:34:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rl30Y-0002Ts-6A
	for qemu-trivial@nongnu.org; Wed, 11 Jan 2012 13:34:47 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:49131)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Rl30S-0002St-Tv; Wed, 11 Jan 2012 13:34:41 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	299E37280003; Wed, 11 Jan 2012 19:34:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id lXtAxQuWJMup; Wed, 11 Jan 2012 19:34:38 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id CFDA37280009; Wed, 11 Jan 2012 19:34:38 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Wed, 11 Jan 2012 19:34:28 +0100
Message-Id: <1326306870-14484-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, "M. Mohan Kumar" <mohan@in.ibm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 0/2] virtfs-proxy-helper: Fix and clean
	include statements
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
X-List-Received-Date: Wed, 11 Jan 2012 18:34:54 -0000

Obviously most Linux host systems don't have a libcap-dev package.

If this package is available, make tries to build virtfs-proxy-helper
and fails on recent Linux distributions because of a missing attr/xattr.h.

The first patch fixes this. As I noticed that several include statements
were redundant, I added the second patch which is optional but cleans
the code a little bit.

Please consider adding libcap-dev to the Linux build bots (and of course
to the personal Linux environment when you are a maintainer).

Regards,
Stefan Weil

[PATCH 1/2] virtfs-proxy-helper: Fix compilation on newer systems
[PATCH 2/2] virtfs-proxy-helper: Clean include files

