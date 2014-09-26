Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXXKf-0002G9-5G
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 11:21:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XXXKZ-00025Z-GP
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 11:21:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XXXKU-0007T1-Na
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 11:21:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16336)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XXXKH-0007QA-46; Fri, 26 Sep 2014 11:20:53 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8QFKbHw002855
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 26 Sep 2014 11:20:38 -0400
Received: from red.redhat.com (ovpn-113-28.phx2.redhat.com [10.3.113.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8QFKbGb028824; Fri, 26 Sep 2014 11:20:37 -0400
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Sep 2014 09:20:30 -0600
Message-Id: <1411744833-20699-1-git-send-email-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, wenchaoqemu@gmail.com
Subject: [Qemu-trivial] [PATCH v5a 0/3] trivial qapi cleanups
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
X-List-Received-Date: Fri, 26 Sep 2014 15:21:16 -0000

This is split out from [PATCH v4 00/19]: drop qapi nested structs
in order to get the trivial stuff in now, rather than holding it
up for what may be another month while I address the larger findings
against the rest of that series.

v4 was here:
https://lists.gnu.org/archive/html/qemu-devel/2014-09/msg04022.html

Changelog:

v5:
  no change (just splitting the series into two parts)

v4:
  add docs (patch 3 is new) [Markus]

v3:
  no changes

v2:
  add makefile cleanups (patch 1-2)

v1:
  this portion of the larger series was not present

Eric Blake (3):
  qapi: Consistent whitespace in tests/Makefile
  qapi: Ignore files created during make check
  qapi: Update docs given recent event, spacing fixes

 docs/qapi-code-gen.txt | 100 +++++++++++++++++++++++++++++++++++++++----------
 tests/.gitignore       |   3 ++
 tests/Makefile         |  32 ++++++++--------
 3 files changed, 99 insertions(+), 36 deletions(-)

-- 
1.9.3


