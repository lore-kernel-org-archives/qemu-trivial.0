Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YqLco-0001WF-KU
	for mharc-qemu-trivial@gnu.org; Thu, 07 May 2015 09:14:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1YqLch-0001LR-8O
	for qemu-trivial@nongnu.org; Thu, 07 May 2015 09:14:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1YqLcg-0004KK-Bd
	for qemu-trivial@nongnu.org; Thu, 07 May 2015 09:13:55 -0400
Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235]:33725)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>)
	id 1YqLcU-0004Hj-BJ; Thu, 07 May 2015 09:13:42 -0400
Received: by obblk2 with SMTP id lk2so30949967obb.0;
	Thu, 07 May 2015 06:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ljBCWiq51JywAxz4klsiFe99CzMICf31FdfCOyF2HrA=;
	b=tEnu6pfIHapMLUiCymI6ihR3hh1wTRj2GAB71rLwn5V5HOJN+WlunnOAm/qPVMa/WJ
	SfOaBDQUIRpU7EaXBsVBBWi1Lc+yR8h8dtYv1Vn3Xv75P72leq/f3Hebi7+mshfjQNFO
	xZg0jwz1lFYXIzlo24y6HfqtvJHGVLD2a64vElSPNTJGegD+Nm5h60a0KRe5dKReGY1f
	pG7j0uOfQKIfR82nLFDwnpxCyvd2vrijEN20PzmxDT7UYSYw9ncxJoXNhE4kJ0T0zXzj
	q7u6BD+2U4+2+qnPaM24PLe2MzcI43c1CDHfsvboyxzsH9X4MfaDl3+Bla12YFbJGTpi
	tvTQ==
MIME-Version: 1.0
X-Received: by 10.202.136.131 with SMTP id k125mr3077201oid.2.1431004421675;
	Thu, 07 May 2015 06:13:41 -0700 (PDT)
Received: by 10.182.14.68 with HTTP; Thu, 7 May 2015 06:13:41 -0700 (PDT)
In-Reply-To: <1430995260-31458-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1430995260-31458-1-git-send-email-mjt@msgid.tls.msk.ru>
Date: Thu, 7 May 2015 15:13:41 +0200
Message-ID: <CABoDooP73TndpZ9i1+u47fp=4xNL3+rNyv8nMYfMst0ubNNHEA@mail.gmail.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::235
Cc: qemu-trivial@nongnu.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] glib-compat.h: change
	assert to g_assert
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
X-List-Received-Date: Thu, 07 May 2015 13:14:01 -0000

Hello,

On Thu, May 7, 2015 at 12:41 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> include/glib-compat.h defines a bunch of functions based on glib primitives,
> and uses assert() without including assert.h.  Replace assert() with
> g_assert() to make the file more self-contained, and to fix compilation
> breakage after 28507a415a9b1e.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Tested-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  include/glib-compat.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/include/glib-compat.h b/include/glib-compat.h
> index 011352b..28d9f15 100644
> --- a/include/glib-compat.h
> +++ b/include/glib-compat.h
> @@ -115,7 +115,7 @@ static inline void g_mutex_init(CompatGMutex *mutex)
>
>  static inline void g_mutex_clear(CompatGMutex *mutex)
>  {
> -    assert(mutex->once.status != G_ONCE_STATUS_PROGRESS);
> +    g_assert(mutex->once.status != G_ONCE_STATUS_PROGRESS);
>      if (mutex->once.retval) {
>          g_mutex_free((GMutex *) mutex->once.retval);
>      }
> @@ -155,7 +155,7 @@ static inline void g_cond_init(CompatGCond *cond)
>
>  static inline void g_cond_clear(CompatGCond *cond)
>  {
> -    assert(cond->once.status != G_ONCE_STATUS_PROGRESS);
> +    g_assert(cond->once.status != G_ONCE_STATUS_PROGRESS);
>      if (cond->once.retval) {
>          g_cond_free((GCond *) cond->once.retval);
>      }
> @@ -164,7 +164,7 @@ static inline void g_cond_clear(CompatGCond *cond)
>
>  static inline void (g_cond_wait)(CompatGCond *cond, CompatGMutex *mutex)
>  {
> -    assert(mutex->once.status != G_ONCE_STATUS_PROGRESS);
> +    g_assert(mutex->once.status != G_ONCE_STATUS_PROGRESS);
>      g_once(&cond->once, do_g_cond_new, NULL);
>      g_cond_wait((GCond *) cond->once.retval, (GMutex *) mutex->once.retval);
>  }
> --
> 2.1.4
>
>

