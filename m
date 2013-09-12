Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VK2ak-0005rB-OO
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 04:49:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VK2ae-0005q8-I8
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 04:49:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VK2aZ-0004OZ-RX
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 04:49:28 -0400
Received: from mail-la0-f41.google.com ([209.85.215.41]:47395)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VK2aZ-0004OH-Kh
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 04:49:23 -0400
Received: by mail-la0-f41.google.com with SMTP id ec20so8338298lab.14
	for <qemu-trivial@nongnu.org>; Thu, 12 Sep 2013 01:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AQEz0+QoFjLt09bNT3FQjAITxbzDOvdETRmVIOCGTIc=;
	b=EnyM1f6XEvmL+quUW/wTl9PPEy1H7LTkScVSC5ZuIJkUoxzop9cGzbrC9lNMyk3mdF
	M+iaJKb9GW7/cFrCKRdi+bgm0F+WWV2u9lsFmk0LMp0ifYxPrlj7z8AIZhzjxtZajLa7
	NYpsAE13kCfYXmNybHD+dIqEwfAAQweyy0RKt+yD0aRKib9/iCYjZbcg65DbV2IM4iq2
	f3ar9sZntdEpaEil6ClLQctFq0n9zH/1n4ldrxN2BcsKsTJzcJ5Vb5Oj6yAvcq64bjtO
	sL+bipXlcv3S3tAF9QsDb0PdT4PcpP1ivnRyOHgx40/BV+J0uIsjtlEfVbBWhBD90i1j
	cK+w==
X-Gm-Message-State: ALoCoQloAkvTE/pYU5a3YIdm4PcLzgymu5DO9r7iD5qk6NP0en97O8IjakgwzvGzf44NOyRp2anX
X-Received: by 10.152.10.99 with SMTP id h3mr5273706lab.13.1378975762527; Thu,
	12 Sep 2013 01:49:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Thu, 12 Sep 2013 01:49:02 -0700 (PDT)
In-Reply-To: <5230F7D1.9090009@twiddle.net>
References: <5230F7D1.9090009@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2013 09:49:02 +0100
Message-ID: <CAFEAcA_c1Qja2geB9wzmR3rLG8dq=V38cGVyYaqip5uEZrdgCQ@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.41
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] Ping
	http://patchwork.ozlabs.org/patch/251410/
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
X-List-Received-Date: Thu, 12 Sep 2013 08:49:33 -0000

On 12 September 2013 00:08, Richard Henderson <rth@twiddle.net> wrote:
> There have been two patches posted for this uninitialized warning, outstanding
> since June 14.  I still encounter this daily...

Looks like material for -trivial to me, cc'ing.

-- PMM

