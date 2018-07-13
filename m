Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fdt3B-0004L0-Lo
	for mharc-qemu-trivial@gnu.org; Fri, 13 Jul 2018 04:03:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1fdt39-0004JD-7O
	for qemu-trivial@nongnu.org; Fri, 13 Jul 2018 04:03:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1fdt38-0002By-HI
	for qemu-trivial@nongnu.org; Fri, 13 Jul 2018 04:03:35 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41540 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1fdt2z-0001s0-Hc; Fri, 13 Jul 2018 04:03:25 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F32DA81663EE;
	Fri, 13 Jul 2018 08:03:24 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-82.ams2.redhat.com
	[10.36.116.82])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD0791C703;
	Fri, 13 Jul 2018 08:03:23 +0000 (UTC)
Date: Fri, 13 Jul 2018 10:03:22 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Max Reitz <mreitz@redhat.com>, Jeff Cody <jcody@redhat.com>,
	qemu-block@nongnu.org
Message-ID: <20180713080322.GC3896@localhost.localdomain>
References: <20180712195120.27394-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180712195120.27394-1-sw@weilnetz.de>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 13 Jul 2018 08:03:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 13 Jul 2018 08:03:25 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kwolf@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] block: Fix typos in comments (found by
 codespell)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2018 08:03:36 -0000

Am 12.07.2018 um 21:51 hat Stefan Weil geschrieben:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Thanks, applied to the block branch.

Kevin

