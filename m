Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VdyqT-0004jW-Ss
	for mharc-qemu-trivial@gnu.org; Wed, 06 Nov 2013 03:52:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VdyqM-0004Vw-M4
	for qemu-trivial@nongnu.org; Wed, 06 Nov 2013 03:52:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VdyqH-0002S9-QC
	for qemu-trivial@nongnu.org; Wed, 06 Nov 2013 03:52:06 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40284)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vdyq6-0002PN-K4; Wed, 06 Nov 2013 03:51:50 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1AEF44085D;
	Wed,  6 Nov 2013 12:51:49 +0400 (MSK)
Message-ID: <527A0325.1020407@msgid.tls.msk.ru>
Date: Wed, 06 Nov 2013 12:51:49 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Laszlo Ersek <lersek@redhat.com>
References: <1383594685-19332-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA9-YvQPprbt1+KCG0ov44-gbvaPx-gtX4yyd5fzfcX3UA@mail.gmail.com>
	<527805D2.3000107@redhat.com>
In-Reply-To: <527805D2.3000107@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>, Anthony Liguori <aliguori@amazon.com>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] C99 loop vars? [was: gtk: Fix compiler warnings with
	-Werror=sign-compare]
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
X-List-Received-Date: Wed, 06 Nov 2013 08:52:12 -0000

05.11.2013 00:38, Laszlo Ersek wrote:
> On 11/04/13 21:07, Peter Maydell wrote:
>> On 4 November 2013 19:51, Stefan Weil <sw@weilnetz.de> wrote:
>>> With -Werror=3Dsign-compare (not enabled by default), gcc shows these=
 errors:
>>>
>>> ui/gtk.c: In function =E2=80=98gtk_release_modifiers=E2=80=99:
>>> ui/gtk.c:288:19: error:
>>>   comparison between signed and unsigned integer expressions [-Werror=
=3Dsign-compare]
>>> ui/gtk.c: In function =E2=80=98gd_key_event=E2=80=99:
>>> ui/gtk.c:746:19: error:
>>>   comparison between signed and unsigned integer expressions [-Werror=
=3Dsign-compare]
>>
>> If this warning is going to complain about entirely
>> safe and idiomatic code like
>>
>>     int i;
>>     static const int some_array[] =3D {
>>         0x2a, 0x36, 0x1d, 0x9d, 0x38, 0xb8, 0xdb, 0xdd,
>>     };
>>
>>     for (i =3D 0; i < ARRAY_SIZE(some_array); i++) {
>>         ...
>>     }
>
> (Entirely safe, and completely non-idiomatic: "i" should be size_t, as
> that is the type of the sizeof operator's result.)

Maybe in some places we should switch to C99 which allows to declare
a loop variable inside the loop header, like this:

   for(int i =3D 0; i < ARRAY_SIZE(..); i++) {
   }

?

This is much better than a per-unit (function-level) declaration because
by changing type in one place we don't change it for other places which
might become wrong in the result...

But this requires compiling whole thing with gcc -std=3Dc99, which might
bit problematic.

But as it is, the original patch from Stefan, -- I don't think it's a
good idea to apply it.  The code is obviously correct, ARRAY_SIZE is
a fixed value, the compiler is able to determine this and shut pretty
much up ;)

Thanks,

/mjt

