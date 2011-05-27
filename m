Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQ3u3-000788-Ec
	for mharc-qemu-trivial@gnu.org; Fri, 27 May 2011 16:45:03 -0400
Received: from eggs.gnu.org ([140.186.70.92]:34064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QQ3u1-00072Y-0D
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 16:45:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QQ3u0-0006z6-6U
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 16:45:00 -0400
Received: from moutng.kundenserver.de ([212.227.126.187]:64507)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1QQ3tx-0006yP-NL; Fri, 27 May 2011 16:44:58 -0400
Received: from flocke.weilnetz.de (p5086FC6B.dip.t-dialin.net [80.134.252.107])
	by mrelayeu.kundenserver.de (node=mrbap4) with ESMTP (Nemesis)
	id 0MabPt-1QAzrL3rIn-00K7JB; Fri, 27 May 2011 22:44:55 +0200
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <weil@mail.berlios.de>)
	id 1QQ3tu-0001nR-2A; Fri, 27 May 2011 22:44:54 +0200
Message-ID: <4DE00D46.5030604@mail.berlios.de>
Date: Fri, 27 May 2011 22:44:54 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20110307 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>	<1306516951-31105-6-git-send-email-cerbere@gmail.com>	<4DDFE0C9.5040907@mail.berlios.de>
	<m38vtst0up.fsf@blackfin.pond.sub.org>
In-Reply-To: <m38vtst0up.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V02:K0:EV3STykjJcSkMLQGLedo7R+E2UXGM+vJRkh24kqVGA4
	LhbFvVoNYC+J4qJ7qLOHgJ9p6cnD7YhzMB+UkkopRErL877onU
	FNzfewCmHfns+O+1K0fLqk9Kfp5DZVqgHoHkxuc4LJAkWXiaG9
	E6lUSbGZ4rzGy5t3KAwKjancP43BfGrS90krkFlP7naT21Iq2w
	tPSD71QCnv7QxaE6LURZla+v6ZMlFVNYxHmXcJwLSlE98u+x5m qWA34n4hI+uLw
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.187
Cc: Alexandre Raymond <cerbere@gmail.com>, qemu-trivial@nongnu.org,
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
X-List-Received-Date: Fri, 27 May 2011 20:45:02 -0000

Am 27.05.2011 21:11, schrieb Markus Armbruster:
> Stefan Weil <weil@mail.berlios.de> writes:
>
>> Am 27.05.2011 19:22, schrieb Alexandre Raymond:
>>> ----8<----
>>> qemu/target-lm32/translate.c: In function
>>> ‘gen_intermediate_code_internal’:
>>> qemu/target-lm32/translate.c:1135: warning: format ‘%zd’ expects
>>> type ‘signed size_t’, but argument 4 has type ‘int’
>>> ----8<----
>>>
>>> Both gen_opc_ptr and gen_opc_buf are "uint16_t *", so a simple '%d' 
>>> should
>>> be able to describe their relative difference.
>>>
>>> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
>>> ---
>>> target-lm32/translate.c | 2 +-
>>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/target-lm32/translate.c b/target-lm32/translate.c
>>> index eb21158..0f69f27 100644
>>> --- a/target-lm32/translate.c
>>> +++ b/target-lm32/translate.c
>>> @@ -1132,7 +1132,7 @@ static void
>>> gen_intermediate_code_internal(CPUState *env,
>>> if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
>>> qemu_log("\n");
>>> log_target_disas(pc_start, dc->pc - pc_start, 0);
>>> - qemu_log("\nisize=%d osize=%zd\n",
>>> + qemu_log("\nisize=%d osize=%d\n",
>>> dc->pc - pc_start, gen_opc_ptr - gen_opc_buf);
>>> }
>>> #endif
>>
>> Nack.
>>
>> The original code is correct, because the difference of two pointers
>> is always of type ssize_t (well, obviously not with your compiler,
>> but then I assume that your compiler is broken).
>
> ISO/IEC 9899:1999 §6.5.6 on pointer subtraction:
>
> The size of the result is implementation-defined, and its type (a
> signed integer type) is ptrdiff_t defined in the <stddef.h> header.
>
> The pedantically correct way to print a pointer difference is the 't'
> type modifier. Ibid. §7.19.6.1 on fprintf():
>
> t Specifies that a following d, i, o, u, x, or X conversion
> specifier applies to a ptrdiff_t or the corresponding unsigned
> integer type argument; or that a following n conversion
> specifier applies to a pointer to a ptrdiff_t argument.
>
> ssize_t is POSIX, not ISO C. It can differ from ptrdiff_t only if
> ptrdiff_t has a different size than size_t, which would be kind of sick.
> ISO C permits all kinds of sickness. Whether tolerating a particular
> sickness is worth our while is another question.
>
> [...]

That's correct. And ptrdiff_t needs %td.

Alexandre, could you please try %td instead of %zd?

Cheers,
Stefan W.


