Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rbt7b-0007ij-Vy
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 07:12:11 -0500
Received: from eggs.gnu.org ([140.186.70.92]:36982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Rbt7Y-0007Wb-UY
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 07:12:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Rbt7X-0001dM-UV
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 07:12:08 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:32921)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Rbt7V-0001ct-DH; Sat, 17 Dec 2011 07:12:05 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C906D728CD6E; Sat, 17 Dec 2011 13:11:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id b-MGCZSjZx3m; Sat, 17 Dec 2011 13:11:32 +0100 (CET)
Received: from [192.168.178.20] (p54ADB9C3.dip.t-dialin.net [84.173.185.195])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	EC0C0728188B; Sat, 17 Dec 2011 13:11:31 +0100 (CET)
Message-ID: <4EEC86E9.7080404@weilnetz.de>
Date: Sat, 17 Dec 2011 13:11:21 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1324110459-3932-1-git-send-email-sw@weilnetz.de>	<1324110459-3932-4-git-send-email-sw@weilnetz.de>
	<CAFEAcA8MY3zc7xLD_PosE_fHnOL+jn54wX7TAS8MxE=4vVa+Bw@mail.gmail.com>
In-Reply-To: <CAFEAcA8MY3zc7xLD_PosE_fHnOL+jn54wX7TAS8MxE=4vVa+Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/11] configure: Fix
 compiler warning in config.log (integer from pointer)
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
X-List-Received-Date: Sat, 17 Dec 2011 12:12:10 -0000

Am 17.12.2011 12:29, schrieb Peter Maydell:
> On 17 December 2011 08:27, Stefan Weil <sw@weilnetz.de> wrote:
>> warning: return makes integer from pointer without a cast
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  configure |    6 +++++-
>>  1 files changed, 5 insertions(+), 1 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 93c6cbe..8dee237 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1841,7 +1841,11 @@ if test "$curses" != "no" ; then
>>  #ifdef __OpenBSD__
>>  #define resize_term resizeterm
>>  #endif
>> -int main(void) { resize_term(0, 0); return curses_version(); }
>> +int main(void) {
>> +  const char *s = curses_version();
>> +  resize_term(0, 0);
>> +  return s != (const char *)0;
>
> You don't need this cast, I think.

Indeed, a quick test with gcc-4.4.5 shows no new warning when
I remove the type cast. Are you sure that this works with all
supported versions of gcc and any set of warning options?

Normally NULL is used for this kind of code, but it needs
stddef.h. Typically NULL is defined to be ((void *)0 for C
(that's the reason why I used a type cast, too). Only for
C++ it is defined without a type cast.

The type cast won't harm and is not in "normal" code,
so it can be committed as it is. I also don't mind if it is
removed by whoever commits it. If it is preferred that
I send an updated patch, I'd use NULL with stddef.h
(just to be safe).

Regards,
Stefan Weil


