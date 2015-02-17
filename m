Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNdJg-0007I3-IK
	for mharc-qemu-trivial@gnu.org; Tue, 17 Feb 2015 03:15:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNdJa-0007Du-4B
	for qemu-trivial@nongnu.org; Tue, 17 Feb 2015 03:15:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNdJL-00027M-23
	for qemu-trivial@nongnu.org; Tue, 17 Feb 2015 03:15:30 -0500
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:51198)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNdJK-000274-Q1
	for qemu-trivial@nongnu.org; Tue, 17 Feb 2015 03:15:14 -0500
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Tue, 17 Feb 2015 08:15:13 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 17 Feb 2015 08:15:12 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6C0CF1B08069; 
	Tue, 17 Feb 2015 08:15:23 +0000 (GMT)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t1H8FBeh64159886; Tue, 17 Feb 2015 08:15:11 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t1H8FAib009841; Tue, 17 Feb 2015 01:15:10 -0700
Received: from oc7435384737.ibm.com (dyn-9-152-224-69.boeblingen.de.ibm.com
	[9.152.224.69])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t1H8F6Qm009659; Tue, 17 Feb 2015 01:15:07 -0700
Date: Tue, 17 Feb 2015 09:15:05 +0100
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20150217091505.0db4fab0@oc7435384737.ibm.com>
In-Reply-To: <54E26EB0.70308@redhat.com>
References: <1424122891-9390-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1424122891-9390-5-git-send-email-thuth@linux.vnet.ibm.com>
	<54E26EB0.70308@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.23; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 15021708-0009-0000-0000-0000032B7E6C
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.108
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/4] block: Remove unused
	functions
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
X-List-Received-Date: Tue, 17 Feb 2015 08:15:35 -0000


 Hi Max,

On Mon, 16 Feb 2015 17:26:56 -0500
Max Reitz <mreitz@redhat.com> wrote:

> On 2015-02-16 at 16:41, Thomas Huth wrote:
> > qemu_try_blockalign0() and nbd_export_close_all() are not
> > used anymore and thus can be removed.
> >
> > Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
> > Cc: Kevin Wolf <kwolf@redhat.com>
> > Cc: Stefan Hajnoczi <stefanha@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >   block.c               |   11 -----------
> >   include/block/block.h |    1 -
> >   include/block/nbd.h   |    1 -
> >   nbd.c                 |    9 ---------
> >   4 files changed, 0 insertions(+), 22 deletions(-)
> 
> NACK, I'm using nbd_export_close_all() in my "block: Rework 
> bdrv_close_all()" series.

Alright, if it's going to be used again, then it must not be removed,
of course.

> I'm not so sure about qemu_try_blockalign0(); it has never been used, 
> but I introduced it because we have qemu_blockalign(), 
> qemu_try_blockalign(), and qemu_blockalign0() (the latter of which I 
> introduced along with qemu_try_blockalign0(), and this function is used).
> 
> So I'd be fine with removing qemu_try_blockalign0() again, but I don't 
> really see the point in doing so. It is not a function that is per-se 
> deprecated or something, quite the opposite, actually. If people can 
> make use of that function, they should most certainly do so.

I'm not a big fan of providing unused (and likely untested) functions
just because they could be used somewhen in a distant future (unless
they are part of a proper library) ... I'd rather add such functions
again when they are really being used.

Anyway, this is just a small, trivial function, and if you prefer to
keep it, then please ignore this patch simply completely. There is
certainly no urgent need for removing unused functions, I just wanted
to make people aware that there are some.

 Thomas


