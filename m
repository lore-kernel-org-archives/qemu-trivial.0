Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5K8G-0004gm-HO
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 11:54:32 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S5K8E-0004gf-Bu
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 11:54:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S5K7r-0004x2-EP
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 11:54:29 -0500
Received: from cantor2.suse.de ([195.135.220.15]:53044 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1S5K7R-0004Zm-Ab; Wed, 07 Mar 2012 11:53:41 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 0D9F78FA98;
	Wed,  7 Mar 2012 17:19:21 +0100 (CET)
Message-ID: <4F578A88.7000200@suse.de>
Date: Wed, 07 Mar 2012 17:19:20 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120215 Thunderbird/10.0.2
MIME-Version: 1.0
To: Chen Yufei <cyfdecyf@gmail.com>
References: <1331134603-73952-1-git-send-email-cyfdecyf@gmail.com>
In-Reply-To: <1331134603-73952-1-git-send-email-cyfdecyf@gmail.com>
X-Enigmail-Version: 1.3.5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove type field in
 ModuleEntry as it's not used.
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
X-List-Received-Date: Wed, 07 Mar 2012 16:54:31 -0000

Am 07.03.2012 16:36, schrieb Chen Yufei:
> Signed-off-by: Chen Yufei <cyfdecyf@gmail.com>

There's separate init_type_list[]s per type and the type field is not
even initialized, so:

Acked-by: Andreas F=E4rber <afaerber@suse.de>

Thanks,
Andreas

> ---
>  module.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>=20
> diff --git a/module.c b/module.c
> index 106a969..c3a6da7 100644
> --- a/module.c
> +++ b/module.c
> @@ -19,7 +19,6 @@
> =20
>  typedef struct ModuleEntry
>  {
> -    module_init_type type;
>      void (*init)(void);
>      QTAILQ_ENTRY(ModuleEntry) node;
>  } ModuleEntry;

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

