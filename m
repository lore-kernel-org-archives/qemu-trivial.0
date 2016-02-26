Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZGhL-0002oo-Sz
	for mharc-qemu-trivial@gnu.org; Fri, 26 Feb 2016 06:36:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZGhI-0002hz-20
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:36:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZGhG-0000Mz-Uw
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:36:35 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:36136)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZGhG-0000Mm-RE
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:36:34 -0500
Received: by mail-vk0-x22a.google.com with SMTP id c3so74524195vkb.3
	for <qemu-trivial@nongnu.org>; Fri, 26 Feb 2016 03:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kH9h/IhqGOGsX8cXnj1bC+jWNhrrDWtWoY+NiMOhBWQ=;
	b=ISY+sr7cKfzX1g/6yp+tmY8SSD3NN30X5GmZnHC2fYBTYZz+zljqrmTw3cGO1169Xe
	IBnkta5MvZuKPRhJW5ZkmjyZg4uapiIqzAaOrWYJrdj7BFxiIWYE4BCUNo0SLV5MGsNn
	4NfmkeSiOli/2Glxv/y67Ybc3KsBU6WINDWRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kH9h/IhqGOGsX8cXnj1bC+jWNhrrDWtWoY+NiMOhBWQ=;
	b=OQUud1Of1Iesr9w7pdKPK+ulw1p6vs23CyL+jXKlQzb8Hd9+o2jFpAPBVnna2/50KW
	xCsNp96LFMSrPFX6C5XIby07GBsdWKcV4QTXndpycUof7kNVzuq7TG2DcyhpOmaCAtX2
	YQMqLSPW17GnMYYprnvWvIbVlZ77JTIMZ5ICKlDQ0ge0iuBUBn5y+09uwaT6OkzIR5JJ
	38s6PUzccqR1hpzB/+CNxEVH06GtAghugP9/89P+tHQdStUy4UZnKe+BZ5xzF5cLoHgj
	NN1e0BNF8PqDXqW+oJWetDeTiQAvsqY+rfkCwsOzNQBw2fyaDWn6awPxVuAtCzGcpRhj
	eNvA==
X-Gm-Message-State: AD7BkJLFWTkQF7lsngKERTRLxhAQ78plzZFpJxWSLI99hm71x+BQBbDTURWrYaOYG2en6p6yCU7sFYX8OOAfdQWl
X-Received: by 10.31.1.6 with SMTP id 6mr554690vkb.139.1456486594440; Fri, 26
	Feb 2016 03:36:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 26 Feb 2016 03:36:15 -0800 (PST)
In-Reply-To: <1456486178-8074-2-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1456486178-8074-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<1456486178-8074-2-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Feb 2016 11:36:15 +0000
Message-ID: <CAFEAcA-LmoovVxDb76TQN8UWJuFxa28ofx-i1TRcSLERapQ=rQ@mail.gmail.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v3 1/2] doc/memory: fix typo
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
X-List-Received-Date: Fri, 26 Feb 2016 11:36:37 -0000

On 26 February 2016 at 11:29, Cao jin <caoj.fnst@cn.fujitsu.com> wrote:
> Fix typo while also modify its description, make the text parallel to
> the existing .impl.unaligned doc.

This still isn't a typo...

> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  docs/memory.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/docs/memory.txt b/docs/memory.txt
> index 8745f76..306280e 100644
> --- a/docs/memory.txt
> +++ b/docs/memory.txt
> @@ -297,8 +297,9 @@ various constraints can be supplied to control how these callbacks are called:
>   - .valid.min_access_size, .valid.max_access_size define the access sizes
>     (in bytes) which the device accepts; accesses outside this range will
>     have device and bus specific behaviour (ignored, or machine check)
> - - .valid.aligned specifies that the device only accepts naturally aligned
> -   accesses.  Unaligned accesses invoke device and bus specific behaviour.
> + - .valid.unaligned specifies that the *device being modelled* supports
> +   unaligned accesses. if false, unaligned accesses will invoke the appropriate
> +   bus or CPU specific behaviour.

Needs to be a semicolon before the "if".

Either "something something. If foo" or "something something; if foo"
are correct as punctuation. Since we're aiming to follow the same
construction as the existing text for .impl.unaligned, we want the
semicolon and lowercase.

>   - .impl.min_access_size, .impl.max_access_size define the access sizes
>     (in bytes) supported by the *implementation*; other access sizes will be
>     emulated using the ones available.  For example a 4-byte write will be
> --
> 2.1.0

thanks
-- PMM

