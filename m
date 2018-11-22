Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPnu9-0000uL-Gt
	for mharc-qemu-trivial@gnu.org; Thu, 22 Nov 2018 07:16:21 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gPntw-0000XO-DD
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 07:16:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gPnmo-0008HE-Up
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 07:08:47 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:55367)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gPnmk-0007o9-JF; Thu, 22 Nov 2018 07:08:42 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1Mna0x-1fgsEq2Oov-00jaSy; Thu, 22 Nov 2018 13:08:21 +0100
To: Paolo Bonzini <pbonzini@redhat.com>, Li Qiang <liq3ea@gmail.com>,
	rth@twiddle.net, ehabkost@redhat.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <1542261954-4060-1-git-send-email-liq3ea@gmail.com>
	<da889f34-09b3-6c01-050a-778b86a731fa@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <815170fb-b014-23cd-f1ad-03969a7964e7@vivier.eu>
Date: Thu, 22 Nov 2018 13:08:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <da889f34-09b3-6c01-050a-778b86a731fa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:OdnEK9IbMg7T6kPIObximVUpiP83QehwAEabLobXpzUeCV1gyG+
	lLMrl4/6FuC91Lq3svwV1MCPxjMxtf+RkgkEYlbPJY38fe665ideQwd7tsist/O95h8eSD2
	FCpgQ3dUo8AIkU6LzYY9jTgVWap3c74nu0h0mPs3J9Fr/63EBNFW7Kw5RzqVGR5PHPREIm2
	vOQTV3I4vYueNEeWyNrVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+M8yNOmkhR0=:Jlr+10WVYDoJnV6KgSz+5y
	E9Y6Jq7pVNhMEnYJ+e6yu0ESMB9iLPTJxOEviNxoz3kLqaXtXT/Huo8YG9JA0w6Bzta+5vbsN
	uW/n5U7J6Yk2Cz0GJ2ru1XZWTB8fW72I9abt+VqRCMFsO35Oi2cvBHY++4SbY7ZzSLSNXSLAO
	rSfEN8UpbQgO1AZdEU5neKcUtu/4/5uRNQojmeRxxnigK+Uh6O0zviHLywd8VjK6CKEir2gS5
	uwLAnB/qehA6DyDoSQ/PSBaLKCxg2aAIS6XflZE0auXv0c4boxbyS9Jnene5rP+EWKaoMmH60
	ER83Qq+LVpa6fq1vAJ02YZI13fGPJDHC9d/zk8Wyx/k1uR03ua7QevxpD1rqQ8CjHdSgo/pQp
	HNXvUWVGfVZ8Mm1UKKRHWKlrmc1Dsjuomn0dt3I0RSY2uxdGZ2RTl86iawwDjF/klgqiVA3Mu
	FsRF2EJtS1ri4Bwj2WL8Ludqmx+JgoAGz79oXbeaXg4gE/MzZ60Y5f/Gmd44TP+vXPLqYGULN
	NcKvowCBLvOcQYNc2bKyBr6anaHdukbM0VbtIXBs6l6qDjeJaVt0k6vIMZoUHNeUm/mK4samk
	m7mmoCoYj6fafsJzJmH9AY5zIY4XDNbwiNkgLZmsHfNVKF9eTerFZq4SptcCR2dW+U3SksezU
	JtbvdICwK7jGLN6zus0qVajKL75TJ6Q+2kTjqtsvDqZFGdi7o02i37cDmbiXOcCCHjYekWp1L
	fcw0UpeDRl29WmulTNJWbzEetVgcHW9WrQO/eT064v4oef+NwZykL/Hmn4YszZQ6HrXAS5X1w
	kS0E1IxvCHJyu9y19j5gyY+U+faCw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: Re: [Qemu-trivial] [PATCH] target: hax: replace g_malloc with
 g_malloc0
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
X-List-Received-Date: Thu, 22 Nov 2018 12:16:13 -0000

On 21/11/2018 18:55, Paolo Bonzini wrote:
> On 15/11/18 07:05, Li Qiang wrote:
>> And also the g_malloc doesn't need check return value,
>> remove it.
>>
>> Cc: qemu-trivial@nongnu.org
>>
>> Signed-off-by: Li Qiang <liq3ea@gmail.com>
>> ---
>>  target/i386/hax-all.c | 15 +++------------
>>  1 file changed, 3 insertions(+), 12 deletions(-)
>>
>> diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
>> index d2e512856b..a460c605af 100644
>> --- a/target/i386/hax-all.c
>> +++ b/target/i386/hax-all.c
>> @@ -154,13 +154,7 @@ int hax_vcpu_create(int id)
>>          return 0;
>>      }
>>  
>> -    vcpu = g_malloc(sizeof(struct hax_vcpu_state));
>> -    if (!vcpu) {
>> -        fprintf(stderr, "Failed to alloc vcpu state\n");
>> -        return -ENOMEM;
>> -    }
>> -
>> -    memset(vcpu, 0, sizeof(struct hax_vcpu_state));
>> +    vcpu = g_malloc0(sizeof(struct hax_vcpu_state));
>>  
>>      ret = hax_host_create_vcpu(hax_global.vm->fd, id);
>>      if (ret) {
>> @@ -250,11 +244,8 @@ struct hax_vm *hax_vm_create(struct hax_state *hax)
>>          return hax->vm;
>>      }
>>  
>> -    vm = g_malloc(sizeof(struct hax_vm));
>> -    if (!vm) {
>> -        return NULL;
>> -    }
>> -    memset(vm, 0, sizeof(struct hax_vm));
>> +    vm = g_malloc0(sizeof(struct hax_vm));
>> +
>>      ret = hax_host_create_vm(hax, &vm_id);
>>      if (ret) {
>>          fprintf(stderr, "Failed to create vm %x\n", ret);
>>
> 
> Queued, thanks.

Markus and Philippe have asked to use g_new0() rather than g_malloc0().

Thanks,
Laurent


