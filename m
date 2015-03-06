Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YToGy-0000gq-NH
	for mharc-qemu-trivial@gnu.org; Fri, 06 Mar 2015 04:10:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YToGr-0000RC-QP
	for qemu-trivial@nongnu.org; Fri, 06 Mar 2015 04:10:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YToGo-0006iL-A0
	for qemu-trivial@nongnu.org; Fri, 06 Mar 2015 04:10:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YToGf-0006Ps-56; Fri, 06 Mar 2015 04:10:01 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t269A0lc025334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 6 Mar 2015 04:10:00 -0500
Received: from blackfin.pond.sub.org (ovpn-116-77.ams2.redhat.com
	[10.36.116.77])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2699wRQ010371
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 6 Mar 2015 04:10:00 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4E3FE303FEBB; Fri,  6 Mar 2015 10:09:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Mar 2015 10:09:56 +0100
Message-Id: <1425632998-616-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH 0/2] monitor: Fix and clean up around
	.user_print
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
X-List-Received-Date: Fri, 06 Mar 2015 09:10:18 -0000

A more thorough cleanup of the area is in the works, but I want to get
this out quickly, so it makes 2.3.

I think it can go via -trivial, if Luiz doesn't mind.

Markus Armbruster (2):
  hmp: Fix definition of command quit
  qmp: Drop unused .user_print from command definitions

 hmp-commands.hx | 1 -
 qmp-commands.hx | 4 ----
 2 files changed, 5 deletions(-)

-- 
1.9.3


