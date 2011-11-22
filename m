Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSozW-0005WL-IY
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 06:58:22 -0500
Received: from eggs.gnu.org ([140.186.70.92]:57682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RSozR-0005W8-KU
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 06:58:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RSozL-0002Fx-ER
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 06:58:17 -0500
Received: from smtp.eu.citrix.com ([62.200.22.115]:60527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RSozL-0002Fr-76; Tue, 22 Nov 2011 06:58:11 -0500
X-IronPort-AV: E=Sophos;i="4.69,553,1315180800"; 
   d="scan'208";a="9061825"
Received: from lonpmailmx01.citrite.net ([10.30.203.162])
	by LONPIPO01.EU.CITRIX.COM with ESMTP/TLS/RC4-MD5;
	22 Nov 2011 11:58:10 +0000
Received: from kaball.uk.xensource.com (10.80.2.59) by
	LONPMAILMX01.citrite.net (10.30.203.162) with Microsoft SMTP Server id
	8.3.213.0; Tue, 22 Nov 2011 11:58:10 +0000
Date: Tue, 22 Nov 2011 11:58:57 +0000
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball-desktop
To: Markus Armbruster <armbru@redhat.com>
In-Reply-To: <1321962970-2876-1-git-send-email-armbru@redhat.com>
Message-ID: <alpine.DEB.2.00.1111221158410.31179@kaball-desktop>
References: <1321962970-2876-1-git-send-email-armbru@redhat.com>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 62.200.22.115
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Stefano Stabellini <Stefano.Stabellini@eu.citrix.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] console: Fix
 qemu_default_pixelformat() for 24 bpp
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
X-List-Received-Date: Tue, 22 Nov 2011 11:58:22 -0000

On Tue, 22 Nov 2011, Markus Armbruster wrote:
> Falls through to 32 bpp.  Harmless, because the only difference is the
> alpha component, and we're not using that.  Spotted by Coverity.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

ack

>  console.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/console.c b/console.c
> index ce0429d..223f8fd 100644
> --- a/console.c
> +++ b/console.c
> @@ -1688,6 +1688,7 @@ PixelFormat qemu_default_pixelformat(int bpp)
>              pf.rbits = 8;
>              pf.gbits = 8;
>              pf.bbits = 8;
> +            break;
>          case 32:
>              pf.rmask = 0x00FF0000;
>              pf.gmask = 0x0000FF00;
> -- 
> 1.7.6.4
> 
> 

