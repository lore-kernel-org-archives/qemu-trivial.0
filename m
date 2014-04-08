Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXSXY-0003tP-BS
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 05:42:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WXSXP-0003l8-8w
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 05:41:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WXSXJ-0000tY-FT
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 05:41:51 -0400
Received: from mail-la0-f46.google.com ([209.85.215.46]:42521)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WXSXJ-0000rT-1O
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 05:41:45 -0400
Received: by mail-la0-f46.google.com with SMTP id hr17so626795lab.19
	for <qemu-trivial@nongnu.org>; Tue, 08 Apr 2014 02:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=T0ymOC7rtFPadSzt9qOoAieHBBrRnEBu/Sk3xENcd20=;
	b=R1/oxLPT4d8TABft+tuXs4twHjehNrQr4oKWQ+sHrIp2He+md0QHKcUTnmua5wrNTb
	DDhEEeZ+QRsPv0F6vdBcyXGg9xna4g46BWmt0KuQefw0ahgPgPc+K0aIiTggZ29cOQgF
	ABtLf708anjd/pGtsM9ydKjAttGFLNdTImJDukg2bLW5YjQtDgAcQrViOqR1/GyIgxUC
	IsB2IVLk3hPJIHEgTuCl0nUarkdjkVUzkA5I1ldUYw6+51vgEBF+U5CGsr34MqLAd5/J
	e3Gkudad11j/bh6muqkSl/9fZ90LC6L2m0AzK8++loPyv2b+LMxv4uB1GiW37/87K2SR
	3DSQ==
X-Gm-Message-State: ALoCoQnkeeQglBm+vQEguteXAi48WDfbEv+PwZ71VBvG8OoxXH3BIGWY6cMJQSZhxH2vL8nNJ4bl
X-Received: by 10.112.142.68 with SMTP id ru4mr875089lbb.49.1396950103815;
	Tue, 08 Apr 2014 02:41:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Tue, 8 Apr 2014 02:41:22 -0700 (PDT)
In-Reply-To: <5343B8CB.9050700@msgid.tls.msk.ru>
References: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA941ST_y3k3b5UjTZeKP220WnZE0Bp2Lok4czw58T74_A@mail.gmail.com>
	<5343B8CB.9050700@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Apr 2014 10:41:22 +0100
Message-ID: <CAFEAcA9xr+fyjACcvn7N=dMdMmsm6j++Vosqz1XZmzr125WqoQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.46
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL for-2.0 00/11] Trivial
	patches for 2014-04-08
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
X-List-Received-Date: Tue, 08 Apr 2014 09:41:56 -0000

On 8 April 2014 09:52, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Well.  At least one of them is entirely safe (hw/ide/ahci.c).
> Another - xbzrle.c - looks okay, and even maybe fixing a bug.
> And this int128 thing is okay too, except that the whole thing
> is questionable as has been mentioned in that thread.
>
> I can prepare another pull request without xbzrle and int128 changes,
> or even without ahci change too, but I'm not sure it is worth the
> effort - I think everything is okay to go.  I'll take your word for this.

Well, anything that goes in today is going to get at best two
days of being tested before the release. To me that argues
fairly strongly for not putting anything in unless it is
fixing a genuine bug.

thanks
-- PMM

