Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eZig7-0000ux-1l
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jan 2018 14:38:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eZig4-0000sh-GM
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 14:38:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eZifz-0003HP-Jm
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 14:38:16 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:58787)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eZifz-0003Gc-9y; Thu, 11 Jan 2018 14:38:11 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue006 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0LjPoq-1fAyIy1nJo-00beIc; Thu, 11 Jan 2018 20:38:08 +0100
To: Marco A L Barbosa <malbarbo@gmail.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <20180111183714.22834-2-malbarbo@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <70d15c39-d087-0617-9eb2-1e021e3f7afc@vivier.eu>
Date: Thu, 11 Jan 2018 20:38:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180111183714.22834-2-malbarbo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:NhhSwHAFj5bk7L7yuEwwaTCTbLB2CVEDJMmSbn2ZQs7lkhuec5R
	+ymghrOH6KZy0GyEoB98Zg7HYOZT7a7+HdMGJ1pduoj3x81ZBDcbky6dAizDajSHLBA3IUs
	bRPEwW8ydUgJd+0Nvoi9e3kL+B/vpzEHY2OoDw433qzK4MQc4sXOPrNswK7XVcZFjMEZSjk
	7u69E4/zOnC/pZH9ObBmQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:v+XfMWzR/3E=:dy+N/sVwHGlemsNzVWCjoh
	kTorFAgkuS6fBc95BUco42ZytyemQt5JIVs5M98o1UoGNXcwIaoarPkgXdZdnU69uhLHsg2rW
	J657SyUot8LRZ1/By7tcEFlYrl/6VyRsq8xxYLrNqo5YLgABJfTOhxsl9DDicHuLsIZ90sZWf
	g08wKmFZbI9WB7wSX39Td/W18PdQ429mPObetG6kZOftlfRM09pSuSjAgX3/u+bgDNGvFwSTF
	TeBcNS/hfmfBsQbdztcYw9FrrhvKIqkvU0B12ifx7ngHXwS1lL8FLJC/GIMkLNQCF2QDy6d5n
	y9fPKXd6DQBXoyp6gt3jhViH2iiN81YMkWzAAc8tdR43HQ5Oide1ew3PiDcxtU1AvB653G9QE
	TUcTPbLHYmU8bjLu7hVoOPLrMVqXVbbxTy79LdP/ukXOmuzFROY/INL3dcpsBtNezmhKy4fZN
	xKqHjIxZZW6XC5wCqXAh1tHu2SGMDxsSLzA18uUn4vARs6cToxsNA6aRP2XzB2ooHto9ZVuXx
	d6EgD0CkXkto3oXkbiQm/Id6Pzrs2bcRSEiDFq6XKZQPAFCX4v0l9eX+yz4JqIg8E+pxuRq6a
	YPPdkCpGcCyWOlxsO+g+hHUHKg7eKXjZGZfLAWXxiwxwYmAyFQObiFm9IOPix/vR1GVO18pXO
	bFYpKGMPS8e1tgXDmIse9D/22ATp7DNKJNj3fuFVQw5nHWEA6wKaFgQgQW/LUf25BvMcdxxbv
	bQot9CkvhThO6qhZ4uFKt5riYCwJqYtBg0htvfVkfDQxmffsU0Vixq7SovhwsDExtxGKgFhli
	hSP9LOOkL2PMGPzNqIiIVyOTFPO4WF1lQfvBHKJ3YNQfLojfZVJ1Ti9YMLjJnzQ6jHTL69a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] linux-user: Add
 AT_SECURE auxval
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
X-List-Received-Date: Thu, 11 Jan 2018 19:38:17 -0000

Le 11/01/2018 à 19:37, Marco A L Barbosa a écrit :
> ---
>  linux-user/elfload.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 20f3d8c2c3..32a47674e6 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1354,7 +1354,7 @@ struct exec
>                                   ~(abi_ulong)(TARGET_ELF_EXEC_PAGESIZE-1))
>  #define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE-1))
>  
> -#define DLINFO_ITEMS 14
> +#define DLINFO_ITEMS 15
>  
>  static inline void memcpy_fromfs(void * to, const void * from, unsigned long n)
>  {
> @@ -1786,6 +1786,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
>      NEW_AUX_ENT(AT_HWCAP, (abi_ulong) ELF_HWCAP);
>      NEW_AUX_ENT(AT_CLKTCK, (abi_ulong) sysconf(_SC_CLK_TCK));
>      NEW_AUX_ENT(AT_RANDOM, (abi_ulong) u_rand_bytes);
> +    NEW_AUX_ENT(AT_SECURE, (abi_ulong) qemu_getauxval(AT_SECURE));
>  
>  #ifdef ELF_HWCAP2
>      NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);
> 

after adding the comment and the S-o-b of v1:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

