Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZGPG-0003av-5V
	for mharc-qemu-trivial@gnu.org; Fri, 26 Feb 2016 06:17:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZGPE-0003Y5-AM
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:17:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZGPD-0002Vr-Dv
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:17:56 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:35661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZGPD-0002Vf-9X
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:17:55 -0500
Received: by mail-vk0-x236.google.com with SMTP id e6so74141757vkh.2
	for <qemu-trivial@nongnu.org>; Fri, 26 Feb 2016 03:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wKRAw2O14Y7qZns4PonMcAlBfLIDpSzaVBnSqmielZ8=;
	b=KHfy0g1JUTmIbZ+ot3D9TY/PHXPKqFO7uW2CdZ0kEO1BmIWeZHsrkr4K0ZsLbDK8Ts
	XBdFtpJGP+LXZ+1ys3izjwZGuWtkXSvxUw0ELiD++EV9eKr8sxDC4aLLOoO18KLVtl5V
	CNarnrAb0c+yP/3VKVNf582eQKCIgoMrbRBv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wKRAw2O14Y7qZns4PonMcAlBfLIDpSzaVBnSqmielZ8=;
	b=C6n3yQe9Rhztv++1jrC9SWd03BfoU0wGE/+X7tjp854nkgxb8zOq0fKJYwwJYU9INQ
	89l1z70BPEKbdNx/3f+VxJJ4sqPFxydNgxc3iOu/1Kt58XuIx0bjJx9Qvx76WYP4NApB
	haa/++fn5/HacJe3MGhb0PsHra8XO+96aeap0QsAa5uNG/sHN9AVeQY/JmPKbaZ4NNpC
	rJu5OUiFZv2hsXf1BcUulUusSvMWW2fMrReZjpzGk2L1umkWXD5pf4xjsp+Db+ugY43x
	rYHC2ynZtBVrg8xJF0JC+R+SiXWxxPC3qDy8apyU6dLaAsR8ohQRHmyTfgvuFO63+vxn
	YrFw==
X-Gm-Message-State: AD7BkJJ9x860W4v0spBnVBPXbG4PkzmJMlR1X/Um3/0XTNvdnnefbkuZH2dwKLvu48fgejXKcXHjIGuiGW3GUN7q
X-Received: by 10.31.194.130 with SMTP id s124mr636466vkf.92.1456485474871;
	Fri, 26 Feb 2016 03:17:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 26 Feb 2016 03:17:35 -0800 (PST)
In-Reply-To: <56D0333A.2000605@cn.fujitsu.com>
References: <1456484343-7445-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<CAFEAcA8+ekWvpkch2-YrOVdyVOjtH2t3R851WEj4k49DGCd-2Q@mail.gmail.com>
	<56D0333A.2000605@cn.fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Feb 2016 11:17:35 +0000
Message-ID: <CAFEAcA_vs62TV43cmT=-SQ75ySt3U29idyfrwvB5eiPi5M0vbA@mail.gmail.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] doc/memory.txt: fix typo
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
X-List-Received-Date: Fri, 26 Feb 2016 11:17:57 -0000

On 26 February 2016 at 11:12, Cao jin <caoj.fnst@cn.fujitsu.com> wrote:
> On 02/26/2016 07:03 PM, Peter Maydell wrote:
>> Why is this patch touching all these ascii art diagrams? If you want
>> to change them, that's a different patch, but I don't see any need to.
>> In fact you seem to have lost some of the [] from your version, so your
>> change doesn't look like an improvement to me.

> well, the diagram seem not aligned so well, so I did the modification.

The lines
        0      1000   2000   3000   4000   5000   6000   7000    8000
        |------|------|------|------|------|------|------|-------|

have one stray extra '-' in the 7000..8000 part (and so an
extra ' ' before '8000'), both other than that the diagram
itself looks correct to me.

thanks
-- PMM

