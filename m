Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RodxD-0004DC-8X
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jan 2012 11:38:11 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RodxA-00045y-CC
	for qemu-trivial@nongnu.org; Sat, 21 Jan 2012 11:38:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Rodx9-00086I-2q
	for qemu-trivial@nongnu.org; Sat, 21 Jan 2012 11:38:08 -0500
Received: from cantor2.suse.de ([195.135.220.15]:49407 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Rodx6-00085z-A2; Sat, 21 Jan 2012 11:38:04 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 3BC8989471;
	Sat, 21 Jan 2012 17:38:03 +0100 (CET)
Message-ID: <4F1AE974.2090401@suse.de>
Date: Sat, 21 Jan 2012 17:36:04 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111220 Thunderbird/9.0
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@web.de>
References: <4F1AC0EB.3050304@web.de>
In-Reply-To: <4F1AC0EB.3050304@web.de>
X-Enigmail-Version: 1.3.4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qdev-property: Make bit
 property parsing stricter
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
X-List-Received-Date: Sat, 21 Jan 2012 16:38:09 -0000

Am 21.01.2012 14:43, schrieb Jan Kiszka:
> By using strncasecmp, we allow for arbitrary characters after the
> "on"/"off" string. Fix this by switching to strcasecmp.
>=20
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

An alternative might be to increase the char count by one. For a const
char* parameter I see the responsibility for nul-terminating at the
caller though, so this seems right. Did you check all callers?

Andreas

> ---
>  hw/qdev-properties.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/qdev-properties.c b/hw/qdev-properties.c
> index 02f0dae..ea3b2df 100644
> --- a/hw/qdev-properties.c
> +++ b/hw/qdev-properties.c
> @@ -40,9 +40,9 @@ static void qdev_prop_cpy(DeviceState *dev, Property =
*props, void *src)
>  /* Bit */
>  static int parse_bit(DeviceState *dev, Property *prop, const char *str=
)
>  {
> -    if (!strncasecmp(str, "on", 2))
> +    if (!strcasecmp(str, "on"))
>          bit_prop_set(dev, prop, true);
> -    else if (!strncasecmp(str, "off", 3))
> +    else if (!strcasecmp(str, "off"))
>          bit_prop_set(dev, prop, false);
>      else
>          return -EINVAL;

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

