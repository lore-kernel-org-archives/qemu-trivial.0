Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQ5Fd-0004tA-Fx
	for mharc-qemu-trivial@gnu.org; Fri, 27 May 2011 18:11:25 -0400
Received: from eggs.gnu.org ([140.186.70.92]:43676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQ5Fa-0004lj-M2
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 18:11:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQ5FZ-0004Zh-HI
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 18:11:22 -0400
Received: from mail-pz0-f45.google.com ([209.85.210.45]:43639)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QQ5FX-0004ZQ-Bz; Fri, 27 May 2011 18:11:19 -0400
Received: by pzk30 with SMTP id 30so1020909pzk.4
	for <multiple recipients>; Fri, 27 May 2011 15:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=AILrewaiE95bY4hyTjeHful7Duu3P6wH46RO8nFpkWw=;
	b=uNGUg/jpaKu5wiTfuxkByYWsOkcZqM1RevIEfQELrMp5vtMWrDaDTKfZu6u7JgHdbK
	Vk5DHwoEEzxCvHAXFHrJWAj4ySvRwKnC9C4DfkDzooej8yhfkRHG53WyT7JbXY2LDAd7
	ByC9dsWupJR/lOebx6+CvCsdJEbESH1OtapGw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=VtmhYAL7BTBxx8s+zWZSO2VDfvke/dz5oTCbKxuDeaQYsFSZDS1WWm8iuT1KbVNOGi
	NJnhcvt+xui+RJ5AaaJ16h2eH+gxL6yMyM7Y6YxmwyD9Ybc/hNUg254knpTfL40ZLSWx
	LS4J/+vXr2qXBncnIpnJqczMw3+0klelRJHrc=
Received: by 10.68.17.202 with SMTP id q10mr1113339pbd.76.1306534278093; Fri,
	27 May 2011 15:11:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.228 with HTTP; Fri, 27 May 2011 15:10:58 -0700 (PDT)
In-Reply-To: <4DE00D46.5030604@mail.berlios.de>
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
	<1306516951-31105-6-git-send-email-cerbere@gmail.com>
	<4DDFE0C9.5040907@mail.berlios.de>
	<m38vtst0up.fsf@blackfin.pond.sub.org>
	<4DE00D46.5030604@mail.berlios.de>
From: Alexandre Raymond <cerbere@gmail.com>
Date: Fri, 27 May 2011 18:10:58 -0400
Message-ID: <BANLkTi=s7wHQcJHfnN0mGQ0oeeZkKzByng@mail.gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.45
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 5/6] Remove warning in
	printf due to type mismatch
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
X-List-Received-Date: Fri, 27 May 2011 22:11:23 -0000

Hi Stefan and Markus,

Thanks for your feedback :)

"%td" doesn't generate warnings on Linux nor on OSX.

Alexandre

On Fri, May 27, 2011 at 4:44 PM, Stefan Weil <weil@mail.berlios.de> wrote:
> Am 27.05.2011 21:11, schrieb Markus Armbruster:
>>
>> Stefan Weil <weil@mail.berlios.de> writes:
>>
>>> Am 27.05.2011 19:22, schrieb Alexandre Raymond:
>>>>
>>>> ----8<----
>>>> qemu/target-lm32/translate.c: In function
>>>> =E2=80=98gen_intermediate_code_internal=E2=80=99:
>>>> qemu/target-lm32/translate.c:1135: warning: format =E2=80=98%zd=E2=80=
=99 expects
>>>> type =E2=80=98signed size_t=E2=80=99, but argument 4 has type =E2=80=
=98int=E2=80=99
>>>> ----8<----
>>>>
>>>> Both gen_opc_ptr and gen_opc_buf are "uint16_t *", so a simple '%d'
>>>> should
>>>> be able to describe their relative difference.
>>>>
>>>> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
>>>> ---
>>>> target-lm32/translate.c | 2 +-
>>>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/target-lm32/translate.c b/target-lm32/translate.c
>>>> index eb21158..0f69f27 100644
>>>> --- a/target-lm32/translate.c
>>>> +++ b/target-lm32/translate.c
>>>> @@ -1132,7 +1132,7 @@ static void
>>>> gen_intermediate_code_internal(CPUState *env,
>>>> if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
>>>> qemu_log("\n");
>>>> log_target_disas(pc_start, dc->pc - pc_start, 0);
>>>> - qemu_log("\nisize=3D%d osize=3D%zd\n",
>>>> + qemu_log("\nisize=3D%d osize=3D%d\n",
>>>> dc->pc - pc_start, gen_opc_ptr - gen_opc_buf);
>>>> }
>>>> #endif
>>>
>>> Nack.
>>>
>>> The original code is correct, because the difference of two pointers
>>> is always of type ssize_t (well, obviously not with your compiler,
>>> but then I assume that your compiler is broken).
>>
>> ISO/IEC 9899:1999 =C2=A76.5.6 on pointer subtraction:
>>
>> The size of the result is implementation-defined, and its type (a
>> signed integer type) is ptrdiff_t defined in the <stddef.h> header.
>>
>> The pedantically correct way to print a pointer difference is the 't'
>> type modifier. Ibid. =C2=A77.19.6.1 on fprintf():
>>
>> t Specifies that a following d, i, o, u, x, or X conversion
>> specifier applies to a ptrdiff_t or the corresponding unsigned
>> integer type argument; or that a following n conversion
>> specifier applies to a pointer to a ptrdiff_t argument.
>>
>> ssize_t is POSIX, not ISO C. It can differ from ptrdiff_t only if
>> ptrdiff_t has a different size than size_t, which would be kind of sick.
>> ISO C permits all kinds of sickness. Whether tolerating a particular
>> sickness is worth our while is another question.
>>
>> [...]
>
> That's correct. And ptrdiff_t needs %td.
>
> Alexandre, could you please try %td instead of %zd?
>
> Cheers,
> Stefan W.
>
>

