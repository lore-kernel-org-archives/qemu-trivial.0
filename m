Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZzcM-0003o3-AD
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jun 2011 02:11:50 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QZzcI-0003n5-3d
	for qemu-trivial@nongnu.org; Fri, 24 Jun 2011 02:11:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QZzcG-0007jd-FX
	for qemu-trivial@nongnu.org; Fri, 24 Jun 2011 02:11:45 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46633)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1QZzcB-0007iq-Sh; Fri, 24 Jun 2011 02:11:40 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	7A1FB72818A5; Fri, 24 Jun 2011 08:11:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 4tJorPW5F9Ab; Fri, 24 Jun 2011 08:11:33 +0200 (CEST)
Received: from [192.168.178.20] (p5086FA80.dip.t-dialin.net [80.134.250.128])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	5CF2272818A4; Fri, 24 Jun 2011 08:11:33 +0200 (CEST)
Message-ID: <4E042A94.7020608@mail.berlios.de>
Date: Fri, 24 Jun 2011 08:11:32 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <4E02F63E.3010908@web.de>	<20110623133508.GF12698@stefanha-thinkpad.localdomain>	<4E034E79.5050901@mail.berlios.de>
	<BANLkTikpwAVCpEdQzpBWLx=2CmkxXxEMAA@mail.gmail.com>
In-Reply-To: <BANLkTikpwAVCpEdQzpBWLx=2CmkxXxEMAA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Avoid double definitions of PRI*64
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
X-List-Received-Date: Fri, 24 Jun 2011 06:11:48 -0000

Am 24.06.2011 07:41, schrieb Stefan Hajnoczi:
> On Thu, Jun 23, 2011 at 3:32 PM, Stefan Weil <weil@mail.berlios.de> wrote:
>> Am 23.06.2011 15:35, schrieb Stefan Hajnoczi:
>>>
>>> On Thu, Jun 23, 2011 at 10:15:58AM +0200, Jan Kiszka wrote:
>>>>
>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>
>>>> Recent mingw32 provide those defines.
>>
>> ... and all of those defines are wrong, because QEMU does not use
>> MS format specifiers. http://patchwork.ozlabs.org/patch/74276/
>> tried to fix this. My preferred solution is removing those PRI*64 from
>> qemu-common.h, because not only recent mingw32 versions provide
>> the (wrong) definitions, but even the Debian version provides them
>> (which is really old, but I use it for my regression tests).
>>
>> The wrong definitions do not allow using -Wformat for mingw32
>> builds, but they work because (most?) relevant mingw32 functions
>> accept both MS and standard format specifiers.
>>
>> Adding the correct definitions (to qemu-os-win32.h, not to qemu-common.h)
>> would be another solution as long as mingw32 does not handle
>> __USE_MINGW_ANSI_STDIO correctly.
>>
>>>>
>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>> ---
>>>> qemu-common.h | 3 +++
>>>> 1 files changed, 3 insertions(+), 0 deletions(-)
>>>
>>> It's never too late to implement C99!
>>>
>>> Thanks, applied to the trivial patches tree:
>>> http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches
>>>
>>> Stefan
>>
>> Stefan, the patch won't harm, but it's also unnecessary.
>> So it's up to you whether you remove it from your queue,
>> modify it as I suggested above or apply it as it is.
>
> Keeping those #defines unconditional prevents new mingw builds from
> working, according to the commit description. So we have to either
> remove them entirely or do them correctly. Dropping this patch will
> keep the build from working.
>
> I suggest we keep this patch. A follow-up patch can us MS format
> specifiers or do any other adjustments that make this work better.
> Stefan, would you be able to send that patch?
>
> Stefan

Hi Stefan,

I just did a "git blame include/inttypes.h" on cygwin/mingw32 sources
(git repository created from CVS). Here is the result:

8f6754d5 (dannysmith 2002-06-13 10:20:41 +0000  34) #define PRId64 "I64d"
8f6754d5 (dannysmith 2002-06-13 10:20:41 +0000  52) #define PRIi64 "I64i"
8f6754d5 (dannysmith 2002-06-13 10:20:41 +0000  70) #define PRIo64 "I64o"
8f6754d5 (dannysmith 2002-06-13 10:20:41 +0000  90) #define PRIu64 "I64u"
8f6754d5 (dannysmith 2002-06-13 10:20:41 +0000 109) #define PRIx64 "I64x"
8f6754d5 (dannysmith 2002-06-13 10:20:41 +0000 127) #define PRIX64 "I64X"

The format specifiers were added in 2002 and never changed since that time,
so they are rather old. They don't break any current mingw32 builds.
They will break builds as soon as mingw32 fixes the wrong definitions
(which I don't expect for the next months).

I'll send a patch which simply removes the definitions from
qemu-common.h, so Jan's patch is no longer needed.

Stefan


