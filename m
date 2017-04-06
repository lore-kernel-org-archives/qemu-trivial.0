Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cw8Zw-0006n4-Ge
	for mharc-qemu-trivial@gnu.org; Thu, 06 Apr 2017 10:40:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sahid.ferdjaoui@redhat.com>) id 1cw4tE-0001yQ-Pa
	for qemu-trivial@nongnu.org; Thu, 06 Apr 2017 06:43:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sahid.ferdjaoui@redhat.com>) id 1cw4tD-0003qj-LM
	for qemu-trivial@nongnu.org; Thu, 06 Apr 2017 06:43:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39306)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sahid.ferdjaoui@redhat.com>)
	id 1cw4tA-0003pf-Uu; Thu, 06 Apr 2017 06:43:41 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7ACDB80494;
	Thu,  6 Apr 2017 10:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7ACDB80494
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=sahid.ferdjaoui@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7ACDB80494
Received: from localhost (ovpn-116-237.ams2.redhat.com [10.36.116.237])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0012299B35;
	Thu,  6 Apr 2017 10:43:36 +0000 (UTC)
Date: Thu, 6 Apr 2017 12:43:36 +0200
From: Sahid Orentino Ferdjaoui <sferdjao@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20170406104336.GA28959@redhat>
References: <20170403114044.15762-1-lvivier@redhat.com>
	<ef70b4ab-f71a-8235-dc63-ae34097436af@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <ef70b4ab-f71a-8235-dc63-ae34097436af@amsat.org>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 06 Apr 2017 10:43:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 06 Apr 2017 10:40:03 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio-gpu: replace
 PIXMAN_* by PIXMAN_BE_*
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
X-List-Received-Date: Thu, 06 Apr 2017 10:43:48 -0000

On Mon, Apr 03, 2017 at 09:28:02AM -0300, Philippe Mathieu-Daud=E9 wrote:
> On 04/03/2017 08:40 AM, Laurent Vivier wrote:
> > This avoids a "#ifdef HOST_WORDS_BIGENDIAN" and this is the purpose
> > of PIXMAN_BE_* macros.
> >=20
> > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>

Reviewed-by: Sahid Orentino Ferdjaoui <sahid.ferdjaoui@redhat.com>

>=20
> > ---
> >  hw/display/virtio-gpu.c | 35 ++++++++---------------------------
> >  1 file changed, 8 insertions(+), 27 deletions(-)
> >=20
> > diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> > index 9b530ab..7befcef 100644
> > --- a/hw/display/virtio-gpu.c
> > +++ b/hw/display/virtio-gpu.c
> > @@ -258,41 +258,22 @@ void virtio_gpu_get_display_info(VirtIOGPU *g,
> >  static pixman_format_code_t get_pixman_format(uint32_t virtio_gpu_fo=
rmat)
> >  {
> >      switch (virtio_gpu_format) {
> > -#ifdef HOST_WORDS_BIGENDIAN
> >      case VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM:
> > -        return PIXMAN_b8g8r8x8;
> > +        return PIXMAN_BE_b8g8r8x8;
> >      case VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM:
> > -        return PIXMAN_b8g8r8a8;
> > +        return PIXMAN_BE_b8g8r8a8;
> >      case VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM:
> > -        return PIXMAN_x8r8g8b8;
> > +        return PIXMAN_BE_x8r8g8b8;
> >      case VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM:
> > -        return PIXMAN_a8r8g8b8;
> > +        return PIXMAN_BE_a8r8g8b8;
> >      case VIRTIO_GPU_FORMAT_R8G8B8X8_UNORM:
> > -        return PIXMAN_r8g8b8x8;
> > +        return PIXMAN_BE_r8g8b8x8;
> >      case VIRTIO_GPU_FORMAT_R8G8B8A8_UNORM:
> > -        return PIXMAN_r8g8b8a8;
> > +        return PIXMAN_BE_r8g8b8a8;
> >      case VIRTIO_GPU_FORMAT_X8B8G8R8_UNORM:
> > -        return PIXMAN_x8b8g8r8;
> > +        return PIXMAN_BE_x8b8g8r8;
> >      case VIRTIO_GPU_FORMAT_A8B8G8R8_UNORM:
> > -        return PIXMAN_a8b8g8r8;
> > -#else
> > -    case VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM:
> > -        return PIXMAN_x8r8g8b8;
> > -    case VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM:
> > -        return PIXMAN_a8r8g8b8;
> > -    case VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM:
> > -        return PIXMAN_b8g8r8x8;
> > -    case VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM:
> > -        return PIXMAN_b8g8r8a8;
> > -    case VIRTIO_GPU_FORMAT_R8G8B8X8_UNORM:
> > -        return PIXMAN_x8b8g8r8;
> > -    case VIRTIO_GPU_FORMAT_R8G8B8A8_UNORM:
> > -        return PIXMAN_a8b8g8r8;
> > -    case VIRTIO_GPU_FORMAT_X8B8G8R8_UNORM:
> > -        return PIXMAN_r8g8b8x8;
> > -    case VIRTIO_GPU_FORMAT_A8B8G8R8_UNORM:
> > -        return PIXMAN_r8g8b8a8;
> > -#endif
> > +        return PIXMAN_BE_a8b8g8r8;
> >      default:
> >          return 0;
> >      }
> >=20

