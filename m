Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjUYV-00073e-4r
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 09:12:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1UjUYJ-0006kW-49
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 09:12:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1UjUYC-0002XD-OX
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 09:11:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:18133)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1UjUXw-0002Uc-7z; Mon, 03 Jun 2013 09:11:36 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r53DBYc2001052
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 3 Jun 2013 09:11:34 -0400
Received: from localhost (ovpn-112-30.ams2.redhat.com [10.36.112.30])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r53DBWMV019908; Mon, 3 Jun 2013 09:11:33 -0400
Date: Mon, 3 Jun 2013 15:11:32 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20130603131132.GA29131@stefanha-thinkpad.redhat.com>
References: <1370249911-19708-1-git-send-email-stefanha@redhat.com>
	<1370249911-19708-3-git-send-email-stefanha@redhat.com>
	<51AC8B6E.9040002@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51AC8B6E.9040002@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Cam Macdonell <cam@cs.ualberta.ca>, qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 2/2] ivshmem: add missing error exit(2)
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
X-List-Received-Date: Mon, 03 Jun 2013 13:12:09 -0000

On Mon, Jun 03, 2013 at 06:26:22AM -0600, Eric Blake wrote:
> On 06/03/2013 02:58 AM, Stefan Hajnoczi wrote:
> > If the user fails to specify 'chardev' or 'shm' then we cannot continue.
> > Exit right away so that we don't invoke shm_open(3) with a NULL pointer.
> > 
> > It would be nice to replace exit(1) with error returns in the PCI device
> > .init() function, but leave that for another patch since exit(1) is
> > currently used elsewhere.
> > 
> > Spotted by Coverity.
> > 
> > Cc: Cam Macdonell <cam@cs.ualberta.ca>
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  hw/misc/ivshmem.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> > index a19a6d6..5658f73 100644
> > --- a/hw/misc/ivshmem.c
> > +++ b/hw/misc/ivshmem.c
> > @@ -735,6 +735,7 @@ static int pci_ivshmem_init(PCIDevice *dev)
> >  
> >          if (s->shmobj == NULL) {
> >              fprintf(stderr, "Must specify 'chardev' or 'shm' to ivshmem\n");
> > +            exit(1);
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> However, I prefer exit(EXIT_FAILURE) rather than exit(1), to make it a
> bit easier to grep for known failure exits.  Libvirt has a syntax
> checker (taken from gnulib) that enforces such a style, if qemu would
> like to adopt that style.

I like EXIT_FAILURE too but the rest of the file inconsistently uses
exit(1) and exit(-1).  I decided exit(1) was the least evil but the
longer term fix is to return instead of exiting.

