Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UVPW8-0005yX-En
	for mharc-qemu-trivial@gnu.org; Thu, 25 Apr 2013 12:59:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UVPW1-0005kq-6H
	for qemu-trivial@nongnu.org; Thu, 25 Apr 2013 12:59:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UVPVz-0007KH-AS
	for qemu-trivial@nongnu.org; Thu, 25 Apr 2013 12:59:25 -0400
Received: from mail-lb0-f171.google.com ([209.85.217.171]:48679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UVPVz-0007IJ-3d
	for qemu-trivial@nongnu.org; Thu, 25 Apr 2013 12:59:23 -0400
Received: by mail-lb0-f171.google.com with SMTP id v10so2976261lbd.2
	for <qemu-trivial@nongnu.org>; Thu, 25 Apr 2013 09:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=N41vSfHaN6IacXuZJfWp7J80FiHvFa4IInhvknOK3+U=;
	b=MXGgXQTG0B3spDiFJtOhQmkY0X5F4CsJpyvhaAgqbn20Ya0bRVHyzzWRS03JUVY4aU
	cBqj9hqMKsIFiO6wZr1FQb6adfhGmkZFEw+2X5qAe9OxCEFmaJf0nPhsIQgbSloqzerH
	zpg/Xol4VoD8un71JfEaVRKmc+pu4wa76j4nZwnwuh9/osLhWssizVTEpiwEpxmj3UCl
	++MlKq7M1ugQJ88s9amXdhCGCZ0sDFDI3fO+DbqTDgsXTG9QzGUnuAu1bYXz14FtIIrC
	1op+vGNGRkrzXa1+j+HJDWl9elCHvxRqhxo8A543K8OnlWcLPPl62ugUzTHSzITzQKhg
	r+ig==
X-Received: by 10.112.132.166 with SMTP id ov6mr20061770lbb.71.1366909161922; 
	Thu, 25 Apr 2013 09:59:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.198.198 with HTTP; Thu, 25 Apr 2013 09:59:01 -0700 (PDT)
In-Reply-To: <1366906631-2680-1-git-send-email-emaste@freebsd.org>
References: <1366906631-2680-1-git-send-email-emaste@freebsd.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Apr 2013 17:59:01 +0100
Message-ID: <CAFEAcA-CJXXnvUSnejp-uaffEtonLwuYsduyUzmRQ-gZ4qiO9Q@mail.gmail.com>
To: Ed Maste <emaste@freebsd.org>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnnryM5mRUYmhr1rc2VcBR0FuWL4Ff+8xdDtCzxn90xzKHFPy69E/MeggGZNhoP673ximwY
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.171
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove unnecessary FreeBSD
	#include
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
X-List-Received-Date: Thu, 25 Apr 2013 16:59:31 -0000

On 25 April 2013 17:17, Ed Maste <emaste@freebsd.org> wrote:
> sys/param.h was included to define __FreeBSD_version, but the conditional
> using it was removed by commit d05ef160453e98546a4197496dc8a3cb2defac53
> (Brad Smith, "Allow clock_gettime() monotonic clock to be utilized on more
> OS's"), so the include is no longer needed here.
>
> Signed-off-by: Ed Maste <emaste@freebsd.org>

CCing qemu-trivial for this.

(Our other use of __FreeBSD_version is preceded by a direct
include of sys/param.h in translate-all.c.)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

> ---
>  include/qemu/timer.h | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/include/qemu/timer.h b/include/qemu/timer.h
> index c363190..9dd206c 100644
> --- a/include/qemu/timer.h
> +++ b/include/qemu/timer.h
> @@ -5,10 +5,6 @@
>  #include "qemu/main-loop.h"
>  #include "qemu/notify.h"
>
> -#ifdef __FreeBSD__
> -#include <sys/param.h>
> -#endif
> -
>  /* timers */
>
>  #define SCALE_MS 1000000
> --
> 1.7.11.5
>

