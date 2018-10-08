Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g9Rr7-0002OI-AB
	for mharc-qemu-trivial@gnu.org; Mon, 08 Oct 2018 05:29:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9Rr5-0002O5-SH
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2018 05:29:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9Rr4-0000qf-UL
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2018 05:29:35 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36327)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g9Rr4-0000q7-OM
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2018 05:29:34 -0400
Received: by mail-ot1-x343.google.com with SMTP id k5so6153161ote.3
	for <qemu-trivial@nongnu.org>; Mon, 08 Oct 2018 02:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dKLdZ9nSvHhpHHcOLb7jNaFR8U0F75xuJcD+dUly3fE=;
	b=KVQBEqrzEZXipaQg2zjpsDNrjGXPHPidjDiNDJYHr/h2fzIqr2pxfnmvqZiutHe5ke
	2+HBju1otJPK2SPAOWKVqhp4ChCjANfvp/V8gzlS02DAYgUFqNnQHWPsESth5Fa9hrWt
	rRRMM3YHM51fK6WVfDnlgrVUjPKc84qzm94Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dKLdZ9nSvHhpHHcOLb7jNaFR8U0F75xuJcD+dUly3fE=;
	b=Ntjlv3LZ+ZuEh3xLnwR1CHfPTaSg60BzOStRdy2qtvBITOQ5AgjX9kqbrxKetcogrP
	ZDiXBHv4ZqwaTK08XN23T5JaZ+/Q5YMQYK6KcTSEnCzl+Oxz7bcIQbP5m5Z5JnmCJHtx
	/KnHrB5RI+h78torSW+/JBuy0O3nzZLDdNRbgtmoqCfYPeMfvEKaO8EUnUXMmQguWI1H
	ov9/fDDqMukEX6vRtE34sVDhpPxo0VxAr2IdKFQWoyc79Pcs9Bb4hQvhBx/gM3I11Vfa
	DRvng2/gDCjrSDvSgymzXT3/8UXVjVX3Im+fns+KGsIYtVQrMbMt05o3ytRHVGgny3Pw
	YOyQ==
X-Gm-Message-State: ABuFfogkRYJLVWvt/UdUoBisbl2Mftieg0/fWQkxROUH03AdwARX/F4N
	0IyL2QhMHAIKRZ1WmYby6bDNgyL8V+Q8uByH41/8ug==
X-Google-Smtp-Source: ACcGV603TgDY3+rjERMwMR8j4dFzVmOfOxpphVRP8PucKG9KeAJjHPKyeTuOPEcezmNY76kAwsfSG905DE1ctwtyHzg=
X-Received: by 2002:a9d:1ea3:: with SMTP id n32mr1432045otn.352.1538990972352; 
	Mon, 08 Oct 2018 02:29:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Mon, 8 Oct 2018 02:29:11 -0700 (PDT)
In-Reply-To: <1538964972-3223-1-git-send-email-liq3ea@gmail.com>
References: <1538964972-3223-1-git-send-email-liq3ea@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Oct 2018 10:29:11 +0100
Message-ID: <CAFEAcA9wzVR1XH=Q_Lr6p83XtjGEDykMCgdfvwLqDp5ojqT5_w@mail.gmail.com>
To: Li Qiang <liq3ea@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <famz@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] util: aio-posix: fix a typo
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
X-List-Received-Date: Mon, 08 Oct 2018 09:29:36 -0000

On 8 October 2018 at 03:16, Li Qiang <liq3ea@gmail.com> wrote:
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Li Qiang <liq3ea@gmail.com>
> ---
>  util/aio-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/util/aio-posix.c b/util/aio-posix.c
> index 621b302..51c41ed 100644
> --- a/util/aio-posix.c
> +++ b/util/aio-posix.c
> @@ -40,7 +40,7 @@ struct AioHandler
>
>  #ifdef CONFIG_EPOLL_CREATE1
>
> -/* The fd number threashold to switch to epoll */
> +/* The fd number threshold to switch to epoll */
>  #define EPOLL_ENABLE_THRESHOLD 64
>
>  static void aio_epoll_disable(AioContext *ctx)
> --
> 1.8.3.1
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

