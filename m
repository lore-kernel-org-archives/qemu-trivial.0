Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXTlN-0002Ft-3K
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 10:46:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dXTlL-0002EK-3A
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 10:46:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dXTlK-0002SR-8k
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 10:46:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56491)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dXTlF-0002NJ-3m; Tue, 18 Jul 2017 10:46:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 081A3C04D2EF;
	Tue, 18 Jul 2017 14:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 081A3C04D2EF
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 081A3C04D2EF
Received: from [10.33.200.180] (dhcp-200-180.str.redhat.com [10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 194E27C741;
	Tue, 18 Jul 2017 14:46:02 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu trival <qemu-trivial@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	QEMU <qemu-devel@nongnu.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-16-f4bug@amsat.org>
	<CAJ+F1CJh-pX4rvuZKCzYiDE+8Spruan-w73qZk+=BWsLFG5OAg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <bdc516ce-f893-1b93-d01a-b648fedd704d@redhat.com>
Date: Tue, 18 Jul 2017 16:46:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJh-pX4rvuZKCzYiDE+8Spruan-w73qZk+=BWsLFG5OAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 18 Jul 2017 14:46:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 15/29] microblaze: use
 QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 14:46:12 -0000

On 18.07.2017 13:08, Marc-Andr=C3=A9 Lureau wrote:
> On Mon, Jul 17, 2017 at 11:09 PM, Philippe Mathieu-Daud=C3=A9
> <f4bug@amsat.org> wrote:
>> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osd=
ep.cocci
>> (also added braces to satisfy checkpatch)
[...]
>> diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_help=
er.c
>> index 1e07e21c1c..41ab52fb7a 100644
>> --- a/target/microblaze/op_helper.c
>> +++ b/target/microblaze/op_helper.c
>> @@ -108,8 +108,9 @@ void helper_debug(CPUMBState *env)
>>               (env->sregs[SR_MSR] & MSR_IE));
>>      for (i =3D 0; i < 32; i++) {
>>          qemu_log("r%2.2d=3D%8.8x ", i, env->regs[i]);
>> -        if ((i + 1) % 4 =3D=3D 0)
>> +        if (QEMU_IS_ALIGNED(i + 1, 4)) {
>>              qemu_log("\n");
>> +        }
>>      }
>>      qemu_log("\n\n");
>>  }
>> diff --git a/target/microblaze/translate.c b/target/microblaze/transla=
te.c
>> index cb65d1e129..ae7b3c71b0 100644
>> --- a/target/microblaze/translate.c
>> +++ b/target/microblaze/translate.c
>> @@ -1839,9 +1839,10 @@ void mb_cpu_dump_state(CPUState *cs, FILE *f, f=
printf_function cpu_fprintf,
>>
>>      for (i =3D 0; i < 32; i++) {
>>          cpu_fprintf(f, "r%2.2d=3D%8.8x ", i, env->regs[i]);
>> -        if ((i + 1) % 4 =3D=3D 0)
>> +        if (QEMU_IS_ALIGNED(i + 1, 4)) {
>>              cpu_fprintf(f, "\n");
>>          }
>> +    }
>>      cpu_fprintf(f, "\n\n");
>>  }

I'd also vote to keep the original code here ... it's about pretty
printing, not about checking the alignment of addresses.

 Thomas

