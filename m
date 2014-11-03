Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlKjP-0000oM-MP
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 11:43:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XlKjJ-0000d2-60
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 11:43:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XlKjE-0002Lg-H8
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 11:43:45 -0500
Received: from mail-la0-f54.google.com ([209.85.215.54]:45085)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XlKjE-0002LU-2e
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 11:43:40 -0500
Received: by mail-la0-f54.google.com with SMTP id s18so4471523lam.13
	for <qemu-trivial@nongnu.org>; Mon, 03 Nov 2014 08:43:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ovrt3qIqdNmXvjS0OeLAIbxX6HlVrQxNYDtgFL9wNhY=;
	b=BwzrCEGWpAnKLLMGdaBFVpTFREFTyEMqLVgyBNnaz1/JG6s4wih5r6ABmW+9DVfAPu
	StkCvgGouvMsfaUQuvJ7WfA7UXbF3n6yy+fc0qcby26wvJVou3D6cMArJYrLiOrSymcB
	cHLisn5E4hw+OW5ru/tXIXfznZtrK/hhqjOaTdCOCR9EI5MWqmiwd8znqdnvyrxZPXwK
	2Lqmcg47NgmzLYx+n6eQ8KdRRH3nD682crVuhG6Mj+mu9qeLjIgaLxrd0hO/L4eSrm9U
	NA1vTGkBdVKt/g9iy4tBlnrMwYvrl8Ofcc0sCpYLDA59MC0eNz1ohrnR26enweySIXcb
	jefA==
X-Gm-Message-State: ALoCoQmzmQ/MH8dJa2D7kaKMcXJzJNT6bLFsHPAwOsTFKU/yAYmNMO2O0XDtCIjF+0eyv9HNi+DH
X-Received: by 10.112.189.10 with SMTP id ge10mr51863974lbc.23.1415033016677; 
	Mon, 03 Nov 2014 08:43:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.173.168 with HTTP; Mon, 3 Nov 2014 08:43:16 -0800 (PST)
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Nov 2014 16:43:16 +0000
Message-ID: <CAFEAcA8h_yV6HPw17oNmNv_Jtq0ZMr4Vd5U2facQmOdB-oV=-g@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.54
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/23] Trivial patches for
	2014-11-02
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
X-List-Received-Date: Mon, 03 Nov 2014 16:43:50 -0000

On 2 November 2014 11:57, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's an almost 3-week trivial patches pull request.
> Lots of small things here and there, many small bugfixes
> too.  This is also a first pull request for which a
> signature should finally be known to others.
>
> Please consider applying/pulling.
>
> /mjt
>
> The following changes since commit ee29498e4f0f3eff90eeeb7f5fa1703abedd2fb6:
>
>   Merge remote-tracking branch 'remotes/sstabellini/xen-2014-10-30' into staging (2014-10-30 20:28:09 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2014-11-02
>
> for you to fetch changes up to f18a768efb990d9cd02911159de02e8ff5475239:
>
>   vdi: wrapped uuid_unparse() in #ifdef (2014-11-02 10:05:35 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2014-11-02
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

