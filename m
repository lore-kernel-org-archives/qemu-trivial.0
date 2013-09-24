Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VONIJ-0008De-7t
	for mharc-qemu-trivial@gnu.org; Tue, 24 Sep 2013 03:44:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VONIB-0007z2-7h
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 03:44:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VONI5-0002PI-8a
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 03:44:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26024)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1VONHd-0002J5-F3; Tue, 24 Sep 2013 03:43:45 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8O7hhhX018000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 24 Sep 2013 03:43:43 -0400
Received: from blackfin.pond.sub.org (ovpn-116-38.ams2.redhat.com
	[10.36.116.38])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8O7heEQ012505
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 Sep 2013 03:43:42 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4BB48200C0; Tue, 24 Sep 2013 09:43:40 +0200 (CEST)
From: armbru@redhat.com
To: qemu-devel@nongnu.org
Date: Tue, 24 Sep 2013 09:43:38 +0200
Message-Id: <1380008620-13796-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, lersek@redhat.com, afaerber@suse.de,
	anthony@codemonkey.ws, qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PATCH v3 0/2] tests: Fixes for in-tree build
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
X-List-Received-Date: Tue, 24 Sep 2013 07:44:25 -0000

From: Markus Armbruster <armbru@redhat.com>

Hasn't gotten maintainer attention for two months.  Retrying via
qemu-trivial.

v3: Trivially rebased
v2: Nominate for qemu-stable (Andreas)

Markus Armbruster (2):
  tests: Fix schema parser test for in-tree build
  tests: Update .gitignore for test-int128 and test-bitops

 tests/.gitignore | 3 +++
 tests/Makefile   | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

-- 
1.8.1.4


