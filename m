Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqRQI-0003no-BM
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jan 2012 10:39:38 -0500
Received: from eggs.gnu.org ([140.186.70.92]:44781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RqRQC-0003Uh-IC
	for qemu-trivial@nongnu.org; Thu, 26 Jan 2012 10:39:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RqRQ6-0004PD-OX
	for qemu-trivial@nongnu.org; Thu, 26 Jan 2012 10:39:32 -0500
Received: from cantor2.suse.de ([195.135.220.15]:33076 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1RqRPv-0004OZ-G2; Thu, 26 Jan 2012 10:39:15 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 72877919A3;
	Thu, 26 Jan 2012 16:39:14 +0100 (CET)
Message-ID: <4F217322.2000506@suse.de>
Date: Thu, 26 Jan 2012 16:37:06 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111220 Thunderbird/9.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1327591664-18442-1-git-send-email-afaerber@suse.de>
In-Reply-To: <1327591664-18442-1-git-send-email-afaerber@suse.de>
X-Enigmail-Version: 1.3.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: Kevin Wolf <kwolf@redhat.com>,
	Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>,
	Anthony Liguori <aliguori@us.ibm.com>,
	Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>, Markus Armbruster <armbru@redhat.com>,
	Blue Swirl <blauwirbel@gmail.com>, Amit Shah <amit.shah@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v7] qdev: Add support for
	property type bool
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
X-List-Received-Date: Thu, 26 Jan 2012 15:39:37 -0000

Am 26.01.2012 16:27, schrieb Andreas F=C3=A4rber:
> From: Andreas F=C3=A4rber <andreas.faerber@web.de>
>=20
> VMState supports the type bool but qdev instead supports bit, backed by
> uint32_t. Therefore let's add PROP_TYPE_BOOL and qdev_prop_set_bool().
>=20
> With non-programmers in mind, instead of universal true/false provide
> two different property types:
> * on/off for DEFINE_PROP_SWITCH() (requested by Jan) and
> * yes/no for DEFINE_PROP_BOOL() (also accepting true/false as input).
>=20
> Signed-off-by: Andreas F=C3=A4rber <andreas.faerber@web.de>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Jan Kiszka <jan.kiszka@siemens.com>
> Cc: Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>
> ---
>  v6 -> v7:
>  * Rename existing "boolean" type to "bit".
>  * Re-introduce qdev_prop_set_bool().
>  * Split "bool" into "switch" (on/off) and "boolean" (yes/no; true/fals=
e input).
>=20
>  v5 -> v6:
>  * Rebased onto QOM properties.
>  * Parse and print true/false for bool, leave bit untouched.
>  Please review, v6 untested.
>  [* Accidentally dropped qdev_prop_set_bool().]
>=20
>  v4 -> v5 (40P):
>  * Parse on/off in addition to yes/no for both bit and bool, print yes/=
no for bool.
>=20
>  v4 (ISA):
>  * Introduced.
>=20
>  hw/qdev-properties.c |  102 ++++++++++++++++++++++++++++++++++++++++++=
+++++++-
>  hw/qdev.h            |    7 +++
>  2 files changed, 108 insertions(+), 1 deletions(-)

> diff --git a/hw/qdev.h b/hw/qdev.h
> index 6b58dd8..37167d4 100644
> --- a/hw/qdev.h
> +++ b/hw/qdev.h
> @@ -152,6 +152,7 @@ enum PropertyType {
>      PROP_TYPE_VLAN,
>      PROP_TYPE_PTR,
>      PROP_TYPE_BIT,
> +    PROP_TYPE_BOOL,
>  };
> =20
>  struct PropertyInfo {
> @@ -276,6 +277,7 @@ int do_device_del(Monitor *mon, const QDict *qdict,=
 QObject **ret_data);
>  /*** qdev-properties.c ***/
> =20
>  extern PropertyInfo qdev_prop_bit;
> +extern PropertyInfo qdev_prop_bool;

Sorry, missing

extern PropertyInfo qdev_prop_bool_switch;

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

