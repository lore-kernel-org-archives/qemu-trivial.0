Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmNg7-00028Y-AP
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 08:27:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UmNg3-00023G-BV
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 08:27:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UmNfy-0001oL-LQ
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 08:27:55 -0400
Received: from cantor2.suse.de ([195.135.220.15]:45777 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UmNfv-0001nv-Qb; Tue, 11 Jun 2013 08:27:47 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id D551FA538C;
	Tue, 11 Jun 2013 14:27:46 +0200 (CEST)
Message-ID: <51B717C2.5050906@suse.de>
Date: Tue, 11 Jun 2013 14:27:46 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1370896852-12473-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1370896852-12473-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Blue Swirl <blauwirbel@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-sparc: Replace free
	by g_free
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
X-List-Received-Date: Tue, 11 Jun 2013 12:27:57 -0000

Am 10.06.2013 22:40, schrieb Stefan Weil:
> The wrong function was reported by cppcheck.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

> ---
>  target-sparc/cpu.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target-sparc/cpu.c b/target-sparc/cpu.c
> index 290b580..13bb7bb 100644
> --- a/target-sparc/cpu.c
> +++ b/target-sparc/cpu.c
> @@ -614,7 +614,7 @@ static int cpu_sparc_find_by_name(sparc_def_t *cpu_=
def, const char *cpu_model)
>      return 0;
> =20
>   error:
> -    free(s);
> +    g_free(s);
>      return -1;
>  }
> =20

So s is for the string, and matches occurrence above, fine.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

