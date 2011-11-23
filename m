Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RTA09-0007EO-TQ
	for mharc-qemu-trivial@gnu.org; Wed, 23 Nov 2011 05:24:25 -0500
Received: from eggs.gnu.org ([140.186.70.92]:51814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RTA05-00070p-Qz
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 05:24:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RTA01-0001AQ-Fj
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 05:24:21 -0500
Received: from cantor2.suse.de ([195.135.220.15]:42177 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1RT9zw-00011K-Bl; Wed, 23 Nov 2011 05:24:12 -0500
Received: from relay2.suse.de (nat.nue.novell.com [195.135.221.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id D08808B013;
	Wed, 23 Nov 2011 11:24:07 +0100 (CET)
Message-ID: <4ECCC9A9.5070606@suse.de>
Date: Wed, 23 Nov 2011 11:23:37 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
References: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
In-Reply-To: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/11] fix spelling in
	darwin-user sub directory
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
X-List-Received-Date: Wed, 23 Nov 2011 10:24:22 -0000

Am 22.11.2011 11:06, schrieb Dong Xu Wang:
> From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
>=20
>=20
> Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

> diff --git a/darwin-user/machload.c b/darwin-user/machload.c
> index 0aa8282..26dd293 100644
> --- a/darwin-user/machload.c
> +++ b/darwin-user/machload.c

> @@ -809,7 +809,7 @@ unsigned long setup_arg_pages(void * mh, char ** ar=
gv, char ** env)
>          page_set_flags((int)env[i], (int)(env[i]+strlen(env[i])), PROT=
_READ | PAGE_VALID);
>      }
> =20
> -    /* Add on the stack the interp_prefix choosen if so */
> +    /* Add on the stack the interp_prefix chosen if so */
>      if(interp_prefix[0])
>      {
>          char *dyld_root;

Don't really understand this comment either way... ;)

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

