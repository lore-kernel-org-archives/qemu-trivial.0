Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um0R5-00010Y-Js
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 07:38:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1Um0R1-0000zO-RB
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 07:38:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1Um0R0-0003Ah-Ef
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 07:38:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38478)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1Um0R0-0003Aa-5Y; Mon, 10 Jun 2013 07:38:50 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5ABcn1s018621
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Jun 2013 07:38:49 -0400
Received: from choo.home.annexia.org (vpn1-6-48.ams2.redhat.com [10.36.6.48])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id r5ABcjVa030500; Mon, 10 Jun 2013 07:38:46 -0400
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-trivial@nongnu.org
Date: Mon, 10 Jun 2013 12:38:42 +0100
Message-Id: <1370864323-25679-1-git-send-email-rjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH v2] block/curl.c: Refuse to open the handle
	for writes.
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
X-List-Received-Date: Mon, 10 Jun 2013 11:38:53 -0000

v2:

- Use qerror_report to report an error.
- Return -EROFS instead of -ENOTSUP.


