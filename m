Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjyWA-0001FK-Vh
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 17:11:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1UjyW7-0001B1-RD
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 17:11:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1UjyW6-0004db-Go
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 17:11:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51649)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1UjyW2-0004cA-It; Tue, 04 Jun 2013 17:11:38 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r54LBbOp027855
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 4 Jun 2013 17:11:37 -0400
Received: from [10.3.113.96] (ovpn-113-96.phx2.redhat.com [10.3.113.96])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r54LBa5p020054; Tue, 4 Jun 2013 17:11:36 -0400
Message-ID: <51AE5808.6000000@redhat.com>
Date: Tue, 04 Jun 2013 15:11:36 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Alon Levy <alevy@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
In-Reply-To: <1370377419-31788-1-git-send-email-alevy@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2WMGCRMGRCIUORSDJFAJR"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/5] oslib-posix: add
	qemu_pipe_non_block
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
X-List-Received-Date: Tue, 04 Jun 2013 21:11:45 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2WMGCRMGRCIUORSDJFAJR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 06/04/2013 02:23 PM, Alon Levy wrote:
> Used by the followin patch.

s/followin/following/

> =20
> +int qemu_pipe_non_block(int pipefd[2])
> +{
> +    int ret;
> +
> +    ret =3D qemu_pipe(pipefd);

qemu_pipe() already uses pipe2() when available; it seems like it would
be nicer to use pipe2's O_NONBLOCK option directly in one syscall (where
supported) instead of having to make additional syscalls after the fact.
 Would it just be smarter to change the signature of qemu_pipe() to add
a bool block parameter, and then change the 5 existing callers to pass
false with your later patch in the series passing true, and do it
without creating a new wrapper?

> +    if (ret) {
> +        return ret;
> +    }
> +    if (fcntl(card->pipe[0], F_SETFL, O_NONBLOCK) =3D=3D -1) {
> +        return -errno;
> +    }
> +    if (fcntl(card->pipe[1], F_SETFL, O_NONBLOCK) =3D=3D -1) {
> +        return -errno;

Leaks fds.  If you're going to report error, then you must close the fds
already created.

> +    }
> +    if (fcntl(card->pipe[0], F_SETOWN, getpid()) =3D=3D -1) {
> +        return -errno;

Same comment about fd leaks.

This part seems like a useful change, IF you plan on using SIGIO and
SIGURG signals; and it is something which pipe2() cannot optimize, so I
can see why you are adding a new function instead of changing
qemu_pipe() and adjust all its callers to pass an additional parameter.
 But are you really planning on using SIGIO/SIGURG?

Furthermore, this is undefined behavior.  According to POSIX, use of
F_SETOWN is only portable on sockets, not pipes.  It may work on Linux,
but you'll need to be aware of what it does on other platforms.
http://pubs.opengroup.org/onlinepubs/9699919799/functions/fcntl.html
--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2WMGCRMGRCIUORSDJFAJR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJRrlgIAAoJEKeha0olJ0Nqb4sIAJ4vj/nKYf2B65JPThJ7we56
Sfw1BxFH+bg5CyHgyqQ46nGeWH10t1lA+9VfFkTXlhD7N2dIPNEBhy7p5tO8Efj0
YDKcLsFPxGX1t/luCFzZdlcsit+C+Sz4lqdAmf9O16WemeByOpBPJnJFB3ec5nnU
+5CqsLyfnThneJk8PqSSmhLmImzVSdJeLN5vC2Yni3Qkt1k84EWrteatpGKvPowt
Ksp2Mi0nR42TymmnXbUn4kAHYDSsfR+KU0+c0st/K64qnjkivlX/+rscyk2wMd2H
6lXTbUKPACV6IOt406MZBaz7LWjnxz00wBaiFGlfPJxCK0sCuX4NOOxdbwfEtu4=
=evgq
-----END PGP SIGNATURE-----

------enig2WMGCRMGRCIUORSDJFAJR--

