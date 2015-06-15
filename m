Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z4Tcj-0003Ut-9U
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jun 2015 08:36:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z4Tcf-0003PO-GY
	for qemu-trivial@nongnu.org; Mon, 15 Jun 2015 08:36:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z4Tcd-0002Wh-25
	for qemu-trivial@nongnu.org; Mon, 15 Jun 2015 08:36:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60482)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Z4TcR-0002Sn-5Q; Mon, 15 Jun 2015 08:36:03 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id E611B345B51;
	Mon, 15 Jun 2015 12:36:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5FCa0lF007552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 15 Jun 2015 08:36:01 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A79083042B83; Mon, 15 Jun 2015 14:35:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jun 2015 14:35:57 +0200
Message-Id: <1434371759-29592-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 0/2] qemu-options: Minor doc improvements
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
X-List-Received-Date: Mon, 15 Jun 2015 12:36:18 -0000

Markus Armbruster (2):
  qemu-options: Improve -global documentation
  qemu-options: Use @itemx where appropriate

 qemu-options.hx | 57 +++++++++++++++++++++++++++++----------------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

-- 
1.9.3


