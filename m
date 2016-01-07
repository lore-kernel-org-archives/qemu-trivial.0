Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aH9WZ-0006wl-Vs
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jan 2016 07:18:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aH9WX-0006vj-Cw
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 07:18:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aH9WW-0003M9-Ja
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 07:18:37 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:35791)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aH9WV-0003Lq-Cf
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 07:18:36 -0500
Received: by mail-vk0-x236.google.com with SMTP id k1so172714163vkb.2
	for <qemu-trivial@nongnu.org>; Thu, 07 Jan 2016 04:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yS8sjCcCjLDsV8hCM58uKi3cpsMvIUuojuRES8TjQLQ=;
	b=TdhxkU55c3bPXvvvKqKVx6oinsvYtMCsQLpbuW9cNhwhhfnyIwrRuhjH3wn03jI0f9
	B4Osr9KdC6IEJFuJQGrPo7ywWyNvVZoc7DdS8LbFvOeP6xVUQiwJ9jxT0qZkwH64NC+6
	GMH/WVGXHybY9Gmg4jm8xSWr06rTwIjAf5Ex8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yS8sjCcCjLDsV8hCM58uKi3cpsMvIUuojuRES8TjQLQ=;
	b=Zqvb7pjySkK8vIJz+kKnF/pPEM4/uGClSQGfsPX17KgUdHYrbJr5UpYbTLDeCgqtNo
	YK4KgOwyFrzCZix1NeXf0SON+YAJLgSUUxAL7+UEdogy8uHmsdvSt+yeEFtvR9kF+mr/
	V+EanokCtkTY0GO7+kco45p34xbpaxiw/Ozl1/LnEOarMzqh6VzQTPDGM9ROTHi43mvx
	A4OR/TVujtZJK+kXxZ2VxEvIWgtMOueeoaGZYzCRKVK3Mx4OxtKnFMTiLnsMMgwarhoZ
	xqz160ItuPPR2K7CWiGh878OsNC7pnihPps377WCpApFsPUmoZmmfeEuSPt9Qj7GGVAv
	WegQ==
X-Gm-Message-State: ALoCoQmp1sq0/MyT0lfBsfLlmZgmNFrlm/5CMkhnSyo+2HFQEKThVtGKSciJpooGOF3wGQ16dSwhJ+F4agStUtWvWRaVzFBJzpjKG8SOO7vyZ1Sl2m30TJA=
X-Received: by 10.31.47.197 with SMTP id v188mr73916369vkv.6.1452169115025;
	Thu, 07 Jan 2016 04:18:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 7 Jan 2016 04:18:15 -0800 (PST)
In-Reply-To: <568E56BA.8020706@physik.fu-berlin.de>
References: <1451382673-5345-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA8Vd8q5JXSwUaD6-i+Z4aHkO2NiXJ2TMSG3rfyXJijoQw@mail.gmail.com>
	<568E56BA.8020706@physik.fu-berlin.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2016 12:18:15 +0000
Message-ID: <CAFEAcA-b47=1XD2hT2iBj9HSp_MXtmKKKeWkk8XjnTzH+tqyww@mail.gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] linux-user: enable
 sigaltstack for all architectures
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
X-List-Received-Date: Thu, 07 Jan 2016 12:18:38 -0000

On 7 January 2016 at 12:14, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> Hi Peter!
>
> On 01/07/2016 12:52 PM, Peter Maydell wrote:
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> Has this been committed yet? I can't see the change in cgit.

No. "Reviewed-by" means I just code reviewed it. At some point
it will be picked up by a subtree maintainer (either the
-trivial subtree or the linux-user one). That person will then
at some point send me a pull request for their subtree which
will result in the commit getting merged into master when I
apply that pull request.

thanks
-- PMM

