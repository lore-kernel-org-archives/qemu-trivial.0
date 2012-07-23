Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1StMcS-0002G0-NR
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jul 2012 13:40:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1StMcQ-00029A-Aj
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 13:40:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1StMcP-0001vq-CS
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 13:40:30 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:64624)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1StMcL-0001v6-Jk; Mon, 23 Jul 2012 13:40:25 -0400
Received: by yenl1 with SMTP id l1so5864538yen.4
	for <multiple recipients>; Mon, 23 Jul 2012 10:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5ydDB6vGzEuDfyJKLS23aERcUpfU/auVKnn2tKYsMD0=;
	b=VG/WVr9clXfLRZvb4WVL2JvhZXEq4I9hvf4EKeFazPeDipLXMtYeJSIy2CRPoVkv/z
	8UiKnbgFKnz4jA4m/rn3XygkLVtDXLAZxU8efw66TRw2MmDhiCnJiGwTpXMeiDR8x+Wp
	ffYud+xDUypa+6RUJFcdpLJ1OBjiH2ME+ImGDWZG8KjkCCi62iQ4aaWOxjlCUCQ4+C9D
	ofjRtovGjYACsjtfZjjfprILpDKA7EkQRwynwCf0Fjme3rokG2YFNErerNBOI+OR2usb
	OvSBwirp7vhdFVR6I4IkBopzhDeyXkoFVVHlB60Hxsc3/g5F5YPFir9roNdlpQdvhL6m
	jcOA==
Received: by 10.50.88.167 with SMTP id bh7mr11206422igb.69.1343065224488; Mon,
	23 Jul 2012 10:40:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.38.68 with HTTP; Mon, 23 Jul 2012 10:40:04 -0700 (PDT)
In-Reply-To: <CAFEAcA9n7+UVp9W20x8zs71cPxZWBu8o1FQxVSwq8o6TdGZ0BQ@mail.gmail.com>
References: <1342546459-21993-1-git-send-email-i.mitsyanko@samsung.com>
	<5005A904.5000006@samsung.com> <5005AFA5.6080101@weilnetz.de>
	<CAFEAcA9t5qDGvOBTL0eb+nRZGdiNBBwqd020Gz+80ovGm3t+hA@mail.gmail.com>
	<5005BBD7.1000905@weilnetz.de>
	<CAFEAcA9n7+UVp9W20x8zs71cPxZWBu8o1FQxVSwq8o6TdGZ0BQ@mail.gmail.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Mon, 23 Jul 2012 17:40:04 +0000
Message-ID: <CAAu8pHvJVj=cU-q9gjrGinPT97O+60L4vipzYMVeWy+T2o3cuA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Igor Mitsyanko <i.mitsyanko@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: fix ALSA
	configure test
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
X-List-Received-Date: Mon, 23 Jul 2012 17:40:31 -0000

On Tue, Jul 17, 2012 at 7:28 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 17 July 2012 20:24, Stefan Weil <sw@weilnetz.de> wrote:
>> The arguments why -Werror is a bad idea for some configure tests
>> are reasonable.
>>
>> Nevertheless the QEMU community was able to produce thousands of
>> lines of code which compile without a warning, so we should be able
>> to create warning and error free code for a handful of configure
>> tests.
>
> The trouble is that the warnings and errors here don't cause the
> build to fail noisily; that's a big distinction IMHO.
> I suppose we could make compile_prog do something like:
>  * run the compile test

Unfortunately that would break cross compiling.

>  * if it fails => test failure as now
>  * if it succeeds (and we're doing a Werror build at all),
>    rerun the same test with -Werror
>  * if that fails, abort configure with an error message
> Then we would have the same "make the problem obvious" effect
> that plain -Werror provides for our main compilation.
>
>> The 4 patches above are valid and can be applied with or without
>> -Werror, therefore qemu-trivial or whoever does not have to wait for
>> Peter's patch.
>
> Yes, I agree we might as well fix these errors since we've now
> noticed them, regardless of whether or not we apply my patch
> (which I've just sent).
>
> -- PMM

