Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFUOb-0006Yx-8i
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 14:25:41 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TFUOY-0006Pb-Gi
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 14:25:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TFUOX-0007hP-Di
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 14:25:38 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:49108)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TFUOV-0007h3-8X; Sat, 22 Sep 2012 14:25:35 -0400
Received: by iea17 with SMTP id 17so3242714iea.4
	for <multiple recipients>; Sat, 22 Sep 2012 11:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=dhQqGS3YB8ec4gwPW3+stwgDOIrhovPcM3m8Jx2XkVI=;
	b=JMGp+Z8h77mGnVo/l/so7okCkPHA8pWXHVOBuQOy+ZAlcdQ7spRS9rw30nn8G1q4mO
	OsxWdMAM1bqKgB6w8m+TUL1ZzxqRBX8WYDOZvXPfHL9FF5uVKZKk1V6UNVGbfy06KTPK
	2SZFRi3eIIWyFonLjn8ZbDTCpzhgKidNZ3bn5ueJHcrcSBuVlT6+3jbt32qhxKM2c2a0
	GUt2jFRMtOWNlJwMwJPNkTakZLEFpCV9r4dn4RFlT2fVRyiQ7+JZTikkTY3zQ1357WNm
	zYgELoVKPg7oG9CpGZOtkoy78MhnaeKiDjx2U5Erc682X7bo50+qYptDjkviQ8IP2Zdh
	ugxQ==
Received: by 10.50.17.163 with SMTP id p3mr1591879igd.19.1348338334571; Sat,
	22 Sep 2012 11:25:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.49.227 with HTTP; Sat, 22 Sep 2012 11:25:14 -0700 (PDT)
In-Reply-To: <505E00D4.7040104@weilnetz.de>
References: <1348169539-24797-1-git-send-email-sw@weilnetz.de>
	<20120922163216.GC14154@stefanha-thinkpad.localdomain>
	<505DFCFD.6010202@msgid.tls.msk.ru> <505E00D4.7040104@weilnetz.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 22 Sep 2012 18:25:14 +0000
Message-ID: <CAAu8pHuAfjHEU1MjZdJnAHz2xfSGmj=NwJCwD2j_zexbRvYoNQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net/socket: Fix compiler
 warning (regression for MinGW)
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
X-List-Received-Date: Sat, 22 Sep 2012 18:25:39 -0000

On Sat, Sep 22, 2012 at 6:17 PM, Stefan Weil <sw@weilnetz.de> wrote:
> Am 22.09.2012 20:01, schrieb Michael Tokarev:
>
>> On 22.09.2012 20:32, Stefan Hajnoczi wrote:
>>>
>>> On Thu, Sep 20, 2012 at 09:32:19PM +0200, Stefan Weil wrote:
>>>>
>>>> Add a type cast which was removed by commit
>>>> 213fd5087e2e4e2da10ad266df0ba950cf7618bf again.
>>>>
>>>> Without it, MinGW compilers complain:
>>>>
>>>> net/socket.c:136: warning:
>>>>   pointer targets in passing argument 2 of =E2=80=98sendto=E2=80=99 di=
ffer in signedness
>>>>
>>>> /usr/lib/gcc/amd64-mingw32msvc/4.4.4/../../../../amd64-mingw32msvc/inc=
lude/winsock2.h:1313:
>>>> note:
>>>>   expected =E2=80=98const char *=E2=80=99 but argument is of type =E2=
=80=98const uint8_t *=E2=80=99
>>>
>>> Wow, that's messed up.  sendto() is POSIX and the prototype shouldn't b=
e
>>> const char *.
>>>
>>> It's easy for someone to remove this cast in the future.  Please add a
>>> comment explaining that it's needed because MinGW headers don't have th=
e
>>> POSIX version of sendto().
>>
>> There's qemu_recv() in qemu-common.h, for exactly the same purpose.
>> But qemu_recv() is much more evil, IMHO.
>>
>> Thanks,
>>
>> /mjt
>
>
> Thanks for the hint.
>
> I already sent v2 of my patch (with a comment as suggested by Stefan H.).
>
> Of course we could also add a qemu_sendto to qemu-common.h.
> Is there anybody who would prefer that solution?

Yes.

>
> Regards
> Stefan W.
>

