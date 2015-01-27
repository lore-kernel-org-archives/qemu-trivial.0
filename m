Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YG8mI-0007WH-4S
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jan 2015 11:14:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YG8mB-0007LX-GQ
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 11:14:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YG8mA-0002bq-PW
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 11:14:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50098)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YG8m4-0002bD-JU; Tue, 27 Jan 2015 11:13:56 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0RGDsms005108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 27 Jan 2015 11:13:55 -0500
Received: from blackfin.pond.sub.org (ovpn-116-17.ams2.redhat.com
	[10.36.116.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0RGDrOR000738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 27 Jan 2015 11:13:54 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 97033303F83B; Tue, 27 Jan 2015 17:13:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Jan 2015 17:13:49 +0100
Message-Id: <1422375232-29283-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 0/3] util/uri: Cleanups and a bug fix
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
X-List-Received-Date: Tue, 27 Jan 2015 16:14:09 -0000

Note: checkpatch is unhappy with the first patch, because I refrained
from cleaning up the ugly return(NULL).  They're all over the place.

Markus Armbruster (3):
  util/uri: uri_new() can't fail, drop dead error handling
  util/uri: realloc2n() can't fail, drop dead error handling
  util/uri: URI member path can be null, compare more carfully

 util/uri.c | 61 +++++++++++++------------------------------------------------
 1 file changed, 13 insertions(+), 48 deletions(-)

-- 
1.9.3


