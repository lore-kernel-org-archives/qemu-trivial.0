Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qph9O-0002ox-9h
	for mharc-qemu-trivial@gnu.org; Sat, 06 Aug 2011 09:42:50 -0400
Received: from eggs.gnu.org ([140.186.70.92]:38122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1QpDiG-0007vq-PF
	for qemu-trivial@nongnu.org; Fri, 05 Aug 2011 02:16:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1QpDiF-0005pj-N2
	for qemu-trivial@nongnu.org; Fri, 05 Aug 2011 02:16:52 -0400
Received: from fmmailgate03.web.de ([217.72.192.234]:41925)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1QpDiD-0005pN-3h; Fri, 05 Aug 2011 02:16:49 -0400
Received: from smtp04.web.de  ( [172.20.0.225])
	by fmmailgate03.web.de (Postfix) with ESMTP id 021291974FB52;
	Fri,  5 Aug 2011 08:16:48 +0200 (CEST)
Received: from [88.65.250.235] (helo=mchn199C.mchp.siemens.de)
	by smtp04.web.de with asmtp (TLSv1:AES256-SHA:256) (WEB.DE 4.110 #2)
	id 1QpDiB-0007vr-00; Fri, 05 Aug 2011 08:16:47 +0200
Message-ID: <4E3B8ACA.7080104@web.de>
Date: Fri, 05 Aug 2011 08:16:42 +0200
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: David Gibson <david@gibson.dropbear.id.au>
References: <1312516970-26606-1-git-send-email-david@gibson.dropbear.id.au>
In-Reply-To: <1312516970-26606-1-git-send-email-david@gibson.dropbear.id.au>
X-Enigmail-Version: 1.2
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigC224A13DCFB3A9C505228A87"
Sender: jan.kiszka@web.de
X-Sender: jan.kiszka@web.de
X-Provags-ID: V01U2FsdGVkX1/214oe85VKr2EQtsN4G8MLS4oOaZXVBJp07oUe
	g+SxjENqnDHYp2tcKfEwZTYGss+6tBejRyTqx69pooTYUJa/HQ lz93wzcmo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.234
X-Mailman-Approved-At: Sat, 06 Aug 2011 09:42:49 -0400
Cc: Avi Kivity <avi@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-devel@nongnu.org, kvm <kvm@vger.kernel.org>, agraf@suse.de
Subject: Re: [Qemu-trivial] [PATCH] Permit -mem-path without sync mmu
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
X-List-Received-Date: Fri, 05 Aug 2011 06:16:53 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigC224A13DCFB3A9C505228A87
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

On 2011-08-05 06:02, David Gibson wrote:
> At present, an explicit test disallows use of -mem-path when kvm is ena=
bled
> but KVM_CAP_SYNC_MMU is not set.  In particular, this prevents the user=

> from using hugetlbfs to back the guest memory.
>=20
> I can see no reason for this check, and when I asked about it previousl=
y,
> the only theory offered was that this was a limitation of the very earl=
y
> days of kvm which only happened to match the SYNC_MMU flag by accident.=

>=20
> This patch, therefore, removes the check.  This is of particular use to=

> us on POWER, where we haven't yet implement SYNC_MMU, but where backing=

> the guest with hugepages is possible, and in fact mandatory (for now).
>=20
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  exec.c |    5 -----
>  1 files changed, 0 insertions(+), 5 deletions(-)
>=20
> diff --git a/exec.c b/exec.c
> index 476b507..041637c 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -2818,11 +2818,6 @@ static void *file_ram_alloc(RAMBlock *block,
>          return NULL;
>      }
> =20
> -    if (kvm_enabled() && !kvm_has_sync_mmu()) {
> -        fprintf(stderr, "host lacks kvm mmu notifiers, -mem-path unsup=
ported\n");
> -        return NULL;
> -    }
> -
>      if (asprintf(&filename, "%s/qemu_back_mem.XXXXXX", path) =3D=3D -1=
) {
>          return NULL;
>      }

This is nothing trivial, see ce9a92411d in qemu-kvm or
http://thread.gmane.org/gmane.comp.emulators.kvm.devel/27380. And it
should rather target uq/master. CCing Avi, Marcelo, and the kvm list.

Jan


--------------enigC224A13DCFB3A9C505228A87
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk47itAACgkQitSsb3rl5xR1jQCdE5r8MEFmXnax/mH57uBbhIQh
wBUAni5t4xlY+RLsXjqxOtRbgIpaUknF
=zY2/
-----END PGP SIGNATURE-----

--------------enigC224A13DCFB3A9C505228A87--

