Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dhDoT-0002Yq-DI
	for mharc-qemu-trivial@gnu.org; Mon, 14 Aug 2017 07:45:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dhDoQ-0002X3-O0
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:45:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dhDoP-0000Xd-VX
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:45:38 -0400
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231]:33566)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dhDoP-0000Vs-OW
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:45:37 -0400
Received: by mail-wr0-x231.google.com with SMTP id b65so8963408wrd.0
	for <qemu-trivial@nongnu.org>; Mon, 14 Aug 2017 04:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ePelPL14IZHmMpZOEH2Pc90kgn5Vf2VK6fci86aBkJI=;
	b=byR2Ka8QS96JvijaVO9Wikag3A5+d17WxPyvW86G0JRl2xDSTRRY1Ani0NU6VdSXLk
	cYCOSbI8y/qCVGiKvvNMQ9JFYsdjmtSOCvmE+hkwsbIcnaE942cLOivn90xDBO/7XwoD
	8v5i4s1LO2m0x2yBJjaYgqaGPqwz7+JHH02l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ePelPL14IZHmMpZOEH2Pc90kgn5Vf2VK6fci86aBkJI=;
	b=Tlw6uuZfO1TuzoTR8dhtY8Qxcsni6Kt81MGkEmBV0CtM9+ym45yLbNLe1uijyeUJAd
	1Vw84f/brmnbepc7sQOf8HH8kZzWBEmgEMaUWqf+KnMW8ZnDgfOH8xvtlYRJ94m+0LAW
	C5sMkfdvSSj1qdxqyViIOBxBS7j6TaywFHjI4rZ33ITwBEmvTg42aeJ/pLPWB8FC7blb
	8miOUq37mR9aX4F5NRie8uX9kJMhO/XNcysA/cve8CHQG/tNbUsOlG3ZiK408WAq5+pI
	bC+KL97HzaWvckUXDs4BK7QAxq9u9/cuKD81Rxr0Dqh8f2wQCkA3GHNErzkzXsSGV+Dm
	MGMA==
X-Gm-Message-State: AHYfb5h1AFf0mrLjR5UXXiJxi+xRkbSSD1Wi9rBFoNxlXD6SLHTx3YEI
	dmpDor+B8DdpY6BIbSqdOhe8YDX60sDx
X-Received: by 10.223.165.138 with SMTP id g10mr15012847wrc.167.1502711136719; 
	Mon, 14 Aug 2017 04:45:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 14 Aug 2017 04:45:16 -0700 (PDT)
In-Reply-To: <a808c0865b720e22ca2929ec3d362d4610fbad51.1502708830.git.mjt@msgid.tls.msk.ru>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
	<a808c0865b720e22ca2929ec3d362d4610fbad51.1502708830.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Aug 2017 12:45:16 +0100
Message-ID: <CAFEAcA-Jac8wFzQ9vRyKjcEwDKYBdXysNyDP7ERFfXFhVcF56w@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 7/7] hw/misc/mmio_interface:
 Return after error_setg() to avoid crash
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
X-List-Received-Date: Mon, 14 Aug 2017 11:45:39 -0000

On 14 August 2017 at 12:07, Michael Tokarev <mjt@tls.msk.ru> wrote:
> From: Thomas Huth <thuth@redhat.com>
>
> QEMU currently abort()s if the user tries to specify the mmio_interface
> device without parameters:
>
> x86_64-softmmu/qemu-system-x86_64 -nographic -device mmio_interface
> qemu-system-x86_64: /home/thuth/devel/qemu/util/error.c:57: error_setv:
>  Assertion `*errp == ((void *)0)' failed.
> Aborted (core dumped)
>
> This happens because the realize function is trying to set the errp
> twice in this case. After setting an error, the realize function
> should immediately return instead.

It seems like it should be an error to permit this to be
created from the command line at all -- the device is intended
only as an internal implementation detail of the memory system,
and it has a PROP_PTR property which can't be sensibly set
from the command line.

This patch is a correct fix for an immediate problem, but we should disable
using this via -device somehow.

thanks
-- PMM

