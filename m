Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbpdT-0003oU-5I
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 03:28:51 -0500
Received: from eggs.gnu.org ([140.186.70.92]:51532)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RbpdQ-0003eK-FP
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:28:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RbpdO-0006IW-Ak
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:28:48 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:58851)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RbpdJ-0006BS-SM; Sat, 17 Dec 2011 03:28:41 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	25007728328E; Sat, 17 Dec 2011 09:28:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id GJ2sJwZd49Sn; Sat, 17 Dec 2011 09:27:49 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id CF6FC728188B; Sat, 17 Dec 2011 09:27:49 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 17 Dec 2011 09:27:28 +0100
Message-Id: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 00/11] configure: Fix compiler warnings in
	config.log
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
X-List-Received-Date: Sat, 17 Dec 2011 08:28:49 -0000

Recently some patches were sent from Peter Maydell to improve
the output in config.log.

This new patch series also improves that output by eliminating
some compiler warnings.

Here is the result of a typical QEMU configuration:

without patch series
296 lines in config.log with 78 compilations, 69 errors and 107 warnings

with patch series applied
152 lines in config.log with 75 compilations, 24 errors and 30 warnings

It is possible to apply only some of the patches (they don't depend
on each other).

Regards,
Stefan Weil

[PATCH 01/11] configure: Fix compiler warnings in config.log (always return a value from main)
[PATCH 02/11] configure: Fix compiler warnings in config.log (old-style function definition)
[PATCH 03/11] configure: Fix compiler warning in config.log (integer from pointer)
[PATCH 04/11] configure: Fix compiler warnings in config.log (null arguments)
[PATCH 05/11] configure: Fix compiler warning in config.log (unused variable)
[PATCH 06/11] configure: Fix compiler warning in config.log (macro redefined)
[PATCH 07/11] configure: Fix compiler warnings in config.log (uninitialized variable)
[PATCH 08/11] configure: Fix compiler warning in config.log (undefined NULL)
[PATCH 09/11] configure: Fix compiler warning in config.log (value was never used)
[PATCH 10/11] configure: Fix compiler warnings in config.log (statement without effect)
[PATCH 11/11] configure: Improve Xen autodetection for hosts without Xen

