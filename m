Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xm2Ap-0004gK-Gk
	for mharc-qemu-trivial@gnu.org; Wed, 05 Nov 2014 10:07:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xm2Ag-0004e9-DH
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 10:07:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xm2AV-0003Ev-Ik
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 10:06:54 -0500
Received: from mail-la0-f52.google.com ([209.85.215.52]:42128)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xm2AU-0003C6-WE
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 10:06:43 -0500
Received: by mail-la0-f52.google.com with SMTP id pv20so855105lab.11
	for <qemu-trivial@nongnu.org>; Wed, 05 Nov 2014 07:06:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cpgGB006FV+PJ8TSz2Xp+6x1gUTex7Jnyl4PXGAgWzw=;
	b=Ax161rb1/WvK4MBW0A1AHbu0017uhrMYXstkK66VXpiXuxnCiq3AuH21lR6w3sHZHJ
	NG2MtXL81VYhezPTqfOkGooEc57Pd6LOMeBp7C163j8f8yft+XlZY1wSp+ug5NqFnnuv
	PFwlfxLm9YN28UAuinsLwgH4QTWPjXFsbMkknLPGBlUxCq4H2d8h8bB5Kr8o6iyfj6qv
	RMyxQFjmRWIWuYXRfSmdxpia22R7QR17WBn2RCrZm0AmPbVosgG8UzLbLErGtgbnGa3Z
	q+FcN3fNiBgIwttgB82DsKO3lI3jk+Oavx/T8LCe2PLf+6X6SJKajkpxroMwLEHvjuDx
	Pa6Q==
X-Gm-Message-State: ALoCoQkarPuIJEznnOmYk7tJrw+ytdWM7+uDXRtiEFwoZJI8SeBB0phdqGgK/wM2yhd2nP4qGojX
X-Received: by 10.112.189.10 with SMTP id ge10mr67909048lbc.23.1415200001152; 
	Wed, 05 Nov 2014 07:06:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.173.168 with HTTP; Wed, 5 Nov 2014 07:06:20 -0800 (PST)
In-Reply-To: <201411051447.sA5EldYV022824@higson.cam.lispworks.com>
References: <201411041751.sA4Hpu4X013678@heapu.cam.lispworks.com>
	<CAFEAcA9X35ptR64c=rFEN42de1Lrp_+ikuVFcxM2ZENGZY_aag@mail.gmail.com>
	<201411051350.sA5DowCk030277@higson.cam.lispworks.com>
	<CAFEAcA8rEYK51OR12uJFC+jrFzTgnpdZ9dg5TXWLi5ooLqiRig@mail.gmail.com>
	<201411051447.sA5EldYV022824@higson.cam.lispworks.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Nov 2014 15:06:20 +0000
Message-ID: <CAFEAcA8-TKo7uLR7Z4h7hf+194e9LrQ0B5SHaSE0-54Z7D3aYg@mail.gmail.com>
To: Martin Simmons <martin@lispworks.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.52
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gdbstub: Add a missing case
 of signal number translation in gdbstub
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
X-List-Received-Date: Wed, 05 Nov 2014 15:07:01 -0000

On 5 November 2014 14:47, Martin Simmons <martin@lispworks.com> wrote:
>>>>>> On Wed, 5 Nov 2014 14:17:36 +0000, Peter Maydell said:
>>
>> On 5 November 2014 13:50, Martin Simmons <martin@lispworks.com> wrote:
>> >>>>>> On Tue, 4 Nov 2014 19:09:43 +0000, Peter Maydell said:
>> >> The if() statement should have braces for our coding style,
>> >> and no space before the '(' in function calls; otherwise this
>> >> looks good to me.
>> >
>> > Do you want a new patch with it like that?  I was following the style of the
>> > rest of that file, in particular the other 'C' case :-(
>>
>> Yes, if you could respin it that would be nice. Unfortunately there
>> are still areas of our codebase which don't follow the coding
>> style; we update bits of code as we change them, so new patches
>> follow the style guide for the lines they touch. You can use
>> scripts/checkpatch.pl to check your patch for the most common
>> issues.
>
> OK, here it is.
>
> Signed-off-by: Martin Simmons <martin@lispworks.com>
>
> diff --git a/gdbstub.c b/gdbstub.c
> index d1b5afd..0faca56 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -823,7 +823,10 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>                  action = *p++;
>                  signal = 0;
>                  if (action == 'C' || action == 'S') {
> -                    signal = strtoul(p, (char **)&p, 16);
> +                    signal = gdb_signal_to_target(strtoul(p, (char **)&p, 16));
> +                    if (signal == -1) {
> +                        signal = 0;
> +                    }
>                  } else if (action != 'c' && action != 's') {
>                      res = 0;
>                      break;
>
> __Martin
>

This version Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
and cc'd trivial. (Somebody's going to have to manually put the
patch together with the commit message now, though.)

thanks
-- PMM

