Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1REe0d-0001TF-DC
	for mharc-qemu-trivial@gnu.org; Fri, 14 Oct 2011 05:24:55 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1REe0Y-00018A-49
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2011 05:24:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1REe0T-00011N-KP
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2011 05:24:50 -0400
Received: from cantor2.suse.de ([195.135.220.15]:49884 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1REe0L-0000tE-Mg; Fri, 14 Oct 2011 05:24:37 -0400
Received: from [10.10.102.108] (charybdis-ext.suse.de [195.135.221.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 9F69B8B2F9;
	Fri, 14 Oct 2011 11:24:35 +0200 (CEST)
Message-ID: <4E97FFD3.5050205@suse.de>
Date: Fri, 14 Oct 2011 11:24:35 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
MIME-Version: 1.0
To: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
References: <1318578066-18379-1-git-send-email-wdongxu@linux.vnet.ibm.com>
In-Reply-To: <1318578066-18379-1-git-send-email-wdongxu@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] correct spelling
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
X-List-Received-Date: Fri, 14 Oct 2011 09:24:54 -0000

[cc'ing qemu-trivial]

A one-line summary here and a topic like sheepdog: in the subject
would've been nice but given it's just a typo fix... :)

Am 14.10.2011 09:41, schrieb Dong Xu Wang:
> Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
> ---
>  block/sheepdog.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/block/sheepdog.c b/block/sheepdog.c
> index c1f6e07..ae857e2 100644
> --- a/block/sheepdog.c
> +++ b/block/sheepdog.c
> @@ -66,7 +66,7 @@
>   * 20 - 31 (12 bits): reserved data object space
>   * 32 - 55 (24 bits): vdi object space
>   * 56 - 59 ( 4 bits): reserved vdi object space
> - * 60 - 63 ( 4 bits): object type indentifier space
> + * 60 - 63 ( 4 bits): object type identifier space
>   */
> =20
>  #define VDI_SPACE_SHIFT   32

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746, AG N=FCrnb=
erg

