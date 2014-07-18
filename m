Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X82Mb-0007hf-IB
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jul 2014 03:13:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X82MV-0007f0-La
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 03:13:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X82MQ-0003aO-Sp
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 03:13:47 -0400
Received: from mail-lb0-f170.google.com ([209.85.217.170]:59033)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X82MQ-0003aG-Le
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 03:13:42 -0400
Received: by mail-lb0-f170.google.com with SMTP id w7so1683956lbi.15
	for <qemu-trivial@nongnu.org>; Fri, 18 Jul 2014 00:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zm89ghPiPYvRYzfPada0fPlPD3hCo0ENldqBvWQJ6kE=;
	b=FPzN0934kSd0pzcvT9KrWCkvxQhMLj++ql+OeZl0LTBfPfLgvBncPVTJhNHRfFM7rb
	2MVcaIaVWmig36D6s0gVTCnbJpRNHInUh9tw59h80GiMKbKYtAhG+fCSeWoUh4O8Pzxb
	YsNjG0vdu9yhbiTi/YD1rm2FXsba+Tgl+LYd9s8P7nVS4dBwPMbiuAerWBTQrlUaeYv5
	BBYIF4yPzLVDDSDloYohshFRdYes2iv1NWIKe1QHjmD8obimKbAjbj4Jlmbcsj9GbNzf
	5BM8E2gfxyRlhaWe7OWiac7f5I846ekr7DXA9OkP4cntEnEoqLgy7qhzV6HQvoczIgcp
	6+pw==
X-Gm-Message-State: ALoCoQmloWXxjzTGXnjh/gw1xnEECWMMeNMLvDdC64hYXUZ7Yoh5ezs67aLKGawa77xvDEZgrNXZ
X-Received: by 10.152.19.169 with SMTP id g9mr2381314lae.47.1405667621441;
	Fri, 18 Jul 2014 00:13:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Fri, 18 Jul 2014 00:13:21 -0700 (PDT)
In-Reply-To: <53C8AF0D.2060508@msgid.tls.msk.ru>
References: <1402933631-3276-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA9SAZF7kg9wJz9iQKPyML_7hA0kCm5ghjr5O+373srnzA@mail.gmail.com>
	<CAFEAcA-1r0DkyT8+VuSSTRrkKX5GGQb32VzZ42KqS_-TW+0GYw@mail.gmail.com>
	<53C8AF0D.2060508@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Jul 2014 08:13:21 +0100
Message-ID: <CAFEAcA8hjO5gdcjCzP_bAmczXG2X79Ko4hDFWb6k-SHCxKr6hA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.170
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Give error message
 if hostfwd_add/remove for unrecognized vlan/stack
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
X-List-Received-Date: Fri, 18 Jul 2014 07:13:52 -0000

On 18 July 2014 06:22, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 08.07.2014 15:39, Peter Maydell wrote:
>> On 26 June 2014 13:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 16 June 2014 16:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> If the user specified a (vlan ID, slirp stack name) tuple in a monitor
>>>> hostfwd_add/remove command and we can't find it, give the user an
>>>> error message rather than silently doing nothing.
>>>>
>>>> This brings this error case in slirp_lookup() into line with the
>>>> other two.

> Peter, I returned from vacation yesterday, so I weren't able to process -trivial
> queue before, and due to the time constraints we have before 2.1, I'm not sure
> it is a good idea to make a pull request for the -trivial tree.  I'll pick this
> one up but it might be better to apply this directly.

At this point and given the slirp code has been like this for a long
time, I think it's probably best to let it go til 2.2.

thanks
-- PMM

