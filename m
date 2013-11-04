Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VdRGy-000661-TV
	for mharc-qemu-trivial@gnu.org; Mon, 04 Nov 2013 16:01:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VdRGr-00061F-Cc
	for qemu-trivial@nongnu.org; Mon, 04 Nov 2013 16:01:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VdRGi-0002Vr-Fv
	for qemu-trivial@nongnu.org; Mon, 04 Nov 2013 16:01:13 -0500
Received: from mail-lb0-f177.google.com ([209.85.217.177]:55506)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VdRGh-0002VB-KU
	for qemu-trivial@nongnu.org; Mon, 04 Nov 2013 16:01:04 -0500
Received: by mail-lb0-f177.google.com with SMTP id u14so5852367lbd.36
	for <qemu-trivial@nongnu.org>; Mon, 04 Nov 2013 13:01:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lq59ENC8YuJ7D/SMketLuBOiezfjqZAZRZ+FG1E+l0M=;
	b=Ov07G7W6y0kzXq1aYgk02ORV9wzsERC+NP585e3KZdd3b0kcap8Rm224N04/zKukfQ
	fgKhKT8uk9fUg3Vy5sZnyWHGNUGUjpV6AiaUwmtJWm08bIci1m6yhKFgtdtwYWM+njds
	1fLEvsIdV8elSPgvm6Sp4CVKSOP0uE2tRdUyfCh/me33G69nU59OHXzCk7d8PBBQP8yj
	tikNb2EUe4zDug7dd27GIVRcRYoBX8you3JcZxPEPyCF3HQSy796swhBDbCQ8ENs/HKU
	dEXZVGzFAdA9F2fiMM/EGdcYqL0zsfPQhezJvUuuH7y591YI4YFauLj7vnPk2L9IkkjM
	UFkA==
X-Gm-Message-State: ALoCoQnXc2m1A7ISh+aXRckaP3HuFIdeamjkGQejDUElTX+C1tbgvpEOpBuS/kDr/jebSAzeBBpB
X-Received: by 10.152.10.99 with SMTP id h3mr13443926lab.13.1383598862418;
	Mon, 04 Nov 2013 13:01:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Mon, 4 Nov 2013 13:00:42 -0800 (PST)
In-Reply-To: <527805D2.3000107@redhat.com>
References: <1383594685-19332-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA9-YvQPprbt1+KCG0ov44-gbvaPx-gtX4yyd5fzfcX3UA@mail.gmail.com>
	<527805D2.3000107@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Nov 2013 21:00:42 +0000
Message-ID: <CAFEAcA8k2PWA_QF90oMisoP8tHz9zTU+UghXZf-wg4s0-751Zg@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.177
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>, Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gtk: Fix compiler warnings
	with -Werror=sign-compare
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
X-List-Received-Date: Mon, 04 Nov 2013 21:01:19 -0000

On 4 November 2013 20:38, Laszlo Ersek <lersek@redhat.com> wrote:
> On 11/04/13 21:07, Peter Maydell wrote:
>> If this warning is going to complain about entirely
>> safe and idiomatic code like
>>
>>    int i;
>>    static const int some_array[] = {
>>        0x2a, 0x36, 0x1d, 0x9d, 0x38, 0xb8, 0xdb, 0xdd,
>>    };
>>
>>    for (i = 0; i < ARRAY_SIZE(some_array); i++) {
>>        ...
>>    }
>
> (Entirely safe, and completely non-idiomatic: "i" should be size_t, as
> that is the type of the sizeof operator's result.)

Making simple loop iteration variables 'unsigned' is completely
non-idiomatic. It just happens that we're calculating the upper
bound here via a macro that coincidentally produces an
unsigned result. Insisting on unsigned also runs you into
problems with loops like

   for (i = ARRAY_SIZE(foo) - 1; i >=0 ; i--) {
     something(foo[i]);
   }

(which obviously you can avoid by contorting the code,
but why do that when leaving 'i' as signed is much clearer?)

-- PMM

