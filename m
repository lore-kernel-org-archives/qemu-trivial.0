Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwFL8-0006zb-Pn
	for mharc-qemu-trivial@gnu.org; Tue, 10 Nov 2015 15:16:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZwFL5-0006vD-Rd
	for qemu-trivial@nongnu.org; Tue, 10 Nov 2015 15:16:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZwFL2-0005Fh-4y
	for qemu-trivial@nongnu.org; Tue, 10 Nov 2015 15:16:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60929)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZwFKx-0005Dw-TO; Tue, 10 Nov 2015 15:16:15 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 358FB3B70D;
	Tue, 10 Nov 2015 20:16:15 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-6-38.ams2.redhat.com [10.36.6.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAAKGBoo029221; Tue, 10 Nov 2015 15:16:12 -0500
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 10 Nov 2015 21:16:07 +0100
Message-Id: <1447186571-27672-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/4] Remove superfluous return statements
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
X-List-Received-Date: Tue, 10 Nov 2015 20:16:24 -0000

Some functions in QEMU have a "return;" statement at the
very end of a function with "void" return type, i.e. the
return statement is superfluous. This patch series removes
some of them.

Thomas Huth (4):
  hw/ide: Remove superfluous return statements
  hw/acpi: Remove superfluous return statement
  hw/s390x: Remove superfluous return statements
  hw/core/qdev: Remove superfluous return statement

 hw/acpi/memory_hotplug.c  |  1 -
 hw/core/qdev.c            |  1 -
 hw/ide/atapi.c            |  1 -
 hw/ide/macio.c            |  2 --
 hw/s390x/css.c            |  1 -
 hw/s390x/event-facility.c | 21 ++++++---------------
 hw/s390x/s390-pci-bus.c   |  4 ----
 7 files changed, 6 insertions(+), 25 deletions(-)

-- 
1.8.3.1


