Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SrXTE-0002Bd-5t
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jul 2012 12:51:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SrXT9-0002B9-5K
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2012 12:51:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SrXT5-0006yG-DJ
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2012 12:51:23 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:47586)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SrXT5-0006xk-6E
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2012 12:51:19 -0400
Received: by bkcji1 with SMTP id ji1so1474801bkc.4
	for <qemu-trivial@nongnu.org>; Wed, 18 Jul 2012 09:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=SubpeuAqn2ru7ZLGqbBNJ0jaHsiEnJTYDkbr0gVU2Yc=;
	b=DhfeY2y/Dg44Xs2J+0xKNaExKa0M0vtqSG75PYSO/cNdD7LwsTufKtcfhhMdQHER+5
	JI+MMQK3M1g3WDyY7Z+OwxaxvNEr2VYd2S2KZU37oxro03j3a1JF+Us/Jo1uDeLM2Sjx
	GnOGSERBmeKxbvXpN8yfbb06htzHDDjwNPa+4GGqSntT+nyUBo8NqozdhGwU4tAqAoQI
	ji0kulmt4HONMIh5PqRaP8T0Dmue4HIYXxyRFqQ6fCi3FescE6FCC/qYm+agiFCrkv1s
	3z/MLas4N1i8QsH26sAQ0qVNexqTNFiH2NGpG6KuwgoXRiVY9svq5SWCoIFYHb6pWL/M
	A20g==
MIME-Version: 1.0
Received: by 10.204.157.135 with SMTP id b7mr2160928bkx.61.1342630277700; Wed,
	18 Jul 2012 09:51:17 -0700 (PDT)
Received: by 10.204.102.14 with HTTP; Wed, 18 Jul 2012 09:51:17 -0700 (PDT)
In-Reply-To: <5006E77F.8030602@weilnetz.de>
References: <1342627957-31682-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA-Cg7HOU3okDFUOdD9iG3z4gYKQovoNoFRibVV-1_E3Mw@mail.gmail.com>
	<5006E77F.8030602@weilnetz.de>
Date: Wed, 18 Jul 2012 17:51:17 +0100
Message-ID: <CAFEAcA8dJ_vY=0=MZpQh8mQrvpDqWQKPj3hbo=Dbv4mDUnquCw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlw/Y6ByuwjyXMzSCPgmV03Cuu/1w+P1FinL0LBP7eMkVA8Fr9/rZ70lqpoe2ZZBCZN6kSz
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use macro QEMU_PACKED for
	new packed structures
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
X-List-Received-Date: Wed, 18 Jul 2012 16:51:27 -0000

On 18 July 2012 17:42, Stefan Weil <sw@weilnetz.de> wrote:
> Am 18.07.2012 18:33, schrieb Peter Maydell:
>> On 18 July 2012 17:12, Stefan Weil <sw@weilnetz.de> wrote:
>>> Since commit 541dc0d47f10973c241e9955afc2aefc96adec51,
>>> some new packed structures were added without using QEMU_PACKED.
>>>
>>> QEMU_PACKED is needed for compilations with MinGW.
>>> For other platforms nothing changes.
>>>
>>> The code was fixed using this command:
>>>
>>>      git grep -la '__attribute__ ((packed))'|xargs perl -pi -e
>>> 's/__attribute__ \(\(packed\)\)/QEMU_PACKED/'
>>
>> There's one in tcg/tcg.c as well, which you missed because
>> it doesn't have a space between the "__attribute__" and
>> "((packed))".
>>
>> (There are also some in some of the tcg-target.c files,
>> but those are cases of the packed attribute being applied
>> to individual struct members rather than a whole struct, so
>> I'm not entirely sure what we should do with those.)

> I noticed those, too, but did not change them because
> I think that they need more examination (see my comment
> in http://lists.nongnu.org/archive/html/qemu-devel/2012-07/msg02373.html).

Fair enough.
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

