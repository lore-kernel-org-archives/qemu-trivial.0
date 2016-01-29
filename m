Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPAAr-00032R-PK
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jan 2016 09:37:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1aPAAq-00032H-7d
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 09:37:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1aPAAl-0006QW-9F
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 09:37:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58277)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1aPAAl-0006QO-3z
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 09:37:15 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 48AB58DFED;
	Fri, 29 Jan 2016 14:37:14 +0000 (UTC)
Received: from localhost (ovpn-113-102.phx2.redhat.com [10.3.113.102])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0TEbDl5015895; Fri, 29 Jan 2016 09:37:13 -0500
Date: Fri, 29 Jan 2016 15:37:12 +0100
From: Amit Shah <amit.shah@redhat.com>
To: Wei Yang <richard.weiyang@gmail.com>
Message-ID: <20160129143712.GF20428@grmbl.mre>
References: <1453644598-11250-1-git-send-email-richard.weiyang@gmail.com>
	<20160129140326.GA4544@vultr.guest>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160129140326.GA4544@vultr.guest>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, quintela@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] rdma: remove check on time_spent
	when calculating mbs
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
X-List-Received-Date: Fri, 29 Jan 2016 14:37:21 -0000

On (Fri) 29 Jan 2016 [14:03:26], Wei Yang wrote:
> Someone like these two patches? :)

Could you please post these to qemu-devel as well?

Thanks,

		Amit

