Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRzGH-0005bV-AG
	for mharc-qemu-trivial@gnu.org; Wed, 28 Nov 2018 07:48:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRzGE-0005aF-Sw
	for qemu-trivial@nongnu.org; Wed, 28 Nov 2018 07:48:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRzGE-0005Wi-6O
	for qemu-trivial@nongnu.org; Wed, 28 Nov 2018 07:48:10 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:45853)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gRzG8-0005UW-26; Wed, 28 Nov 2018 07:48:04 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MybCV-1fThcz3rwL-00yz8O; Wed, 28 Nov 2018 13:47:53 +0100
To: Paolo Bonzini <pbonzini@redhat.com>, Li Qiang <liq3ea@gmail.com>,
	rth@twiddle.net, ehabkost@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <1543226303-5260-1-git-send-email-liq3ea@gmail.com>
	<74a43b98-de88-6130-4e2f-30f0884cb56c@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <14459b81-9c92-5543-8333-171d984486bb@vivier.eu>
Date: Wed, 28 Nov 2018 13:47:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <74a43b98-de88-6130-4e2f-30f0884cb56c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xjIQmjImDKaJlKUkLDogvjwCj5XOjy8hWgyhEH5STfa+oqEKLu9
	mMPc0ne8p8kKMxSZNaFS9xreuJlFEHS8okGpRfsQjopYd7DgsNnLdfkK0EDGUh72CrCcbxp
	JxiE6BPQfsGt5DmzqDxs76g0Bzqtbk68LQ/5ahxiLigaHFQj9GFeTwLhvyqPO7dwycyL3/e
	RglsvjjjkfLkEbPnwFy6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6Nu9NbUwQ0U=:GezRZ2kpd1IHnvM6NOTd9p
	8B6XGwUE3AP/l14esvJWllCfL2mJMK8P5HN+ObRNuaHyY2PaVmqbj0E56vkdQpXYMcXFO8WlV
	1nXWN68t7nXPzqkfxu6ZGrs6IfFlKc67/jN3+sbQyBg95JkumoZ+8NV0BHxp5ahBa7A6xVuX1
	u9xc+nWAKiJ6pu/ofDPMiq2wroory1MT8gWSFJz21uWWMA2OoINAmMWSTtszARhMWqkc5CMzX
	f+Dh0R6n7LHOl+hLAhoENqlS6067EGBGO4ngjgoxJvX7gerOuF+4h0LwCKWPln9mIH+uwjOzf
	BlXZB8HMv9t+bgIH8+4FEYsw7tkMV8/9Z4dsdqMjCygresRcYMoTRRw6Ctsz8ucmmVSaY3+aD
	5eGtM7ClJxMGTJwg6mSASCYHv7gVIlou52UokrO12Ov01qsgjG3QEaAf51e0xGwBi4GS24Gcg
	BgPFurv2riSt4k75uUtP5M7qpwFEzPGctTMUrgFAybPnRqKbiY4hH/4PjFTUkosBRI0y/nDxu
	BHPg6084FhDRavrC2EcuGdI1WVKMJQ3CfdzKLacR7QZLn/SYjR/rGC4AVY84WoMv/OHyly5cT
	jP+70x45lA2a5o+pm6bnYG8t+s39mSPihIkyjyhcfyQV5snLXuJMV8B9FNVvIEuoKF5YwxkEu
	9jzztqT3qhSrzQvxkCt19BUmKGfRF0bVPu2r25Te8jvWYLJlGFgqzEHmHPHeqMmQz43zw9S1e
	c9wj2L2dU4VWE/hzk3sHomD/HywZubWGFqOEABX74gzqWMIo2LOhap3XBqvgDUAiatkVwrzAo
	VWIAiH3DjeXPYA9fsnwYGNg39+36w==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-trivial] [PATCH] target: hax: fix a typo
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
X-List-Received-Date: Wed, 28 Nov 2018 12:48:11 -0000

Le 28/11/2018 à 13:43, Paolo Bonzini a écrit :
> On 26/11/18 10:58, Li Qiang wrote:
>> Cc: qemu-trivial@nongnu.org
>>
>> Signed-off-by: Li Qiang <liq3ea@gmail.com>
>> ---
>>  target/i386/hax-all.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
>> index 502ce6f0af..464744a406 100644
>> --- a/target/i386/hax-all.c
>> +++ b/target/i386/hax-all.c
>> @@ -205,7 +205,7 @@ int hax_vcpu_destroy(CPUState *cpu)
>>      }
>>  
>>      /*
>> -     * 1. The hax_tunnel is also destroied when vcpu destroy
>> +     * 1. The hax_tunnel is also destroyed when vcpu destroy
>>       * 2. close fd will cause hax module vcpu be cleaned
>>       */
>>      hax_close_fd(vcpu->fd);
>>
> 
> Queued, thanks.
> 

There is a v2: "target: hax: fix errors in comment" with "vcpu is
destroyed" rather than "vcpu destroy".

Thanks,
Laurent

