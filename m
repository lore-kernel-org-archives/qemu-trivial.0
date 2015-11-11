Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwTWe-0002kG-I6
	for mharc-qemu-trivial@gnu.org; Wed, 11 Nov 2015 06:25:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1ZwTWb-0002iv-9T
	for qemu-trivial@nongnu.org; Wed, 11 Nov 2015 06:25:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1ZwTWY-0000H3-4Q
	for qemu-trivial@nongnu.org; Wed, 11 Nov 2015 06:25:13 -0500
Received: from e06smtp11.uk.ibm.com ([195.75.94.107]:47321)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1ZwTWX-0000G6-Re
	for qemu-trivial@nongnu.org; Wed, 11 Nov 2015 06:25:10 -0500
Received: from localhost
	by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Wed, 11 Nov 2015 11:25:07 -0000
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 11 Nov 2015 11:25:05 -0000
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: cornelia.huck@de.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id B98002190046; 
	Wed, 11 Nov 2015 11:25:00 +0000 (GMT)
Received: from d06av05.portsmouth.uk.ibm.com (d06av05.portsmouth.uk.ibm.com
	[9.149.37.229])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id tABBP5qr8258008; Wed, 11 Nov 2015 11:25:05 GMT
Received: from d06av05.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id tABBP4OF026402; Wed, 11 Nov 2015 04:25:04 -0700
Received: from gondolin (dyn-9-152-224-100.boeblingen.de.ibm.com
	[9.152.224.100])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id tABBP4AK026393; Wed, 11 Nov 2015 04:25:04 -0700
Date: Wed, 11 Nov 2015 12:25:03 +0100
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20151111122503.1e445227.cornelia.huck@de.ibm.com>
In-Reply-To: <1447186571-27672-4-git-send-email-thuth@redhat.com>
References: <1447186571-27672-1-git-send-email-thuth@redhat.com>
	<1447186571-27672-4-git-send-email-thuth@redhat.com>
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
x-cbid: 15111111-0041-0000-0000-0000067E22CF
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.107
Cc: qemu-trivial@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
	Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [PATCH 3/4] hw/s390x: Remove superfluous return
	statements
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
X-List-Received-Date: Wed, 11 Nov 2015 11:25:14 -0000

On Tue, 10 Nov 2015 21:16:10 +0100
Thomas Huth <thuth@redhat.com> wrote:

> The "return;" statements at the end of functions do not make
> much sense, so let's remove them.
> 
> Cc: Cornelia Huck <cornelia.huck@de.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Alexander Graf <agraf@suse.de>
> Cc: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/s390x/css.c            |  1 -
>  hw/s390x/event-facility.c | 21 ++++++---------------
>  hw/s390x/s390-pci-bus.c   |  4 ----
>  3 files changed, 6 insertions(+), 20 deletions(-)
> 

Ack for the css and pci parts.

The sclp parts, however, switch from "one point of exit" to "immediate
exit", and I'm not sure I like that; not sure enough anyway to apply
this patch.


