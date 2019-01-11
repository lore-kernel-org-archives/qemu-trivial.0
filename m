Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghr7X-0007HL-9L
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2019 02:20:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghr7V-0007GA-RS
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 02:20:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghr7V-0004Fb-27
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 02:20:45 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:55805)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ghr7H-0003st-0N; Fri, 11 Jan 2019 02:20:34 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MZCrZ-1gmVog1Q4P-00V8NC; Fri, 11 Jan 2019 08:20:19 +0100
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-trivial@nongnu.org, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Jon Diekema <jon.diekema@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <5c2e6965.1c69fb81.b832c.13ee@mx.google.com>
	<2c434536-6388-563f-344b-c6800769a733@vivier.eu>
	<20190111003735.GP6682@umbus.fritz.box>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3d0e3354-5a56-7576-cc36-7cfb360bf636@vivier.eu>
Date: Fri, 11 Jan 2019 08:20:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190111003735.GP6682@umbus.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:+lkYzkbACice+E2wC117cnrlb7E1FKsTSlsoQQSN9Aahgwgm22n
	hQXGaeHz9n+DJk9AiW20IlAqMIKg6QRHvvS+ePdcxXnW8/m0JzWiNivkjT7w9fzAs3S0CzB
	aFVW/Cm8Ucf4gBlm+b3Ml1MZtyhrCRa/r7Kzb+xYNnmhIQj+ENVhhElL+ueAttwJdzuyHpU
	Jj9wO/KbiVQY1YketCBqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+KyqRDWrok4=:AhDB+FL8qqnCczGlrw6ROY
	0lSs/4VxqP98RwQm30pbY/iOCfPed/Td9YMFimr0e22iTLqmYdtkYXqK84FiTzKJbDutSlGtE
	TW7bFHwvEBN8RbwZJRtLgzwkmE7dSXBfDkPF4XvFxjcKAzi0VgR/0a/7PxijbtSCKPx93RuWt
	fWeh3n/sR21wHDmQ3mKcJuDDrXWJTNEnX8mgxIXOyxrxL2fMXNEQPDmWAB+0oeQqlDk8k3fTz
	QtDheK2KLAAJo0sTOgE2IRYtJq6on8ENvAP5evCCSvp9tP+JUpyn1C5ktiAHBJ125k1/A8uCh
	VlyO5b8NnE8lKlcJEDoXIrqZuvvjeUDkj+jt+M4opd+Rn92y7XZbOG2A1L72goqAXrYOKpMSN
	qD0Ee/hz8kcCQ2UFk9Jdm+UtJv45ylG6HCEbU59ZBMosaCI1KBb+CsIqIWZbLjGF7XVqaDaPZ
	OEcMyscz7UjVOqW8gd28+BP4uhe5ZJfoPiIq0dAj9ei74SpKdQMn0SOEFFtnz8DdF94hJPIjA
	V5ZgiGBJGYYg2yCx0WvbHzJ1flmnbQvevkAV1qpOzG/IFFTvhkcYanCZNZMsEalRwQoMh8+Fm
	9OPRfc/Oc2ReR24+OW5NZjVtKtLTtvUQyeJhbB5zg3IzvxbbyzCOHJftp6XsRRaOjGuG+/OVm
	9DhcJsyMi6EtNiujQh6O4c+YekLAga9x43C600YoyIokQtipR7fwvVrxxeapxSq9P81jpw88b
	ZPyuZOEgv6JGb9mERWm7Cg0gCxJAemClOyAHqgtKRh78ZiehXsxFznV3dpo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-trivial] Whitespace cleanup:
 target/ppc/translate_init.inc.c
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
X-List-Received-Date: Fri, 11 Jan 2019 07:20:46 -0000

On 11/01/2019 01:37, David Gibson wrote:
> On Wed, Jan 09, 2019 at 11:15:26AM +0100, Laurent Vivier wrote:
>> Hi Jon,
>>
>> please cc: qemu-devel and MAINTAINERS when you send a patch.
>>
>> You can have the list of maintainers using a script in qemu directory:
>>
>>     ./scripts/get_maintainer.pl XXXX.patch
>>
>> Thanks,
>> Laurent
> 
> Hrm.  Like the other patch, I didn't seem to receive this - I checked
> back through my archives.  I think something must be not working with
> email from Jon to me, although I can't quite imagine what.
> 
>>
>> On 03/01/2019 20:58, Jon Diekema wrote:
>>> From: Jon Diekema <jon.diekema@gmail.com>
>>> Date: Tue, 25 Dec 2018 04:03:04 -0500
>>> Subject: Whitespace cleanup: target/ppc/translate_init.inc.c
>>>
>>> Signed-off-by: Jon Diekema <jon.diekema@gmail.com>
>>> ---
>>>   target/ppc/translate_init.inc.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.inc.c
>>> index c971a5faf7..b5f4c9bd55 100644
>>> --- a/target/ppc/translate_init.inc.c
>>> +++ b/target/ppc/translate_init.inc.c
>>> @@ -5237,7 +5237,7 @@ static void init_proc_601(CPUPPCState *env)
>>>                    0x00000000);
>>>       /* Memory management */
>>>       init_excp_601(env);
>>> -    /* XXX: beware that dcache line size is 64
>>> +    /* XXX: beware that dcache line size is 64
>>>        *      but dcbz uses 32 bytes "sectors"
>>>        * XXX: this breaks clcs instruction !
>>>        */
>>> @@ -10485,7 +10485,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
>>>       cc->tcg_initialize = ppc_translate_init;
>>>   #endif
>>>       cc->disas_set_info = ppc_disas_set_info;
>>> -
>>> +
>>>       dc->fw_name = "PowerPC,UNKNOWN";
>>>   }
>>>   
>>>
>>
> 

Likewise. Only sent to qemu-trivial ML.

Thanks,
Laurent

