Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJqgc-0006Lu-IB
	for mharc-qemu-trivial@gnu.org; Fri, 06 Feb 2015 16:43:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqga-0006J0-P3
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqgY-0006uJ-4T
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:36 -0500
Received: from p54ac902a.dip0.t-ipconnect.de ([84.172.144.42]:46013 helo=edv32)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqgX-0006tw-Sz
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:34 -0500
Received: from stefan by edv32 with local (Exim 4.84)
	(envelope-from <stefan@bib.uni-mannheim.de>)
	id 1YJqgU-00084P-Iz; Fri, 06 Feb 2015 22:43:30 +0100
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Fri,  6 Feb 2015 22:43:07 +0100
Message-Id: <1423258997-30957-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 84.172.144.42
Subject: [Qemu-trivial] [PATCH 00/10] Fix warnings (undeclared global
	symbols)
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
X-List-Received-Date: Fri, 06 Feb 2015 21:43:38 -0000

All warnings were reported by the Sparse static analysis tool.

[PATCH 01/10] disas/cris: Fix warning caused by missing 'static'
[PATCH 02/10] disas/sh4: Fix warning caused by missing 'static'
[PATCH 03/10] migration: Fix warning caused by missing declaration of
[PATCH 04/10] migration: Fix warnings caused by missing 'static'
[PATCH 05/10] moxie: Fix warning caused by missing include statement
[PATCH 06/10] serial: Fix warnings caused by missing 'static'
[PATCH 07/10] spice: Add missing 'static' attribute
[PATCH 08/10] stubs: Fix warning caused by missing include statement
[PATCH 09/10] vga: Fix warning caused by missing 'static' attribute
[PATCH 10/10] virtio: Fix warning caused by missing 'static'

