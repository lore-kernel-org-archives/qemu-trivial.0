Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bIiJE-0001Ar-7K
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jun 2016 16:11:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIiJB-00012D-K9
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 16:11:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIiJA-0006QT-94
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 16:11:33 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:36047)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIiJ9-0006QF-LL
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 16:11:32 -0400
Received: by mail-vk0-x22f.google.com with SMTP id m127so66088925vkb.3
	for <qemu-trivial@nongnu.org>; Thu, 30 Jun 2016 13:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wIIeLrBmgIh/Rt3/LyeKHzuPVzs7KpR61Drmvpptt70=;
	b=DvIZJIZUQfrX+0bvubQ2GXgxrteDLevjLBhtpVUW8SNxZuoyq5t6YnKt6sFMT4vAzU
	kRK0DgaM1MRjNDsjMfBz0LN4CbVvVcku8ICEM3WisIInf8j6pMFJFqhVnNGh5mSduHUO
	7D4BQA2WADi/4yJ3v5CLe6UHScXwqzQMSpeQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wIIeLrBmgIh/Rt3/LyeKHzuPVzs7KpR61Drmvpptt70=;
	b=d74EVnxFed8pA1G/dj7SmnLShxcXyoxEP3bvcyjiAHZGeiLyyvw1OAhkD8rTMtyTh+
	xfJv87DXl6QIJMJBn+qccruTXfRdzSxQz0RLxrfW38pMYgocW9FsmooY7ES1e1LVXLCN
	9fvCK9MclqNn5Uvq+/hC2fDN8CPE3jYDdYen58zuXVCQbbvigOA8mbGCc6DxAtmMKj3Z
	cYpgHOdjg1P0MJLrSoXoIoo1KkdOWo+5TdPDfP+molvuq9d3xWWhZPatnqyNaMJxI2Vz
	gnwFbcHjLppp77/KT/tBocrF4aHuE7VfPHbdEvxYkrtpyy7VueGII7tFkkBmioSr5+lt
	btOg==
X-Gm-Message-State: ALyK8tI/3eF8LmG1KjSUU7DxV/fVP0SSipfkQXcWx/EcmhKkOs/f2fsYGQTsykJJJe8I3QCPVqZErf9fGqZG4sB9
X-Received: by 10.31.96.207 with SMTP id u198mr6580170vkb.50.1467317491196;
	Thu, 30 Jun 2016 13:11:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 30 Jun 2016 13:11:11 -0700 (PDT)
In-Reply-To: <1467315396-3628-1-git-send-email-jsnow@redhat.com>
References: <1467315396-3628-1-git-send-email-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jun 2016 21:11:11 +0100
Message-ID: <CAFEAcA-mbSO_3OcUma98qFsnsc-tPtOot0GizFNq6+5sSPyftw@mail.gmail.com>
To: John Snow <jsnow@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Subject: Re: [Qemu-trivial] [PATCH] Remove left shifts of negative signed
 integers
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
X-List-Received-Date: Thu, 30 Jun 2016 20:11:34 -0000

On 30 June 2016 at 20:36, John Snow <jsnow@redhat.com> wrote:
> Another exercise in placating Clang's increasingly strict -Werror mode.
> Technically, this is undefined behavior. In practice, -N<<M is the same
> as -(N<<M).
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  hw/audio/fmopl.c      | 2 +-
>  target-i386/monitor.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
> index 731110f..de9338b 100644
> --- a/hw/audio/fmopl.c
> +++ b/hw/audio/fmopl.c
> @@ -69,7 +69,7 @@ static int opl_dbg_maxchip,opl_dbg_chip;
>  /* final output shift , limit minimum and maximum */
>  #define OPL_OUTSB   (TL_BITS+3-16)             /* OPL output final shift 16bit */
>  #define OPL_MAXOUT (0x7fff<<OPL_OUTSB)
> -#define OPL_MINOUT (-0x8000<<OPL_OUTSB)
> +#define OPL_MINOUT (-(0x8000<<OPL_OUTSB))

We have been down this path before:
http://patchwork.ozlabs.org/patch/545238/

Paolo will doubtless be along with the rant shortly.

-- PMM

