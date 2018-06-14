Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fTPm7-0001ql-DF
	for mharc-qemu-trivial@gnu.org; Thu, 14 Jun 2018 06:46:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTPm4-0001pN-TF
	for qemu-trivial@nongnu.org; Thu, 14 Jun 2018 06:46:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTPm3-0003Tl-H2
	for qemu-trivial@nongnu.org; Thu, 14 Jun 2018 06:46:40 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:45101)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fTPm3-0003Sn-2K
	for qemu-trivial@nongnu.org; Thu, 14 Jun 2018 06:46:39 -0400
Received: by mail-ot0-x243.google.com with SMTP id a5-v6so6504274otf.12
	for <qemu-trivial@nongnu.org>; Thu, 14 Jun 2018 03:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U2AJlSjgbLZ7SQTj3SlIKeFCyc61gA8CkoUBtsUoNcQ=;
	b=TMWUhhvD0CbnverlPqGTfhmyyownFQs99wUmkv4Z3W0SwUWuu6xMX5imjUXF60AJhQ
	JpV+1JdzUOYzxPeBhq8OeGuVQYUMSshD3ZIsIgvTz6z/9u/6ZpmPl91HVD8XhgokDUS+
	9iOXEsatfFc+yiazwLujyfgcTNHKrJvv232jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U2AJlSjgbLZ7SQTj3SlIKeFCyc61gA8CkoUBtsUoNcQ=;
	b=dQqBRR9nQNwaIsP0KNXKuZzhmSrtO1/FUjhklO7fNTD8E1X/d5ZLvw8Z2ivluhN1ua
	t+/LOzkaAl+U3mxqnXeYpfBl2aOHgBgN7Yli46or6QbZahoAZ2imN0TDibae1rG9zbCh
	H1V/p1GkwyDeaozDssvHRiZWXRRK0+D/gQFpVaK/BKimNInJFa6r7BzRtPmFZRqTfg/O
	yPDNTn+GZxGUd89PVnmjueFCCBh5MvL7nlqZyLIbGHNbSp6hCg7OQwhwyjO15syxiW95
	usgl7cklldlVzj+T2XuPPvJWC/M2eyebAs4BhGeAYktG/nvKgLpBEdjfeaop123OJIDD
	E3fg==
X-Gm-Message-State: APt69E13DHq1nn4QJkG5zS/ksfVR7URJ9tZnRcNJkHI7CG2gYzeuznVz
	bt95qzamGoR1036qNdBLe/LBABKdi4L1Fkj5eZ0eeA==
X-Google-Smtp-Source: ADUXVKJRmiwVD+ssNUDsNm0BSmEgAqRm9bqgyG4W/AEOKYAn2w1sp7yiiPGZvscwmJ1t3l3LwUzOqze/Gx+YIi9VBsw=
X-Received: by 2002:a9d:3d76:: with SMTP id
	a109-v6mr1100749otc.294.1528973198288; 
	Thu, 14 Jun 2018 03:46:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 03:46:17
	-0700 (PDT)
In-Reply-To: <f9beda14-7c4a-8f89-baf1-5a79e847c4ac@redhat.com>
References: <20180611141716.3813-1-peter.maydell@linaro.org>
	<650048df-f4b1-b351-f877-be8c84197ba2@linaro.org>
	<CAFEAcA-vZH0KUxi+iYP3eYzXeHxNTotNwCMhEPcGhOLksbG71A@mail.gmail.com>
	<f9beda14-7c4a-8f89-baf1-5a79e847c4ac@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jun 2018 11:46:17 +0100
Message-ID: <CAFEAcA_egToeW7ksTncbFCsW6uTh1FcPSgW6gx+VnjvQpqwWsw@mail.gmail.com>
To: John Snow <jsnow@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, "patches@linaro.org" <patches@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Markus Armbruster <armbru@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] CODING_STYLE: Define our
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
X-List-Received-Date: Thu, 14 Jun 2018 10:46:42 -0000

On 13 June 2018 at 17:55, John Snow <jsnow@redhat.com> wrote:
> The same reasoning could be used to justify
>
> /* two
>  * lines */
>
> as it's ... actually just two lines. I think people don't seem to like
> this much either (why? does it look 'naked' on the end?)

I dislike the way it breaks up the line of stars. For me it is the
/*
 *
 */
shape that defines a multiline comment, and where exactly the text is
on the RHS of it is not important to my sense of visual neatness :-)

> It would only begin to matter terribly much if we actually decided we
> wanted to do a doxygen-style doc generation for our internal APIs for
> compatibility with, say, fancier IDEs than vim/emacs.

We ought to do that at some point -- I had some prototype patches
for it. Doc-comment comments always start /** on a line of its own,
though.

> As it stands, we're pretty inconsistent about which exact style we apply
> when we "document" internal functions -- sometimes we document the
> header, sometimes the implementation, sometimes both (but differently!)
> and always with different styles all over the place. That's the real
> problem, IMO.

IMHO -- global functions should always be documented in the header
with the prototype, and any new global function should get a
doc comment (I require this for code I review...) I should be able
to read about the API your code exposes to the rest of QEMU purely
by looking at your headers.

thanks
-- PMM

