Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XjTh6-0005IE-Q6
	for mharc-qemu-trivial@gnu.org; Wed, 29 Oct 2014 09:53:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1XjSqY-00076l-5J
	for qemu-trivial@nongnu.org; Wed, 29 Oct 2014 08:59:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1XjSqT-0000b0-Cf
	for qemu-trivial@nongnu.org; Wed, 29 Oct 2014 08:59:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59519)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>)
	id 1XjSqJ-0000ZP-Gn; Wed, 29 Oct 2014 08:59:15 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9TCx9C4024136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 29 Oct 2014 08:59:09 -0400
Received: from localhost (ovpn-113-75.phx2.redhat.com [10.3.113.75])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9TCx7vF025424; Wed, 29 Oct 2014 08:59:08 -0400
Date: Wed, 29 Oct 2014 18:29:04 +0530
From: Amit Shah <amit.shah@redhat.com>
To: arei.gonglei@huawei.com
Message-ID: <20141029125904.GC19598@grmbl.mre>
References: <1414586983-10816-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1414586983-10816-1-git-send-email-arei.gonglei@huawei.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Wed, 29 Oct 2014 09:53:47 -0400
Cc: qemu-trivial@nongnu.org, weidong.huang@huawei.com, qemu-devel@nongnu.org,
	quintela@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] vl.c: Fix Coverity complaining for
	vmstate_dump_file
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
X-List-Received-Date: Wed, 29 Oct 2014 12:59:35 -0000

On (Wed) 29 Oct 2014 [20:49:43], arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> commit abfd9ce3(migration: dump vmstate info as a json
> file for static analysis) introduce a new command,
> '-dump-vmstate', that takes a filename
> as an argument.  When executed, QEMU will dump the vmstate information
> for the machine type it's invoked with to the file, and quit.
> 
> Apparently, it supports one '-dump-vmstate' option,
> otherwise, the vmstate_dump_file will be overwritten.

Suggested re-wording of this para:

However, only one instance of the -dump-vmstate option is supported.
If more were given, the vmstate_dump_file could be overwritten.

> Of course, the resource will be freed when Qemu quit, but The code logic
> is not good, it will make Coverity complaining.

Suggested re-wording:

This fix also helps silence a Coverity error.

> Signed-off-by: Gonglei <arei.gonglei@huawei.com>

Reviewed-by: Amit Shah <amit.shah@redhat.com>

Thanks,

		Amit

