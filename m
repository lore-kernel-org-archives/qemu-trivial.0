Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fT4vR-0003ev-3n
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 08:30:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fT4vO-0003cw-9N
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 08:30:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fT4vN-0008Sm-7K
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 08:30:54 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:42313)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fT4vM-0008RD-PB
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 08:30:53 -0400
Received: by mail-ot0-x241.google.com with SMTP id 92-v6so2714944otw.9
	for <qemu-trivial@nongnu.org>; Wed, 13 Jun 2018 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yAJvLyiqgwLPK93/dYU3l41GKUDEKbe8fuohIqMYbjg=;
	b=NwxMkmMsTlZcBtDInFNyS/zjzmNFa8tUHwnUQ9P3M+mYHo9lLq+1x6uZ1twl1anqmO
	JKNyeR7d7YtYTEPIp6g771yQA0JmE9azSyNUHA9BqVTW3nwqMi8cZye78b9fA2YtKU0c
	LvMChUuvmLI41j+9RAhDQrEzX/hWWR+CBWvow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yAJvLyiqgwLPK93/dYU3l41GKUDEKbe8fuohIqMYbjg=;
	b=qGLC/4KOwFUIXSmiEIzxhlQRQrgYjT7598mOC7AbOXSqos6tS0iDBCwkVJ/Sg0Zt4l
	iAAyxGMPhyLsmvWezoTvTurBplNsMF1j2lOj5YDNFRp5R1enGyHEV2lmFb8zxHEhS7ZI
	IGgxqvdhnUFkZczI+UePS/qJCa7pxZYMNzOxQ4JuM6AqBIzHO/TGnQxK28BngAO4KN7X
	t4jbyoz8edSb+zJRM+MR2mJYdGjgGOPiX47dFayk9xlL4+gaVo9eT8EpppMbDHjDV0lj
	GCjYSxdMtbjo31RAxv3sb2Oy++3b8SdmjyvJLMrTdN/hGM69Rk10Q9Oa+KuyW+xWcgJH
	EVZg==
X-Gm-Message-State: APt69E0OPmRz8pzJsw6vCZqDIAM2bNj9byE+CLlOiPYB2F5+lLTED8vb
	MD/lSXzprP0APem6n1aDSQKOHqv3XAZQ/oYIB4+TPQ==
X-Google-Smtp-Source: ADUXVKLbnMS4UhXJOUsOnvntdbZ+SlUiBaQlDDxC/dzQjpldCFCxLxLj74wRGTC/JlkUzpW10qDB9eFvTlXyfUiN1Pk=
X-Received: by 2002:a9d:2909:: with SMTP id
	d9-v6mr2789413otb.258.1528893052025; 
	Wed, 13 Jun 2018 05:30:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 13 Jun 2018 05:30:31
	-0700 (PDT)
In-Reply-To: <650048df-f4b1-b351-f877-be8c84197ba2@linaro.org>
References: <20180611141716.3813-1-peter.maydell@linaro.org>
	<650048df-f4b1-b351-f877-be8c84197ba2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Jun 2018 13:30:31 +0100
Message-ID: <CAFEAcA-vZH0KUxi+iYP3eYzXeHxNTotNwCMhEPcGhOLksbG71A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	"patches@linaro.org" <patches@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Markus Armbruster <armbru@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
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
X-List-Received-Date: Wed, 13 Jun 2018 12:30:55 -0000

On 12 June 2018 at 18:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 06/11/2018 04:17 AM, Peter Maydell wrote:
>> The codebase has a bit of a mix of different multiline
>> comment styles. State a preference for the Linux kernel
>> style:
>>     /*
>>      * Star on the left for each line.
>>      * Leading slash-star and trailing star-slash
>>      * each go on a line of their own.
>>      */
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> This is not my personal favourite, but seemed to be the
>> closest we had to consensus in the mail thread for v1;
>> I can live with it in order to avoid getting patches which
>> use the styles I like even less :-)
>
> Honestly, I don't like this except for "important" comments.
>
> A "small" comment, e.g. one that doesn't quite fit on a single line, now takes
> 4 lines instead of 2.  Which is really annoying and IMO tends to break flow.

That's why I prefer
 /* two
  * lines
  */
style over kernel-style. But apparently nobody else does...

thanks
-- PMM

