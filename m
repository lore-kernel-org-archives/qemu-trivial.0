Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dPRTm-0002KE-J7
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jun 2017 06:42:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dPRTk-0002If-N4
	for qemu-trivial@nongnu.org; Mon, 26 Jun 2017 06:42:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dPRTj-0001XN-Up
	for qemu-trivial@nongnu.org; Mon, 26 Jun 2017 06:42:48 -0400
Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f]:36217)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dPRTj-0001Wx-Ou
	for qemu-trivial@nongnu.org; Mon, 26 Jun 2017 06:42:47 -0400
Received: by mail-wr0-x22f.google.com with SMTP id c11so142439731wrc.3
	for <qemu-trivial@nongnu.org>; Mon, 26 Jun 2017 03:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XNXGfJ6EkL6ZIH/SKl5DmpeZLpc4T39uQQhvFqykpcU=;
	b=K11miUGWocOyzkF+xAo7nsz7RQNZoXKTIYDNTFjc3wTO3iH77d3soxWUw60GcWVV/f
	nqMEw9S53xa41Fd4MutJCSfMKxAh2YY14tOQBc1wN397OesQexqTt1vBgpo1GW6ABzPV
	yaAaqbla6wAYMOae7e8R3av/Dm+WH3G7zUHzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XNXGfJ6EkL6ZIH/SKl5DmpeZLpc4T39uQQhvFqykpcU=;
	b=iF/3isLumFCIOR2UUOL3Tr6TjiTkeMvg94Vzx4AoXsPsc0sDd7bfGyJ8sr51QiTbIh
	4Vd10HrE5yUcaVcKrRrB/8//rSeoJYou3Vv75FccyalIrwd3jU5EZA6b6KvoojkCWKC6
	3YQAMmqiRcq2VCwOOjp8Q0Ejw5Tdn1PLbxUCT/RMCByn4FNmriV5JMCUGM8/w6+KbUwH
	FDto1k1iwfZFopvvF4MQhrLRdKyHJWOlrWFEljcri/LigPE4VX91Fjuzt68Pjua4nHBO
	1LlZZKFU6JvzZmwoAWnubLwOL0ufTH+dt7K1fH9y5L30RvqQx+0mpfgsM8caqVuFP+zv
	Smrg==
X-Gm-Message-State: AKS2vOwdcbyhxlS6KkrRq9qaQFiGN7HbNO+vTrEOGX5/YXwHIV+5Bp+i
	pFE7JnM/8kMb8IL0pwC893bMSsSbCX9y
X-Received: by 10.223.162.208 with SMTP id t16mr14780769wra.151.1498473766561; 
	Mon, 26 Jun 2017 03:42:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Mon, 26 Jun 2017 03:42:25 -0700 (PDT)
In-Reply-To: <20170626103756.22974-1-berrange@redhat.com>
References: <20170626103756.22974-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jun 2017 11:42:25 +0100
Message-ID: <CAFEAcA80E514buuMMTTq5+OR-bRqWp0CC98RO-NHQ4v=Y67P8Q@mail.gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22f
Subject: Re: [Qemu-trivial] [PATCH v2] sockets: avoid formatting buffer that
 may not be NUL terminated
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
X-List-Received-Date: Mon, 26 Jun 2017 10:42:49 -0000

On 26 June 2017 at 11:37, Daniel P. Berrange <berrange@redhat.com> wrote:
> The 'sun_path' field in the sockaddr_un struct is not required
> to be NUL termianted, so when reporting an error, we must use

"terminated", but hopefully whoever applies the patch can fix the typo?

> the separate 'path' variable which is guaranteed terminated.
>
> Fixes a bug spotted by coverity that was introduced in
>
>   commit ad9579aaa16d5b385922d49edac2c96c79bcfb62
>   Author: Daniel P. Berrange <berrange@redhat.com>
>   Date:   Thu May 25 16:53:00 2017 +0100
>
>     sockets: improve error reporting if UNIX socket path is too long
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

