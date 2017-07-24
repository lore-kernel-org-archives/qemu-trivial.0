Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZiZx-0001QC-LR
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:59:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56164)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZiZv-0001NV-Dh
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:59:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZiZu-0005hD-PF
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:59:39 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:61565)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1dZiZp-0005cK-Db; Mon, 24 Jul 2017 14:59:33 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue102 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0M250t-1dtJce0kw7-00txvD; Mon, 24 Jul 2017 20:59:23 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-25-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c11e0987-f4e7-51f4-40a2-5784091854ee@vivier.eu>
Date: Mon, 24 Jul 2017 20:59:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724182751.18261-25-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:p35jWWjeQGa1cLQZYItNxA2S7OpH1JD0UTmvMCiWgkeec9CKm9H
	KaiA+TE/KTIbGtn6t9UaX5sF2Qga3dM8uQpiwo/oNbrk83CbgHm5cK8X3a0DE1sog8JC86p
	zqwgzsH+xJ94InrGjaDVwvZafumavlyXYrICRX/J7OT0+rYR98H/YEm49vxuqbNuiSXbNvm
	ZSCvTcHC0N9JWFPIBMqOg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:/vPnR3+rcU0=:1tGRsU0cTc98ASpClLdwEf
	ZApr4MHgoMrxij+od32Ss4U9EgYtCU+EdwYy88o4C7K8n+O9sH7wMNth7a6CZJKcku8vqMBiM
	MylisyHtWYkJU2xPdLJ/0zpmfB+FSLy+34Citw6NXV8Bq8MxuSB2/N4cUdEfxEVeNYPC/uEdN
	NLbF6lTy6479fgyS3u3WllBLgHIolPaCuHp4mp5z0M5szu7XNci9jeS+lVvATALmSXb1tpzr+
	2wSBV5cQxTTFT9IZrGaRHp+zvbDh8gTrx7o21lLpgpj6BVH7xg5VNKKwpwEGPfMXzt95ISwUI
	5aBwpp7FoSxpC2LYbP5bVs0z3hvO9VMLv111vhQub9wIqPlfJhIoaY0SIYB26DlxsZ/p6wOTn
	dlje7UtKLXIUFlqgE33/TmizsSLJs0xXLFix+K86et/ATL+YMpMvGj0M3DBi8DSgetGCB5RLt
	i3eKV4VO9WgM1005QfnbHQab/rMkgZ7NgcryHWHYed1WcO3Veh9E1Mu054LIz3bI0ekelNQmD
	GONpnw2ibUDd4g+aoYX4FdjhhejH9xTvqOFM/J4XAPdcdQmZ3p+Df2pFT6wTH89rt8fxylXM1
	J+qEkYUTEORVGN1fqr/StJovbbkhWbmJ8Jo+46A8xd3me8SSPsHQgUuk+dnAZw03Sg5QczKbg
	Tnfl2td75ZE5a+LU4XJZX4LB/gvT6MIAqpoI3P2ojE4Nbg7IKPAus4wR8tiBsXDdkx9jYYU2j
	dXGQKWpbU+qEiS4JTRGhwdv9Bd/DNU38myVWtfhty92XZWJHFc5xawuF708=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.73
Subject: Re: [Qemu-trivial] [PATCH for 2.10 24/35] linux-user/sh4: fix
 incorrect memory write
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
X-List-Received-Date: Mon, 24 Jul 2017 18:59:40 -0000

Le 24/07/2017 à 20:27, Philippe Mathieu-Daudé a écrit :
> not hit since 2009! :)
> 
> linux-user/elfload.c:1102:20: warning: Out of bound memory access (access exceeds upper limit of memory block)
>         (*regs[i]) = tswap32(env->gregs[i]);
>         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/elfload.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 2a902f7806..79062882ba 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1099,7 +1099,7 @@ static inline void elf_core_copy_regs(target_elf_gregset_t *regs,
>      int i;
>  
>      for (i = 0; i < 16; i++) {
> -        (*regs[i]) = tswapreg(env->gregs[i]);
> +        (*regs)[i] = tswapreg(env->gregs[i]);
>      }
>  
>      (*regs)[TARGET_REG_PC] = tswapreg(env->pc);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


