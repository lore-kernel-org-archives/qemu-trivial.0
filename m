Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjpeR-0005cE-AO
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 07:43:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UjpeJ-0005QW-KN
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 07:43:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UjpeI-0007Lg-17
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 07:43:35 -0400
Received: from cantor2.suse.de ([195.135.220.15]:55621 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UjpeD-0007Kf-KW; Tue, 04 Jun 2013 07:43:29 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E553EA51CB;
	Tue,  4 Jun 2013 13:43:26 +0200 (CEST)
Message-ID: <51ADD2DD.3090909@suse.de>
Date: Tue, 04 Jun 2013 13:43:25 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: peter.crosthwaite@xilinx.com, pbonzini@redhat.com
References: <cover.1370237352.git.peter.crosthwaite@xilinx.com>
	<54b43e8b5fe6acff6fe667062d412c0b224f92f6.1370237352.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <54b43e8b5fe6acff6fe667062d412c0b224f92f6.1370237352.git.peter.crosthwaite@xilinx.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 2/3] memory:
 as_update_topology_pass: Improve comments
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
X-List-Received-Date: Tue, 04 Jun 2013 11:43:42 -0000

Am 03.06.2013 07:32, schrieb peter.crosthwaite@xilinx.com:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>=20
> These comments we're a little difficult to read. First one had

While we're picky: "were" - Paolo can you fix up in your queue?

Andreas

> incorrect parenthesis. The part about attributes changing is
> really applicable to the region being 'in both' rather than 'in
> new'
>=20
> Second comment has an obscure parenthetic about 'Logging may have
> changed'. Made clearer, as this if is supposed to handle the case where
> the memory region is unchanged (with the notable exception re logging).
>=20
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
>=20
>  memory.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/memory.c b/memory.c
> index 60e033b..7e710c4 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -719,7 +719,7 @@ static void address_space_update_topology_pass(Addr=
essSpace *as,
>                  || int128_lt(frold->addr.start, frnew->addr.start)
>                  || (int128_eq(frold->addr.start, frnew->addr.start)
>                      && !flatrange_equal(frold, frnew)))) {
> -            /* In old, but (not in new, or in new but attributes chang=
ed). */
> +            /* In old but not in new, or in both but attributes change=
d. */
> =20
>              if (!adding) {
>                  MEMORY_LISTENER_UPDATE_REGION(frold, as, Reverse, regi=
on_del);
> @@ -727,7 +727,7 @@ static void address_space_update_topology_pass(Addr=
essSpace *as,
> =20
>              ++iold;
>          } else if (frold && frnew && flatrange_equal(frold, frnew)) {
> -            /* In both (logging may have changed) */
> +            /* In both and unchanged (except logging may have changed)=
 */
> =20
>              if (adding) {
>                  MEMORY_LISTENER_UPDATE_REGION(frnew, as, Forward, regi=
on_nop);
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

