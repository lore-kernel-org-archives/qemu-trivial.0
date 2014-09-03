Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XPK49-0007mf-OX
	for mharc-qemu-trivial@gnu.org; Wed, 03 Sep 2014 19:34:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>) id 1XPK41-0007b8-JM
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 19:34:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>) id 1XPK3v-0003zi-Dm
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 19:34:09 -0400
Received: from smtp02.citrix.com ([66.165.176.63]:37163)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>)
	id 1XPK3i-0003yp-Sj; Wed, 03 Sep 2014 19:33:50 -0400
X-IronPort-AV: E=Sophos;i="5.04,461,1406592000"; d="scan'208";a="168906130"
Received: from ukmail1.uk.xensource.com (10.80.16.128) by smtprelay.citrix.com
	(10.13.107.79) with Microsoft SMTP Server id 14.3.181.6;
	Wed, 3 Sep 2014 19:33:48 -0400
Received: from kaball.uk.xensource.com ([10.80.2.59])	by
	ukmail1.uk.xensource.com with esmtp (Exim 4.69)	(envelope-from
	<stefano.stabellini@eu.citrix.com>)	id 1XPK3g-0005j0-OX;
	Thu, 04 Sep 2014 00:33:48 +0100
Date: Thu, 4 Sep 2014 00:32:09 +0100
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball.uk.xensource.com
To: Chen Gang <gang.chen.5i5j@gmail.com>
In-Reply-To: <54066F78.7040101@gmail.com>
Message-ID: <alpine.DEB.2.02.1409040024100.18866@kaball.uk.xensource.com>
References: <5405EED9.2090701@gmail.com> <54066F78.7040101@gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-DLP: MIA2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.63
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, xen-devel@lists.xensource.com,
	qemu-devel <qemu-devel@nongnu.org>, stefano.stabellini@eu.citrix.com
Subject: Re: [Qemu-trivial] [PATCH] xen-hvm.c: Improve the return method for
 xen_hvm_init()
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
X-List-Received-Date: Wed, 03 Sep 2014 23:34:16 -0000

On Wed, 3 Sep 2014, Chen Gang wrote:
> Oh, sorry, forgot Cc to qemu trivial.
> 
> Thanks.
> On 9/3/14 0:22, Chen Gang wrote:
> > When failure occurs, it need use "return -1" instead of exit(1), so can
> > let upper caller has chance to print failure information, too, then user
> > can know the failure result more clearly.

good point


> > xen_hvm_init() may also return -errno, which may let upper caller think
> > more (e.g. free some other related resources and try again), although at
> > present, all related upper callers still exit(1).

I think we should return -1 in the other cases too


> > It is not a normal function which does not release related resources, if
> > return -1. So need give the related comments for it.
> > 
> > It passes common test under fedora 20 x86_64:
> > 
> >   "./configure --enable-xen && make -j4 && make check"
> >   execute result: "echo $? == 0".
> > 
> > Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> > ---
> >  xen-hvm.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen-hvm.c b/xen-hvm.c
> > index 0d09940..35efec0 100644
> > --- a/xen-hvm.c
> > +++ b/xen-hvm.c
> > @@ -978,6 +978,7 @@ static void xen_wakeup_notifier(Notifier *notifier, void *data)
> >      xc_set_hvm_param(xen_xc, xen_domid, HVM_PARAM_ACPI_S_STATE, 0);
> >  }
> >  
> > +/* return value:  0 is OK, -errno is failure, -1 is critical issue -- exit(1) */
> >  int xen_hvm_init(ram_addr_t *below_4g_mem_size, ram_addr_t *above_4g_mem_size,
> >                   MemoryRegion **ram_memory)
> >  {
> > @@ -998,6 +999,7 @@ int xen_hvm_init(ram_addr_t *below_4g_mem_size, ram_addr_t *above_4g_mem_size,
> >      state->xenstore = xs_daemon_open();
> >      if (state->xenstore == NULL) {
> >          perror("xen: xenstore open");
> > +        xc_evtchn_close(state->xce_handle);
> >          g_free(state);
> >          return -errno;
> >      }

just return -1 and do the same in the above check (xce_handle ==
XC_HANDLER_INITIAL_VALUE)


> > @@ -1069,7 +1071,7 @@ int xen_hvm_init(ram_addr_t *below_4g_mem_size, ram_addr_t *above_4g_mem_size,
> >      /* Initialize backend core & drivers */
> >      if (xen_be_init() != 0) {
> >          fprintf(stderr, "%s: xen backend core setup failed\n", __FUNCTION__);
> > -        exit(1);
> > +        return -1;
> >      }
> >      xen_be_register("console", &xen_console_ops);
> >      xen_be_register("vkbd", &xen_kbdmouse_ops);
> > 
> 
> -- 
> Chen Gang
> 
> Open, share, and attitude like air, water, and life which God blessed
> 

