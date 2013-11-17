Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ViAKa-0000yH-Sr
	for mharc-qemu-trivial@gnu.org; Sun, 17 Nov 2013 16:56:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ViAKU-0000qH-A8
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 16:56:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ViAKO-0007KC-OB
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 16:56:30 -0500
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=57474
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1ViAKD-0007HK-2v; Sun, 17 Nov 2013 16:56:13 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	21BF7728008A; Sun, 17 Nov 2013 22:56:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id HwQgC404AE2G; Sun, 17 Nov 2013 22:55:59 +0100 (CET)
Received: from [192.168.178.35] (p54AD858D.dip0.t-ipconnect.de
	[84.173.133.141])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	433297280089; Sun, 17 Nov 2013 22:55:58 +0100 (CET)
Message-ID: <52893B6F.60300@weilnetz.de>
Date: Sun, 17 Nov 2013 22:55:59 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1384711222-8916-1-git-send-email-sw@weilnetz.de>
	<528929B8.9010706@msgid.tls.msk.ru>
In-Reply-To: <528929B8.9010706@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH for 1.7] acpi-build: Fix compiler warning
 (missing gnu_printf format attribute)
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
X-List-Received-Date: Sun, 17 Nov 2013 21:56:36 -0000

Am 17.11.2013 21:40, schrieb Michael Tokarev:
> 17.11.2013 22:00, Stefan Weil wrote:
>> gcc 4.8.2 reports this warning when extra warnings are enabled (-Wextr=
a):
>>
>>   CC    m68k-softmmu/hw/m68k/mcf5206.o
>> hw/i386/acpi-build.c: In function =E2=80=98build_append_nameseg=E2=80=99=
:
>> hw/i386/acpi-build.c:294:5: error:
>>  function might be possible candidate for =E2=80=98gnu_printf=E2=80=99=
 format attribute [-Werror=3Dsuggest-attribute=3Dformat]
>>      g_string_vprintf(s, format, args);
>>      ^
> Why are you sending for-1.7 patches which fixes issues which are not
> present in 1.7?  As far as I can see, -Wextra isn't enabled in 1.7, is =
it?
>
> Thanks,
>
> /mjt

We try to use format attributes for all functions with printf like
arguments.

Patch http://patchwork.ozlabs.org/patch/291873/ shows that the format
attribute
not only fixes a compiler warning (which is not shown with the default
settings)
but also uncovers real programming errors.

I use quite a lot of build environments (32 and 64 bit, Linux and
Windows cross builds)
but there still remain more which I don't cover. With the additional
format attributes
any code either is okay and compiles without warning, or it uses a wrong
format string,
so my patches will break only builds which compile broken code.

I think this kind of build breakage is good and important.

Regards,
Stefan


