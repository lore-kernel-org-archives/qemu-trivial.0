Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZhZM-0004AG-8K
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 06:55:32 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QZhZJ-00049n-MB
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 06:55:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QZhZI-0005SM-Ka
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 06:55:29 -0400
Received: from fmmailgate01.web.de ([217.72.192.221]:44956)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1QZhZF-0005Rf-VO; Thu, 23 Jun 2011 06:55:26 -0400
Received: from smtp03.web.de  ( [172.20.0.65])
	by fmmailgate01.web.de (Postfix) with ESMTP id DBBD2191F58AB;
	Thu, 23 Jun 2011 12:55:23 +0200 (CEST)
Received: from [87.173.122.232] (helo=[10.0.1.1])
	by smtp03.web.de with asmtp (TLSv1:AES128-SHA:128) (WEB.DE 4.110 #2)
	id 1QZhZD-0002ck-00; Thu, 23 Jun 2011 12:55:23 +0200
Message-Id: <A1FD35CE-FFDB-4A58-B513-1F8AC2AC98CB@web.de>
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
To: Matthew Fernandez <matthew.fernandez@gmail.com>
In-Reply-To: <BANLkTimJgByZ3TpNE9CFAC+QB4xNmQoE7Q@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed; delsp=yes
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Apple Message framework v936)
Date: Thu, 23 Jun 2011 12:55:22 +0200
References: <BANLkTik5z-sZdPrt6+FMJwgvbehR9O2GwA@mail.gmail.com>
	<57FD980B-E6A3-4E1A-A83B-062B9954DB5C@web.de>
	<BANLkTimJgByZ3TpNE9CFAC+QB4xNmQoE7Q@mail.gmail.com>
X-Mailer: Apple Mail (2.936)
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX1+dOZpafMaidAZ2EMFeYhJWY1SIvmmXZTEjDYrf
	b1yySemtcrN2ZpHQ21ISNhjGNVwbS+TIB82UjPaicYwXsLHP1H
	pLlSXrEydQ3uyR8O7AlA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.221
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>,
	qemu-devel Developers <qemu-devel@nongnu.org>,
	Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] Fix comment typos
	in hw/armv7m.c
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
X-List-Received-Date: Thu, 23 Jun 2011 10:55:31 -0000

Am 23.06.2011 um 12:35 schrieb Matthew Fernandez:

> On 23 June 2011 20:22, Andreas F=E4rber <andreas.faerber@web.de> =
wrote:
>> Am 23.06.2011 um 02:59 schrieb Matthew Fernandez:
>>>
>>>
>>> Fix a couple of typos in comments.
>>>
>>> Signed-off-by: Matthew Fernandez <matthew.fernandez@gmail.com>
>>> ----
>>> This patch doesn't touch any code and should (hopefully) not be
>>> controversial. There doesn't seem to be a maintainer for this file,
>>> but changes are trivial.
>>>
>>>
>>> diff --git a/hw/armv7m.c b/hw/armv7m.c
>>> index 72d010a..83f3393 100644
>>> --- a/hw/armv7m.c
>>> +++ b/hw/armv7m.c
>>> @@ -4,7 +4,7 @@
>>>  * Copyright (c) 2006-2007 CodeSourcery.
>>>  * Written by Paul Brook
>>>  *
>>> - * This code is licenced under the GPL.
>>> + * This code is licensed under the GPL.
>>>
>>
>> Nack. Licence is British English, license American English. It's =20
>> not wrong.
> Licence is the noun in British English, while license in the noun in =20=

> American English. License is the correct verb in both.

Ah, you seem right.

> Nevertheless, I don't think this is worth debating. If there's =20
> dissent I'm happy to drop the first part of the patch.

I would still suggest to separate the two issues, as Stefan W. has =20
done before - one patch for all "acess" -> "access", and one for all =20
"licenced" -> "licensed", rather than file-based changes. That reduces =20=

list traffic for such cosmetic issues.

It might be worth thinking about integrating the top 10 typos into =20
checkpatch.pl.

Andreas=

