Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWFSz-000818-4F
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 02:22:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fWFSx-00080p-A6
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 02:22:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fWFSu-0007e2-Gd
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 02:22:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33108 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fWFSo-0007aO-ER; Fri, 22 Jun 2018 02:22:30 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47FAB8D685;
	Fri, 22 Jun 2018 06:22:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1ADC4111DD0B;
	Fri, 22 Jun 2018 06:22:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 4DD44143B3D; Fri, 22 Jun 2018 08:22:25 +0200 (CEST)
Date: Fri, 22 Jun 2018 08:22:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <20180622062225.ay4bubgshxjj3uey@sirius.home.kraxel.org>
References: <20180621171257.14897-1-f4bug@amsat.org>
	<20180621171257.14897-6-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180621171257.14897-6-f4bug@amsat.org>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 22 Jun 2018 06:22:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 22 Jun 2018 06:22:28 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH 05/11] hw/display/cirrus: Convert
 printf() calls to trace events
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
X-List-Received-Date: Fri, 22 Jun 2018 06:22:40 -0000

On Thu, Jun 21, 2018 at 02:12:51PM -0300, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  hw/display/cirrus_vga.c | 25 ++++++-------------------
>  hw/display/trace-events |  2 ++
>  2 files changed, 8 insertions(+), 19 deletions(-)
>=20
> diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
> index 138ae961b9..a826bef6ec 100644
> --- a/hw/display/cirrus_vga.c
> +++ b/hw/display/cirrus_vga.c
> @@ -2608,11 +2608,8 @@ static uint64_t cirrus_vga_ioport_read(void *opa=
que, hwaddr addr,
>  	    break;
>  	case 0x3c5:
>  	    val =3D cirrus_vga_read_sr(c);
> +        trace_vga_cirrus_read_reg("SR", s->sr_index, val);
>              break;
> -#ifdef DEBUG_VGA_REG
> -	    printf("vga: read SR%x =3D 0x%02x\n", s->sr_index, val);
> -#endif

Indention looks weird.

otherwise the patch looks fine.

cheers,
  Gerd


