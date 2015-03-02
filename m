Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YSJNa-0003Dc-IT
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2015 00:58:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1YSJNY-0003Cx-T2
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 00:58:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1YSJNT-0006VK-TD
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 00:58:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49283)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>)
	id 1YSJNT-0006VE-LU; Mon, 02 Mar 2015 00:58:51 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t225wnQ4012560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 2 Mar 2015 00:58:49 -0500
Received: from localhost ([10.3.113.17])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t225wkTH002898; Mon, 2 Mar 2015 00:58:47 -0500
Date: Mon, 2 Mar 2015 11:28:35 +0530
From: Amit Shah <amit.shah@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20150302055835.GF26196@grmbl.mre>
References: <1425146983-16015-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425146983-16015-1-git-send-email-sw@weilnetz.de>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] migration: Fix 32 bit compiler errors
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
X-List-Received-Date: Mon, 02 Mar 2015 05:58:58 -0000

On (Sat) 28 Feb 2015 [19:09:40], Stefan Weil wrote:
> Obviously that code was never before compiled on 32 bit hosts.
> The RDMA API uses lots of uint64_t values and the code casts them
> to and from pointers.
> 
> I tried to fix the compilation but did not run any runtime tests.
> 
> I think the first two patches are trivial, but the third one might
> not be trivial, so please review it carefully.

Interestingly Juan found this out recently as well, and Dave was
taking a look.  CC'ing Dave.

Thanks,

		Amit

