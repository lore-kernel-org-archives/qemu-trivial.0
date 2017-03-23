Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cr3Pe-00026T-Dk
	for mharc-qemu-trivial@gnu.org; Thu, 23 Mar 2017 10:08:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cr3PX-00021O-6I
	for qemu-trivial@nongnu.org; Thu, 23 Mar 2017 10:08:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cr3PV-0004Cx-S3
	for qemu-trivial@nongnu.org; Thu, 23 Mar 2017 10:08:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52012)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cr3PP-0004AU-Fv; Thu, 23 Mar 2017 10:08:11 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76874624B3;
	Thu, 23 Mar 2017 14:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 76874624B3
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 76874624B3
Received: from [10.36.117.89] (ovpn-117-89.ams2.redhat.com [10.36.117.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA48F7E48E;
	Thu, 23 Mar 2017 14:08:02 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20170323113156.9277-1-marcandre.lureau@redhat.com>
Cc: samuel.thibault@ens-lyon.org, jan.kiszka@siemens.com,
	qemu-trivial@nongnu.org
From: Thomas Huth <thuth@redhat.com>
Message-ID: <78193f29-1706-5d32-e87c-1e5a844ead43@redhat.com>
Date: Thu, 23 Mar 2017 15:07:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170323113156.9277-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 23 Mar 2017 14:08:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: tftp,
 copy sockaddr_size
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
X-List-Received-Date: Thu, 23 Mar 2017 14:08:25 -0000

On 23.03.2017 12:31, Marc-Andr=C3=A9 Lureau wrote:
> ASAN detects an "unknown-crash" when running pxe-test:
>=20
> /ppc64/pxe/spapr-vlan: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D7143=3D=3DERROR: AddressSanitizer: unknown-crash on address 0x7f6=
dcd298d30 at pc 0x55e22218830d bp 0x7f6dcd2989e0 sp 0x7f6dcd2989d0
> READ of size 128 at 0x7f6dcd298d30 thread T2
>     #0 0x55e22218830c in tftp_session_allocate /home/elmarco/src/qq/sli=
rp/tftp.c:73
>     #1 0x55e22218a1f8 in tftp_handle_rrq /home/elmarco/src/qq/slirp/tft=
p.c:289
>     #2 0x55e22218b54c in tftp_input /home/elmarco/src/qq/slirp/tftp.c:4=
46
>     #3 0x55e2221833fe in udp6_input /home/elmarco/src/qq/slirp/udp6.c:8=
2
>     #4 0x55e222137b17 in ip6_input /home/elmarco/src/qq/slirp/ip6_input=
.c:67
>=20
> Address 0x7f6dcd298d30 is located in stack of thread T2 at offset 96 in=
 frame
>     #0 0x55e222182420 in udp6_input /home/elmarco/src/qq/slirp/udp6.c:1=
3
>=20
>   This frame has 3 object(s):
>     [32, 48) '<unknown>'
>     [96, 124) 'lhost' <=3D=3D Memory access at offset 96 partially over=
flows this variable
>     [160, 200) 'save_ip' <=3D=3D Memory access at offset 96 partially u=
nderflows this variable
>=20
> The sockaddr_storage pointer is the sockaddr_in6 lhost on the
> stack. Copy only the source addr size.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  slirp/tftp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/slirp/tftp.c b/slirp/tftp.c
> index 50e714807d..a9bc4bb1b6 100644
> --- a/slirp/tftp.c
> +++ b/slirp/tftp.c
> @@ -70,7 +70,7 @@ static int tftp_session_allocate(Slirp *slirp, struct=
 sockaddr_storage *srcsas,
> =20
>   found:
>    memset(spt, 0, sizeof(*spt));
> -  spt->client_addr =3D *srcsas;
> +  memcpy(&spt->client_addr, srcsas, sockaddr_size(srcsas));
>    spt->fd =3D -1;
>    spt->block_size =3D 512;
>    spt->client_port =3D tp->udp.uh_sport;
>=20

Makes sense.

Reviewed-by: Thomas Huth <thuth@redhat.com>


