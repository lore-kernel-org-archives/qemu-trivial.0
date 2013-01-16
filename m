Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvbXi-000321-Af
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 17:33:10 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TvbXf-0002tR-Ew
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 17:33:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TvbXe-0001Bd-4R
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 17:33:07 -0500
Received: from cantor2.suse.de ([195.135.220.15]:47992 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1TvbXb-0001B2-Hh; Wed, 16 Jan 2013 17:33:03 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id A5AABA3A78;
	Wed, 16 Jan 2013 23:33:01 +0100 (CET)
Message-ID: <50F72A97.5040600@suse.de>
Date: Wed, 16 Jan 2013 23:32:55 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1358358029-14684-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1358358029-14684-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Liu <proljc@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw: Spelling fix in log
	message
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
X-List-Received-Date: Wed, 16 Jan 2013 22:33:08 -0000

Am 16.01.2013 18:40, schrieb Stefan Weil:
> defineition -> definition
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/openrisc_sim.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/openrisc_sim.c b/hw/openrisc_sim.c
> index fb47cdc..6c443ba 100644
> --- a/hw/openrisc_sim.c
> +++ b/hw/openrisc_sim.c
> @@ -107,7 +107,7 @@ static void openrisc_sim_init(QEMUMachineInitArgs *=
args)
>      for (n =3D 0; n < smp_cpus; n++) {
>          cpu =3D cpu_openrisc_init(cpu_model);
>          if (cpu =3D=3D NULL) {
> -            qemu_log("Unable to find CPU defineition!\n");
> +            qemu_log("Unable to find CPU definition!\n");
>              exit(1);
>          }
>          qemu_register_reset(main_cpu_reset, cpu);

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

