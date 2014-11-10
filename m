Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XnkCB-0005ua-8T
	for mharc-qemu-trivial@gnu.org; Mon, 10 Nov 2014 03:19:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XnkC2-0005gL-HC
	for qemu-trivial@nongnu.org; Mon, 10 Nov 2014 03:19:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XnkBx-00008u-Lp
	for qemu-trivial@nongnu.org; Mon, 10 Nov 2014 03:19:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XnkBo-00006z-H3; Mon, 10 Nov 2014 03:19:08 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAA8J1bH002319
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 10 Nov 2014 03:19:01 -0500
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com
	[10.36.116.42])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAA8Ixdi022346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 10 Nov 2014 03:19:00 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A39EE30403AF; Mon, 10 Nov 2014 09:18:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <545D935F.3070300@lekkertech.net>
	<CAFEAcA8gyg=jjbJ0v4iRx+1aTDWFQWFNGwXXa49LZ_WWSA76_Q@mail.gmail.com>
Date: Mon, 10 Nov 2014 09:18:58 +0100
In-Reply-To: <CAFEAcA8gyg=jjbJ0v4iRx+1aTDWFQWFNGwXXa49LZ_WWSA76_Q@mail.gmail.com>
	(Peter Maydell's message of "Sat, 8 Nov 2014 15:26:53 +0000")
Message-ID: <87sihr31u5.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Willem Pinckaers <willem_qemu@lekkertech.net>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] coroutine-sigaltstack:
	Change jmp_buf to sigjmp_buf
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
X-List-Received-Date: Mon, 10 Nov 2014 08:19:30 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 8 November 2014 03:51, Willem Pinckaers <willem_qemu@lekkertech.net> wrote:
>> This is a simple patch to change the type of old_env from jmp_buf
>> to sigjmp_buf.  old_env is used by sigsetjmp and as such should be
>> a sigjmp_buf.
>>
>> This fixes a stack_chk fail in a OSX 32bit build. Since at least on
>> OSX sigjmp_buf is four bytes larger then a jmpbuf, resulting in an
>> overflow in sigsetjmp. Due to variable reordering this overwrites
>> the stack cookie.
>>
>> Signed-off-by: Willem Pinckaers <willem_qemu@lekkertech.net>
>> ---
>>  coroutine-sigaltstack.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/coroutine-sigaltstack.c b/coroutine-sigaltstack.c
>> index 3de0bb3..63519ff 100644
>> --- a/coroutine-sigaltstack.c
>> +++ b/coroutine-sigaltstack.c
>> @@ -155,7 +155,7 @@ Coroutine *qemu_coroutine_new(void)
>>      stack_t oss;
>>      sigset_t sigs;
>>      sigset_t osigs;
>> -    jmp_buf old_env;
>> +    sigjmp_buf old_env;
>>
>>      /* The way to manipulate stack is with the sigaltstack function. We
>>       * prepare a stack, with it delivering a signal to ourselves and then
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> I think I must have missed this one when I converted all the jmp_buf
> to sigjmp_buf in commit 6ab7e546.

Useful bit of information, perhaps you can amend the commit message with
it on commit.

