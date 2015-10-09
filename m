Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkZUc-0004o0-Uu
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 11:21:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZkVRo-0003zc-7p
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 07:02:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZkVRi-0005nl-KV
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 07:02:48 -0400
Received: from mail-vk0-f49.google.com ([209.85.213.49]:35640)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZkVRi-0005nd-Go
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 07:02:42 -0400
Received: by vkao3 with SMTP id o3so48933196vka.2
	for <qemu-trivial@nongnu.org>; Fri, 09 Oct 2015 04:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iLuyMg6JiR2VxJxQ9IAcJhQuvaNlRjmGne98H17dVuY=;
	b=WsI21MQN2xgh2vITYuTScWdVeaKyd3Qcd5IBathGyLFmE89Aj1GgWOp81qqPbPyQVs
	WRR5NwCxG/RivUKl+VoP3zY3Nnhi9knWsU7JMeWfDdtNBfuHK3QdR/wVhWGfYqcebVs/
	d9Jk6sJvKpzUAqoRE54VqUQkM250dUY7cmMkXmuCPXvgOCKXDX9sCmxyEH1YtfImufx5
	heT2zkEs58F48VaaLGU/KxodeIugZZ/65ruPC7+aa5niAEJI61x/hqD6L477VT5r71hK
	WGL8Z4LV708LY3ZQIdcgjNgI9C+RJgo9iT8cqxi7qK0fHkPv6sy8XY9byT8ccpPTis1P
	GcxQ==
X-Gm-Message-State: ALoCoQnvUQiCBvwJ6cUwuRB8gTgsqXpoVbquX/TV1LLLtl/zNZQLf2mUDKaGKkfVkmOy/TJPrScl
X-Received: by 10.31.56.72 with SMTP id f69mr7432346vka.27.1444388561858; Fri,
	09 Oct 2015 04:02:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 9 Oct 2015 04:02:22 -0700 (PDT)
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Oct 2015 12:02:22 +0100
Message-ID: <CAFEAcA_DJ2dQzX40iY10Fagm+3oFh6NcSyxXOP9WmUw2c5dyFw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.49
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/19] Trivial patches for
	2015-10-08
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
X-List-Received-Date: Fri, 09 Oct 2015 11:02:52 -0000

On 8 October 2015 at 17:52, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Another trivial-patches pull request.
> Everything's trivial in there this time.
>
> Please consider applying/pulling.
>
> Thank you!
>
> /mjt
>
> The following changes since commit 31c9bd164ddb653915b9029ba0edd40cd57530d9:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20151007' into staging (2015-10-08 15:33:56 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-10-08
>
> for you to fetch changes up to deb847bfba7ee0ab8151842f5e9cb12d4daad3a3:
>
>   tests: Unique test path for /string-visitor/output (2015-10-08 19:48:17 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2015-10-08
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

