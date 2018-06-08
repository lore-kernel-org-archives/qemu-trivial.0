Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fRNiX-0002X3-KM
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jun 2018 16:10:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fRNiV-0002Uw-13
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 16:10:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fRNiT-00005e-Sq
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 16:10:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53268 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fRNiP-0008QG-6K; Fri, 08 Jun 2018 16:10:29 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55D0A4022931;
	Fri,  8 Jun 2018 20:10:28 +0000 (UTC)
Received: from [10.36.116.56] (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9EAC2024CAC;
	Fri,  8 Jun 2018 20:10:25 +0000 (UTC)
To: Patryk Olszewski <patryk@fala.ehost.pl>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Desnogues <laurent.desnogues@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20180607210818.12727-1-f4bug@amsat.org>
	<9abdaa17-d6d1-0c34-2a20-43078b487bef@redhat.com>
	<CAFEAcA-QYnWOo2Hqdr-3tKDDxWDnR+tF4snd15Y1P6md04CogA@mail.gmail.com>
	<2b3eb485-701e-21cd-f66c-897df470a4e4@fala.ehost.pl>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6c6a6d92-140f-7b1b-544d-bf05c42abd29@redhat.com>
Date: Fri, 8 Jun 2018 22:10:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <2b3eb485-701e-21cd-f66c-897df470a4e4@fala.ehost.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 08 Jun 2018 20:10:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 08 Jun 2018 20:10:28 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] chardev: Restore CR,
 LF on stdio
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
X-List-Received-Date: Fri, 08 Jun 2018 20:10:36 -0000

On 08.06.2018 17:58, Patryk Olszewski wrote:
> W dniu 08.06.2018 o=C2=A017:25, Peter Maydell pisze:
>> On 8 June 2018 at 06:47, Thomas Huth <thuth@redhat.com> wrote:
>>> On 07.06.2018 23:08, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> Remove the 'stair-step output' on stdio.
>>>>
>>>> This partially reverts commit 12fb0ac05, which was correct
>>>> on the mailing list but got corrupted by the maintainer :p
>>>>
>>>> Introduced-by: 3b876140-c035-dd39-75d0-d54c48128fac@redhat.com
>>>> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> Suggested-by: Thomas Huth <thuth@redhat.com>
>>>> Tested-by: Laurent Desnogues <laurent.desnogues@gmail.com>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>> ---
>>>> See:
>>>> http://lists.nongnu.org/archive/html/qemu-devel/2018-05/msg06202.htm=
l (bug)
>>>> http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg01309.htm=
l (report)
>>>>
>>>> Peter, Can this enters directly as bug-fix?
>>>>
>>>>  chardev/char-stdio.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/chardev/char-stdio.c b/chardev/char-stdio.c
>>>> index d83e60e787..96375f2ab8 100644
>>>> --- a/chardev/char-stdio.c
>>>> +++ b/chardev/char-stdio.c
>>>> @@ -59,7 +59,7 @@ static void qemu_chr_set_echo_stdio(Chardev *chr, =
bool echo)
>>>>      if (!echo) {
>>>>          tty.c_iflag &=3D ~(IGNBRK | BRKINT | PARMRK | ISTRIP
>>>>                           | INLCR | IGNCR | ICRNL | IXON);
>>>> -        tty.c_oflag &=3D ~OPOST;
>>>> +        tty.c_oflag |=3D OPOST;
>>>>          tty.c_lflag &=3D ~(ECHO | ECHONL | ICANON | IEXTEN);
>>>>          tty.c_cflag &=3D ~(CSIZE | PARENB);
>>>>          tty.c_cflag |=3D CS8;
>>>>
>>> I think this is the right way to go.
>>>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Applied to master, thanks.
>>
>> -- PMM
>>
> I actually think it would be better to set c_oflag to (OPOST | ONLCR) t=
o
> avoid any problems in the future. At this point it is assumed that ONLC=
R
> is set.

stdio output worked fine without explicitly setting ONLCR in the past,
so unless we hit a situation where it is really required, I'd rather
keep it that way now to avoid yet another unexpected regression.

 Thomas


