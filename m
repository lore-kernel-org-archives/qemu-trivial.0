Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SyQJN-0000GG-Sa
	for mharc-qemu-trivial@gnu.org; Mon, 06 Aug 2012 12:37:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SyQJM-0000G9-Er
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2012 12:37:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SyQJL-00073F-E0
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2012 12:37:44 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:64721)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SyQJL-00073B-9h
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2012 12:37:43 -0400
Received: by yenm4 with SMTP id m4so267841yen.4
	for <qemu-trivial@nongnu.org>; Mon, 06 Aug 2012 09:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=KWgw7yjgLb94BcknN5hreH4N+H4LYvMC07Knw1dS+wM=;
	b=ddNjN4AQTlUY6rnvH+eZ6bcPuQ2Nn4Tx6TJFEaqdpiMXxJhjt/2TaVj+UsAYUc709P
	8cWb0XLwzSw1sSKQD9CXMs5RROY0QB3bH2pBHjz6rvsO0PiG+NgYqjFCdp2t/+9cD9oX
	Tr+atSlHveTvYBtpARWMLdHH+kRjukDxJXYEWJCObzGlSQQzXZIR2DytlCY/XgJJPsR2
	t4yduUkJs6pUaXny4PlqQG16xqJpQwEMQH1wSSTsdF6IvZn+BeX6dPHd3Yu+ox83ebGb
	Sra1XqD+yfA4tXcpc9rM+YtajIqI/flZvCegfzK7E2GdKcrw6t+wpszJUaczQ+FZDzAC
	h25A==
MIME-Version: 1.0
Received: by 10.50.207.65 with SMTP id lu1mr5990978igc.33.1344271062305; Mon,
	06 Aug 2012 09:37:42 -0700 (PDT)
Received: by 10.50.237.41 with HTTP; Mon, 6 Aug 2012 09:37:42 -0700 (PDT)
In-Reply-To: <1344270823-17607-1-git-send-email-peter.maydell@linaro.org>
References: <1344270823-17607-1-git-send-email-peter.maydell@linaro.org>
Date: Mon, 6 Aug 2012 17:37:42 +0100
Message-ID: <CAFEAcA9cJCSE8G5NKMEm63eymRsWWNTpO4xa2SdnidyM_obUbA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmWrat3cUO2rh0LtjqeRPeS1qbtZDD0INAe52u8bu3TELtbj6VM+2bxW4xtKCGv3JEyKxuW
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org,
	"Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-arm: Fix typos in
	comments
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
X-List-Received-Date: Mon, 06 Aug 2012 16:37:45 -0000

On 6 August 2012 17:33, Peter Maydell <peter.maydell@linaro.org> wrote:
> Fix a variety of typos in comments in target-arm files.

> -/* Handling addition overflow with 64 bits inputs values is more
> - * tricky than with 32 bits values.  */
> +/* Handling addition overflow with 64 bit inputs values is more
> + * tricky than with 32 bit values.  */

In accordance with Muphry's Law (http://en.wikipedia.org/wiki/Muphry%27s_law)
I've just noticed an error here: should be 'input', not 'inputs'.
Will send v2 patch in a bit...

-- PMM

