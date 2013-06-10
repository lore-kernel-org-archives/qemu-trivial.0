Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ulz01-0003tK-Eo
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 06:06:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1Ulyzy-0003ss-1M
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 06:06:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1Ulyzw-0006y9-VX
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 06:06:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:2039)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1Ulyzw-0006xk-Ov; Mon, 10 Jun 2013 06:06:48 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5AA6ln4016133
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Jun 2013 06:06:47 -0400
Received: from choo.home.annexia.org (vpn1-6-48.ams2.redhat.com [10.36.6.48])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with
	ESMTP id r5AA6jhb014101; Mon, 10 Jun 2013 06:06:46 -0400
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-trivial@nongnu.org
Date: Mon, 10 Jun 2013 11:06:35 +0100
Message-Id: <1370858796-16217-1-git-send-email-rjones@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH] block/curl.c: Refuse to open the handle for
	writes.
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
X-List-Received-Date: Mon, 10 Jun 2013 10:06:52 -0000

This simple patch avoids a segfault in qemu if the user tries to open
a curl disk for writing.

This was previously part of Fam Zheng's curl patch series, but it
stands alone and we shouldn't forget about it.

Rich.


