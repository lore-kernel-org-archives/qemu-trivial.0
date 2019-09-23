Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCPVs-0006Dz-QJ
	for mharc-qemu-trivial@gnu.org; Mon, 23 Sep 2019 10:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40486)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iCPVo-00061t-3k
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 10:40:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iCPVl-00067l-O1
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 10:40:23 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44997)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iCPVl-00063E-2v
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 10:40:21 -0400
Received: by mail-ot1-x344.google.com with SMTP id 21so12272008otj.11
 for <qemu-trivial@nongnu.org>; Mon, 23 Sep 2019 07:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UVxDV1Cug82JTtKncFbLQTRFqJjzdFnWaiYFroc2csk=;
 b=BWDzQQ5J9U5xpnEso5tBguBnnCR940tCrymriZfiNmByk3neQK0MFOBy8WdocahyNo
 Yh88vGHZs+jOH4dmsQnjWPq3z0nZSv5HUruj+Y5ec/Vykp6wtKPqAW42aRmc9FGn3Gba
 brYan7pMbX18LGJ7AerWSP9l8bvd1uZLrX10QOs0HpgL9LTlCQVZu6TFiJCDss0Gvlcv
 +BwH+6Zgc1Jd0LeUxulMO3ZRUAqM/1dWxCf8a/2iWOEEzH0WOAyETAGC2gA+eG6IqMon
 Zp9GRaf9STu0Nx1R1tKOb5ISXveeE89eGj+4QGPBvzq/scE8IA3yuvKV28ADioiAG/Zi
 ddYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UVxDV1Cug82JTtKncFbLQTRFqJjzdFnWaiYFroc2csk=;
 b=diC9590WdT2y9rqdslPxGhhL12ZEwQnRhLcAHjLzdo4zcZ22HRCaKnxni2NpOadYVA
 /QAyChvdxnsaf4R1VBodPWetyWEfToY5+vrADl0rXpekD4ll+0v0bMu+GyOYIiYZQigV
 MrprTjOuxD4LO8tIPUri5zcnsH8i/bMl2d3SJWpqe+xLIMiIZd4kTWymZ0vL17tRe/dy
 Jkuod007G4dTudRSPH53W2NhS/XfbWbgmh03IQt3pzxlbfGyGl6fvcP6PJtqz6MUH67u
 kGjFDNmIOyQCdt3ZAyXA3R6AKV1awjmWAfl3BDcdrFQv66YkswCNjQyM5apBRnLtOes4
 NWaQ==
X-Gm-Message-State: APjAAAUG6yqEUxthRKVZ36ytkui/XFnwkGYAsG0llfthi6RKxhL9xzwg
 jIIsV/IPf9tmJtGFrSzRylgk81kQ6WcQEib3WJqR5w==
X-Google-Smtp-Source: APXvYqzVaBtiTn/cmdFjvhDcfZk9hpu5lzilSinhX9Xjh+7zUdMQGtwHbuFCAaWWZ4xfRBiUjkiSDBmr2dqSrhWKNXY=
X-Received: by 2002:a05:6830:1357:: with SMTP id
 r23mr106498otq.91.1569249615442; 
 Mon, 23 Sep 2019 07:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190921101703.17935-1-philmd@redhat.com>
In-Reply-To: <20190921101703.17935-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Sep 2019 15:40:04 +0100
Message-ID: <CAFEAcA8RfAPuV9LfL3c01KU+sCtAcWkHsLR7e-4QNJVcniq7Cg@mail.gmail.com>
Subject: Re: [PATCH] hw/ptimer: Assert next_event is newer than last_event
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Dmitry Osipenko <digetx@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Sep 2019 14:40:26 -0000

On Sat, 21 Sep 2019 at 11:17, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> If the period is too big, the 'delta * period' product result
> might overflow, resulting in a negative number, then the
> next_event ends before the last_event. This is buggy, as there
> is no forward progress. Assert this can not happen.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/core/ptimer.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index d58e2dfdb0..88085d4c81 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -125,6 +125,9 @@ static void ptimer_reload(ptimer_state *s, int delta_=
adjust)
>
>      s->last_event =3D s->next_event;
>      s->next_event =3D s->last_event + delta * period;
> +    /* Verify forward progress */
> +    g_assert(s->next_event > s->last_event);
> +
>      if (period_frac) {
>          s->next_event +=3D ((int64_t)period_frac * delta) >> 32;
>      }
> --

Can this only happen if a QEMU timer model using the ptimer
code has a bug, or is it guest-triggerable for some of our
timer models?

thanks
-- PMM

