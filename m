Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ymkvi-0006Oj-Qz
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 11:26:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Ymkvb-0006Bi-LM
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 11:26:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1YmkvX-0006NJ-KL
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 11:26:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34659)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1YmkvM-0006LI-Ur; Mon, 27 Apr 2015 11:26:21 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 61CC8C40AE;
	Mon, 27 Apr 2015 15:26:20 +0000 (UTC)
Received: from noname.str.redhat.com (dhcp-192-197.str.redhat.com
	[10.33.192.197])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t3RFQIYk031715; Mon, 27 Apr 2015 11:26:18 -0400
Date: Mon, 27 Apr 2015 17:26:18 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150427152618.GG4046@noname.str.redhat.com>
References: <1430135516-32438-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1430135516-32438-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>,
	qemu-devel@nongnu.org, Peter Wu <peter@lekensteyn.nl>
Subject: Re: [Qemu-trivial] [PATCH v2] block/dmg: make it modular
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
X-List-Received-Date: Mon, 27 Apr 2015 15:26:40 -0000

Am 27.04.2015 um 13:51 hat Michael Tokarev geschrieben:
> dmg can optionally utilize libbz2, make it modular
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Thanks, applied to the block branch.

Kevin

