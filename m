Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TyfdS-0002ej-OP
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2013 04:31:46 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1TyfdI-00027p-8E
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 04:31:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1TyfdA-0003db-3m
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 04:31:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1Tyfct-0003ZW-5L; Fri, 25 Jan 2013 04:31:11 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0P9V8A1011441
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 25 Jan 2013 04:31:09 -0500
Received: from localhost (ovpn-112-29.ams2.redhat.com [10.36.112.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0P9V7L1025519; Fri, 25 Jan 2013 04:31:08 -0500
Date: Fri, 25 Jan 2013 10:31:06 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vishvananda Ishaya <vishvananda@gmail.com>
Message-ID: <20130125093106.GC14204@stefanha-thinkpad.redhat.com>
References: <1359050440-52511-1-git-send-email-vishvananda@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1359050440-52511-1-git-send-email-vishvananda@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] block: Create proper size file for disk
	mirror
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
X-List-Received-Date: Fri, 25 Jan 2013 09:31:45 -0000

On Thu, Jan 24, 2013 at 10:00:40AM -0800, Vishvananda Ishaya wrote:
> The qmp monitor command to mirror a disk was passing -1 for size
> along with the disk's backing file. This size of the resulting disk
> is the size of the backing file, which is incorrect if the disk
> has been resized. Therefore we should always pass in the size of
> the current disk.
> 
> Signed-off-by: Vishvananda Ishaya <vishvananda@gmail.com>
> ---
> Fixes https://bugs.launchpad.net/qemu/+bug/1103903
> 
>  blockdev.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Also CCed Paolo Bonzini who wrote the code.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

