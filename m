Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Svt7B-0007Gu-68
	for mharc-qemu-trivial@gnu.org; Mon, 30 Jul 2012 12:46:41 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Svt74-0007B5-3s
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2012 12:46:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Svt71-00011z-W6
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2012 12:46:34 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:53538)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Svt71-00011n-QF
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2012 12:46:31 -0400
Received: by pbbro12 with SMTP id ro12so9633890pbb.4
	for <qemu-trivial@nongnu.org>; Mon, 30 Jul 2012 09:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=jBdZCMgvz6XPm3Mf6B4vrj2gIlOq/uFABmtZViGeFII=;
	b=NrbLGZS1obU542uulbHc40y6oB49mrqoLiG048Z2UlCkYi+y+uNRSEjxGvyeB1+cvX
	SwidF9peAs4UwYPaFmMH4s/7yASjD14/0K/1u8ETerLb3xon3e1OHgVnK4T5MLLrtvXr
	78YEjzVT0gTUSV/vXsLjNFe6e7cgX2MyFkgajrQqOHzj033Tzz39wPTwstuyocrj1SMt
	RudwzmpDQGjpSQZ7nVzjfr4dzkiicBSV1gXjqThJoHixkhAzqQeK5tG44oKQs5x5+pT1
	2sN9zc3XNNmpLponCHfysQ7MhdF65HtOYYbauhlQseNhYkAPKt/qo8GeDND4IsHRvwPU
	PzNQ==
MIME-Version: 1.0
Received: by 10.68.130.9 with SMTP id oa9mr36412676pbb.95.1343666790858; Mon,
	30 Jul 2012 09:46:30 -0700 (PDT)
Received: by 10.66.218.170 with HTTP; Mon, 30 Jul 2012 09:46:30 -0700 (PDT)
In-Reply-To: <20120730164244.GB21719@stefanha-thinkpad.localdomain>
References: <1343569729-11218-1-git-send-email-sw@weilnetz.de>
	<20120730164244.GB21719@stefanha-thinkpad.localdomain>
Date: Mon, 30 Jul 2012 17:46:30 +0100
Message-ID: <CAFEAcA9N55YGau_gswGys7RmY_i00=TBmCWeE1DiAs=yQq-saA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmxosiN17eTLudyP/d4Jl6hj7c5faq1N2p+P3Fj4D1ykgfS4rdFSIeA+lW7jl2UplKI4qYI
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Remove generated
 hw/usb files in 'clean' target
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
X-List-Received-Date: Mon, 30 Jul 2012 16:46:39 -0000

On 30 July 2012 17:42, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Sun, Jul 29, 2012 at 03:48:49PM +0200, Stefan Weil wrote:
>> Commit f1ae32a1ecda8aaff7a355c9030c0d8c363f3a70 moved the
>> usb directory to hw, so the files which should be removed
>> are now hw/usb/*.{d,o}.
>>
>> The new code removes these files and also any other generated
>> *.o and *.d files in directories below hw.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  Makefile |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index e4c754d..30f9e91 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -215,7 +215,7 @@ clean:
>>       rm -Rf .libs
>>       rm -f slirp/*.o slirp/*.d audio/*.o audio/*.d block/*.o block/*.d net/*.o net/*.d fsdev/*.o fsdev/*.d ui/*.o ui/*.d qapi/*.o qapi/*.d qga/*.o qga/*.d
>>       rm -f qom/*.o qom/*.d
>> -     rm -f usb/*.o usb/*.d hw/*.o hw/*.d
>> +     rm -f hw/*/*.o hw/*/*.d hw/*.o hw/*.d
>>       rm -f qemu-img-cmds.h
>>       rm -f trace/*.o trace/*.d
>>       rm -f trace-dtrace.dtrace trace-dtrace.dtrace-timestamp
>> --
>> 1.7.10
>
> Thanks.  Jan Kiszka already submitted an equivalent patch which I have
> merged.  He used hw/usb/*.o hw/usb/*.d instead of hw/*/....

We should probably just use
        rm -f $(shell find . -name '*.[od]')

for consistency with Makefile.target and future proofing anyway...

-- PMM

