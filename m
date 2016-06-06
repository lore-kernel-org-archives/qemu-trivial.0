Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9sLF-0004UL-Qe
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jun 2016 07:05:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9sLE-0004QF-1e
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2016 07:05:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9sL3-0006z1-1l
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2016 07:05:06 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:36242)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9sL1-0006yk-RB
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2016 07:04:56 -0400
Received: by mail-vk0-x22e.google.com with SMTP id c66so40494872vkb.3
	for <qemu-trivial@nongnu.org>; Mon, 06 Jun 2016 04:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kk7/8bNnwqAUA/+TbQah1CWRVKNyd9kVUeY9G3zgLAA=;
	b=EhmPVSyg0VsFPcgYD2QX5AY+ZleF9jx7I7wTIzU0w1+q9uQwCsuUkXgkx5ZmRQxcG5
	akVn1ZPeIHm3hlF8yTDabn44EfC5SLtR26xuLzL8xHD21mmrTetF0hYEdwXccgwUdLgS
	hFBpiyC8YemNNV+SGEXA97Q15BCmKbs3Dw1y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kk7/8bNnwqAUA/+TbQah1CWRVKNyd9kVUeY9G3zgLAA=;
	b=e1kGuaapck/XegN+/3J+AJkoOdOMLebBQcOlHMQ0HPokIgEH3pHayToPf5RCk9jFhP
	+xvlbH0npOGtm1vRn9kcOujeL0sNuYldJBPAeeNo+dxwPvvz+RyE40PD5nRvzh/QS563
	KoGcXNs0dDmwejBGDmJCri+NpdYCsTBiBjzi2AULm2ZIm7QHLffXT6rCZS+59TtwmFDf
	zVqm4cfEJk827eAtnKJOZPs/0mqplgVs3yC3uiFUwkCqxEwovkZsgR50pPJQTp888E7Z
	atN2WScI0w3Yf//NaF/VaEA2GVq/2+Jrx8Kj8Z5zpaynTnIpuSv/sJjUjNIkG2wKrlT8
	rMKw==
X-Gm-Message-State: ALyK8tLy3ntmm7y36kcEkfLdmxzGmN6c0zbO5HfshZ+2JyGYqC53uwbmr7K82Y2fLLVocibDj7FxaLuB2V5mET9Q
X-Received: by 10.176.0.146 with SMTP id 18mr3835079uaj.17.1465211095364; Mon,
	06 Jun 2016 04:04:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.67.65 with HTTP; Mon, 6 Jun 2016 04:04:35 -0700 (PDT)
In-Reply-To: <20160605143548.2331-1-peter@lekensteyn.nl>
References: <20160605143548.2331-1-peter@lekensteyn.nl>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2016 12:04:35 +0100
Message-ID: <CAFEAcA9FfGMinBWmqWdTXEFb3O84o9feLsV4hd+JLNWXgZu-Tg@mail.gmail.com>
To: Peter Wu <peter@lekensteyn.nl>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-trivial] [PATCH v2] gdbstub: avoid busy loop while
 waiting for gdb
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
X-List-Received-Date: Mon, 06 Jun 2016 11:05:09 -0000

On 5 June 2016 at 15:35, Peter Wu <peter@lekensteyn.nl> wrote:
> While waiting for a gdb response, or while sending an acknowledgement
> there is not much to do, so do not mark the socket as non-blocking to
> avoid a busy loop while paused at gdb. This only affects the user-mode
> emulation (qemu-arm -g 1234 ./a.out).
>
> Note that this issue was reported before at
> https://lists.nongnu.org/archive/html/qemu-devel/2013-02/msg02277.html.
>
> While at it, close the gdb client fd on EOF or error while reading.
>
> Signed-off-by: Peter Wu <peter@lekensteyn.nl>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  v2: resent with fixed commit message + R-b from
>      https://patchwork.kernel.org/patch/9008751/

Applied to master, thanks.
-- PMM

