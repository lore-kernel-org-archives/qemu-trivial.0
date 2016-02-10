Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTTl0-00011Y-Um
	for mharc-qemu-trivial@gnu.org; Wed, 10 Feb 2016 07:20:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1aTTkr-0000qE-6X
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 07:20:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1aTTko-0005rn-Ec
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 07:20:21 -0500
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:48783)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1aTTko-0005q0-4r
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 07:20:18 -0500
Received: from localhost
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Wed, 10 Feb 2016 12:20:15 -0000
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp17.uk.ibm.com (192.168.101.147) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 10 Feb 2016 12:20:13 -0000
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: cornelia.huck@de.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b06cxnps4074.portsmouth.uk.ibm.com
	(d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id CF7852190023; 
	Wed, 10 Feb 2016 12:19:58 +0000 (GMT)
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com
	[9.149.37.248])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u1ACKCb263504546; Wed, 10 Feb 2016 12:20:12 GMT
Received: from d06av07.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u1ACKCPO027812; Wed, 10 Feb 2016 07:20:12 -0500
Received: from gondolin (dyn-9-152-224-197.boeblingen.de.ibm.com
	[9.152.224.197])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u1ACKCpY027800; Wed, 10 Feb 2016 07:20:12 -0500
Date: Wed, 10 Feb 2016 13:20:10 +0100
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20160210132010.41637f0a.cornelia.huck@de.ibm.com>
In-Reply-To: <1455102586-14523-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1455102586-14523-1-git-send-email-mjt@msgid.tls.msk.ru>
Organization: IBM Deutschland Research & Development GmbH Vorsitzende des
	Aufsichtsrats: Martina Koederitz
	=?UTF-8?B?R2VzY2jDpGZ0c2bDvGhydW5nOg==?=
	Dirk Wittkopp Sitz der Gesellschaft: =?UTF-8?B?QsO2Ymxpbmdlbg==?=
	Registergericht: Amtsgericht Stuttgart, HRB 243294
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; i686-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021012-0005-0000-0000-00000A4E919A
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.113
Cc: qemu-trivial@nongnu.org, Pierre Morel <pmorel@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] s390x: remove
	s390-zipl.rom
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
X-List-Received-Date: Wed, 10 Feb 2016 12:20:27 -0000

On Wed, 10 Feb 2016 14:09:46 +0300
Michael Tokarev <mjt@tls.msk.ru> wrote:

> This is an s390 boot rom which was used in s390-virtio machine.
> but since commit 3538fb6f89dd9bb2e7e59de2bfad52a45321c744
> "s390x: remove s390-virtio machine", this file isn't used.
> The only place it is referenced in the code is an unused
> define ZIPL_FIRMWARE.  There's also comment in hw/s390/ipl.c
> which I'm modifying too, to refer to s390-ccw.rom instead.
> 
> Cc: Pierre Morel <pmorel@linux.vnet.ibm.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> --
> v2: fix commit comment, restoring line which
>     has been eaten by git.
> ---
>  Makefile               |   1 -
>  hw/s390x/ipl.c         |   2 +-
>  hw/s390x/s390-virtio.c |   1 -
>  pc-bios/README         |   4 ----
>  pc-bios/s390-zipl.rom  | Bin 3304 -> 0 bytes
>  5 files changed, 1 insertion(+), 7 deletions(-)
>  delete mode 100644 pc-bios/s390-zipl.rom

Acked-by: Cornelia Huck <cornelia.huck@de.ibm.com>


