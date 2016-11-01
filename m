Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1cvR-0003io-3e
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2016 13:32:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c1cvO-0003h9-CE
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 13:32:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c1cvN-0002ZL-Kd
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 13:32:38 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:33815)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1c1cvN-0002Z5-8a
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 13:32:37 -0400
Received: by mail-vk0-x229.google.com with SMTP id x186so76565414vkd.1
	for <qemu-trivial@nongnu.org>; Tue, 01 Nov 2016 10:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6y+8QpEzXQE8NdvkkyFTlkasKc+h3wwm4v1RbrE4ct8=;
	b=Boj7WK7gIAq6pVwbjZ6ryceNPsqsoMhyK3ew/EOZsTfXiX2mt2Bkf6slRXD6nijB7N
	p/wnX4PBRrr5/2c3iS9ocYcXnz9uYmZdWbocJ6BeXT/tpjTha0JHGsjPcT4RUhYzvr3x
	b087yud2D7sqAMIzKJrjFCgzo9IW1AwkKdduI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6y+8QpEzXQE8NdvkkyFTlkasKc+h3wwm4v1RbrE4ct8=;
	b=UqiEQ3vGbp25COx4WHDANioc6ifvqBLsSwfw7/41xUINNEzP6QiyrdUwuGyipKN5/s
	3phn7FmKyHN0dr71fLxU5SkmGQq2DTqne8sdtHudX4zZ4EdDrLbUIGXOQgu9QcDVbfpo
	vhzwwGPGx5yA/j8JwPWDG4tRg39xuQ3L1+0QRiYmmKp+udp6+6XBY7tJT3zwNNQSHCQV
	nIdPk2jlxtEP3Yo2c4Z6yU4mY8ACmgjLRq66kkiJ78nKlBmJeVITHSWiNC+4dY/TbhqZ
	vom5mkDQuOmEG/zPHXltaDr9QNo4pPEWVGYWmQAZo1tvMmJJ9E5kqE8oZ4u0e8GcCkI2
	STNg==
X-Gm-Message-State: ABUngvfXp3QZa7le4QplEUYx/ubKgl1Shri5NE8wuRFD4vinp+ZvLw710aZGeqx0YNbNjaQS4llavbbQ60m+XC3K
X-Received: by 10.31.102.6 with SMTP id a6mr24071522vkc.175.1478021556618;
	Tue, 01 Nov 2016 10:32:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 1 Nov 2016 10:32:16 -0700 (PDT)
In-Reply-To: <20161101171927.25684-1-sw@weilnetz.de>
References: <20161101171927.25684-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Nov 2016 17:32:16 +0000
Message-ID: <CAFEAcA9QJ01169NRxeGXPGCqd1xpzVhnKBw=POZWU9JumoSHoA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>, 
	Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs: Fix typos found by
 codespell
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
X-List-Received-Date: Tue, 01 Nov 2016 17:32:39 -0000

On 1 November 2016 at 17:19, Stefan Weil <sw@weilnetz.de> wrote:
> Fix also some indefinite articles.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> I still don't understand the comment in docs/colo-proxy.txt.

> diff --git a/docs/colo-proxy.txt b/docs/colo-proxy.txt
> index 76767cb..6c8cca5 100644
> --- a/docs/colo-proxy.txt
> +++ b/docs/colo-proxy.txt
> @@ -158,7 +158,7 @@ secondary.
>
>  == Usage ==
>
> -Here, we use demo ip and port discribe more clearly.
> +Here, we use demo ip and port describe more clearly.

The problem with this sentence (as you note) is not the spelling
but that it is not clear what it is trying to say and needs
rewriting.

>  Primary(ip:3.3.3.3):
>  -netdev tap,id=hn0,vhost=off,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown
>  -device e1000,id=e0,netdev=hn0,mac=52:a4:00:12:78:66

thanks
-- PMM

