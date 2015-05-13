Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YsWv2-0000Pn-IR
	for mharc-qemu-trivial@gnu.org; Wed, 13 May 2015 09:41:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <M.Cerveny@computer.org>) id 1YsVZJ-0002lK-ON
	for qemu-trivial@nongnu.org; Wed, 13 May 2015 08:15:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <M.Cerveny@computer.org>) id 1YsVZG-0003Ir-Cc
	for qemu-trivial@nongnu.org; Wed, 13 May 2015 08:15:21 -0400
Received: from gw.c-home.cz ([89.24.150.100]:55215 helo=dmz.c-home.cz)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <M.Cerveny@computer.org>)
	id 1YsVZG-0003Hk-1K; Wed, 13 May 2015 08:15:18 -0400
Received: from xen.c-home.cz (xen.c-home.cz [192.168.1.102])
	by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id t4DCFEuu018810;
	Wed, 13 May 2015 14:15:15 +0200 (CEST)
From: Martin Cerveny <M.Cerveny@computer.org>
To: qemu-devel@nongnu.org
Date: Wed, 13 May 2015 14:14:52 +0200
Message-Id: <1431519294-8873-1-git-send-email-M.Cerveny@computer.org>
X-Mailer: git-send-email 1.7.4.1
X-detected-operating-system: by eggs.gnu.org: Solaris 10
X-Received-From: 89.24.150.100
X-Mailman-Approved-At: Wed, 13 May 2015 09:41:51 -0400
Cc: qemu-trivial@nongnu.org, Martin Cerveny <M.Cerveny@computer.org>
Subject: [Qemu-trivial] [PATCH 0/2] Some fixes to qom scripts
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
X-List-Received-Date: Wed, 13 May 2015 12:15:22 -0000

Hi all.

I found some minor problems with qom scripts.

Martin Cerveny

Martin Cerveny (2):
  scripts: qom-*: add network syntax
  scripts: qom-tree: add support of path as argument

 scripts/qmp/qom-fuse |   13 ++++++++++++-
 scripts/qmp/qom-get  |   12 +++++++++++-
 scripts/qmp/qom-list |   12 +++++++++++-
 scripts/qmp/qom-set  |   12 +++++++++++-
 scripts/qmp/qom-tree |   21 ++++++++++++++++++---
 5 files changed, 63 insertions(+), 7 deletions(-)

-- 
1.7.4.1


