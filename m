Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SCZtv-0007K6-G5
	for mharc-qemu-trivial@gnu.org; Tue, 27 Mar 2012 13:09:43 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1SCZto-00070b-5I
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2012 13:09:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1SCZtm-00036P-CN
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2012 13:09:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20148)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1SCZtf-00034k-4T; Tue, 27 Mar 2012 13:09:27 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2RH9NJX008039
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 27 Mar 2012 13:09:24 -0400
Received: from [10.3.113.127] (ovpn-113-127.phx2.redhat.com [10.3.113.127])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q2RH9N8l028017; Tue, 27 Mar 2012 13:09:23 -0400
Message-ID: <4F71F442.7080201@redhat.com>
Date: Tue, 27 Mar 2012 11:09:22 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120316 Thunderbird/11.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1332867470-29780-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1332867470-29780-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.4
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigBB5993A9ABD0477CBB4F22CB"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Andreas Faerber <andreas.faerber@web.de>, qemu-devel@nongnu.org,
	Emre Ersin <emre.ersin@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix conversion from lower
 to upper case with Turkish locale
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
X-List-Received-Date: Tue, 27 Mar 2012 17:09:42 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigBB5993A9ABD0477CBB4F22CB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/27/2012 10:57 AM, Stefan Weil wrote:
> Some locale settings let make fail or create wrong results
> because tr '[:lower:]' '[:upper:]' which is used to convert
> from lower to upper case depends on the locale.
>=20
> With locale tr_TR.UTF-8, lower case 'i' is not converted to 'I'.
> This results in wrong entries in config-host.h like these ones:
>=20
>   #define CONFIG_QEMU_PREFiX "/usr/local"
>   #define CONFIG_QEMU_BiNDiR "/usr/local/bin"

>  for card in $audio_card_list; do
> -    def=3DCONFIG_`echo $card | tr '[:lower:]' '[:upper:]'`
> +    def=3DCONFIG_`echo $card | tr '[a-z]' '[A-Z]'`

NACK.  POSIX says that 'tr a-z' is unspecified outside of the POSIX
locale, but without setting LC_ALL=3DC, you aren't guaranteeing the POSIX=

locale.  If you want to be portable without use of [:lower:], you have
to spell it out, with abcdefghijklmnopqrstuvwxyz.

--=20
Eric Blake   eblake@redhat.com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--------------enigBB5993A9ABD0477CBB4F22CB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBCAAGBQJPcfRCAAoJEKeha0olJ0NqD2EH/0V/MM4t5u9tgcV4FPfMfMj0
2Cuj95YKo1zcXbxlKFWuXaEo4UZNNxkKcwCEjGKFwYjaRv2z7dew0ouz39Xv9Rlk
S6g9rbL0cJlAz6y5OLBZ20OrMZLV4nL4iQhR5RC1NC+fqJL9pC0NMYBlT+dh5ZvU
l7z+JVMfI5C5HJ6AXfwwX0K/chh9Vmhbon8vgM5qknJTwKrk7EgwTDBIFZCYvDjn
3GrsiCT2i6LLNDwXDWcpMyYl3Sfofg2l7Kwx4cy8ZNgMydSnihXDkQNabXxB+3tZ
LgMgTBVHE3jG3+jCRdjsmXm7MJRrHZi/R8laRtYHqjDe/BOnoB5U/jqE8qg39vk=
=KQt9
-----END PGP SIGNATURE-----

--------------enigBB5993A9ABD0477CBB4F22CB--

