Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFMYq-0004Ns-9n
	for mharc-qemu-trivial@gnu.org; Sun, 25 Jan 2015 07:45:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFMYj-0004C0-JZ
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 07:45:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFMYZ-0005bH-TR
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 07:44:57 -0500
Received: from mail-la0-f46.google.com ([209.85.215.46]:37785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFMYZ-0005bA-Mo
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 07:44:47 -0500
Received: by mail-la0-f46.google.com with SMTP id s18so4007464lam.5
	for <qemu-trivial@nongnu.org>; Sun, 25 Jan 2015 04:44:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=E5i39wvkbMYgmelfFbblSOYkZYsDINXZY8Ic8kGXrzw=;
	b=PLt3pxI/bQSt3lqUDX588uLv6BNyIf/AQiZ4mM4PfPcUCKI6GW7szp70wKBg+WDEsS
	ojQrBzpxfdNeSZ9CIXs0NmkupjTYEXEBBPekn22eS1+Y3lKrg/2Dqe+kvk23ubKcgZk4
	67zZiS/W9RDkDOfnAb74esa3KYV7EaNmOwRfx/zNWBkSbZNeuuX6oj5mO+sqQmLIobgt
	bhyzgYByrI+ymBiEZTULbKEW5irZbK9hqIQXf8n/aoog2pYWzL5P1smrMNQqnmqW0EGR
	x8jHPDWp9/OdZ+YWEGngtYwztfi3b5ryQfU6WTmzmKYpEO/80rr2/k5TJbunMTyNLRhG
	6+kQ==
X-Gm-Message-State: ALoCoQmEl9rmnyNJctTrAKF82rDq3thYhQwwJTA6gUEIqBziSNOBP5apfTpK+Bu23F2vz/GvWgOM
X-Received: by 10.152.120.97 with SMTP id lb1mr16456845lab.76.1422189886775;
	Sun, 25 Jan 2015 04:44:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Sun, 25 Jan 2015 04:44:26 -0800 (PST)
In-Reply-To: <54C4D51E.4030408@sunrus.com.cn>
References: <54C4D51E.4030408@sunrus.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Jan 2015 12:44:26 +0000
Message-ID: <CAFEAcA8Bz_WjQOWPsMUX-bqFR0qmn-ntiNu1j9XBq+vQqPV1TA@mail.gmail.com>
To: Chen Gang S <gang.chen@sunrus.com.cn>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.46
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] linux-user/main.c: Use TARGET_SIG*
	instead of SIG*
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
X-List-Received-Date: Sun, 25 Jan 2015 12:45:02 -0000

On 25 January 2015 at 11:35, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
> In main.c, all SIG* need be change to TARGET_SIG*, since the related
> next call are all for TARGET_SIG*: queue_signal() and gdb_handlesig().
>
> The related vi operation command is "1,$ s/\<SIG/TARGET_SIG/g".
>
>
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

