Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xo94s-0004iR-Cz
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 05:53:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>) id 1Xo94l-0004ar-LM
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 05:53:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>) id 1Xo94g-0000Cc-Kw
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 05:53:31 -0500
Received: from smtp02.citrix.com ([66.165.176.63]:28466)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>)
	id 1Xo94W-0000A4-RQ; Tue, 11 Nov 2014 05:53:16 -0500
X-IronPort-AV: E=Sophos;i="5.07,360,1413244800"; d="scan'208";a="191510880"
Received: from ukmail1.uk.xensource.com (10.80.16.128) by smtprelay.citrix.com
	(10.13.107.80) with Microsoft SMTP Server id 14.3.181.6;
	Tue, 11 Nov 2014 05:53:14 -0500
Received: from kaball.uk.xensource.com ([10.80.2.59])	by
	ukmail1.uk.xensource.com with esmtp (Exim 4.69)	(envelope-from
	<stefano.stabellini@eu.citrix.com>)	id 1Xo94U-0001RY-AS;
	Tue, 11 Nov 2014 10:53:14 +0000
Date: Tue, 11 Nov 2014 10:53:01 +0000
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball.uk.xensource.com
To: Chen Gang <gang.chen.5i5j@gmail.com>
In-Reply-To: <5461D59C.5020106@gmail.com>
Message-ID: <alpine.DEB.2.02.1411111052280.26318@kaball.uk.xensource.com>
References: <5461D59C.5020106@gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-DLP: MIA1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.63
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, xen-devel@lists.xensource.com,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: [Qemu-trivial] [PATCH trivial] xen-hvm: Remove redandant
	varialbe 'xstate'
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
X-List-Received-Date: Tue, 11 Nov 2014 10:53:36 -0000

On Tue, 11 Nov 2014, Chen Gang wrote:
> In xen_hvm_change_state_handler(), can pass 'opaque' with type cast to
> xen_main_loop_prepare() directly, need not use additional variable for
> it.
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>

Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>


>  xen-hvm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/xen-hvm.c b/xen-hvm.c
> index 21f1cbb..7548794 100644
> --- a/xen-hvm.c
> +++ b/xen-hvm.c
> @@ -993,9 +993,8 @@ static void xen_main_loop_prepare(XenIOState *state)
>  static void xen_hvm_change_state_handler(void *opaque, int running,
>                                           RunState rstate)
>  {
> -    XenIOState *xstate = opaque;
>      if (running) {
> -        xen_main_loop_prepare(xstate);
> +        xen_main_loop_prepare((XenIOState *)opaque);
>      }
>  }
>  
> -- 
> 1.8.5.2 (Apple Git-48)
> 

