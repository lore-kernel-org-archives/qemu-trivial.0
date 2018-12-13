Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXMQG-0004gW-JP
	for mharc-qemu-trivial@gnu.org; Thu, 13 Dec 2018 03:32:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56714)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gXMQB-0004fS-Kf
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 03:32:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gXMQ3-000459-Nu
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 03:32:37 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:58739)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gXMPp-0003qc-8z; Thu, 13 Dec 2018 03:32:17 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1Mrwnt-1hCUXD1THh-00o0Ue; Thu, 13 Dec 2018 09:32:06 +0100
To: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20181203100415.53027-1-r.bolshakov@yadro.com>
	<20181203100415.53027-2-r.bolshakov@yadro.com>
	<20181212211646.vem27l5pe6pzujd4@SPB-NB-133.local>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <8ad0725d-50e5-4503-e380-acc5720b8fd3@vivier.eu>
Date: Thu, 13 Dec 2018 09:32:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181212211646.vem27l5pe6pzujd4@SPB-NB-133.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:aKW2kfVLs9UgOVM5w1Tvbj29SLjICOs+p35yBQAnofuG3DIFeVu
	udDI6yF82Jl8QrHqStGCwSa24Xey+3cNP5OcgKRuMzhiHwXWEtUGc2/NYfSMwXe8SJH898P
	HMg/CZl9FeyPXuH5Qy8BqIrFOERHbHc5mOpGdToR7LYG2l9E8KVSs8lanfy3dqk/G6wCa0g
	rChd5q5GirSquOhkJcCdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Lu5oXJkL67A=:UAq1QnUlg8aI3I88JM2WzR
	n5Q9R9pCTtDD4Au/vAey9JnaG00tNT0gsBMo1eQUqMFXFiQSdBjh5h/JHrAAHh40BETIwlY7D
	TbzReJ/oiHIVkJRqk/NkGzrmMZEui28wdFLb1vmXRyQd6iQFIsWB2xM/liN+6xWuKB0Kk4nGR
	hmhJp+kvawzCwgj3KcTwuuxyywQ2o4I5xTL2FlyqFNQgqzZzSOUqUNRdMcoMFDgsqakc7hKZ3
	vOTER94KyLANCZ53sqzLQ90IYVqR74Hjmf/Gkv4Pw6YQi6DOQH6X4FaWLuvNSL0C2/yRvVKoI
	VONOREcZRnbN3c09uFmrtQjzDyvcoawwjX6KYAdywHsygnCZ8mYNcZdsnSZGw5isdA+KeQMlG
	UwLh+n+/cTu+wgmNcEx5ocviPQlU7yjK2gLIpUb9e/LCqxW5dlFTq0PMSZj8uIgQD0p0IKfqW
	LnQ4enQUThDgqzCNliohEd98MTqbkZd4/eXxyYW8ZcMKBPnLVeOX/oiC2McSfrfVqj9Z6RhQ0
	Q0rSKTUnNZffZ85EBxl0q354alCoeaDjmbF5sDbtMQDIlK6PBrHBQ6HnnntAENNlFe6PR+U/J
	B+L2WhYyO6If7ouXhRNpkc41iOsvDVL1g+ueZj/U6+e3a0PCgqqtzQVokTvcqYr3pJQ7pAqxy
	j/9TReww3JnM28/9D8jkT67sYZVhRJmdMwjgpMzi79wyiE4or8blkCusdf5fHb/AmFPxwTbgd
	qtlo0ZiDd9sXFbfET8DoV316ybVR69szrfKg4NGAiRNAQlNe4+WUj5kEFQQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [PATCH for-3.1 2/2] i386: hvf: drop debug printf
 in decode_sldtgroup
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
X-List-Received-Date: Thu, 13 Dec 2018 08:32:41 -0000

On 12/12/2018 22:16, Roman Bolshakov wrote:
> On Mon, Dec 03, 2018 at 01:04:15PM +0300, Roman Bolshakov wrote:
>> It's going to clutter QEMU logs if 0x0f00 is trapped.
>>
>> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> ---
>>  target/i386/hvf/x86_decode.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
>> index d125a6ef83..5f513c5563 100644
>> --- a/target/i386/hvf/x86_decode.c
>> +++ b/target/i386/hvf/x86_decode.c
>> @@ -525,8 +525,6 @@ static void decode_sldtgroup(CPUX86State *env, struct x86_decode *decode)
>>          X86_DECODE_CMD_INVL
>>      };
>>      decode->cmd = group[decode->modrm.reg];
>> -    printf("%llx: decode_sldtgroup: %d\n", env->hvf_emul->fetch_rip,
>> -            decode->modrm.reg);
>>  }
>>  
>>  static void decode_lidtgroup(CPUX86State *env, struct x86_decode *decode)
>> -- 
>> 2.17.2 (Apple Git-113)
>>
> 
> Could you please apply to trivial queue
Applied to my trivial-patches branch.

Thanks,
Laurent


