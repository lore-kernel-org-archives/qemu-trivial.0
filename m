Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGbEf-0006yu-8J
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 17:37:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YGbEa-0006ty-LM
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 17:37:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YGbEN-0004Zz-IB
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 17:37:16 -0500
Received: from mail-lb0-f179.google.com ([209.85.217.179]:54036)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YGbEN-0004Zn-Ap
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 17:37:03 -0500
Received: by mail-lb0-f179.google.com with SMTP id 10so22137668lbg.10
	for <qemu-trivial@nongnu.org>; Wed, 28 Jan 2015 14:37:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SR4++E04P3fOxZ8yX8CZEDXnVbV7eySemD9PWBzn9OE=;
	b=MtaQtkKfHxMbZy0V+Ncxm9hbm1twOskmYnsIooJy0rbwvARUUm6PAeawoott7cyNQe
	3vC5NVYFn0MYg7z2mh3CnTA3nkEfRh84MAueqduix8kxd7qQiQECWFUYAmc/rULuzEiQ
	qJmc4dipxc3fyH11Hp1OCtHOjCmw9AEBWxBRp46LAcDzcu/Y15xCoZd9ejEqhvjod+Nw
	MNuLN78ySI2RD9buZq4iXRpx1ssHvNV2ZpYpJEbTcv9tmNK4l5OAE63RoZMy0rr6irtS
	iQw81cShhLgHQ7RpF7rVK3M2WYjjDpCllwaAZt4RkhjBMC1nabDhNPoDEbAd99fTM+Bm
	OBfQ==
X-Gm-Message-State: ALoCoQmlBjqw0LECfsLNmwZxUKHqKgBUZzqAXtOvjectzjQ5PqACQZDhaZgdHk2W4x4tmVBpONKf
X-Received: by 10.152.9.41 with SMTP id w9mr10940486laa.17.1422484622499; Wed,
	28 Jan 2015 14:37:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Wed, 28 Jan 2015 14:36:42 -0800 (PST)
In-Reply-To: <54C95E09.1030107@sunrus.com.cn>
References: <54C4DC4E.3080306@sunrus.com.cn>
	<CAFEAcA_hGO-R85yYXDU7eoC7FHF_v96y7Oh54SX9HXBAss6Vpg@mail.gmail.com>
	<54C5672D.4080800@sunrus.com.cn>
	<CAFEAcA9mqzpHsWcyDdzBYDWdxsR1AoDy3akgHCaMUbjZ0zh=0Q@mail.gmail.com>
	<54C6566B.6050205@sunrus.com.cn>
	<CAFEAcA8q7jNqL8DFygnHaiiv=2pGKXBQ_Gi1icOn9H=diOXK5Q@mail.gmail.com>
	<20150128142705.GA22971@afflict.kos.to>
	<54C95E09.1030107@sunrus.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Jan 2015 22:36:42 +0000
Message-ID: <CAFEAcA-GviCfmB3vZVFRNXK7BDHoKON7ZCE9-=bE0SrYCQj9gg@mail.gmail.com>
To: Chen Gang S <gang.chen@sunrus.com.cn>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.179
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user/syscall.c: Let
 all lock_user_struct() and unlock_user_struct() paired with each other
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
X-List-Received-Date: Wed, 28 Jan 2015 22:37:20 -0000

On 28 January 2015 at 22:09, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
>  - Is what I said above really correct (e.g. is linux-user really mainly
>    for cpu emulation)?.

Not really. linux-user is mainly for running single Linux binaries.
It has a secondary use for running gcc test binaries which think
they are "bare metal" but actually use some kind of semihosting API.
(You should check whether tile has one of those.)

As well as linux-user mode, QEMU has system emulation mode, where
we emulate a complete machine.

Both modes need CPU emulation.

-- PMM

