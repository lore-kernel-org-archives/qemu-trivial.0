Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aWQDy-0003aR-S1
	for mharc-qemu-trivial@gnu.org; Thu, 18 Feb 2016 10:10:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aWQDt-0003Y0-Dd
	for qemu-trivial@nongnu.org; Thu, 18 Feb 2016 10:10:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aWQDo-00007W-U1
	for qemu-trivial@nongnu.org; Thu, 18 Feb 2016 10:10:29 -0500
Received: from e06smtp09.uk.ibm.com ([195.75.94.105]:42805)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aWQDo-00006h-Jn
	for qemu-trivial@nongnu.org; Thu, 18 Feb 2016 10:10:24 -0500
Received: from localhost
	by e06smtp09.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Thu, 18 Feb 2016 15:10:22 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp09.uk.ibm.com (192.168.101.139) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 18 Feb 2016 15:10:19 -0000
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: gkurz@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org; qemu-ppc@nongnu.org;
	qemu-trivial@nongnu.org
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id C05DD17D8059; 
	Thu, 18 Feb 2016 15:10:37 +0000 (GMT)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u1IFAIlm5112254; Thu, 18 Feb 2016 15:10:19 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u1IFAIok012678; Thu, 18 Feb 2016 08:10:18 -0700
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u1IFAIFb012668; Thu, 18 Feb 2016 08:10:18 -0700
Received: from bahia.huguette.org (sig-9-79-65-117.de.ibm.com [9.79.65.117])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 8FD5422010B;
	Thu, 18 Feb 2016 16:10:17 +0100 (CET)
Date: Thu, 18 Feb 2016 16:10:15 +0100
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20160218161015.7dd8a833@bahia.huguette.org>
In-Reply-To: <87povuawo2.fsf@blackfin.pond.sub.org>
References: <20160218144045.7349.67293.stgit@bahia.huguette.org>
	<87povuawo2.fsf@blackfin.pond.sub.org>
Organization: IBM
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.29; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021815-0037-0000-0000-000005AA9361
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.105
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] spapr: initialize local
	Error pointer
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
X-List-Received-Date: Thu, 18 Feb 2016 15:10:31 -0000

On Thu, 18 Feb 2016 16:02:53 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Greg Kurz <gkurz@linux.vnet.ibm.com> writes:
> 
> > This fixes a crash in the target QEMU during migration.
> >
> > Fixes: c5f54f3e31bf693f70a98d4d73ea5dbe05689857  
> 
> Suggest to word that as "Broken in commit c5f54f3."
> 

This is more explicit indeed. I'll do that for future
patches.

Thanks !

> > Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
> > ---
> >  hw/ppc/spapr.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index e214a34257b3..c119f5582429 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -1528,7 +1528,7 @@ static int htab_load(QEMUFile *f, void *opaque, int version_id)
> >      section_hdr = qemu_get_be32(f);
> >  
> >      if (section_hdr) {
> > -        Error *local_err;
> > +        Error *local_err = NULL;
> >  
> >          /* First section gives the htab size */
> >          spapr_reallocate_hpt(spapr, section_hdr, &local_err);  
> 
> Easy mistake to make (I've made it myself).  I wish I had the time to
> figure out how to make Coccinelle catch it.
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 


