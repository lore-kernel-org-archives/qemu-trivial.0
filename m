Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cnmR8-00033B-N8
	for mharc-qemu-trivial@gnu.org; Tue, 14 Mar 2017 09:24:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cnmR6-000311-1d
	for qemu-trivial@nongnu.org; Tue, 14 Mar 2017 09:24:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cnmR5-0003aZ-78
	for qemu-trivial@nongnu.org; Tue, 14 Mar 2017 09:24:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54360)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cnmR0-0003PG-FZ; Tue, 14 Mar 2017 09:24:18 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0A7920264;
	Tue, 14 Mar 2017 13:24:16 +0000 (UTC)
Received: from [10.10.121.52] (ovpn-121-52.rdu2.redhat.com [10.10.121.52] (may
	be forged))
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v2EDOFi9031146; Tue, 14 Mar 2017 09:24:15 -0400
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>,
	qemu devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>
References: <1489477952-6901-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <14a8d8e9-fe37-5f32-c3c2-05419447fff6@redhat.com>
Date: Tue, 14 Mar 2017 08:24:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1489477952-6901-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="iFoe0CnpE29WcK9HflLB8fKLl5LCer2Ki"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 14 Mar 2017 13:24:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/net/virtio-net.c: Follow
 CODING_STYLE
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
X-List-Received-Date: Tue, 14 Mar 2017 13:24:25 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iFoe0CnpE29WcK9HflLB8fKLl5LCer2Ki
Content-Type: multipart/mixed; boundary="Hb0wu4oRtH4do6cTh4ON28SJF3OsJlCEJ";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>,
 qemu devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <14a8d8e9-fe37-5f32-c3c2-05419447fff6@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] hw/net/virtio-net.c: Follow CODING_STYLE
References: <1489477952-6901-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
In-Reply-To: <1489477952-6901-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>

--Hb0wu4oRtH4do6cTh4ON28SJF3OsJlCEJ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/14/2017 02:52 AM, Zhang Chen wrote:
> Signed-off-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
> ---
>  hw/net/virtio-net.c | 53 +++++++++++++++++++++++++++++++++------------=
--------
>  1 file changed, 33 insertions(+), 20 deletions(-)
>=20
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index c321680..ede618e 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -273,7 +273,7 @@ static void virtio_net_set_status(struct VirtIODevi=
ce *vdev, uint8_t status)
>          if (queue_started) {
>              if (q->tx_timer) {
>                  timer_mod(q->tx_timer,
> -                               qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +=
 n->tx_timeout);
> +                         qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx=
_timeout);

Indentation still looks off.  You want the two q's to be in the same colu=
mn.

Otherwise looks okay. Wholesale reformatting of a file with no other
changes tends to make 'git blame' attribution a bit noisier than
necessary, so it's a maintainer's judgment call whether to take it.  But
with the indentation fixed, you can add:
Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--Hb0wu4oRtH4do6cTh4ON28SJF3OsJlCEJ--

--iFoe0CnpE29WcK9HflLB8fKLl5LCer2Ki
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYx+79AAoJEKeha0olJ0NqWaQH/i46jcXjl+P4en4pWzyAWBl9
09YiPZ+/KGN8BJdlfFJ+4IMBEuoe7l9nCAkMfUwF8Xbx/3oQxyThiWA+n/kRMXTE
8a39CL5TGKGz7jcIte0ORa+4nG1w/0tLf8UE1dv/IMr4KkE6HQI+YqKHtS8ZO6L6
qscIQdu9r7ZgUWaaD6jSK8i9yo0c0u8WkzbE2F6Wk4Evz18zY4MrjEZLXpdg7O+O
DXcIVd9JI5R0gH6lvxDqfSUTom03gPA6BN8BWonjX5M9hyjPhVM4ekiYLNWdNX5G
PYMF30j7MSlihaOZLqEniPdD/+r5Gpoz4wfjr8F52u8uHbku8lbMRD5Xs30utKg=
=EdmU
-----END PGP SIGNATURE-----

--iFoe0CnpE29WcK9HflLB8fKLl5LCer2Ki--

