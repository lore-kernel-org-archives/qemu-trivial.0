Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VF33T-0007uv-65
	for mharc-qemu-trivial@gnu.org; Thu, 29 Aug 2013 10:18:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1VEzxa-0007YO-Mh
	for qemu-trivial@nongnu.org; Thu, 29 Aug 2013 07:00:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1VEzxV-000660-RV
	for qemu-trivial@nongnu.org; Thu, 29 Aug 2013 07:00:18 -0400
Received: from smtp.citrix.com ([66.165.176.89]:59047)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1VEzxV-00065G-Mi; Thu, 29 Aug 2013 07:00:13 -0400
X-IronPort-AV: E=Sophos;i="4.89,982,1367971200"; d="scan'208";a="48668157"
Received: from accessns.citrite.net (HELO FTLPEX01CL01.citrite.net)
	([10.9.154.239])
	by FTLPIPO01.CITRIX.COM with ESMTP; 29 Aug 2013 11:00:11 +0000
Received: from ukmail1.uk.xensource.com (10.80.16.128) by smtprelay.citrix.com
	(10.13.107.78) with Microsoft SMTP Server id 14.2.342.4;
	Thu, 29 Aug 2013 07:00:10 -0400
Received: from kaball.uk.xensource.com ([10.80.2.59])	by
	ukmail1.uk.xensource.com with esmtp (Exim 4.69)	(envelope-from
	<stefano.stabellini@eu.citrix.com>)	id 1VEzxS-0001W9-Pm;
	Thu, 29 Aug 2013 12:00:10 +0100
Date: Thu, 29 Aug 2013 11:59:59 +0100
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball.uk.xensource.com
To: Fabio Fantoni <fabio.fantoni@m2r.biz>
In-Reply-To: <521F0735.4090102@m2r.biz>
Message-ID: <alpine.DEB.2.02.1308291159290.6397@kaball.uk.xensource.com>
References: <1376664409-2695-1-git-send-email-anthony.perard@citrix.com>
	<521B6DA5.1010801@m2r.biz> <521F0735.4090102@m2r.biz>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-DLP: MIA2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
X-Mailman-Approved-At: Thu, 29 Aug 2013 10:18:32 -0400
Cc: qemu-trivial@nongnu.org, QEMU-devel <qemu-devel@nongnu.org>,
	Xen Devel <xen-devel@lists.xen.org>,
	Stefano Stabellini <stefano.stabellini@citrix.com>,
	Anthony Liguori <anthony@codemonkey.ws>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [Qemu-trivial] [Xen-devel] [PATCH for v1.6] pc: Fix
 initialization of the ram_memory variable.
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
X-List-Received-Date: Thu, 29 Aug 2013 11:00:23 -0000

On Thu, 29 Aug 2013, Fabio Fantoni wrote:
> Il 26/08/2013 17:00, Fabio Fantoni ha scritto:
> > Il 16/08/2013 16:46, Anthony PERARD ha scritto:
> > > In some cases (Xen), it will not be initialized before to be used. This
> > > leads to segv.
> > > 
> > > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > 
> > Tested-by: Fabio Fantoni <fabio.fantoni@m2r.biz>
> > This patch have solved the critical regression of all hvm domUs that
> > prevented domUs starting with qemu 1.6.
> > 
> 
> I not see this patch on git for now, I think is urgent apply this patch or
> solve the problem in other way because qemu 1.6 is unusable at all for hvm
> domUs on xen and 1.5.x doesn't works with hvm domUs with ram > 2gb, with qemu
> 1.6 the regression of > 2 gb ram is solved but without this patch doesn't
> works at all.
> Thanks for any reply and sorry for my bad english.

Sorry, you are right. I know about this patch, it's in my queue. I
haven't had the time to send it upstream yet.

