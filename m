Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxDr6-0002Gx-5L
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2016 09:58:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bxDr4-0002Es-8J
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 09:57:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bxDr3-00006g-Cb
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 09:57:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36724)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1bxDqy-0008Vy-Pf; Thu, 20 Oct 2016 09:57:52 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EABA5745C1;
	Thu, 20 Oct 2016 13:57:51 +0000 (UTC)
Received: from [10.3.116.151] (ovpn-116-151.phx2.redhat.com [10.3.116.151])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9KDvp4b030610; Thu, 20 Oct 2016 09:57:51 -0400
To: Anand J <anand.indukala@gmail.com>, qemu-devel@nongnu.org
References: <1476957133-24382-1-git-send-email-anand.indukala@gmail.com>
Cc: qemu-trivial@nongnu.org, thuth@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <a315edac-70ee-6aba-f65d-adc5a521d48b@redhat.com>
Date: Thu, 20 Oct 2016 08:57:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1476957133-24382-1-git-send-email-anand.indukala@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="0sHh7VR10DnJ8Ivhd2mPtTd2nihpi5eGN"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 20 Oct 2016 13:57:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] script/clean-includes:
 added duplicate #include check
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
X-List-Received-Date: Thu, 20 Oct 2016 13:57:59 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0sHh7VR10DnJ8Ivhd2mPtTd2nihpi5eGN
Content-Type: multipart/mixed; boundary="jcTvdVRX04141l6Fco8t2E5KbwABtgJCJ";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Anand J <anand.indukala@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, thuth@redhat.com
Message-ID: <a315edac-70ee-6aba-f65d-adc5a521d48b@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/2] script/clean-includes: added duplicate
 #include check
References: <1476957133-24382-1-git-send-email-anand.indukala@gmail.com>
In-Reply-To: <1476957133-24382-1-git-send-email-anand.indukala@gmail.com>

--jcTvdVRX04141l6Fco8t2E5KbwABtgJCJ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/20/2016 04:52 AM, Anand J wrote:
> Added script to check duplicate #include entries. This check will scan
> and print the files in which duplicate #include entries are present.

Subject line typo: s,script/,scripts/,

>=20
> Script might output false positive entries as well. Such entries should=

> not be removed. So if it finds any duplicate entries script will
> terminate with an exit status 1. Then each and every file should be
> checked manually and corrected if necessary.
>=20
> In order to enable the check use --check-duphead option with
> script/clean-includes.

Bike-shedding, but if you are going to put a dash between words, put it
between ALL words, as in --check-dup-head.  Or spell it out:
--check-duplicate-headers.  If that feels to long, and you want to
abbreviate, then abbreviate further, as in --duphead.

>=20
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Anand J <anand.indukala@gmail.com>
> ---

>  #
> +# If --check-duphead option is used, then check for duplicate
> +# header files will be enabled.

Grammar; I suggest:

If --check-duphead is specified, additionally check for duplicate header
includes.

> +while true
> +do
> +    case $1 in
> +    "--git")
> +         if [ $# -eq 1 ]; then
> +             echo "--git option requires an argument"
> +             exit 1
> +         fi
> +         GITSUBJ=3D"$2"
> +         GIT=3Dyes
> +         shift
> +         shift
> +         ;;
> +    "--check-duphead")
> +        DUPHEAD=3Dyes
> +        shift
> +        ;;
> +    *)

Your option-parsing loop is missing a special case for --; for
consistency with POSIX recommendations, you should have:

--)
  shift
  break
  ;;
*)

as a way to end option parsing early (and force the next argument to be
treated as a filename, even if it starts with -).

> =20
> +if [ "$DUPHEAD" =3D "yes" ]; then
> +    grep "^#include" $@ | sort | uniq -c | awk '{if ($1 > 1) print $0}=
'

Missing quotes around $@.

Looking forward to v3.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--jcTvdVRX04141l6Fco8t2E5KbwABtgJCJ--

--0sHh7VR10DnJ8Ivhd2mPtTd2nihpi5eGN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYCM1eAAoJEKeha0olJ0Nq30EH/1EBkRQbQoU6RemZYyeVBA9t
kJBcG3ZSPRUip9+mh4oTZDSclEYuyEORU9/MxS9jpAcSaX8lKrgYXYu9KlkUwgwE
nW7qPz1/ULaDD1yJfsxwN4PdJrr9HCg/aE0zmQlxYIyuAASdEfkN+Cpa7Q+5U81O
7UQtabL3iBErs91YMdi5q0L4WoFz+oGPNnG+E5qyNh8vzsYF63JfBzz41wmhtMiU
ay4a3VvuN10T9+P0zJHlrLdOjNC3RDh8k8IkSDKxr3LvSdptbggeKCl7rORQ5KVt
/OjS73XnhEG5QlRjWfW8CJzfYyIShjOFQTsbo/5ESwbBRL5r7Wk0IFw45NFflhE=
=JY6g
-----END PGP SIGNATURE-----

--0sHh7VR10DnJ8Ivhd2mPtTd2nihpi5eGN--

