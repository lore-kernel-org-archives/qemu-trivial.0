Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hS0Cs-0001vw-QF
	for mharc-qemu-trivial@gnu.org; Sat, 18 May 2019 10:21:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hS0Cp-0001pX-CW
	for qemu-trivial@nongnu.org; Sat, 18 May 2019 10:21:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hS0Co-00077X-Fq
	for qemu-trivial@nongnu.org; Sat, 18 May 2019 10:20:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51996)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1hS0Cm-00075g-7w; Sat, 18 May 2019 10:20:56 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D24D3082141;
	Sat, 18 May 2019 14:20:55 +0000 (UTC)
Received: from x1.home (ovpn-117-92.phx2.redhat.com [10.3.117.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97B5A59142;
	Sat, 18 May 2019 14:20:52 +0000 (UTC)
Date: Sat, 18 May 2019 08:20:52 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Li Qiang <liq3ea@163.com>
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	liq3ea@gmail.com, philmd@redhat.com
Message-ID: <20190518082052.4e9884d1@x1.home>
In-Reply-To: <20190518032811.60341-3-liq3ea@163.com>
References: <20190518032811.60341-1-liq3ea@163.com>
	<20190518032811.60341-3-liq3ea@163.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Sat, 18 May 2019 14:20:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 3/4] vfio: platform: fix a typo
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
X-List-Received-Date: Sat, 18 May 2019 14:21:00 -0000

On Fri, 17 May 2019 20:28:10 -0700
Li Qiang <liq3ea@163.com> wrote:

An actual trivial patch, but it could still use a commit message.

> CC: qemu-trivial@nongnu.org
> Signed-off-by: Li Qiang <liq3ea@163.com>
> ---
>  hw/vfio/platform.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
> index e59a0234dd..d52d6552e0 100644
> --- a/hw/vfio/platform.c
> +++ b/hw/vfio/platform.c
> @@ -72,7 +72,7 @@ static VFIOINTp *vfio_init_intp(VFIODevice *vbasedev,
>          g_free(intp->interrupt);
>          g_free(intp);
>          error_setg_errno(errp, -ret,
> -                         "failed to initialize trigger eventd notifier");
> +                         "failed to initialize trigger eventfd notifier");
>          return NULL;
>      }
>      if (vfio_irq_is_automasked(intp)) {
> @@ -84,7 +84,7 @@ static VFIOINTp *vfio_init_intp(VFIODevice *vbasedev,
>              g_free(intp->unmask);
>              g_free(intp);
>              error_setg_errno(errp, -ret,
> -                             "failed to initialize resample eventd notifier");
> +                             "failed to initialize resample eventfd notifier");
>              return NULL;
>          }
>      }


