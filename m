Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daQLU-0002B0-Bg
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 13:43:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1daQLS-00026d-4o
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 13:43:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1daQLR-0001fW-G1
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 13:43:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35554)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1daQLM-0001cl-9n; Wed, 26 Jul 2017 13:43:32 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 39BDA8E382;
	Wed, 26 Jul 2017 17:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 39BDA8E382
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=alex.williamson@redhat.com
Received: from w520.home (ovpn-116-254.phx2.redhat.com [10.3.116.254])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DDB8E5D96C;
	Wed, 26 Jul 2017 17:43:28 +0000 (UTC)
Date: Wed, 26 Jul 2017 11:43:28 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
	<marcandre.lureau@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <20170726114328.43416891@w520.home>
In-Reply-To: <20170724182751.18261-13-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-13-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 26 Jul 2017 17:43:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for 2.10 12/35] vfio/platform: fix use of
 freed memory
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
X-List-Received-Date: Wed, 26 Jul 2017 17:43:39 -0000

On Mon, 24 Jul 2017 15:27:28 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> free the data _after_ using it.
>=20
> hw/vfio/platform.c:126:29: warning: Use of memory after it is freed
>         qemu_set_fd_handler(*pfd, NULL, NULL, NULL);
>                             ^~~~
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/vfio/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
> index 7c09deda61..da84abf4fc 100644
> --- a/hw/vfio/platform.c
> +++ b/hw/vfio/platform.c
> @@ -120,11 +120,11 @@ static int vfio_set_trigger_eventfd(VFIOINTp *intp,
>      *pfd =3D event_notifier_get_fd(intp->interrupt);
>      qemu_set_fd_handler(*pfd, (IOHandler *)handler, NULL, intp);
>      ret =3D ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set);
> -    g_free(irq_set);
>      if (ret < 0) {
>          error_report("vfio: Failed to set trigger eventfd: %m");
>          qemu_set_fd_handler(*pfd, NULL, NULL, NULL);
>      }
> +    g_free(irq_set);
>      return ret;
>  }
> =20

I'll snag this and 13/35 for a pull request with Paolo's R-b.  Connie
has already put a fix in for the other vfio related one, 14/35.  Thanks!

Alex

