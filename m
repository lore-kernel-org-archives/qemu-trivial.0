Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fbTIQ-0001SD-7w
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jul 2018 12:09:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fbTIO-0001S3-PA
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 12:09:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fbTIN-0001Pf-SU
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 12:09:20 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:37014)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fbTIN-0001P2-Mr
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 12:09:19 -0400
Received: by mail-oi0-x243.google.com with SMTP id k81-v6so24420920oib.4
	for <qemu-trivial@nongnu.org>; Fri, 06 Jul 2018 09:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=G7low1IqEO4s6i3nLFP4e1NJAnaWaeoZdF+V1NIbFYI=;
	b=UQScG4X9m+zKZz/Kf0FdZ/TNSEvFuFZcqbZxoqPr8O0OT6HqDM+A3kVrq5IoenK5uy
	+GxDQW3oOTvVIk6+rtkHyeNWJG0/GiSRhiGSFmhAAkT/zCTIfxHLSqYlesVuL8CX6XKp
	tqTN0XXWeVqZ9Eii3cbG+qv5/6m050oi8kjTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=G7low1IqEO4s6i3nLFP4e1NJAnaWaeoZdF+V1NIbFYI=;
	b=paks4Z0nd1J5h+/8UJnGdVuFeMpsED2wAGoq+Qybd+pEwkxonSeYoWtXsbhJ43IGP4
	7sRihB3LyVuE3zSETgRjPBXpAszpoXk00F4VCuE8keVaU4cVYFPU/obx7SmT8pCh5lb+
	2zznpwp1dmRQvTRoJZykBz+rMTTe7RaWzyzXU66TNtqel/ASHfZE6HOMLlfmEFNWfiIk
	zL2KgnnNTsFJF2v4O189rmWh5k7WjbxomV/jQG0pYoAqjz10vkWX5T0uzJigSJo6aIaT
	sh/vH/AjcGgRhGEOcpkEFLbtR+TGzPYO3Ecbvgj+CWoekilzaoApgQrr+jjsbLpSZs5A
	DShg==
X-Gm-Message-State: APt69E2ZvTzXP38LJCrblBd/38dtGDqwu192DP1XsjjyPjcVaHOPr75w
	OrZBqrkRskCdt6VLD+5ehccDlW22CDg4y/qe0M5ZhQ==
X-Google-Smtp-Source: AAOMgpfC4hNvB4L5IaOA2Hiu7kzj4kxhH4uAfruRnvtSO8aEdLAQPhPf7xOXTx8TKGJzgSM1zBB19D8mQsMmjBYxkeY=
X-Received: by 2002:aca:4c14:: with SMTP id
	z20-v6mr11088605oia.164.1530893358808; 
	Fri, 06 Jul 2018 09:09:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:554d:0:0:0:0:0 with HTTP;
	Fri, 6 Jul 2018 09:08:58 -0700 (PDT)
In-Reply-To: <20180706155127.7483-3-f4bug@amsat.org>
References: <20180706155127.7483-1-f4bug@amsat.org>
	<20180706155127.7483-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jul 2018 17:08:58 +0100
Message-ID: <CAFEAcA_rKe5MrPt36EAYjxB5TDREb9Ea+vj8u4kVPgamLDFiog@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>, 
	QEMU Developers <qemu-devel@nongnu.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-trivial] [PATCH for-3.0 2/3] linux-user: Do not report
 "syscall not implemented" by default
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
X-List-Received-Date: Fri, 06 Jul 2018 16:09:21 -0000

On 6 July 2018 at 16:51, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> This can still be reported using the "-d unimp" command line option.
>
> Code change produced with:
>
>   git ls-files linux-user | \
>   xargs sed -i -E 's/fprintf\(stderr,\s?(".*not implemented\\n")\);/qemu_=
log_mask(LOG_UNIMP, \1);/g'
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  linux-user/cris/signal.c       | 4 ++--
>  linux-user/microblaze/signal.c | 4 ++--
>  linux-user/nios2/signal.c      | 2 +-
>  linux-user/sparc/signal.c      | 4 ++--
>  4 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/linux-user/cris/signal.c b/linux-user/cris/signal.c
> index 0b405247cf..1e02194377 100644
> --- a/linux-user/cris/signal.c
> +++ b/linux-user/cris/signal.c
> @@ -146,7 +146,7 @@ void setup_rt_frame(int sig, struct target_sigaction =
*ka,
>                      target_siginfo_t *info,
>                       target_sigset_t *set, CPUCRISState *env)
>  {
> -    fprintf(stderr, "CRIS setup_rt_frame: not implemented\n");
> +    qemu_log_mask(LOG_UNIMP, "setup_rt_frame: not implemented\n");

Your regex seems to have gone a bit awry here, because it's lost
the "CRIS" part of the string (similarly below).

thanks
-- PMM

