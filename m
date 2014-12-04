Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XwWxT-0002AF-Gs
	for mharc-qemu-trivial@gnu.org; Thu, 04 Dec 2014 09:00:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XwWxH-0001yk-FM
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 09:00:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XwWxB-0001Yl-3N
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 09:00:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XwWww-00019x-9f; Thu, 04 Dec 2014 09:00:06 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB4E0549023329
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 4 Dec 2014 09:00:05 -0500
Received: from blackfin.pond.sub.org (ovpn-116-62.ams2.redhat.com
	[10.36.116.62])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB4E04Za020402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 4 Dec 2014 09:00:05 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 81A8C303FEB1; Thu,  4 Dec 2014 15:00:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Dec 2014 15:00:00 +0100
Message-Id: <1417701603-26388-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 0/3] util: Trivial cleanups around g_malloc()
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
X-List-Received-Date: Thu, 04 Dec 2014 14:00:34 -0000

Markus Armbruster (3):
  util: Drop superfluous conditionals around g_free()
  Fuse g_malloc(); memset() into g_new0()
  util: Use g_new() & friends where that makes obvious sense

 util/hbitmap.c |  4 ++--
 util/iov.c     |  4 ++--
 util/uri.c     | 51 +++++++++++++++++++++++----------------------------
 3 files changed, 27 insertions(+), 32 deletions(-)

-- 
1.9.3


