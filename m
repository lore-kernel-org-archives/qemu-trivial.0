Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOTHB-0003v5-MM
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 10:39:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1WOTH4-0003gt-Fk
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 10:39:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1WOTGy-0007K8-IS
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 10:39:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:25861)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1WOTGy-0007Jr-AW; Fri, 14 Mar 2014 10:39:44 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2EEdfJH002804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 14 Mar 2014 10:39:42 -0400
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2EEdcFY018741; Fri, 14 Mar 2014 10:39:40 -0400
From: Laszlo Ersek <lersek@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>, Cole Robinson <crobinso@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 14 Mar 2014 15:39:35 +0100
Message-Id: <1394807976-9469-1-git-send-email-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [trivial PATCH 2.0 0/1] silence invalid cyrus-sasl
	warning on startup
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
X-List-Received-Date: Fri, 14 Mar 2014 14:39:56 -0000

Here's a patch that suits my mental capabilities on this
Friday afternoon.

Laszlo Ersek (1):
  sasl: Avoid 'Could not find keytab file' in syslog

 qemu.sasl | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
1.8.3.1


