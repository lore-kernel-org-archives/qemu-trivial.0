Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1drV8B-00023m-FV
	for mharc-qemu-trivial@gnu.org; Mon, 11 Sep 2017 16:16:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1drV89-000225-1a
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 16:16:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1drV88-0004uP-7a
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 16:16:29 -0400
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:46747)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1drV88-0004u1-1E
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 16:16:28 -0400
Received: by mail-wm0-x231.google.com with SMTP id i189so48145644wmf.1
	for <qemu-trivial@nongnu.org>; Mon, 11 Sep 2017 13:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EPp+C6veGzo30sxAh9ZBXSigOJhJJ0ebS9DstpRlRcc=;
	b=jn8Gww5apzAzmd3qFUhzke0p2nxqPrJQsqgkib8F/rRqcm/vKpapj9UC287RF4AqUk
	8gXLfwpbPJIgDoLywPinEVO25zmK58AUFn3AZ36IO1jrauH+SEBnSQ8PQaq2DpXWy1eW
	0YX6riP1SaQGYErhWLG/MV+E7D4/nHSp59Y9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EPp+C6veGzo30sxAh9ZBXSigOJhJJ0ebS9DstpRlRcc=;
	b=aGR/c08bQwAi/LYomKv2lwcySMnh9hWdioA+edH6Crep3XqZUsTM/TClKY3TZ6OwRF
	syRooCGhyDlpddO99CWvFkUrCzFjqTbcZ59vGcHLfMFihzDEAKMaWC/nKOoUH96i1c+J
	zhiAkDNyRbTe5YUDvD9AdNHq8Jp3yPZov2m78EPgjyOhaH1vylqDAO1NJA9KK4babSub
	Mi8dY2nywrMRsMBSa4TtHjr0/n/zKa+CRDPO4dl5UypKCasWMsmiIFpVzwanv8GYzRPq
	ez+O2gUyu9hv6Akv1HuO29v6l6jSEiotPgybonRd6cqZ8SGphlGTbFJg5TLO3Ag/Iwr+
	NSfA==
X-Gm-Message-State: AHPjjUhc00XMZSulPQT0tsuZz+FXBPgGOJOFmqSMrxkHQkUIFk3w8Ggp
	lzaP6vEJprKwE/qdVuSatV5/+/Rp7ctf
X-Google-Smtp-Source: AOwi7QCiMfb3zISDD2LoqpMWAkv753PSsygSavxIOVlBq6XB4tBCKSda71bCt37F6d1+Pnl5QXdRzY3Vx73f6YxLmpM=
X-Received: by 10.28.166.135 with SMTP id p129mr5275205wme.147.1505160986920; 
	Mon, 11 Sep 2017 13:16:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Mon, 11 Sep 2017 13:16:06 -0700 (PDT)
In-Reply-To: <20170911200002.4511-1-n54@gmx.com>
References: <20170911200002.4511-1-n54@gmx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Sep 2017 21:16:06 +0100
Message-ID: <CAFEAcA-5uT+vMfoNRDkHadGo-O3S-_LOmgj5_7dQgCS8NVzfvA@mail.gmail.com>
To: Kamil Rytarowski <n54@gmx.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Rename round_page() to
 round_pageq()
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
X-List-Received-Date: Mon, 11 Sep 2017 20:16:30 -0000

On 11 September 2017 at 21:00, Kamil Rytarowski <n54@gmx.com> wrote:
> This change fixes conflict with the DragonFly BSD headers.
>
> Signed-off-by: Kamil Rytarowski <n54@gmx.com>

What's the rationale for calling it round_pageq()
in particular?

thanks
-- PMM

