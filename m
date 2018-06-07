Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQuvg-00013A-Vo
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jun 2018 09:26:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQuve-00012r-UM
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2018 09:26:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQuve-0006kO-6H
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2018 09:26:14 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:43526)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fQuve-0006io-0W
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2018 09:26:14 -0400
Received: by mail-ot0-x241.google.com with SMTP id i19-v6so11497267otk.10
	for <qemu-trivial@nongnu.org>; Thu, 07 Jun 2018 06:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R292H/oT8rKP/ypAWZpLdD3uRlMlU0BJ/VFZyrhHLPY=;
	b=kJzmgFucJ8aBWux1de7+px/MfcjWBJI+3jLljkrXhvTXv5eep4/As2678MRNJu8TJQ
	3+z6KCakSq1+7GHTwHtZ47zAOzEL0C1LDp1L6mlNNZQFS1S1uMfJ1EXcNTw/9D+YA5B+
	au/hqIbhXy1wbh+FvOXQQaNyyFuU4sYIZYU+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R292H/oT8rKP/ypAWZpLdD3uRlMlU0BJ/VFZyrhHLPY=;
	b=pFDVrHtkEk3Fa3nqpD4CuK44cjTxhthvH8itSLeFao3xN62yPV3GWa92gK80GxGvGj
	BH79BtBm3pe4bvOpKTDE1y1R8v1RM9US8EUQdPO96qurrbFgXTbT+jdTH7T+Bh6E2MBW
	6qGykgMTfRo/Z39AdMcKipjRoF1Gq8E0INbAqdIMKe6sBrHv8tozZYGJikt5ffBZevwc
	yKmQolpLkLu/ZhtD+EaNjnKolJzXO9UqJAlOyRzWmxVmA7WdxNsq0O2s4Z5joSJCv527
	gTmIaYA1Enr1JjN+SBdsJrBgKpF/7TJ0MEriybnBjxSa8OHsOawvfvw0PHzPiBXJ7oMv
	qSXQ==
X-Gm-Message-State: APt69E37tC19/9rG8/th1czMAtW64nI4KK8MJ3D3X9nq/Kp9T30LriOV
	sm66NDM9NKKWX/pRV9DTUCcQdC307uOVIxz5SL5gZw==
X-Google-Smtp-Source: ADUXVKI+IMPvzVtJzMgd8dFAQHR5Qv/TVjhyb4zOIYWF+j7URxI5h5NjepRTgFh6lnFLs0AiEqi0oojz+kXsJRcP7co=
X-Received: by 2002:a9d:3fda:: with SMTP id
	i26-v6mr932509ote.126.1528377973242; 
	Thu, 07 Jun 2018 06:26:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 06:25:52 -0700 (PDT)
In-Reply-To: <20180607124016.GJ19032@stefanha-x1.localdomain>
References: <20180604162140.20688-1-peter.maydell@linaro.org>
	<20180604191756.1ae61871@w520.home>
	<20180607124016.GJ19032@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jun 2018 14:25:52 +0100
Message-ID: <CAFEAcA9z=f9oiqYrF8ZeCMj9-FjZAyMMGwv9e-argF+vRd4X-g@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] CODING_STYLE: Define our
 preferred form for multiline comments
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
X-List-Received-Date: Thu, 07 Jun 2018 13:26:15 -0000

On 7 June 2018 at 13:40, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Mon, Jun 04, 2018 at 07:17:56PM -0600, Alex Williamson wrote:
>> Note that the kernel coding style, except for certain exceptions, is:
>>
>> /*
>>  * This is a
>>  * multi-line
>>  * comment
>>  */
>
> Amen, the one true way.  :-)

OK, consensus seems to be for recommending the kernel-style for
multiline comments.

Does anybody who knows checkpatch feel like they could write a
checkpatch check for this? (Unfortunately there isn't one in
the kernel's checkpatch script either, as I found out when I
last wrote a kernel patch and got dinged for not putting that
first blank line in...)

thanks
-- PMM

