Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKroo-0005IX-HU
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 11:31:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VKroi-00059S-9Q
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 11:31:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VKroc-0008TV-VK
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 11:31:24 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:49542)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VKroS-0008Rj-4h; Sat, 14 Sep 2013 11:31:08 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0C65772819EA; Sat, 14 Sep 2013 17:31:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id UmBcp0_RgaXb; Sat, 14 Sep 2013 17:30:54 +0200 (CEST)
Received: from [192.168.178.35] (p54AD9847.dip0.t-ipconnect.de [84.173.152.71])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	4325872819E3; Sat, 14 Sep 2013 17:30:54 +0200 (CEST)
Message-ID: <5234812D.8080905@weilnetz.de>
Date: Sat, 14 Sep 2013 17:30:53 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1377063869-16834-1-git-send-email-sw@weilnetz.de>
	<52262A5E.2010507@weilnetz.de> <5234542D.2020400@msgid.tls.msk.ru>
In-Reply-To: <5234542D.2020400@msgid.tls.msk.ru>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
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
X-List-Received-Date: Sat, 14 Sep 2013 15:31:29 -0000

Am 14.09.2013 14:18, schrieb Michael Tokarev:
> 03.09.2013 22:28, Stefan Weil wrote:
>> Am 21.08.2013 07:44, schrieb Stefan Weil:
>>> Compiler option -Wextra enables an additional set of compiler warnings.
>>>
>>> Some of these warnings were already enabled explicitly in QEMU:
>>> -Wold-style-declaration, -Wtype-limits, -Wignored-qualifiers and
>>> -Wempty-body are now redundant and can be removed.
>>>
>>> Others don't work with the current code and must be disabled to
>>> avoid warnings: -Wno-missing-field-initializers, -Wno-override-init,
>>> -Wno-sign-compare and -Wno-unused-parameter.
>>>
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>> This is a rather old and long tested patch: I use -Wextra in my
>>> QEMU builds for more than a year now. At least one bug was found
>>> by using this warning level (see commit
>>> b22dd1243f38286263d40496ce5298a8a7d96eea).
>>>
>>> My tests include Linux and Windows hosts (gcc), but not BSD based
>>> hosts,
>>> so maybe those hosts might need additional code fixes.
>>> clang reports lots of -Wunused-value warnings.
> []
>> Ping? I'd appreciate getting this patch committed.
>> Is it trivial enough for qemu-trivial?
>>
>> Stefan
>>
>> See also http://patchwork.ozlabs.org/patch/268687/
>
> Well.  I see at least one hidden flag here which is not covered by the
> description:
>
> -gcc_flags="-Wendif-labels $gcc_flags"
> +gcc_flags="-fstack-protector-all -Wendif-labels $gcc_flags"
>
> Is it intentional?

No, -fstack-protector-all should not be there. It might be a relict of
a previous patch rebase: I added -Wextra in my local branch a long
time ago, and -fstack-protector-all was obviously moved to another
location in configure during that time.

I can send an updated patch later, or you can just remove it from
my original patch.


>
> As for the rest, I think it may go to -trivial just fine.  The patch
> does not apply to current git, but is easy to fix.
>
> I'll fire a FreeBSD compile test with it applied.
>
> Thanks,
>
> /mjt


