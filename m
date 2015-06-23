Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7Fa2-0001Ap-Jn
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 00:13:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1Z7Fa0-00018R-Br
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 00:13:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1Z7FZz-0002RO-Ic
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 00:13:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59489)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>)
	id 1Z7FZv-0002QY-A5; Tue, 23 Jun 2015 00:12:55 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 4DEA68F282;
	Tue, 23 Jun 2015 04:12:54 +0000 (UTC)
Received: from localhost (dhcp193-78.pnq.redhat.com [10.65.193.78])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5N4Cqw8028762; Tue, 23 Jun 2015 00:12:53 -0400
Date: Tue, 23 Jun 2015 09:42:51 +0530
From: Amit Shah <amit.shah@redhat.com>
To: arei.gonglei@huawei.com
Message-ID: <20150623041251.GA2058@grmbl.mre>
References: <1435021348-9156-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435021348-9156-1-git-send-email-arei.gonglei@huawei.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mrhines@us.ibm.com, qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, quintela@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] rdma: fix memory leak
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
X-List-Received-Date: Tue, 23 Jun 2015 04:13:01 -0000

On (Tue) 23 Jun 2015 [09:02:28], arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> Variable "r" going out of scope leaks the storage
> it points to in line 3268.

Interestingly Dave posted a different patch for the same issue.  I
prefer this approach.

Reviewed-by: Amit Shah <amit.shah@redhat.com>

		Amit

