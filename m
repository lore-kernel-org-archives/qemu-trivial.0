Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1StMhc-0005UM-JQ
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jul 2012 13:45:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1StMha-0005NX-6u
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 13:45:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1StMhU-0003lQ-HY
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 13:45:50 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:49712)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1StMhU-0003lC-5D
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 13:45:44 -0400
Received: by bkcji1 with SMTP id ji1so4708371bkc.4
	for <qemu-trivial@nongnu.org>; Mon, 23 Jul 2012 10:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=7j6jqr3WCdoyh9w4CXXWPcE1JUiFaGKni4x0M67xcew=;
	b=nHOPHHDymQIGhtw3R6ZGAlaAej0nEJDkcWp4rYLYJOcUuLm834hPDVk9BJ/1hRcGmr
	bTlAW+HcNxrWUakTspHf33l3RhWGFT45oeiXHO2SGn0f3H1lh/aYe3S/7ZjKxG5czoxa
	jcGrAc4Xcy8IQ0Ura04iwy3rtcSfFZU5OAMe+o5bNQvKTw4HrvzLKl4vfHOPZRHAIffW
	9lmRYHRaH19PWH2oXVtg+8279fJbG2AA0PVsGdvjoSTRfPJbAwC+ka/8Jv7jbd1Ml8QN
	HdapuRN1/nGPvlFs1jx3FegOze34fiuosLNsTsNKiIkLuQwhH1scvZD0cisTprgOo04N
	CobA==
MIME-Version: 1.0
Received: by 10.205.118.5 with SMTP id fo5mr8586247bkc.124.1343065543096; Mon,
	23 Jul 2012 10:45:43 -0700 (PDT)
Received: by 10.204.102.14 with HTTP; Mon, 23 Jul 2012 10:45:43 -0700 (PDT)
In-Reply-To: <CAAu8pHvJVj=cU-q9gjrGinPT97O+60L4vipzYMVeWy+T2o3cuA@mail.gmail.com>
References: <1342546459-21993-1-git-send-email-i.mitsyanko@samsung.com>
	<5005A904.5000006@samsung.com> <5005AFA5.6080101@weilnetz.de>
	<CAFEAcA9t5qDGvOBTL0eb+nRZGdiNBBwqd020Gz+80ovGm3t+hA@mail.gmail.com>
	<5005BBD7.1000905@weilnetz.de>
	<CAFEAcA9n7+UVp9W20x8zs71cPxZWBu8o1FQxVSwq8o6TdGZ0BQ@mail.gmail.com>
	<CAAu8pHvJVj=cU-q9gjrGinPT97O+60L4vipzYMVeWy+T2o3cuA@mail.gmail.com>
Date: Mon, 23 Jul 2012 18:45:43 +0100
Message-ID: <CAFEAcA-UC5Pmt-oMJx0okH2F6EWNY5XDmURq2EqXnPJuOBAL0w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Blue Swirl <blauwirbel@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlThR/bk7x3969pstei7WeMUQZA9XQ7jccSoT2u6ftL5beWN0SCg2lTad2rE8ro9VEVfZtQ
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
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
X-List-Received-Date: Mon, 23 Jul 2012 17:45:51 -0000

On 23 July 2012 18:40, Blue Swirl <blauwirbel@gmail.com> wrote:
> On Tue, Jul 17, 2012 at 7:28 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The trouble is that the warnings and errors here don't cause the
>> build to fail noisily; that's a big distinction IMHO.
>> I suppose we could make compile_prog do something like:
>>  * run the compile test
>
> Unfortunately that would break cross compiling.

Sorry, that was slightly unclear phrasing. By "run the test"
I meant "do the check that we can compile the test code"
"run the binary produced". This series won't break cross
compiling.

-- PMM

