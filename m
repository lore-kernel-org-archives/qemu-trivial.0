Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoD0j-00064u-UF
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 10:05:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <konrad.wilk@oracle.com>) id 1XoCMp-00045E-Ms
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:24:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <konrad.wilk@oracle.com>) id 1XoCMi-0007fv-Vb
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:24:23 -0500
Received: from aserp1040.oracle.com ([141.146.126.69]:28679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <konrad.wilk@oracle.com>)
	id 1XoCMi-0007ff-FS; Tue, 11 Nov 2014 09:24:16 -0500
Received: from acsinet22.oracle.com (acsinet22.oracle.com [141.146.126.238])
	by aserp1040.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
	ESMTP id sABEO4J4002999
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 11 Nov 2014 14:24:07 GMT
Received: from aserz7021.oracle.com (aserz7021.oracle.com [141.146.126.230])
	by acsinet22.oracle.com (8.14.4+Sun/8.14.4) with ESMTP id
	sABEO2Ev028136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 11 Nov 2014 14:24:03 GMT
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
	by aserz7021.oracle.com (8.14.4+Sun/8.14.4) with ESMTP id
	sABEO21F001075; Tue, 11 Nov 2014 14:24:02 GMT
Received: from konrad-lan.dumpdata.com (/50.195.21.189)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 11 Nov 2014 06:24:02 -0800
Date: Tue, 11 Nov 2014 09:24:00 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Message-ID: <20141111142359.GB8751@konrad-lan.dumpdata.com>
References: <5461D59C.5020106@gmail.com>
	<alpine.DEB.2.02.1411111052280.26318@kaball.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1411111052280.26318@kaball.uk.xensource.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Source-IP: acsinet22.oracle.com [141.146.126.238]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 141.146.126.69
X-Mailman-Approved-At: Tue, 11 Nov 2014 10:05:36 -0500
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, xen-devel@lists.xensource.com,
	Michael Tokarev <mjt@tls.msk.ru>, Chen Gang <gang.chen.5i5j@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Xen-devel] [PATCH trivial] xen-hvm: Remove
 redandant varialbe 'xstate'
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
X-List-Received-Date: Tue, 11 Nov 2014 14:24:30 -0000

On Tue, Nov 11, 2014 at 10:53:01AM +0000, Stefano Stabellini wrote:
> On Tue, 11 Nov 2014, Chen Gang wrote:
> > In xen_hvm_change_state_handler(), can pass 'opaque' with type cast to
> > xen_main_loop_prepare() directly, need not use additional variable for
> > it.

The title of your patch should say 'variable'.
> > 
> > Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> 
> Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
> 
> 
> >  xen-hvm.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/xen-hvm.c b/xen-hvm.c
> > index 21f1cbb..7548794 100644
> > --- a/xen-hvm.c
> > +++ b/xen-hvm.c
> > @@ -993,9 +993,8 @@ static void xen_main_loop_prepare(XenIOState *state)
> >  static void xen_hvm_change_state_handler(void *opaque, int running,
> >                                           RunState rstate)
> >  {
> > -    XenIOState *xstate = opaque;
> >      if (running) {
> > -        xen_main_loop_prepare(xstate);
> > +        xen_main_loop_prepare((XenIOState *)opaque);
> >      }
> >  }
> >  
> > -- 
> > 1.8.5.2 (Apple Git-48)
> > 
> 
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xen.org
> http://lists.xen.org/xen-devel

