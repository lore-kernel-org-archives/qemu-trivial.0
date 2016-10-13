Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1budMx-0005he-TF
	for mharc-qemu-trivial@gnu.org; Thu, 13 Oct 2016 06:36:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1budMv-0005fy-Pm
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 06:36:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1budMt-0004hj-Mv
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 06:36:08 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:32775)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1budMt-0004gr-9V
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 06:36:07 -0400
Received: by mail-vk0-x231.google.com with SMTP id 83so49366720vkd.0
	for <qemu-trivial@nongnu.org>; Thu, 13 Oct 2016 03:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8yxgXI1tPkCpZmOpGjOlDeFAQ9hHwLhk6Nv3iGst/1o=;
	b=Lf2YDjDJ8fZnJHPvR+IiwGv3ikN3T5K2QBBH1mFTiqT7dyserxExphrmMLbiaxyt2x
	v+Bl+r6Pzl8JKXKHAVAqD6cgpoa8mz6i/C4nAb4lqoC15zTcQMo32loJp12VmV8DXB2f
	vKnSrtUJJ/merYqvM6GuYS9CSd7PuEFd1YjW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8yxgXI1tPkCpZmOpGjOlDeFAQ9hHwLhk6Nv3iGst/1o=;
	b=h3LzLIxPMNSryK2KHUcaYSO+Rnl+LrBs+5bBh4WLmbERQIEkXlt0DRDX/4RZjx+y5G
	ZeBBOcQZ/xADt8Qp43PQN+0CvCYpjFXt8SbJb4neRoPo3/NcxIj8y3/Rb5q644RFeTAY
	l2kMvCZ05n50sfdA1DCBE1Aig6Uj9VYISxMgycGxno9OfYk4y5k2IOA5GkDJ5FCrAHfO
	rmlbE1jbHEkCbx+CGm2ISoLxRrqUOVwXMR7Cvk8hRd1E2zb4uiJoAcTbXo31eBMnWuND
	GVdRMbWdQYbEU1/dXSKTOzn1FFM831PKHD0TamY/nVCQp/Z7skIff4kLK9gVJ3cmwchg
	HVJA==
X-Gm-Message-State: AA6/9RlGEFBggeIVkwCfv9G7oiWTCSlYXLoYipW9qDzUuW3gCj8ZcMmD9pFket5XGv7RtmMIcyf0UNEQLi4O/0pQ
X-Received: by 10.31.65.195 with SMTP id o186mr3412076vka.3.1476354951120;
	Thu, 13 Oct 2016 03:35:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Thu, 13 Oct 2016 03:35:30 -0700 (PDT)
In-Reply-To: <1476311708-14792-1-git-send-email-michael@walle.cc>
References: <1476311708-14792-1-git-send-email-michael@walle.cc>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Oct 2016 11:35:30 +0100
Message-ID: <CAFEAcA-vMVAKtyRpE7wYe_DRCg9x3T3O3sfDf-1VTMBM7jMTaA@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-trivial] [PATCH 1/4] target-lm32: swap operand of wcsr in
 LOG_DIS()
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
X-List-Received-Date: Thu, 13 Oct 2016 10:36:10 -0000

On 12 October 2016 at 23:35, Michael Walle <michael@walle.cc> wrote:
> Be consistent with the reference manual.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  target-lm32/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target-lm32/translate.c b/target-lm32/translate.c
> index dc64cc6..fa8416a 100644
> --- a/target-lm32/translate.c
> +++ b/target-lm32/translate.c
> @@ -865,7 +865,7 @@ static void dec_wcsr(DisasContext *dc)
>  {
>      int no;
>
> -    LOG_DIS("wcsr r%d, %d\n", dc->r1, dc->csr);
> +    LOG_DIS("wcsr %d, r%d\n", dc->csr, dc->r1);
>
>      switch (dc->csr) {
>      case CSR_IE:
> --
> 2.1.4

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

