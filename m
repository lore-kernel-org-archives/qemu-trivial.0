Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b32N0-00073H-6E
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 10:22:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b32My-00070D-50
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 10:22:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b32Mx-0001Ji-6e
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 10:22:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44660)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b32Mr-0001J5-Lp; Wed, 18 May 2016 10:22:33 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4EA85711D7;
	Wed, 18 May 2016 14:22:33 +0000 (UTC)
Received: from [10.3.116.47] (ovpn-116-47.phx2.redhat.com [10.3.116.47])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4IEMWJG020686; Wed, 18 May 2016 10:22:32 -0400
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1463563673-671-1-git-send-email-pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <573C7AA8.5000205@redhat.com>
Date: Wed, 18 May 2016 08:22:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1463563673-671-1-git-send-email-pbonzini@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="8KL8fSauunT2DxtfI48R6HQ4E49CwVj17"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 18 May 2016 14:22:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] coccinelle: add
 g_assert_cmp* to macro file
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 14:22:41 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8KL8fSauunT2DxtfI48R6HQ4E49CwVj17
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/18/2016 03:27 AM, Paolo Bonzini wrote:
> This helps applying semantic patches to unit tests.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/cocci-macro-file.h | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
> index eceb4be..9f2e72e 100644
> --- a/scripts/cocci-macro-file.h
> +++ b/scripts/cocci-macro-file.h
> @@ -117,3 +117,9 @@ struct {                                           =
                     \
>          type *tqe_next;       /* next element */                      =
  \
>          type **tqe_prev;      /* address of previous next element */  =
  \
>  }
> +
> +/* From glib */
> +#define g_assert_cmpint(a, op, b)   g_assert(a op b)
> +#define g_assert_cmpuint(a, op, b)   g_assert(a op b)

Odd indentation, compared to the other lines.

> +#define g_assert_cmphex(a, op, b)   g_assert(a op b)
> +#define g_assert_cmpstr(a, op, b)   g_assert(strcmp(a, b) op 0)
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--8KL8fSauunT2DxtfI48R6HQ4E49CwVj17
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXPHqoAAoJEKeha0olJ0NqD/cH/3aClrHFWVLxJxESWTu1vBoJ
tDI+AB/ykq4zRGIG1irI2Dqy6IYm1l9h3pci+HiNwvP/8R7kKhRh5qU9MSgRKLGO
Toaz5MnX3z8XlAvXl2LNAlys3Q9XPdtDmRY/+WTYn+v2fd0VNaR/TUnGsWocdXmT
KCaIqV9fZ3pMWT8e0zvqkWw3+N5xTiyz4UakkbOsxA3UrANDjvv1ye7F/RYhjgmM
RtBO7gjSbiv4HWU/5LN/LHJe246/9OirFkSyRFicRf5HPq15Mla9dr9QFRlB4b4i
R9PK4df6A/2rd9OJVfLKkg9aR3KkcFivZfPVame4UVlkn012JZ0t3RjTSzxX+NA=
=KJvF
-----END PGP SIGNATURE-----

--8KL8fSauunT2DxtfI48R6HQ4E49CwVj17--

