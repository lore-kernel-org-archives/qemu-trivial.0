Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WsuvQ-0002at-8U
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jun 2014 10:15:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1WsuvJ-0002Pg-13
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 10:15:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1WsuvC-0002xK-Sm
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 10:15:12 -0400
Received: from lputeaux-656-01-25-125.w80-12.abo.wanadoo.fr
	([80.12.84.125]:46345 helo=paradis.irqsave.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>)
	id 1Wsuv0-0002l8-M5; Fri, 06 Jun 2014 10:14:54 -0400
Received: from irqsave.net (unknown [192.168.77.254])
	by paradis.irqsave.net (Postfix) with ESMTP id 2E6EFA7EBC;
	Fri,  6 Jun 2014 16:14:54 +0200 (CEST)
Date: Fri, 6 Jun 2014 16:14:54 +0200
From: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20140606141453.GE16494@irqsave.net>
References: <1402063613-12400-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1402063613-12400-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 80.12.84.125
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vdi: remove double
	conversion
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
X-List-Received-Date: Fri, 06 Jun 2014 14:15:19 -0000

The Friday 06 Jun 2014 =E0 16:06:52 (+0200), Paolo Bonzini wrote :
> This should be a problem when running on big-endian machines.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
> 	It's time to clean up old branch, and I found this nice little
> 	patch from May 2012.
>=20
>  block/vdi.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/block/vdi.c b/block/vdi.c
> index 119d3c7..993430e 100644
> --- a/block/vdi.c
> +++ b/block/vdi.c
> @@ -237,7 +237,6 @@ static void vdi_header_to_le(VdiHeader *header)
>      cpu_to_le32s(&header->block_extra);
>      cpu_to_le32s(&header->blocks_in_image);
>      cpu_to_le32s(&header->blocks_allocated);
> -    cpu_to_le32s(&header->blocks_allocated);
>      uuid_convert(header->uuid_image);
>      uuid_convert(header->uuid_last_snap);
>      uuid_convert(header->uuid_link);
> --=20
> 1.8.3.1
>=20
>=20
Reviewed-by: Benoit Canet <benoit@irqsave.net>

