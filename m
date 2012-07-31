Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sw9m2-00072B-Rc
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 06:33:58 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Sw9m0-0006v1-Iz
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 06:33:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Sw9lz-0004qA-AY
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 06:33:56 -0400
Received: from mail-lpp01m010-f45.google.com ([209.85.215.45]:44996)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Sw9lq-0004p6-L2; Tue, 31 Jul 2012 06:33:46 -0400
Received: by lahc1 with SMTP id c1so3712971lah.4
	for <multiple recipients>; Tue, 31 Jul 2012 03:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ioIv1Nt2HsvXL+tCwLUf+jrB4a+508SFcNEqRRwX0+4=;
	b=Vcflo+QJNniQi8CdSxM2iMfuq651CAmo9avnEmBBMawBRfmAP5n/zMlHr5NGSjbUmn
	Ga96SwjEgor2mI86rqMQBbSzrSDRsOH4cD5oU8Von8NPJ+BQNSLpEi0EZVT3vhE/PY57
	PCCymp+d43FT9uGQChR9nKaV/44EgEUiNIkNkA34SLMlwfqP1c14rWh/rLy6+KHzd3ri
	3eXICCUIRq1f2k7TqFKF1imCZAw49FWiEQ0cOiJA0wgBHe2umWRqwnSwpSFcDpEyrZHp
	tq1/qc3xp3itc/9zBWvGJpYz1brvuyQZ+R8nzuYzlMURGrWgfkyldw+kljTgfCV/Vc1S
	EDxQ==
MIME-Version: 1.0
Received: by 10.152.135.200 with SMTP id pu8mr14312550lab.8.1343730825245;
	Tue, 31 Jul 2012 03:33:45 -0700 (PDT)
Received: by 10.112.71.73 with HTTP; Tue, 31 Jul 2012 03:33:45 -0700 (PDT)
In-Reply-To: <CAFEAcA9N55YGau_gswGys7RmY_i00=TBmCWeE1DiAs=yQq-saA@mail.gmail.com>
References: <1343569729-11218-1-git-send-email-sw@weilnetz.de>
	<20120730164244.GB21719@stefanha-thinkpad.localdomain>
	<CAFEAcA9N55YGau_gswGys7RmY_i00=TBmCWeE1DiAs=yQq-saA@mail.gmail.com>
Date: Tue, 31 Jul 2012 11:33:45 +0100
Message-ID: <CAJSP0QUXs1z+4vn=AXVvghcjbUn9pSn9mUJfRqypXNA0KudViA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
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
X-List-Received-Date: Tue, 31 Jul 2012 10:33:57 -0000

On Mon, Jul 30, 2012 at 5:46 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 30 July 2012 17:42, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> On Sun, Jul 29, 2012 at 03:48:49PM +0200, Stefan Weil wrote:
>>> Commit f1ae32a1ecda8aaff7a355c9030c0d8c363f3a70 moved the
>>> usb directory to hw, so the files which should be removed
>>> are now hw/usb/*.{d,o}.
>>>
>>> The new code removes these files and also any other generated
>>> *.o and *.d files in directories below hw.
>>>
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>>  Makefile |    2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index e4c754d..30f9e91 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -215,7 +215,7 @@ clean:
>>>       rm -Rf .libs
>>>       rm -f slirp/*.o slirp/*.d audio/*.o audio/*.d block/*.o block/*.d net/*.o net/*.d fsdev/*.o fsdev/*.d ui/*.o ui/*.d qapi/*.o qapi/*.d qga/*.o qga/*.d
>>>       rm -f qom/*.o qom/*.d
>>> -     rm -f usb/*.o usb/*.d hw/*.o hw/*.d
>>> +     rm -f hw/*/*.o hw/*/*.d hw/*.o hw/*.d
>>>       rm -f qemu-img-cmds.h
>>>       rm -f trace/*.o trace/*.d
>>>       rm -f trace-dtrace.dtrace trace-dtrace.dtrace-timestamp
>>> --
>>> 1.7.10
>>
>> Thanks.  Jan Kiszka already submitted an equivalent patch which I have
>> merged.  He used hw/usb/*.o hw/usb/*.d instead of hw/*/....
>
> We should probably just use
>         rm -f $(shell find . -name '*.[od]')
>
> for consistency with Makefile.target and future proofing anyway...

Cool, want to submit a patch? :)

Stefan

