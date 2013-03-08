Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UDtch-0001BQ-Uz
	for mharc-qemu-trivial@gnu.org; Fri, 08 Mar 2013 04:29:55 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UDtce-0001A1-Ga
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 04:29:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UDtcc-0001gH-Jx
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 04:29:52 -0500
Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b]:65186)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UDtcc-0001gA-CJ
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 04:29:50 -0500
Received: by mail-la0-f43.google.com with SMTP id ek20so1450215lab.2
	for <qemu-trivial@nongnu.org>; Fri, 08 Mar 2013 01:29:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=jpoyr44nYFzq58oDQzixVkIsRBEWKi6vq8aNoCKauL4=;
	b=owE9kgdfy5S75PdopLbKkZK0k6wVqAUGtuXJqtO311q6/cmjBKQfRVKez93I5s9on7
	cjESTzj0A1VQysJgma5XrRYG0kIt6hhFcLLHUmuiAj/2lAFZ0qFd1XsgsOFQWVau4VIS
	hIXL5SmtBT5AypjZ2OqrCtgyIiY5Jaaky9kr5zXCKPfFsGh/Zh04dVExSKhlt2UhQ6vW
	l6MHUqIU43Fr1k04LiJiWjZypugkZg40W9kZ3C0U8rzdWpkG0Qa5O5Vm78rhwfc1nRlz
	/EhNIa5Nzuvu7xeWr17eOwUVWDH5fSTDTeloQZdac5cHFKH7RALUYXp/mFt78d/gW0vr
	dVLw==
X-Received: by 10.152.104.18 with SMTP id ga18mr1380440lab.33.1362734989244;
	Fri, 08 Mar 2013 01:29:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.37.74 with HTTP; Fri, 8 Mar 2013 01:29:29 -0800 (PST)
In-Reply-To: <20130308092102.GD9597@stefanha-thinkpad.redhat.com>
References: <20130307033301.GA48996@cs.nctu.edu.tw>
	<20130308092102.GD9597@stefanha-thinkpad.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Mar 2013 17:29:29 +0800
Message-ID: <CAFEAcA_2JCrZOVTmg8d=YHSPD0-txcXNmjmjvc0AFYihabyfcQ@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQmIIS+XV3c9KQiqItNiMrMAW1NbF9q8hWXBb/Wdstjf4LRYrfFzpCgRli5kktv5iSQpU6Xj
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22b
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use proper term in TCG
	README
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
X-List-Received-Date: Fri, 08 Mar 2013 09:29:54 -0000

On 8 March 2013 17:21, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Thu, Mar 07, 2013 at 11:33:01AM +0800, =E9=99=B3=E9=9F=8B=E4=BB=BB (We=
i-Ren Chen) wrote:
>>   In TCG, "target" means the host architecture for which TCG generates t=
he
>> code. Using "guest" rather than "target" to make the document more consi=
stent.

>> @@ -379,7 +379,7 @@ double-word product T0.  The later is returned in tw=
o single-word outputs.
>>
>>  Similar to mulu2, except the two inputs T1 and T2 are signed.
>>
>> -********* 64-bit target on 32-bit host support
>> +********* 64-bit guest on 32-bit host support
>>
>>  The following opcodes are internal to TCG.  Thus they are to be impleme=
nted by
>>  32-bit host code generators, but are not to be emitted by guest transla=
tors.
>
> Review from TCG experts please.
>
> It seems we have multiple meanings for "target" (e.g. ./configure
> --target-list=3D does not mean "the host architecture for which TCG
> generates code"), if this is really the way TCG uses the term then fine.

Yes, this is an unfortunate terminology clash, but in a TCG context
'target' does mean 'host architecture which the backend compiles for'
(see the tcg/README definition in section 2). This is partly because
of TCG's history as a C compiler backend, where 'target' is unambiguous
and may be different from the 'host' architecture the compiler itself
executes on.

There are several places in tcg/README which use 'target' in the
sense 'QEMU target, ie guest' (as well as lots of uses in the
'TCG target, ie host' sense), not just this one; it might be a good
idea to put a note in the Definitions section that this document uses
'guest' when it means what in other areas of QEMU is often referred to
as the 'target', and fix the places where we've accidentally used 'target'
and 'guest would be better.

-- PMM

