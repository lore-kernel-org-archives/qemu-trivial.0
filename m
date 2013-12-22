Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VukmM-0000ua-AK
	for mharc-qemu-trivial@gnu.org; Sun, 22 Dec 2013 10:17:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VukmG-0000uO-L7
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 10:17:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VukmC-0006xF-6N
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 10:17:12 -0500
Received: from mail-pa0-f49.google.com ([209.85.220.49]:54074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VukmC-0006xA-0T
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 10:17:08 -0500
Received: by mail-pa0-f49.google.com with SMTP id kx10so4422943pab.8
	for <qemu-trivial@nongnu.org>; Sun, 22 Dec 2013 07:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=n/bMWNzBqX7mHPbMxhbQMn2LvIAijfLCvmgRzksGaUI=;
	b=eWKBs1LmtQEbu4EKC7YqSwzuty4MW7ZgKy/frwjoGFGq8EUTmbIgN/dOpo5HIaBbFj
	lpwdAX5LjTZC11kq1XEvyMXOsVxATEBt7qxGqq2xJAyuVnk3vlaKHXUdvCRPJEGyO5KB
	rh4MOELecndSXdz9RaYBB82aUAFLr1PEqNH5PTePVGDRUYWd4qWpDc/t2t2idefvoC4B
	YE5qzkSM4kN6za1L9QbwvrumJSSY7pLx4ix81Tj6QJiF186qgir+HuLCwNtyW3L7SMSe
	1/pYDvP1oWNktqyzfyFsKzCWYo6MKamX/Z/7KDixViIpSdmxtlsvatAqqUZaVrh8BLLx
	NRgQ==
X-Gm-Message-State: ALoCoQkMCOJrFesmjCOBxUBOviWN1nE7W1FFL4IRt5ZIFZvMcu3vNvlK5XPS26Dg6SK0cD9FF61R
X-Received: by 10.66.145.199 with SMTP id sw7mr3353288pab.143.1387725427349;
	Sun, 22 Dec 2013 07:17:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.70.82.227 with HTTP; Sun, 22 Dec 2013 07:16:39 -0800 (PST)
In-Reply-To: <1387722177-28824-1-git-send-email-sw@weilnetz.de>
References: <1387722177-28824-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 22 Dec 2013 15:16:39 +0000
Message-ID: <CAFEAcA9TDOohjP6Po2=uV3BNuwKma+yNjM1g1vpY3RHnC+hvkQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.49
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] pxa27x: Add 'const' attribute to
	keyboard maps
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
X-List-Received-Date: Sun, 22 Dec 2013 15:17:17 -0000

On 22 December 2013 14:22, Stefan Weil <sw@weilnetz.de> wrote:
> The mapping is a hardware feature, so it is relatively constant.

This is true but not particularly relevant to whether we should be
marking the structs and parameters as 'const' or not. Still,
the change is good, so

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

