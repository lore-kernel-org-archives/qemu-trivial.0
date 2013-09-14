Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKool-0002hm-J8
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 08:19:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKoof-0002aL-LC
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 08:19:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKoob-0008Rb-7U
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 08:19:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48598)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKooS-0008Po-5T; Sat, 14 Sep 2013 08:18:56 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BD76741141;
	Sat, 14 Sep 2013 16:18:53 +0400 (MSK)
Message-ID: <5234542D.2020400@msgid.tls.msk.ru>
Date: Sat, 14 Sep 2013 16:18:53 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1377063869-16834-1-git-send-email-sw@weilnetz.de>
	<52262A5E.2010507@weilnetz.de>
In-Reply-To: <52262A5E.2010507@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] configure: Enable extra compiler warnings
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
X-List-Received-Date: Sat, 14 Sep 2013 12:19:14 -0000

03.09.2013 22:28, Stefan Weil wrote:
> Am 21.08.2013 07:44, schrieb Stefan Weil:
>> Compiler option -Wextra enables an additional set of compiler warnings.
>>
>> Some of these warnings were already enabled explicitly in QEMU:
>> -Wold-style-declaration, -Wtype-limits, -Wignored-qualifiers and
>> -Wempty-body are now redundant and can be removed.
>>
>> Others don't work with the current code and must be disabled to
>> avoid warnings: -Wno-missing-field-initializers, -Wno-override-init,
>> -Wno-sign-compare and -Wno-unused-parameter.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>> This is a rather old and long tested patch: I use -Wextra in my
>> QEMU builds for more than a year now. At least one bug was found
>> by using this warning level (see commit
>> b22dd1243f38286263d40496ce5298a8a7d96eea).
>>
>> My tests include Linux and Windows hosts (gcc), but not BSD based hosts,
>> so maybe those hosts might need additional code fixes.
>> clang reports lots of -Wunused-value warnings.
[]
> Ping? I'd appreciate getting this patch committed.
> Is it trivial enough for qemu-trivial?
>
> Stefan
>
> See also http://patchwork.ozlabs.org/patch/268687/

Well.  I see at least one hidden flag here which is not covered by the
description:

-gcc_flags="-Wendif-labels $gcc_flags"
+gcc_flags="-fstack-protector-all -Wendif-labels $gcc_flags"

Is it intentional?

As for the rest, I think it may go to -trivial just fine.  The patch
does not apply to current git, but is easy to fix.

I'll fire a FreeBSD compile test with it applied.

Thanks,

/mjt

