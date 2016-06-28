Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHuhn-00011t-7J
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 11:13:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHuhk-0000xa-B9
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:13:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHuhi-0003Y5-EY
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:13:35 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:33379)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHuhi-0003XZ-9c
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:13:34 -0400
Received: by mail-vk0-x236.google.com with SMTP id j3so26313914vkb.0
	for <qemu-trivial@nongnu.org>; Tue, 28 Jun 2016 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xdT2tokSgy7nP/ZgKteodFw1HTogsHIjXeRDhkJv7NI=;
	b=kkDjtXbswGJzgBHNqCuCWX7QJzqNyexhdsGmQvVV4vf0GGeZtLQ12UlR0hBqJuuNgc
	+XNzmEVpdpnbviNvx+XVZgLsHmTHIsUGJ7YqDdSPiYTnAlL8goub990YaVkrG4Az2Ryk
	GyLrDzghjO3+MwwIMHzz2UH+nIW5tNv4Hmeok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xdT2tokSgy7nP/ZgKteodFw1HTogsHIjXeRDhkJv7NI=;
	b=JGf8WvOf+3spGZPQ1RUQiYck/orGPn4wmS1vF1nbxUBqu8Spwu9akKdYbRKM0ZP7QM
	dEdKXGBX0xUEqKwxdNKZAeRndYpiLBu/O8HpNo4r8mulOj2iDM6ewuUCcJuvFDhU+f0n
	SCCWPbfD4hFCHblWxo+NRQR9q7c2XO1+sY6g+vQiXzR27iMZskTVD2sG89/OFLb6LQdR
	yjx4379aieT0RlTwF0avGlFLn9z0+C7mspaF5xw8doaVIIKykff7YlLxhmpk1WzyOgTS
	xx+1LVz3PSqRPDk58BxpO1wQUKZ0VOVrVNFSgPntLJI5mR6Kpd8SN7MjGgqHuwdLtGpa
	XapQ==
X-Gm-Message-State: ALyK8tJsd0XfjzBQ6DF3DUOZT+pzYtlhF5EY4VtIKc8VxEk/HyOKOybAvDDsuVohzfuaCw6doEhcQCRCLOy/T1kn
X-Received: by 10.31.21.143 with SMTP id 137mr868406vkv.108.1467126813937;
	Tue, 28 Jun 2016 08:13:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Tue, 28 Jun 2016 08:13:14 -0700 (PDT)
In-Reply-To: <1467125451-16700-3-git-send-email-peter.maydell@linaro.org>
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
	<1467125451-16700-3-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jun 2016 16:13:14 +0100
Message-ID: <CAFEAcA8BivgZCg1j9ecUUkvWYx_HDb5P9Px+pjJfrCL7Gkjbbg@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Patch Tracking <patches@linaro.org>, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/6] block/qcow2: Don't use
 cpu_to_*w()
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
X-List-Received-Date: Tue, 28 Jun 2016 15:13:37 -0000

On 28 June 2016 at 15:50, Peter Maydell <peter.maydell@linaro.org> wrote:
> Don't use the cpu_to_*w() functions, which we are trying to deprecate.
> Instead either just use cpu_to_*() to do the byteswap, or use
> st*_be_p() if we need to do the store somewhere other than to a
> variable that's already the correct type.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Apologies for dropping the

Reviewed-by: Eric Blake <eblake@redhat.com>

that this should have; forgot to update before resend.

-- PMM

