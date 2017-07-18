Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXQbu-00027w-2S
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 07:24:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQbp-000235-9I
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:24:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQbi-00053e-Mf
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:24:09 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33408)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dXQbi-00052t-Ee; Tue, 18 Jul 2017 07:24:02 -0400
Received: by mail-lf0-x242.google.com with SMTP id t72so1469370lff.0;
	Tue, 18 Jul 2017 04:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=z5Ca8hQkKgI16q7mASa5d6DKYA10XMpppB8Tou3Iszs=;
	b=Lv87wQfEkbqXbHjdC9/JLDqBYBg1qwFofA1NF6xEZMYn6IDhxDIQo+3ZI8S2+g32Kw
	x1jWlrJNinAwzDb3TEsRpX64riwdb9Hy2TvQlE1oZeL2YcmEbgDghWjjUOANESQMl2Xc
	H+ouqsqV0Va75o1dfYpdoon7D2bPF/jE2y4YsTjZBMdvFlvdgJmkMR1tICf92cl9wmIN
	eyZM1C5DVATmQeabpx0mhENKMuy4PpH2br4+/JqEkNDovvWTN/3fbFogrf5iA+eKcerA
	mOFLclAr+BgmXfVKDYeHlomYB/C+DgW3I32+fB9qNECiE+qeCgIn4AJ/xPeJZgb6Sr8F
	jA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=z5Ca8hQkKgI16q7mASa5d6DKYA10XMpppB8Tou3Iszs=;
	b=CF0rZ5mzTYyCUuT2eh+feLtJlA22Yt/qa1iXkdgzGOH+vMg4vXq46daqQ8klhCcqMY
	ahAT1l92YN806uNLYYHLMKEZKtlbOlkqUc9LH7i87h1hk3CEZW/4M1T/dtq6jTh1G7h0
	9HOGRqomyRPxQu+Xz4gwVZr0kRtOwR+3mG2SJiHz2k1e+KC8x/cX9PpSteX62pEoezxu
	EjM8y/NhVR4QjZynXOSzRC2PgwoXFOROl1VsTKkT9OBk2X0yoKfDSZBxdOVmEqpuCcTA
	NUpgwPjUp95LgN7Wd8DXWDfuoVJztH9nD1Y9POQ8xCLHnc1+CjxvnvLms4I9/mB3KW6C
	DzOQ==
X-Gm-Message-State: AIVw111mC/k2bo89owDnQ1LS7q1osW4SQ1eDjH0A1VRygKsz+aKlGh9Z
	VhYYfReZrrjWkXOiXZqtSDleJ6cGNA==
X-Received: by 10.25.56.28 with SMTP id f28mr473985lfa.167.1500377041162; Tue,
	18 Jul 2017 04:24:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.59.145 with HTTP; Tue, 18 Jul 2017 04:24:00 -0700 (PDT)
In-Reply-To: <87bmoi806u.fsf@linaro.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-27-f4bug@amsat.org>
	<CAJ+F1C+WsdUp3Vtx+-FZ9g7URSAQuJWb6h7-w6yJXM+4TKQNjA@mail.gmail.com>
	<87bmoi806u.fsf@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 18 Jul 2017 04:24:00 -0700
Message-ID: <CAJ+F1CLXojLp2VxET469gBLsaSwCvkQoGODOMyFUs3jUbkdk3A@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	qemu trival <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 26/29] tests/tcg: use
 ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 18 Jul 2017 11:24:12 -0000

Hi

On Tue, Jul 18, 2017 at 4:16 AM, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>
>> Hi
>>
>> On Mon, Jul 17, 2017 at 11:10 PM, Philippe Mathieu-Daud=C3=A9
>> <f4bug@amsat.org> wrote:
>>> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osde=
p.cocci
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> ---
>>>  tests/tcg/alpha/test-cond.c | 2 +-
>>>  tests/tcg/alpha/test-ovf.c  | 2 +-
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>
>> I think those do not include osdep.h
>>
>> (sigh, tests/tcg would need some love ;)
>
> Pranith has had a couple of revs at this:
>
>   Subject: [PATCH v5 00/19] Cleanup of TCG tests
>   Date: Thu,  1 Dec 2016 00:14:14 -0500
>   Message-Id: <20161201051433.17168-1-bobby.prani@gmail.com>
>
> We have the cross-compilers available as a fallback via docker although
> not every one can seamlessly use it for building stuff. Is getting a
> working cross-compiler setup too much of a hurdle fore those that want
> to build cross-arch tests?

Yes, I also did some experiments in cleaning up tests/tcg
(https://github.com/elmarco/qemu/tree/tcg-tests)

The trouble is I don't see an official/automated way to run tests/tcg
tests. Which cross-compiler should I use? When I played with this,
they all had various quirks, on Fedora, Debian or crosstool-ng. I
haven't looked at the docker tests, is this running tests/tcg test
somehow?

