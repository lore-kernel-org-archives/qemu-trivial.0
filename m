Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQILp-0000rj-Ra
	for mharc-qemu-trivial@gnu.org; Tue, 24 Feb 2015 11:28:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YQILn-0000mm-N0
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 11:28:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YQILk-0000OM-Ey
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 11:28:47 -0500
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:47532)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YQILk-0000OB-5u
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 11:28:44 -0500
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Tue, 24 Feb 2015 16:28:42 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp17.uk.ibm.com (192.168.101.147) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 24 Feb 2015 16:28:40 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5398C1B08061; 
	Tue, 24 Feb 2015 16:28:54 +0000 (GMT)
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com
	[9.149.37.248])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t1OGSdIO65208410; Tue, 24 Feb 2015 16:28:39 GMT
Received: from d06av07.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t1OGSdvZ017432; Tue, 24 Feb 2015 11:28:39 -0500
Received: from oc7435384737.ibm.com (sig-9-81-188-148.evts.de.ibm.com
	[9.81.188.148])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t1OGScWM017397; Tue, 24 Feb 2015 11:28:38 -0500
Date: Tue, 24 Feb 2015 17:28:36 +0100
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: Amit Shah <amit.shah@redhat.com>
Message-ID: <20150224172836.5aa5290f@oc7435384737.ibm.com>
In-Reply-To: <20150224092829.GA26558@grmbl.mre>
References: <1424365943-27563-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1424365943-27563-2-git-send-email-thuth@linux.vnet.ibm.com>
	<20150224092829.GA26558@grmbl.mre>
Organization: IBM
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.23; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15022416-0029-0000-0000-0000037E4C63
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.113
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/5] migration: Remove
	unused functions
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
X-List-Received-Date: Tue, 24 Feb 2015 16:28:49 -0000

On Tue, 24 Feb 2015 14:58:29 +0530
Amit Shah <amit.shah@redhat.com> wrote:

> On (Thu) 19 Feb 2015 [18:12:19], Thomas Huth wrote:
> > dup_mig_bytes_transferred(), skipped_mig_bytes_transferred(),
> > migrate_rdma_pin_all(), qsb_clone() and qsb_set_length()
> > are completely unused and thus can be deleted.
> > 
> > Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
> > Cc: Juan Quintela <quintela@redhat.com>
> > Cc: Amit Shah <amit.shah@redhat.com>
> > ---
> >  arch_init.c                   |   10 -------
> >  include/migration/migration.h |    3 --
> >  include/migration/qemu-file.h |    2 -
> >  migration/migration.c         |    9 -------
> >  migration/qemu-file-buf.c     |   53 -----------------------------------------
> >  5 files changed, 0 insertions(+), 77 deletions(-)
> > 
> > diff --git a/arch_init.c b/arch_init.c
> > index 89c8fa4..ad5ce28 100644
> > --- a/arch_init.c
> > +++ b/arch_init.c
> > @@ -249,21 +249,11 @@ static void acct_clear(void)
> >      memset(&acct_info, 0, sizeof(acct_info));
> >  }
> >  
> > -uint64_t dup_mig_bytes_transferred(void)
> > -{
> > -    return acct_info.dup_pages * TARGET_PAGE_SIZE;
> > -}
> > -
> >  uint64_t dup_mig_pages_transferred(void)
> >  {
> >      return acct_info.dup_pages;
> >  }
> >  
> > -uint64_t skipped_mig_bytes_transferred(void)
> > -{
> > -    return acct_info.skipped_pages * TARGET_PAGE_SIZE;
> > -}
> 
> These could be used for reporting; Juan, any idea why these aren't
> used?

Since they are very trivial, I think they could easily be re-added
again in case they are needed again in the future.
Or if you prefer, I can also rework my patch so that these two
functions won't get deleted.

 Thomas


