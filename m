Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QgkWj-0001d3-47
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jul 2011 17:29:57 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QgkWc-0001bR-7C
	for qemu-trivial@nongnu.org; Tue, 12 Jul 2011 17:29:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QgkWX-0008OM-Su
	for qemu-trivial@nongnu.org; Tue, 12 Jul 2011 17:29:49 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:60680)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1QgkWO-0008Lz-7O; Tue, 12 Jul 2011 17:29:36 -0400
Received: by qwj8 with SMTP id 8so3576007qwj.4
	for <multiple recipients>; Tue, 12 Jul 2011 14:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=wisKsuR6ptURE4lxTe+2dIzzgcpto27vQJelqU65xNs=;
	b=khqBqGos4uBclyEsADwNMolHNsi84jeRCPrl+HdZNFbWucB6BJbD4hQr0UY9VT1zB/
	dGY8g96w/anrx1Epvx58bBdAuiPBkr5DK9/CAkHfY7IY2a/iGh64wVR0lguRAyNm2F1A
	/3Zwv+8OKAJv3qqKM3nz0S55ncxx6FbGhdeSc=
Received: by 10.224.29.12 with SMTP id o12mr446543qac.20.1310506174200; Tue,
	12 Jul 2011 14:29:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.74.13 with HTTP; Tue, 12 Jul 2011 14:29:14 -0700 (PDT)
In-Reply-To: <1309813366-7994-1-git-send-email-peter.maydell@linaro.org>
References: <1309813366-7994-1-git-send-email-peter.maydell@linaro.org>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Wed, 13 Jul 2011 00:29:14 +0300
Message-ID: <CAAu8pHvPmWge_CmcGYP3ti0sHC1G-F3cgAv+FLJi=CMMQvzPgQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-alpha,
 target-ppc: Remove unnecessary setjmp.h include
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
X-List-Received-Date: Tue, 12 Jul 2011 21:29:54 -0000

Thanks, applied.

On Tue, Jul 5, 2011 at 12:02 AM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> Remove the include of setjmp.h from the cpu.h of target-alpha
> and target-ppc. This is unnecessary because cpu-defs.h already
> includes this header; this change brings these two targets
> into line with all the rest.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> =C2=A0target-alpha/cpu.h | =C2=A0 =C2=A02 --
> =C2=A0target-ppc/cpu.h =C2=A0 | =C2=A0 =C2=A02 --
> =C2=A02 files changed, 0 insertions(+), 4 deletions(-)
>
> diff --git a/target-alpha/cpu.h b/target-alpha/cpu.h
> index 411bd55..78caa79 100644
> --- a/target-alpha/cpu.h
> +++ b/target-alpha/cpu.h
> @@ -28,8 +28,6 @@
>
> =C2=A0#include "cpu-defs.h"
>
> -#include <setjmp.h>
> -
> =C2=A0#include "softfloat.h"
>
> =C2=A0#define TARGET_HAS_ICE 1
> diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
> index 84f8ff6..d903366 100644
> --- a/target-ppc/cpu.h
> +++ b/target-ppc/cpu.h
> @@ -75,8 +75,6 @@
>
> =C2=A0#include "cpu-defs.h"
>
> -#include <setjmp.h>
> -
> =C2=A0#include "softfloat.h"
>
> =C2=A0#define TARGET_HAS_ICE 1
> --
> 1.7.4.1
>
>
>

