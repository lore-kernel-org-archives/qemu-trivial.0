Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SCYYr-0002rn-Ly
	for mharc-qemu-trivial@gnu.org; Tue, 27 Mar 2012 11:43:53 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SCYYk-0002q2-QQ
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2012 11:43:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SCYYe-0003w4-KK
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2012 11:43:46 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:62169)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SCYYe-0003v2-FY
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2012 11:43:40 -0400
Received: by iafj26 with SMTP id j26so68822iaf.4
	for <qemu-trivial@nongnu.org>; Tue, 27 Mar 2012 08:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=23XOO7duY4LXR4TVU6N2XwjJh/57S9/f/VkNvIXHoSc=;
	b=G4Szyn13xw8PW/25sgpX5tOc6/WV/ngDaFzMUQD5pJOz5zCpW8/pbseXwKQYYJ/0lP
	WKZjj1qio0Afw9jgtkSTffNBauiL0Aqiyb7HDopNXLcy/CeuYrCvqmDdqV74B5QT/oLg
	U605B+ow8FmoCnYS1YKHM+pJDXGhHOg86gKGEnMaugF9Ws552pbDPzHucrjHxVAHtumV
	XrDkcoW7xK+aP2byUFsE2InWW/zropPXYEWp+OFZQRthgctKt+tNRFJYPwLmzGZtF7LH
	rLXVRlM2hfzUQS1OI5jsOcd80EtY1CBbYy5/cQal+2NA5TBBsUNi1Q+D/xHSVn1YwPR4
	Ow0g==
MIME-Version: 1.0
Received: by 10.50.207.5 with SMTP id ls5mr9043779igc.51.1332863015871; Tue,
	27 Mar 2012 08:43:35 -0700 (PDT)
Received: by 10.50.100.198 with HTTP; Tue, 27 Mar 2012 08:43:35 -0700 (PDT)
In-Reply-To: <4F71D7AD.8080103@codesourcery.com>
References: <1330121921-23462-1-git-send-email-meadori@codesourcery.com>
	<4F4814F7.6040008@suse.de> <4F71D7AD.8080103@codesourcery.com>
Date: Tue, 27 Mar 2012 16:43:35 +0100
Message-ID: <CAFEAcA8R+J+DeN7V_6bVHhh3kYprA8EKWJXEzfDp7iWjWzYLqQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Meador Inge <meadori@codesourcery.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQkUn37d2MGEOPzBbWxwS6j7fpUxPgsOg0zhCJpciuXQZk1l6lN8gdEn2C7sOXMwBhHDFz+a
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paul Brook <paul@codesourcery.com>,
	qemu-devel@nongnu.org, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 1/1] m68k: Return
	semihosting errno values correctly
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
X-List-Received-Date: Tue, 27 Mar 2012 15:43:51 -0000

This patch is simple enough (and m68k unmaintained enough)
that it could reasonably go through qemu-trivial I think.

-- PMM

On 27 March 2012 16:07, Meador Inge <meadori@codesourcery.com> wrote:
> Ping.
>
> On 02/24/2012 04:53 PM, Andreas F=C3=A4rber wrote:
>> Am 24.02.2012 23:18, schrieb Meador Inge:
>>> Fixing a simple typo, s/errno/err/, that caused
>>> the error status from GDB semihosted system calls
>>> to be returned incorrectly.
>>>
>>> Signed-off-by: Meador Inge <meadori@codesourcery.com>
>>
>> Nice catch!
>>
>> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>
>> Andreas
>>
>>> ---
>>> =C2=A0m68k-semi.c | =C2=A0 =C2=A02 +-
>>> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/m68k-semi.c b/m68k-semi.c
>>> index bab01ee..6d60ced 100644
>>> --- a/m68k-semi.c
>>> +++ b/m68k-semi.c
>>> @@ -150,7 +150,7 @@ static void m68k_semi_cb(CPUState *env, target_ulon=
g ret, target_ulong err)
>>> =C2=A0 =C2=A0 =C2=A0}
>>> =C2=A0 =C2=A0 =C2=A0/* FIXME - handle put_user() failure */
>>> =C2=A0 =C2=A0 =C2=A0put_user_u32(ret, args);
>>> - =C2=A0 =C2=A0put_user_u32(errno, args + 4);
>>> + =C2=A0 =C2=A0put_user_u32(err, args + 4);
>>> =C2=A0}
>>>
>>> =C2=A0#define ARG(n) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\
>>
>
>
> --
> Meador Inge
> CodeSourcery / Mentor Embedded
> http://www.mentor.com/embedded-software
>

