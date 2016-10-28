Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c08be-0003Kw-G3
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 10:58:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c08bZ-0003HC-HN
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 10:58:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c08bX-0004o4-V8
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 10:58:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44564)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c08bP-0004mA-Vy; Fri, 28 Oct 2016 10:57:52 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6AE0943721;
	Fri, 28 Oct 2016 17:57:51 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 4E14BB49;
	Fri, 28 Oct 2016 17:57:50 +0300 (MSK)
To: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>
References: <1476383370-30650-1-git-send-email-sw@weilnetz.de>
	<9af01992-677a-11d5-e372-fc5e942907be@msgid.tls.msk.ru>
	<CAFEAcA-u-XrxYrb_tCOfk5dHh1j2xpHZek8oRWqWKX-jS5i4uQ@mail.gmail.com>
	<48f03c8d-7697-bcc0-beee-4e8eb10cdcd2@weilnetz.de>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <caa78983-7b80-cac5-b7c0-152f20e48201@msgid.tls.msk.ru>
Date: Fri, 28 Oct 2016 17:57:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <48f03c8d-7697-bcc0-beee-4e8eb10cdcd2@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] Fix build for less common build
 directories names
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
X-List-Received-Date: Fri, 28 Oct 2016 14:58:05 -0000

17.10.2016 07:43, Stefan Weil wrote:
> Am 16.10.2016 um 21:04 schrieb Peter Maydell:
>> On 16 October 2016 at 15:31, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>> 13.10.2016 21:29, Stefan Weil wrote:
>>>> scripts/tracetool generates a C preprocessor macro from the name of the
>>>> build directory. Any characters which are possible in a directory name
>>>> but not allowed in a macro name must be substituted, otherwise builds
>>>> will fail.
>>>
>>> Applied to -trivial, thank you!
>>
>> Consensus on this and the other thread seemed to be
>> that we should just fix the bug where tracetool is
>> putting the build directory name into symbols
>> rather than working around that...
>>
>> thanks
>> -- PMM
>
> IMHO the patch can be applied nevertheless, as it uses a clearer
> regular expression for characters allowed in macro names
> (not one that is specific for the current QEMU code).

So, what's the thing here?

Once again I hit this bug today, when my usual build environment doesn't
work:

./trace/generated-tracers.h:3:15: error: extra tokens at end of
#ifndef directive [-Werror]
 #ifndef TRACE_.B64_GENERATED_TRACERS_H
               ^
and this patch fixes the issue for me.

Thanks,

/mjt

