Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TPFgV-0008Kf-FV
	for mharc-qemu-trivial@gnu.org; Fri, 19 Oct 2012 12:44:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TPFgP-00083l-0D
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 12:44:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TPFgO-0007VG-2m
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 12:44:24 -0400
Received: from mail-ia0-f173.google.com ([209.85.210.173]:54978)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TPFgL-0007TW-6K; Fri, 19 Oct 2012 12:44:21 -0400
Received: by mail-ia0-f173.google.com with SMTP id m10so443808iam.4
	for <multiple recipients>; Fri, 19 Oct 2012 09:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TSfPUPfq6foE849G49NG/HuSss+ja5+G5gGM79XQZ7Q=;
	b=V5aBtl+t0UsOIyysh50jAy7Tone/nNL0Bvc12Zvx7buX6tEKBRP3YZPlFVD8nFPMAr
	r3J04QLBnG65lbXx6ZIPbwNIlrgy7iI54VXVptRe55pJAIT0b1ifVN6G361QXWZ4uO/b
	iIYBH2g3hcwBmCA/r51CSutQlFbm0fNm9cZZhFbxTrv9lzDoL/lKNZn6D031oTPIvxZA
	8n8hVEAfhUlYxLL42ZGGyvIMaNJFZOnAaNRm1kXGsCLQJxVtpoAeS9SDicgC2wDWAlck
	X4ySWuB4fhMU2Y3pkenrs+h6sUamO1GjNnApf4FBt7mbYlNTJombfO39E7Dq/qZhb0ZI
	y1tA==
Received: by 10.50.77.230 with SMTP id v6mr9150940igw.11.1350665059237; Fri,
	19 Oct 2012 09:44:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.53.130 with HTTP; Fri, 19 Oct 2012 09:43:58 -0700 (PDT)
In-Reply-To: <CAFEAcA-=WvnX6gYsvaXDvOy0T4yiRV06+sryzzsfdzxJm7u=DQ@mail.gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
	<9b4ee7a47d8bc116e20f236a1ad9ed73a695123e.1350244587.git.blauwirbel@gmail.com>
	<CAFEAcA_M58F9F-NTY81Fau9_iH_s76f0KHQ_L5TOoC8+naWB6Q@mail.gmail.com>
	<CAAu8pHu5cuBML84JehNbXXsbuJ=3KwauuAvOYP=+VH-Y_GQ+-g@mail.gmail.com>
	<CAFEAcA-f_+CJgKBqW3mGbzDjK2xbBssef=0geyE-kxMZLiK-Og@mail.gmail.com>
	<CAAu8pHtR-jNTnEY0iwEJdihXO8FxKXWcTcnPGQssNJg5jtsBcw@mail.gmail.com>
	<CAFEAcA-=WvnX6gYsvaXDvOy0T4yiRV06+sryzzsfdzxJm7u=DQ@mail.gmail.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Fri, 19 Oct 2012 16:43:58 +0000
Message-ID: <CAAu8pHtTxCgz7=+R8OY5Xq2vvjuDkmhdwxEQ7EYvWzFezyaRJQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 10/11] arm: add missing static and remove
	unused functions
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
X-List-Received-Date: Fri, 19 Oct 2012 16:44:29 -0000

On Sun, Oct 14, 2012 at 8:55 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 14 October 2012 21:49, Blue Swirl <blauwirbel@gmail.com> wrote:
>> On Sun, Oct 14, 2012 at 8:35 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 14 October 2012 21:33, Blue Swirl <blauwirbel@gmail.com> wrote:
>>>> On Sun, Oct 14, 2012 at 8:09 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>> In general anything in linux-user/arm/nwfpe is legacy code which
>>>>> it's scarcely worth the effort of touching or reviewing.
>>>>
>>>> Adding 'static' should be only beneficial.
>>>
>>> Except that it's taken you time to write these patches and it
>>> will take me time to review them.
>>
>> Yes, the benefit may come to the users who may get a slightly faster
>> emulator.
>
> If you or any other user would like to find me some test cases
> which actually use the FPA floating point emulation at all
> I'd be happy to (a) add them to my test collection and (b)
> test this patch...
>
>> We, the developers, get the benefit from different things,
>> like technical excellence or something else.
>
> One day I might pursue technical excellence by dropping
> the nwfpe code completely :-)

That would be the best option. Removed code does not need maintenance.

>
> -- PMM

