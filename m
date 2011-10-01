Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R9yJa-0008Gp-No
	for mharc-qemu-trivial@gnu.org; Sat, 01 Oct 2011 08:05:10 -0400
Received: from eggs.gnu.org ([140.186.70.92]:43148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1R9yJX-00087X-SB
	for qemu-trivial@nongnu.org; Sat, 01 Oct 2011 08:05:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1R9yJW-0001TL-Ip
	for qemu-trivial@nongnu.org; Sat, 01 Oct 2011 08:05:07 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:45954)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1R9yJU-0001Hn-G9; Sat, 01 Oct 2011 08:05:04 -0400
Received: by mail-qw0-f45.google.com with SMTP id b10so1160307qad.4
	for <multiple recipients>; Sat, 01 Oct 2011 05:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=A4jY69hVJCV2lZxJf7VGIxoAiPoBIanDblbXvCyCgsY=;
	b=Aen3WpcEFKqj9ZueqatVKD41P2+ottMi1HwOeSX4dfqyXWKtaT/HbZ6wC6+CGg/Bne
	pk+qGWA9qno+/rw87r8R4yTO3fMuc+MQ1IKD3qZJOzqryU1hTRicTajzzKW2MuY5njtI
	1rIxpAR1h4t+BcKwuTufnpFqhbQSoSDhI7e60=
Received: by 10.224.184.196 with SMTP id cl4mr638361qab.9.1317470704120; Sat,
	01 Oct 2011 05:05:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.6.129 with HTTP; Sat, 1 Oct 2011 05:04:44 -0700 (PDT)
In-Reply-To: <1317052615-21607-1-git-send-email-peter.maydell@linaro.org>
References: <1317052615-21607-1-git-send-email-peter.maydell@linaro.org>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 1 Oct 2011 12:04:44 +0000
Message-ID: <CAAu8pHvR=zjdwUtEmTmOQHnqeYv=R3seizZwLBUDiydj5fF43A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] softfloat: Reinstate
 accidentally disabled target-specific NaN handling
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
X-List-Received-Date: Sat, 01 Oct 2011 12:05:09 -0000

Thanks, applied.

On Mon, Sep 26, 2011 at 3:56 PM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> Include config.h in softfloat.c, so that the target specific ifdefs in
> softfloat-specialize.h are evaluated correctly. This was accidentally
> broken in commit 789ec7ce2 when config-target.h was removed from
> softfloat.h, and means that most targets will have been returning the
> wrong results for calculations involving NaNs.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> =C2=A0fpu/softfloat.c | =C2=A0 =C2=A05 +++++
> =C2=A01 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 2b20085..3aafa81 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -35,6 +35,11 @@ these four paragraphs for those parts of this code tha=
t are retained.
>
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D*/
>
> +/* softfloat (and in particular the code in softfloat-specialize.h) is
> + * target-dependent and needs the TARGET_* macros.
> + */
> +#include "config.h"
> +
> =C2=A0#include "softfloat.h"
>
> =C2=A0/*-----------------------------------------------------------------=
-----------
> --
> 1.7.1
>
>
>

