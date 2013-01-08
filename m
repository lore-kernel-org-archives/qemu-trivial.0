Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TsRSW-0003R3-6u
	for mharc-qemu-trivial@gnu.org; Tue, 08 Jan 2013 00:10:44 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TsRSR-0003GC-V6
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2013 00:10:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TsRSQ-0008Um-Uv
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2013 00:10:39 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:50968)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TsRQE-0007i9-OV; Tue, 08 Jan 2013 00:08:22 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	4478E728004F; Tue,  8 Jan 2013 06:08:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id HLINE2xf5jte; Tue,  8 Jan 2013 06:08:19 +0100 (CET)
Received: from weilnetz.de (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6527C728004E; Tue,  8 Jan 2013 06:08:19 +0100 (CET)
Received: from 80.134.244.1
	(SquirrelMail authenticated user stefan.weil@weilnetz.de)
	by weilnetz.de with HTTP; Tue, 8 Jan 2013 06:08:19 +0100
Message-ID: <daad7ff9db9acb2fff5dc1d770df7368.squirrel@weilnetz.de>
In-Reply-To: <20130107221257.GG18372@otherpad.lan.raisama.net>
References: <1357579795-11770-1-git-send-email-peter.maydell@linaro.org>
	<50EB0805.604@weilnetz.de>
	<CAFEAcA8rwVhbgUbc3VRtgQUWtztkdXyxYfhxJozytdVQyeFY-g@mail.gmail.com>
	<20130107221257.GG18372@otherpad.lan.raisama.net>
Date: Tue, 8 Jan 2013 06:08:19 +0100
From: "Stefan Weil" <sw@weilnetz.de>
To: "Eduardo Habkost" <ehabkost@redhat.com>
User-Agent: SquirrelMail/1.4.21
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
X-Priority: 3 (Normal)
Importance: Normal
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Peter Maydell <peter.maydell@linaro.org>, patches@linaro.org,
	qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qga/channel-posix.c:
 Explicitly include string.h
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
X-List-Received-Date: Tue, 08 Jan 2013 05:10:41 -0000

> On Mon, Jan 07, 2013 at 05:50:14PM +0000, Peter Maydell wrote:
>> On 7 January 2013 17:38, Stefan Weil <sw@weilnetz.de> wrote:
>> > Am 07.01.2013 18:29, schrieb Peter Maydell:
>> >
>> >> Explicitly include string.h to avoid warnings under MacOS X/clang
>> >> about implicit declarations of strerror() and strlen().
>>
>> > Better: include qemu-common.h first and remove all
>> > three standard includes.
>>
>> This would be reversing direction from commit 4d4922c33...
>> I took the commit message in that commit to imply that we
>> shouldn't be including qemu-common.h for standalone
>> executables like qga.
>
> Including qemu-common.h from .c files is OK, although I wouldn't do tha=
t
> in this specific case (I would include string.h instead).
>
> The problem with qemu-common.h is when it is included by header files,
> because qemu-common.h includes lots of other headers, easily leading to
> circular header dependencies.
>
> --
> Eduardo
>


I just noticed that on my Linux host qemu-common.h is no longer
included indirectly (it was with earlier revisions of QEMU).

Therefore the patch is ok.

Reviewed-by: Stefan Weil <sw@weilnetz.de>



