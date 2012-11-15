Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TYvBK-0006eX-0u
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2012 03:52:18 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TYvBF-0006dP-Nw
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 03:52:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TYvBC-0004eH-LT
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 03:52:13 -0500
Received: from mail-ia0-f173.google.com ([209.85.210.173]:47317)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TYvBC-0004dz-HJ
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 03:52:10 -0500
Received: by mail-ia0-f173.google.com with SMTP id m10so868727iam.4
	for <qemu-trivial@nongnu.org>; Thu, 15 Nov 2012 00:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=NksbmhzxZcFsIfc/KCr9fAHimfg7F5bk8ZiFvAr2vXc=;
	b=S6uQup3NioWW+nfQwyMn9LVs3MvAGCRzry0p9BfmQtptfNw+mVKAo/yV2a39H1jt4I
	xmDiK0ZdZJPkbCAekKgbGk1d9r7tVsjBqORAjeEZH6DrNB59qsTuabeIXtibfbQyaM8j
	N29Z06FrH9xWMq1qAbsyLBJM0FuhHeIUYudjMu3/T+svrwskBEWAnQsBMY2o2Rr+dDjq
	gP6T3CHTaLF4Gvu+aJGHteH2ymwu/4BnbPNyLLU59bWfk2cCuu2WFGxdjvN0bNrq1Bwy
	lB3LuYFGHLB+iaeKYj1TxqZtFOQCNy0fr8WIt+5V4GSZrpmg1Q6zjGSnB1BZ8LbdZs18
	M3JA==
MIME-Version: 1.0
Received: by 10.50.190.162 with SMTP id gr2mr1842546igc.65.1352969529796; Thu,
	15 Nov 2012 00:52:09 -0800 (PST)
Received: by 10.50.88.166 with HTTP; Thu, 15 Nov 2012 00:52:09 -0800 (PST)
In-Reply-To: <1352961173-16498-1-git-send-email-peter.crosthwaite@xilinx.com>
References: <1352961173-16498-1-git-send-email-peter.crosthwaite@xilinx.com>
Date: Thu, 15 Nov 2012 08:52:09 +0000
Message-ID: <CAFEAcA9_CAhW5m+99ci2NwomNG0vO5Y2qH=Hdoy4XQtumGQuhw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnMfIagjFF/A7dyQUQyasrSo75wiI5WFfthPvkSQtztBzsC0TJKrmWwOG4rdRTJq6L3/QuC
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sd: Send debug printfery to
	stderr not stdout
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
X-List-Received-Date: Thu, 15 Nov 2012 08:52:16 -0000

On 15 November 2012 06:32, Peter Crosthwaite
<peter.crosthwaite@xilinx.com> wrote:
> Some debug printfs for SD are coming up in stdout. Redirected them to stderr
> instead.
>
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(the patched section is inside an #ifdef DEBUG_SD guard, so
it's ok to be doing fprintf()s here.)

-- PMM

