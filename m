Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bF2OP-0000j9-VW
	for mharc-qemu-trivial@gnu.org; Mon, 20 Jun 2016 12:49:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bF2OJ-0000eW-NI
	for qemu-trivial@nongnu.org; Mon, 20 Jun 2016 12:49:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bF2OH-0000ZX-CN
	for qemu-trivial@nongnu.org; Mon, 20 Jun 2016 12:49:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36190)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bF2O7-0000Vq-TX; Mon, 20 Jun 2016 12:49:28 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 36C81B5379;
	Mon, 20 Jun 2016 16:49:27 +0000 (UTC)
Received: from [10.3.116.124] (ovpn-116-124.phx2.redhat.com [10.3.116.124])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5KGnQKT028683; Mon, 20 Jun 2016 12:49:26 -0400
To: Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>
References: <1466416292-9615-1-git-send-email-laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <57681E96.507@redhat.com>
Date: Mon, 20 Jun 2016 10:49:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1466416292-9615-1-git-send-email-laurent@vivier.eu>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="7STTTlaK9f44ceLCGvDwdq7fIBd8Src42"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 20 Jun 2016 16:49:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user,
 trivial: display "0x%x" instead of "0x%d"
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
X-List-Received-Date: Mon, 20 Jun 2016 16:49:44 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7STTTlaK9f44ceLCGvDwdq7fIBd8Src42
Content-Type: multipart/mixed; boundary="dhdAgu5wJtSTOWD5PmHDEkvont57EJPx9"
From: Eric Blake <eblake@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <57681E96.507@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] linux-user, trivial: display "0x%x" instead
 of "0x%d"
References: <1466416292-9615-1-git-send-email-laurent@vivier.eu>
In-Reply-To: <1466416292-9615-1-git-send-email-laurent@vivier.eu>

--dhdAgu5wJtSTOWD5PmHDEkvont57EJPx9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/20/2016 03:51 AM, Laurent Vivier wrote:
> Display an exception number, generally defined as an hexadecimal
> number (for instance, EXCP_HLT is 0x10001).
>=20
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
> Resent to fix qemu-trivial email address.
>=20
>  linux-user/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

Can you also fix the occurrence of 0x%d in trace-events, for
mhp_pc_dimm_assigned_slot()? (Or whatever file it lands in after the
trace-events split pull request)

> diff --git a/linux-user/main.c b/linux-user/main.c
> index b9a4e0e..c79f5cb 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -2036,7 +2036,7 @@ void cpu_loop(CPUPPCState *env)
>              /* just indicate that signals should be handled asap */
>              break;
>          default:
> -            cpu_abort(cs, "Unknown exception 0x%d. Aborting\n", trapnr=
);
> +            cpu_abort(cs, "Unknown exception 0x%x. Aborting\n", trapnr=
);
>              break;
>          }
>          process_pending_signals(env);
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--dhdAgu5wJtSTOWD5PmHDEkvont57EJPx9--

--7STTTlaK9f44ceLCGvDwdq7fIBd8Src42
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXaB6WAAoJEKeha0olJ0Nqp20H/idEuQYqpERs2oefuzAGC+pk
1yvA/8lhmSlfujyrePJb9MojpTPiJq48FftnogQcvhffsEgBhD9yi0pMQkBOMWLR
k1aAJ5OTdRRA/MBy8GemjsQOTZSI90WYRRdOhX7DpkYcKLzJ2nef00h00Drg0bAZ
Hqm1B2udVeVbHY5BuHy1y43a9VEvyCFAVDcGLV3ZKiZnQ9tqXKv8qzOQSSZ4q2xG
znPeQBzT9U4JfMKLGC8kY8RiKWRydjHNKWfosHge8M7mb/ziVdhEZjgBrEhQ9K16
L3t3+L61+DzmPwDK0/0LPI1I2hQQXK7wlqlT8t2Pj2GHBii9udA4Fj1tDsjPG8U=
=f64V
-----END PGP SIGNATURE-----

--7STTTlaK9f44ceLCGvDwdq7fIBd8Src42--

