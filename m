Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkuQr-0002Lv-8f
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 10:48:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bkuQp-0002IF-5X
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 10:48:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bkuQo-0001uv-A2
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 10:47:59 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:36760)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bkuQo-0001uk-5Z
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 10:47:58 -0400
Received: by mail-vk0-x22b.google.com with SMTP id m62so30607755vkd.3
	for <qemu-trivial@nongnu.org>; Fri, 16 Sep 2016 07:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1iwo3UAQb3YrmC1BAISaHYysL2dDGSbExMtKxP9r8hU=;
	b=GUEqmPas8C5wKbNo5SHcLM17FzWCwiv7JyqCUsnzFNs+AL6zQPj2fiDmI+/sG4dHU0
	Lwews0Za79gTZXkKyE/kdD9FV/4PyllUPqkXTjFNvUAS8W9wAnB8GoQgynizYEz9xw66
	LDf9bc5nYHGoivbW8zECuehXaeNLcP6lL3R2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1iwo3UAQb3YrmC1BAISaHYysL2dDGSbExMtKxP9r8hU=;
	b=df6FXmhv2Iw5vLO97M8YErSi3N9Amqf7S1ZTfXl/9BiwAmZD+yPcPHFCrXkeKWh41p
	azsFd4ifU68XLu//xfw8g5yrdY+70Fxp7Q6w83xfub/VZRl9nH8HJ0OcFbulteXe9P2v
	XMzS0KqZ6X9ylcAb3FInYQ71Q1n+ozaPmyPSZX74GSSgvLWq8R9DD+m9gFrmAYBs/euY
	dNfyMyN088gf7RN2vf0fAzX9WnX2kFm+Oixht7EHDCLSHcZfpsusCfAoAFUSvELg2BCp
	KBYI6Ia2djjEJAPUWUkI41DpA778yUJLXk6qf51XXIWwcfbSGomJZjmnbyz2257jryfT
	uAtg==
X-Gm-Message-State: AE9vXwM/NHJZQAXfpmpzwImDCRRGwA/N91bS/qQB3diLeorq1O/vE96mp+0YallpSntIjIaJl0W0/fJebqkOxBG8
X-Received: by 10.31.221.66 with SMTP id u63mr3804130vkg.173.1474037277507;
	Fri, 16 Sep 2016 07:47:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.131 with HTTP; Fri, 16 Sep 2016 07:47:37 -0700 (PDT)
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Sep 2016 15:47:37 +0100
Message-ID: <CAFEAcA9kTe0geCwguRbRSn8ozhnfarz4eTd5+Ra5kTZeR-fJkA@mail.gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/26] trivial: use
 exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 14:48:00 -0000

On 16 September 2016 at 14:55, Laurent Vivier <lvivier@redhat.com> wrote:
> This series is the result of coccinelle patch
> scripts/coccinelle/exit.cocci
> provided by the first patch of the series.
>
> It replaces exit(0) by exit(EXIT_SUCCESS)
> and exit(1) by exit(EXIT_FAILURE).
>
> All other exit() are not modified as we don't want
> to change the behavior.
>
> In some cases, I've added manually a line break to comply
> with the maximum line length.

>  182 files changed, 734 insertions(+), 715 deletions(-)

You don't say why this is a useful change to make, and it's an
awful lot of churn for a stylistic issue...

thanks
-- PMM

