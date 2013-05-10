Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UapBU-0007r1-Lm
	for mharc-qemu-trivial@gnu.org; Fri, 10 May 2013 11:24:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UapBQ-0007pX-TP
	for qemu-trivial@nongnu.org; Fri, 10 May 2013 11:24:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UapBO-0007oc-PB
	for qemu-trivial@nongnu.org; Fri, 10 May 2013 11:24:32 -0400
Received: from mail-lb0-f175.google.com ([209.85.217.175]:35329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UapBO-0007o7-GT
	for qemu-trivial@nongnu.org; Fri, 10 May 2013 11:24:30 -0400
Received: by mail-lb0-f175.google.com with SMTP id w20so4272794lbh.6
	for <qemu-trivial@nongnu.org>; Fri, 10 May 2013 08:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=xVsd1XAAxDg3BuriVGrrAbehZPZs+g4H62ToiCNCRyU=;
	b=iZctXbDZWgfgxtoVZMXLATKt2S5OvA0UcHj0b1LtCWDUMkuDT1+tC09flOYhFGrLPz
	NaQgkfdAcXBso/VTtJUX4BlDxmXpaI9+SMTGZn/MPt0QhLPEp+llwpcWTLkSaO9/YTEm
	DNNwJT6aLC1/P5TJt3Hi9CNa689PDR/pAm2zJ6PD3a/m7/k3dDf9SdPU+6SISProPdMU
	1mGbyBk/ssKlFpM6o+XjrVL+WD6Z46P/aUpJQW7c2OzQX34m9CKm9tHFuFA/0lwkq7gS
	Cv/egQsZUtLXJD5YfM8Cj8NYsWz55INZgowar5NQ4o015peOHg+kbMHGuw3xdsRcvr4t
	D5+w==
X-Received: by 10.112.162.40 with SMTP id xx8mr7810714lbb.30.1368199469468;
	Fri, 10 May 2013 08:24:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.60.37 with HTTP; Fri, 10 May 2013 08:24:09 -0700 (PDT)
In-Reply-To: <1368198990-44941-1-git-send-email-i.mitsyanko@gmail.com>
References: <1368198990-44941-1-git-send-email-i.mitsyanko@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 May 2013 16:24:09 +0100
Message-ID: <CAFEAcA_zpWNN0uPb3pYUxGw4USX8+NFS4_+b4MO8uBdwDEDLwA@mail.gmail.com>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkyXmkV1y656yWcHywK6jwIugcmilc0bNS2u8vTMK9gHQXjQ7WnK/kGtfr5lKfWgZSgK/fA
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.175
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, aliguori@us.ibm.com,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] osdep.h: include
	sys/types.h for ssize_t definition
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
X-List-Received-Date: Fri, 10 May 2013 15:24:35 -0000

On 10 May 2013 16:16, Igor Mitsyanko <i.mitsyanko@gmail.com> wrote:
> This fixes build for mingw32
>
> Signed-off-by: Igor Mitsyanko <i.mitsyanko@gmail.com>
> ---
>  include/qemu/osdep.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 42545bc..17946a3 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -163,6 +163,8 @@ int qemu_create_pidfile(const char *filename);
>  int qemu_get_thread_id(void);
>
>  #ifndef CONFIG_IOVEC
> +#include <sys/types.h>
> +

This is quite a long way down to have a system #include.

Can we just take the existing include of sys/types.h at
the top of the file out of its current #ifdef __OpenBSD__
guard ?

(http://hacks.owlfolio.org/header-survey/ has a full row
of greens for sys/types.h so this should be safe.)

thanks
-- PMM

