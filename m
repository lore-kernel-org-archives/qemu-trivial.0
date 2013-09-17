Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VLz3p-0002sM-DE
	for mharc-qemu-trivial@gnu.org; Tue, 17 Sep 2013 13:27:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VLz3h-0002gY-1S
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 13:27:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VLz3X-0006Vr-O8
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 13:27:28 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:37996)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VLz3X-0006Ve-E0
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 13:27:19 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6F55C72819E7; Tue, 17 Sep 2013 19:27:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id d7FgfhK56Vwl; Tue, 17 Sep 2013 19:27:06 +0200 (CEST)
Received: from [192.168.178.35] (p54ADBB22.dip0.t-ipconnect.de [84.173.187.34])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	BF5B872819DE; Tue, 17 Sep 2013 19:27:05 +0200 (CEST)
Message-ID: <523890E9.5030000@weilnetz.de>
Date: Tue, 17 Sep 2013 19:27:05 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@web.de>
References: <1379437402-30804-1-git-send-email-sw@weilnetz.de>
	<52388EC1.6030108@web.de>
In-Reply-To: <52388EC1.6030108@web.de>
X-Enigmail-Version: 1.4.6
Content-Type: multipart/alternative;
	boundary="------------030003000206090209000500"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [PATCH] cpu-exec: Fix compiler warning
	(-Werror=clobbered)
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
X-List-Received-Date: Tue, 17 Sep 2013 17:27:35 -0000

This is a multi-part message in MIME format.
--------------030003000206090209000500
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 17.09.2013 19:17, schrieb Jan Kiszka:
> On 2013-09-17 19:03, Stefan Weil wrote:
>> 'cpu' and 'env' are not modified after sigsetjmp. Therefore they will
>> still have their last value after longjmp restored the stack context.
>>
>> The code which should "reload" both variables causes a compiler warnin=
g:
>>
>> cpu-exec.c:204:15: error:
>> variable =E2=80=98cpu=E2=80=99 might be clobbered by =E2=80=98longjmp=E2=
=80=99 or =E2=80=98vfork=E2=80=99
[-Werror=3Dclobbered]
>> cpu-exec.c:202:28: error:
>> argument =E2=80=98env=E2=80=99 might be clobbered by =E2=80=98longjmp=E2=
=80=99 or =E2=80=98vfork=E2=80=99
[-Werror=3Dclobbered]
>>
>> Remove this unneeded code.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> Jan,
>>
>> could you please review this patch which removes code added by you
earlier?
>> I have run tests with the old code and assertions to see whether the
values
>> were really smashed. They never were, and from the documentation of
setjmp
>> I'd not expect that they ever might be.
>>
>> The patch is needed to fix a compiler warning with -Wextra.
>
> This used to fix a real, deadly crash. Therefore a reversion can't be
> trivial by definition. Unfortunately, I don't recall which compiler
> version and concrete scenario were involved back then.
>
> Anyway - did anything change in the code structure around since then?
> Does anything ensure that this "optimization" is not longer performed b=
y
> the compiler?
>
> I'll try to understand the warnings meanwhile.
>
> Jan
>

The code changed a lot since that time, e.g. setjmp was replaced by
sigsetjmp.

Maybe you had a broken compiler which could be forced to do the right thi=
ng
by that code?

Stefan



--------------030003000206090209000500
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Am 17.09.2013 19:17, schrieb Jan Kiszka:<br>
    <span style=3D"white-space: pre;">&gt; On 2013-09-17 19:03, Stefan
      Weil wrote:<br>
      &gt;&gt; 'cpu' and 'env' are not modified after sigsetjmp.
      Therefore they will<br>
      &gt;&gt; still have their last value after longjmp restored the
      stack context.<br>
      &gt;&gt;<br>
      &gt;&gt; The code which should "reload" both variables causes a
      compiler warning:<br>
      &gt;&gt;<br>
      &gt;&gt; cpu-exec.c:204:15: error:<br>
      &gt;&gt; variable =E2=80=98cpu=E2=80=99 might be clobbered by =E2=80=
=98longjmp=E2=80=99 or =E2=80=98vfork=E2=80=99
      [-Werror=3Dclobbered]<br>
      &gt;&gt; cpu-exec.c:202:28: error:<br>
      &gt;&gt; argument =E2=80=98env=E2=80=99 might be clobbered by =E2=80=
=98longjmp=E2=80=99 or =E2=80=98vfork=E2=80=99
      [-Werror=3Dclobbered]<br>
      &gt;&gt;<br>
      &gt;&gt; Remove this unneeded code.<br>
      &gt;&gt;<br>
      &gt;&gt; Signed-off-by: Stefan Weil <a class=3D"moz-txt-link-rfc239=
6E" href=3D"mailto:sw@weilnetz.de">&lt;sw@weilnetz.de&gt;</a><br>
      &gt;&gt; ---<br>
      &gt;&gt;<br>
      &gt;&gt; Jan,<br>
      &gt;&gt;<br>
      &gt;&gt; could you please review this patch which removes code
      added by you earlier?<br>
      &gt;&gt; I have run tests with the old code and assertions to see
      whether the values<br>
      &gt;&gt; were really smashed. They never were, and from the
      documentation of setjmp<br>
      &gt;&gt; I'd not expect that they ever might be.<br>
      &gt;&gt;<br>
      &gt;&gt; The patch is needed to fix a compiler warning with
      -Wextra.<br>
      &gt;<br>
      &gt; This used to fix a real, deadly crash. Therefore a reversion
      can't be<br>
      &gt; trivial by definition. Unfortunately, I don't recall which
      compiler<br>
      &gt; version and concrete scenario were involved back then.<br>
      &gt;<br>
      &gt; Anyway - did anything change in the code structure around
      since then?<br>
      &gt; Does anything ensure that this "optimization" is not longer
      performed by<br>
      &gt; the compiler?<br>
      &gt;<br>
      &gt; I'll try to understand the warnings meanwhile.<br>
      &gt;<br>
      &gt; Jan<br>
      &gt;</span><br>
    <br>
    The code changed a lot since that time, e.g. setjmp was replaced by
    sigsetjmp.<br>
    <br>
    Maybe you had a broken compiler which could be forced to do the
    right thing<br>
    by that code?<br>
    <br>
    Stefan<br>
    <br>
    <br>
  </body>
</html>

--------------030003000206090209000500--

