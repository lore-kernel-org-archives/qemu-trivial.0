Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WsZmE-00058R-6K
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jun 2014 11:40:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1WsZm7-0004vZ-F0
	for qemu-trivial@nongnu.org; Thu, 05 Jun 2014 11:40:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1WsZm2-0004l7-Cw
	for qemu-trivial@nongnu.org; Thu, 05 Jun 2014 11:40:19 -0400
Received: from lputeaux-656-01-25-125.w80-12.abo.wanadoo.fr
	([80.12.84.125]:46256 helo=paradis.irqsave.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>)
	id 1WsZlr-0004ZX-CZ; Thu, 05 Jun 2014 11:40:03 -0400
Received: from irqsave.net (unknown [192.168.77.254])
	by paradis.irqsave.net (Postfix) with ESMTP id 055F9A733A;
	Thu,  5 Jun 2014 17:40:01 +0200 (CEST)
Date: Thu, 5 Jun 2014 17:40:00 +0200
From: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20140605153959.GA6798@irqsave.net>
References: <1401897628-13422-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1401897628-13422-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 80.12.84.125
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] smbios: use g_free directly
	on NULL pointers
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
X-List-Received-Date: Thu, 05 Jun 2014 15:40:24 -0000

The Wednesday 04 Jun 2014 =E0 18:00:28 (+0200), Paolo Bonzini wrote :
> No need to wrap it with an if.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/i386/smbios.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/i386/smbios.c b/hw/i386/smbios.c
> index 7660718..ab89420 100644
> --- a/hw/i386/smbios.c
> +++ b/hw/i386/smbios.c
> @@ -740,11 +740,6 @@ void smbios_set_cpuid(uint32_t version, uint32_t f=
eatures)
>          field =3D value;                                              =
      \
>      }
> =20
> -#define G_FREE_UNLESS_NULL(ptr)                                       =
    \
> -    if (ptr !=3D NULL) {                                              =
      \
> -        g_free(ptr);                                                  =
    \
> -    }
> -
>  void smbios_set_defaults(const char *manufacturer, const char *product=
,
>                           const char *version, bool legacy_mode)
>  {
> @@ -753,7 +748,7 @@ void smbios_set_defaults(const char *manufacturer, =
const char *product,
> =20
>      /* drop unwanted version of command-line file blob(s) */
>      if (smbios_legacy) {
> -        G_FREE_UNLESS_NULL(smbios_tables);
> +        g_free(smbios_tables);
>          /* in legacy mode, also complain if fields were given for type=
s > 1 */
>          if (find_next_bit(have_fields_bitmap,
>                            SMBIOS_MAX_TYPE+1, 2) < SMBIOS_MAX_TYPE+1) {
> @@ -762,7 +757,7 @@ void smbios_set_defaults(const char *manufacturer, =
const char *product,
>              exit(1);
>          }
>      } else {
> -        G_FREE_UNLESS_NULL(smbios_entries);
> +        g_free(smbios_entries);
>      }
> =20
>      SMBIOS_SET_DEFAULT(type1.manufacturer, manufacturer);
> --=20
> 1.8.3.1
>=20
>=20
Reviewed-by: Benoit Canet <benoit@irqsave.net>

