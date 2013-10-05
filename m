Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSOE9-0005Kz-5O
	for mharc-qemu-trivial@gnu.org; Sat, 05 Oct 2013 05:32:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VSODz-00059C-9T
	for qemu-trivial@nongnu.org; Sat, 05 Oct 2013 05:32:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VSODq-0008RP-QK
	for qemu-trivial@nongnu.org; Sat, 05 Oct 2013 05:32:35 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=36624
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VSODW-0008N2-9c; Sat, 05 Oct 2013 05:32:06 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2533272819E0; Sat,  5 Oct 2013 11:32:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id TACU6kBLAV8l; Sat,  5 Oct 2013 11:31:49 +0200 (CEST)
Received: from [192.168.178.35] (p54ADB5CB.dip0.t-ipconnect.de
	[84.173.181.203])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	CD5C272809F0; Sat,  5 Oct 2013 11:31:48 +0200 (CEST)
Message-ID: <524FDC81.2090008@weilnetz.de>
Date: Sat, 05 Oct 2013 11:31:45 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1380746429-634-1-git-send-email-sw@weilnetz.de>
	<524FD777.40303@msgid.tls.msk.ru>
In-Reply-To: <524FD777.40303@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] util/path: Fix type which is longer than
 8 bit for MinGW
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
X-List-Received-Date: Sat, 05 Oct 2013 09:32:44 -0000

Am 05.10.2013 11:10, schrieb Michael Tokarev:
> 03.10.2013 00:40, Stefan Weil wrote:
>> While dirent->d_type is 8 bit for most systems, it is 32 bit for MinGW.
>> Reducing it to 8 bit results in a compiler warning because the macro
>> is_dir_maybe compares that 8 bit value with 32 bit constants.
>>
>> Using 'unsigned' instead of 'unsigned char' matches the declaration for
>> MinGW and does not harm the other systems.
>>
>> MinGW-w32 is not affected: it does not declare d_type.
>
> That's a good one.
>
> What's the diff between mingw-w32 and mingw?
>
> At any rate, there's - I think - no need to declare it as 'char',
> int or unsigned should be just fine.
>
> Thanks, applied to the trivial patches queue.
>
> /mjt


It should be MinGW-w64, not MinGW-w32, because that is the
official project name. Perhaps you can correct that in the commit comment.
But even the MinGW-w64 developers use mingw-w32 when they speak of
MinGW-w64 for 32 bit Windows, so MinGW-w32 is not completely wrong:
http://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win32/Automated%20Builds/

MinGW-w64 is a fork of the original MinGW. The main difference is
that MinGW-w64 supports 32 bit and 64 bit compilers, while MinGW
only supports 32 bit. IMHO MinGW-w64 is better maintained.

For QEMU, I prefer MinGW-w64 because it allows builds without
compiler warnings, so I can use -Werror.

MinGW-w64's dirent.h does not declare d_type and the related macros
DT_DIR, DT_LINK and DT_UNKNOWN. These macros are checked in
the conditional compilation in util/path.c.

Stefan


