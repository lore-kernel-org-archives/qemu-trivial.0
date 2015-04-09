Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YgI7f-00018q-Hw
	for mharc-qemu-trivial@gnu.org; Thu, 09 Apr 2015 15:28:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YgI7d-00018d-8q
	for qemu-trivial@nongnu.org; Thu, 09 Apr 2015 15:28:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YgI7Z-0007cI-9R
	for qemu-trivial@nongnu.org; Thu, 09 Apr 2015 15:28:17 -0400
Received: from mail-ig0-f171.google.com ([209.85.213.171]:37244)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YgI7Z-0007c1-5u
	for qemu-trivial@nongnu.org; Thu, 09 Apr 2015 15:28:13 -0400
Received: by igblo3 with SMTP id lo3so546346igb.0
	for <qemu-trivial@nongnu.org>; Thu, 09 Apr 2015 12:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=e9j7ilAFzs/m1U3BjbEu3329/Oi8Tk55oelg5uXGhDs=;
	b=Mu6/1OyUcdVFbBKaFHuxIA93Otul1GL+iO6KWCVpOz3B3rmKv974CzWwMfRgVHb5ok
	1Rouvk+PxWA9bhXWFbLHrhYWcpfeVDHrrMv4GzvSznwucOLb2eRXhNuSAPpy3ihBgX4f
	UuPDqXKAYbaSPVFUqdqUMBOMsI/a6h9WhIcsG/LB4X9Zfv9hiRVPEOc1xTScnnfrMlUw
	oD37gFziGzfSrPsstZhwS5h0KBZlERBXIZv5phbS0xWmp1A/cJfAUImj1KoJz0s/LTDQ
	UJD16wI3fSdP2Lriad97IUlwbY1l+rcOeQSkHvqTaz2sfXCvZGhpq7EJ53uSGJLE6jnU
	cdeg==
X-Gm-Message-State: ALoCoQlDEKDWUSh/9V6RHGRmjen7MFdwZsHHEpoUCXVG2UBmU1Qa+3CntkU8ypBTpLlUqk/PIzse
X-Received: by 10.107.169.74 with SMTP id s71mr39171615ioe.46.1428607692527;
	Thu, 09 Apr 2015 12:28:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.51.201 with HTTP; Thu, 9 Apr 2015 12:27:52 -0700 (PDT)
In-Reply-To: <1428604359-17067-1-git-send-email-sw@weilnetz.de>
References: <1428604359-17067-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Apr 2015 20:27:52 +0100
Message-ID: <CAFEAcA9PoAxaoAM1gHPf-DAx6s6_OS=gPP1eZnoFRft=ec9gaw@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.171
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Jiri Slaby <jslaby@suse.cz>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc: Fix new collection of
	typos
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
X-List-Received-Date: Thu, 09 Apr 2015 19:28:18 -0000

On 9 April 2015 at 19:32, Stefan Weil <sw@weilnetz.de> wrote:
> All of them were reported by codespell.
> Most typos are in comments, one is in an error message.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

