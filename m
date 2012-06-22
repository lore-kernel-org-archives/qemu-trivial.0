Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Si2Pw-0000i3-Tj
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 07:52:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Si2Pp-0000OP-FM
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 07:52:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Si2Pn-0001xE-Qm
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 07:52:41 -0400
Received: from cantor2.suse.de ([195.135.220.15]:52742 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Si2Pd-0001vN-4z; Fri, 22 Jun 2012 07:52:29 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 1B652A22BB;
	Fri, 22 Jun 2012 13:52:24 +0200 (CEST)
Message-ID: <4FE45C76.3020508@suse.de>
Date: Fri, 22 Jun 2012 13:52:22 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120421 Thunderbird/12.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1340364659-20200-1-git-send-email-peter.maydell@linaro.org>
	<1340364659-20200-3-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1340364659-20200-3-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] cpu-common.h: Remove a
 pointless ifndef CONFIG_USER_ONLY
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
X-List-Received-Date: Fri, 22 Jun 2012 11:52:47 -0000

Am 22.06.2012 13:30, schrieb Peter Maydell:
> Remove an ifndef CONFIG_USER_ONLY guard that was pointless
> because it is already inside an if !defined(CONFIG_USER_ONLY).
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  cpu-common.h |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
>=20
> diff --git a/cpu-common.h b/cpu-common.h
> index 321037f..85548de 100644
> --- a/cpu-common.h
> +++ b/cpu-common.h
> @@ -69,9 +69,7 @@ void cpu_physical_memory_unmap(void *buffer, target_p=
hys_addr_t len,
>  void *cpu_register_map_client(void *opaque, void (*callback)(void *opa=
que));
>  void cpu_unregister_map_client(void *cookie);
> =20
> -#ifndef CONFIG_USER_ONLY
>  bool cpu_physical_memory_is_io(target_phys_addr_t phys_addr);
> -#endif
> =20
>  /* Coalesced MMIO regions are areas where write operations can be reor=
dered.
>   * This usually implies that write operations are side-effect free.  T=
his allows

Acked-by: Andreas F=E4rber <afaerber@suse.de>

Spotted that yesterday myself and was planning to send a patch. :)

Thanks,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

