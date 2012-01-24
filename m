Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rq46b-0007lE-Gd
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jan 2012 09:45:45 -0500
Received: from eggs.gnu.org ([140.186.70.92]:42337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1RpkBY-0000Sl-Nd
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 12:29:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1RpkBT-0002gk-OJ
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 12:29:32 -0500
Received: from goliath.siemens.de ([192.35.17.28]:25644)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1RpkBE-0002ZO-T3; Tue, 24 Jan 2012 12:29:13 -0500
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id q0OHT8Rj008774;
	Tue, 24 Jan 2012 18:29:08 +0100
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q0OHT85E022439;
	Tue, 24 Jan 2012 18:29:08 +0100
Message-ID: <4F1EEA64.2080704@siemens.com>
Date: Tue, 24 Jan 2012 18:29:08 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1327425457-31313-1-git-send-email-afaerber@suse.de>
In-Reply-To: <1327425457-31313-1-git-send-email-afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by goliath.siemens.de id
	q0OHT8Rj008774
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.28
X-Mailman-Approved-At: Wed, 25 Jan 2012 09:45:41 -0500
Cc: Kevin Wolf <kwolf@redhat.com>, Blue Swirl <blauwirbel@gmail.com>,
	Anthony Liguori <aliguori@us.ibm.com>, Juan Quintela <quintela@redhat.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <andreas.faerber@web.de>,
	Amit Shah <amit.shah@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v6] qdev: Add support for property type
	bool
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
X-List-Received-Date: Tue, 24 Jan 2012 17:29:39 -0000

On 2012-01-24 18:17, Andreas F=C3=A4rber wrote:
> From: Andreas F=C3=A4rber <andreas.faerber@web.de>
>=20
> VMState supports the type bool but qdev instead supports bit, backed by
> uint32_t. Therefore let's add DEFINE_PROP_BOOL() and qdev_prop_set_bool=
().
>=20
> bool by definition is either true or false. Should the need arise to
> parse yes/no, on/off, 1/0 or whatever as well, we can still add that at
> a later point in time.

To make it a real replacement for PROP_TYPE_BIT, let's use on/off, also
for printing. Not only programmers may use this interface. ;)

>=20
> Signed-off-by: Andreas F=C3=A4rber <andreas.faerber@web.de>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Jan Kiszka <jan.kiszka@siemens.com>
> Cc: Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>
> ---
>  v5 -> v6:
>  * Rebased onto QOM properties.
>  * Parse and print true/false for bool, leave bit untouched.
>  Please review, v6 untested.
>=20
>  v4 -> v5 (40P):
>  * Parse on/off in addition to yes/no for both bit and bool, print yes/=
no for bool.
>=20
>  v4 (ISA):
>  * Introduced.
>=20
>  hw/qdev-properties.c |   62 ++++++++++++++++++++++++++++++++++++++++++=
++++++++
>  hw/qdev.h            |    4 +++
>  2 files changed, 66 insertions(+), 0 deletions(-)
>=20
> diff --git a/hw/qdev-properties.c b/hw/qdev-properties.c
> index 02f0dae..612f2ea 100644
> --- a/hw/qdev-properties.c
> +++ b/hw/qdev-properties.c
> @@ -96,6 +96,68 @@ PropertyInfo qdev_prop_bit =3D {
>      .set   =3D set_bit,
>  };
> =20
> +/* --- bool --- */
> +
> +static int parse_bool(DeviceState *dev, Property *prop, const char *st=
r)
> +{
> +    bool *ptr =3D qdev_get_prop_ptr(dev, prop);
> +    if (strcmp(str, "true") =3D=3D 0) {
> +        *ptr =3D true;
> +    } else if (strcmp(str, "false") =3D=3D 0) {
> +        *ptr =3D false;
> +    } else {
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +static int print_bool(DeviceState *dev, Property *prop, char *dest, si=
ze_t len)
> +{
> +    bool *ptr =3D qdev_get_prop_ptr(dev, prop);
> +    return snprintf(dest, len, *ptr ? "true" : "false");
> +}
> +
> +static void get_bool(DeviceState *dev, Visitor *v, void *opaque,
> +                     const char *name, Error **errp)
> +{
> +    Property *prop =3D opaque;
> +    bool *ptr =3D qdev_get_prop_ptr(dev, prop);
> +
> +    visit_type_bool(v, ptr, name, errp);
> +}
> +
> +static void set_bool(DeviceState *dev, Visitor *v, void *opaque,
> +                     const char *name, Error **errp)
> +{
> +    Property *prop =3D opaque;
> +    bool *ptr =3D qdev_get_prop_ptr(dev, prop);
> +    Error *local_err =3D NULL;
> +    bool value;
> +
> +    if (dev->state !=3D DEV_STATE_CREATED) {
> +        error_set(errp, QERR_PERMISSION_DENIED);
> +        return;
> +    }
> +
> +    visit_type_bool(v, &value, name, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +    *ptr =3D value;
> +}
> +
> +PropertyInfo qdev_prop_bool =3D {
> +    .name =3D "bool",

Now we have "bool" and "boolean". Can we rename the latter to bit?

Jan

--=20
Siemens AG, Corporate Technology, CT T DE IT 1
Corporate Competence Center Embedded Linux

