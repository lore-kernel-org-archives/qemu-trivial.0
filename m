Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hWdPL-0008DX-3Q
	for mharc-qemu-trivial@gnu.org; Fri, 31 May 2019 05:01:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hWdPI-0008CY-Sd
	for qemu-trivial@nongnu.org; Fri, 31 May 2019 05:01:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hWdPI-00076A-0G
	for qemu-trivial@nongnu.org; Fri, 31 May 2019 05:01:00 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45152)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hWdPH-00074T-PC
	for qemu-trivial@nongnu.org; Fri, 31 May 2019 05:00:59 -0400
Received: by mail-ot1-x341.google.com with SMTP id t24so8423297otl.12
	for <qemu-trivial@nongnu.org>; Fri, 31 May 2019 02:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q6pv/FQFsCWJI7vYgX4n9cwOf3W3UOWrJeFAt5iBe6A=;
	b=oNKh0T0J8j2rqelCFaprkANrXdREw0B+sEM08h4k7ZRC7o0EzRjKsMGu/2ywiWsp2V
	acJryvisC1D+0ND4orOVoaYtv6X1+zGt9k3KWM+cu6cSa/yGddJQ3xuvkZK+yQzZIvC7
	a9r6JjjhEEc52/9FF8a+MxATf0dFDHNQUH+QPH7+IpFCyUT66o2JbfqqnT9BT4MBvEjt
	IyLPFMqAOeNTPPogD9R+GMT23Cvcrfek84+Kn9bs2Yxs1sblxJbIVWayp1eThgsGIztw
	OIMdCauxJKkilgdIKQX5UVcnHy8fCeXTtik7rvPKBETku4b33b0Q9FCfipw/hVIbZBpZ
	HF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q6pv/FQFsCWJI7vYgX4n9cwOf3W3UOWrJeFAt5iBe6A=;
	b=kM7q3X+K0P4UJhJMwBXsSrywXR3Gvg6s4BusJU09FQFgvmOM3bENa4JGVifhGbntG7
	vpPWCqf4ynRcCO4Sa/RMj2gM64fBmnNc7+D34WhuSy75E1xwoICDYR/hd6rHjJZXQYHi
	r6uGrpba+8VE6gRpfSZiLp2oh1vyZQ8vVLqsT3wCy5lL8xknSPt11sOc1A2Z7lz4xwRh
	x7A1tvmudeeZHmR7K1sxEb2ikyaRS91vgTdYfoF6S+6d0LBbf66v+/oCgHdJ+KrfwhxJ
	4fQf6upd4xd3avyWZMxDoNy/9ckOBxkvwjJpZdVr4t7R28WbM2NRk8HHMRmp24Bm5cEU
	1YEA==
X-Gm-Message-State: APjAAAU6J/0l0CMHu450QRvFVZkivfPCn+nb4RITYt+kUut4RM8k6ZO4
	FQUIkoqHcHmIMWCC6gCKOZ3IWic43xZsgZI/Yvu4rg==
X-Google-Smtp-Source: APXvYqw0mXSocs1klp9c9f6dPwH9I94qOzoz8P3RxBIXhgLWVXwjesxYhFBqLS8FAfSq7xcHH3tW2e5i1rQI+qJ89vs=
X-Received: by 2002:a9d:2c29:: with SMTP id f38mr879996otb.97.1559293258702;
	Fri, 31 May 2019 02:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190530173824.30699-1-richard.henderson@linaro.org>
In-Reply-To: <20190530173824.30699-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 May 2019 10:00:47 +0100
Message-ID: <CAFEAcA8QoncdF-rQt7LDHx3B09xSgzrOjZGxb7L71Jh4h3vM1g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-trivial] [PATCH] util: Adjust qemu_guest_getrandom_nofail
 for Coverity
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
X-List-Received-Date: Fri, 31 May 2019 09:01:02 -0000

On Thu, 30 May 2019 at 18:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Explicitly ignore the return value of qemu_guest_getrandom.
> Because we use error_fatal, all errors are already caught.
>
> Fixes: CID 1401701
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  util/guest-random.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

