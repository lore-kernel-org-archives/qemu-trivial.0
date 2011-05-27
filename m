Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQ2Rv-0001Yl-GM
	for mharc-qemu-trivial@gnu.org; Fri, 27 May 2011 15:11:55 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1QQ2Rs-0001TQ-UX
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 15:11:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1QQ2Rs-0007LN-49
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 15:11:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:3574)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1QQ2Rp-0007L2-Sw; Fri, 27 May 2011 15:11:50 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4RJBix0026694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 27 May 2011 15:11:44 -0400
Received: from blackfin.pond.sub.org (ovpn-113-40.phx2.redhat.com
	[10.3.113.40])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p4RJBhSs002352; Fri, 27 May 2011 15:11:44 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id A816E52; Fri, 27 May 2011 21:11:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Weil <weil@mail.berlios.de>
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
	<1306516951-31105-6-git-send-email-cerbere@gmail.com>
	<4DDFE0C9.5040907@mail.berlios.de>
Date: Fri, 27 May 2011 21:11:42 +0200
In-Reply-To: <4DDFE0C9.5040907@mail.berlios.de> (Stefan Weil's message of
	"Fri, 27 May 2011 19:35:05 +0200")
Message-ID: <m38vtst0up.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Fri, 27 May 2011 19:11:54 -0000

Stefan Weil <weil@mail.berlios.de> writes:

> Am 27.05.2011 19:22, schrieb Alexandre Raymond:
>> ----8<----
>> qemu/target-lm32/translate.c: In function
>> =E2=80=98gen_intermediate_code_internal=E2=80=99:
>> qemu/target-lm32/translate.c:1135: warning: format =E2=80=98%zd=E2=80=99=
 expects
>> type =E2=80=98signed size_t=E2=80=99, but argument 4 has type =E2=80=98i=
nt=E2=80=99
>> ----8<----
>>
>> Both gen_opc_ptr and gen_opc_buf are "uint16_t *", so a simple '%d' shou=
ld
>> be able to describe their relative difference.
>>
>> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
>> ---
>> target-lm32/translate.c | 2 +-
>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/target-lm32/translate.c b/target-lm32/translate.c
>> index eb21158..0f69f27 100644
>> --- a/target-lm32/translate.c
>> +++ b/target-lm32/translate.c
>> @@ -1132,7 +1132,7 @@ static void
>> gen_intermediate_code_internal(CPUState *env,
>> if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
>> qemu_log("\n");
>> log_target_disas(pc_start, dc->pc - pc_start, 0);
>> - qemu_log("\nisize=3D%d osize=3D%zd\n",
>> + qemu_log("\nisize=3D%d osize=3D%d\n",
>> dc->pc - pc_start, gen_opc_ptr - gen_opc_buf);
>> }
>> #endif
>
> Nack.
>
> The original code is correct, because the difference of two pointers
> is always of type ssize_t (well, obviously not with your compiler,
> but then I assume that your compiler is broken).

ISO/IEC 9899:1999 =C2=A76.5.6 on pointer subtraction:

    The size of the result is implementation-defined, and its type (a
    signed integer type) is ptrdiff_t defined in the <stddef.h> header.

The pedantically correct way to print a pointer difference is the 't'
type modifier.  Ibid. =C2=A77.19.6.1 on fprintf():

    t   Specifies  that a following d, i, o, u, x, or X conversion
        specifier applies to a ptrdiff_t or the corresponding unsigned
        integer type argument; or that a following n conversion
        specifier applies to a pointer to a ptrdiff_t argument.

ssize_t is POSIX, not ISO C.  It can differ from ptrdiff_t only if
ptrdiff_t has a different size than size_t, which would be kind of sick.
ISO C permits all kinds of sickness.  Whether tolerating a particular
sickness is worth our while is another question.

[...]

