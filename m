Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YSK6A-0001pf-AW
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2015 01:45:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1YSK67-0001oq-J0
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 01:45:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1YSK64-0002dx-Ce
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 01:44:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58731)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>)
	id 1YSK64-0002ds-4d; Mon, 02 Mar 2015 01:44:56 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t226ir1O024603
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 2 Mar 2015 01:44:53 -0500
Received: from localhost ([10.3.113.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t226ips1018449; Mon, 2 Mar 2015 01:44:52 -0500
Date: Mon, 2 Mar 2015 12:14:41 +0530
From: Amit Shah <amit.shah@redhat.com>
To: Thomas Huth <thuth@linux.vnet.ibm.com>
Message-ID: <20150302064441.GM26196@grmbl.mre>
References: <1424365943-27563-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1424365943-27563-2-git-send-email-thuth@linux.vnet.ibm.com>
	<20150224092829.GA26558@grmbl.mre>
	<20150224172836.5aa5290f@oc7435384737.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150224172836.5aa5290f@oc7435384737.ibm.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Mon, 02 Mar 2015 06:45:00 -0000

On (Tue) 24 Feb 2015 [17:28:36], Thomas Huth wrote:
> On Tue, 24 Feb 2015 14:58:29 +0530
> Amit Shah <amit.shah@redhat.com> wrote:
> 
> > On (Thu) 19 Feb 2015 [18:12:19], Thomas Huth wrote:
> > > dup_mig_bytes_transferred(), skipped_mig_bytes_transferred(),
> > > migrate_rdma_pin_all(), qsb_clone() and qsb_set_length()
> > > are completely unused and thus can be deleted.
> > > 
> > > Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
> > > Cc: Juan Quintela <quintela@redhat.com>
> > > Cc: Amit Shah <amit.shah@redhat.com>
> > > ---
> > >  arch_init.c                   |   10 -------
> > >  include/migration/migration.h |    3 --
> > >  include/migration/qemu-file.h |    2 -
> > >  migration/migration.c         |    9 -------
> > >  migration/qemu-file-buf.c     |   53 -----------------------------------------
> > >  5 files changed, 0 insertions(+), 77 deletions(-)
> > > 
> > > diff --git a/arch_init.c b/arch_init.c
> > > index 89c8fa4..ad5ce28 100644
> > > --- a/arch_init.c
> > > +++ b/arch_init.c
> > > @@ -249,21 +249,11 @@ static void acct_clear(void)
> > >      memset(&acct_info, 0, sizeof(acct_info));
> > >  }
> > >  
> > > -uint64_t dup_mig_bytes_transferred(void)
> > > -{
> > > -    return acct_info.dup_pages * TARGET_PAGE_SIZE;
> > > -}
> > > -
> > >  uint64_t dup_mig_pages_transferred(void)
> > >  {
> > >      return acct_info.dup_pages;
> > >  }
> > >  
> > > -uint64_t skipped_mig_bytes_transferred(void)
> > > -{
> > > -    return acct_info.skipped_pages * TARGET_PAGE_SIZE;
> > > -}
> > 
> > These could be used for reporting; Juan, any idea why these aren't
> > used?
> 
> Since they are very trivial, I think they could easily be re-added
> again in case they are needed again in the future.
> Or if you prefer, I can also rework my patch so that these two
> functions won't get deleted.

I'm just asking Juan if he knows why these are around; I don't mind if
we get rid of them, but good to get confirmation from Juan (else we
needlessly end up churning code).

		Amit

