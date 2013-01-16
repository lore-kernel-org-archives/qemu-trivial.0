Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvVJv-0003R2-7c
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 10:54:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TvVJr-0003GT-Fz
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 10:54:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TvVJm-0006Zr-K8
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 10:54:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:15567)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1TvVJg-0006Y7-7P; Wed, 16 Jan 2013 10:54:16 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0GFsFvQ026518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 16 Jan 2013 10:54:15 -0500
Received: from [10.3.113.75] (ovpn-113-75.phx2.redhat.com [10.3.113.75])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0GFsEU8002928; Wed, 16 Jan 2013 10:54:15 -0500
Message-ID: <50F6CD26.6070808@redhat.com>
Date: Wed, 16 Jan 2013 08:54:14 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1358346998-26328-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1358346998-26328-1-git-send-email-armbru@redhat.com>
X-Enigmail-Version: 1.5.0
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2BOLQNGUXWSUXWSPOLLPO"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/11] Trivial memory
 allocation fixes & cleanups
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
X-List-Received-Date: Wed, 16 Jan 2013 15:54:30 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2BOLQNGUXWSUXWSPOLLPO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 01/16/2013 07:36 AM, Markus Armbruster wrote:
> Markus Armbruster (11):
>   g_malloc(0) and g_malloc0(0) return NULL; simplify
>   g_strdup(NULL) returns NULL; simplify
>   hw/9pfs: Fix unchecked strdup() by converting to g_strdup()
>   readline: Fix unchecked strdup() by converting to g_strdup()
>   spice: Fix unchecked strdup() by converting to g_strdup()
>   virtfs-proxy-helper: Fix unchecked strdup() by conv. to g_strdup()
>   qemu-log: Fix unchecked strdup() by converting to g_strdup()
>   qemu-log: Plug trivial memory leak in cpu_set_log_filename()
>   libcacard: Fix unchecked strdup() by converting to g_strdup()
>   qapi: Fix unchecked strdup() by converting to g_strdup()
>   qemu-ga: Fix unchecked strdup() by converting to g_strdup()

Patches 1-7 and 9-11:
Reviewed-by: Eric Blake <eblake@redhat.com>

Style question on patch 4
Patch 8 needs a v2.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2BOLQNGUXWSUXWSPOLLPO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJQ9s0mAAoJEKeha0olJ0Nq5ggH/3RWf8yfSf3ITOk2f9SHIH89
eWUZFfljE/1C84OkIRbKDlNbFNn9iVvs83M/ik77qZRe3KMWzqR+4VqZ+Nx1cdWa
rDQbOkXcJIuSSsBi6swsCfplg/I1L1XJXFlM00pbKRW2ymR+BN0MjJN5wwkliRL9
x0J4z93j3dOLHOCAkx3yI3hf/Yi7+H8TvZbzp/7h2qBYUzZIrGlaPv9lN6wgVR40
SKYMNZKkD2lIS977fX9MR4f0ULiNobTQnYSkThS21P5K8WL6KdCDHskV3gClDK+D
AxmV638kCy1ZoU0UrTmyi+KzW5TZ34Vgs5mMPXPTygQVaBRUg38nUP49QB5DWwQ=
=JonN
-----END PGP SIGNATURE-----

------enig2BOLQNGUXWSUXWSPOLLPO--

