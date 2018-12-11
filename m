Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWp2E-0003sl-1D
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 15:53:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWp2C-0003ro-2Y
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 15:53:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWp28-0001YB-Pv
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 15:53:40 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:34581)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWp28-0001XM-FY; Tue, 11 Dec 2018 15:53:36 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1Mf3yk-1h4WxP2Wfy-00gbr5; Tue, 11 Dec 2018 21:53:29 +0100
To: "Emilio G. Cota" <cota@braap.org>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20181128153423.11916-1-cota@braap.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <83d57b16-336c-5dc3-1d2a-946d1ba34c0a@vivier.eu>
Date: Tue, 11 Dec 2018 21:53:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181128153423.11916-1-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:/AEN83gf7JSYwMiYpJaaOCAd7kpe2Bwt2pjGuKA9dhh/OMsw4Gh
	x/HK34evZDGcZ6tpda3Iuy587voWOfYdCexPMgABq26DOfIbT+BE6SGPnfAntdrwLO+pHXs
	qCFXjSVBs2EqTXgtbWgpwXkqNrXQOJbJ6OiFNk10mVSgu/WFGGRm2FT4znHngfl6bYCbCDc
	2MPFyguR2NsABHCE10zkg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6RTGEstx5Ao=:8zRbrgHmvKx3FZ3xaaDcUS
	DoUw+Vp00TFU9zJtT5e7LTz0/3/yiZqfIB8EIrTe1VbnZ3ZJ8yJyeKafOdI7ohCUKFKh//nWt
	LSMtj2VlJ/bocPfAWsejPLRuTyJ1s6/Up9zGlv4+Nk7AgK/GBZiwbTrn2jw98sVooifNY74Oq
	1qAySxkby01jl7eOeUhBcP/Ba8T+cUqLMeSsXsJVaADjlJCDyN9KzIgIVMB3Z5OhRAia6Si1E
	Cm7CJYoUOuavj4OmTtnezyhD1As/hKunQC3EJtitz08Xk6+3LxErS3Ke/aCQwvcjjLl46wCLG
	mLe3oYbrf3vGmlRqPK+HUxTJ8FnF+NVM0FRL+MwHPtQIZpYgyvDJDsLb/iD1c4unMXGLsVqMU
	7F2a3gLhZKSLJLs5WL1glGQ7nDlTu24bdF8jEd60tL2z2cQ5GlzOs/W5RZdDw6N7jHepb3Zkk
	0m9BhLskzvJCEe/GoW6Js+atr6OfIw8orcAn+Dmmsv7164qP68Ip7mapL2+g1yxop2LOBMSGp
	UEw2TEEzc6AIIXdiO0RUvxbBaDaBr73cZlTwYFxMEUsegTRsQJFEM3Zolk3PefQilg1BLmZUv
	Ijg6L3emdxj/RLubHy53n5FKnJG5VIBi/ue/cW5Mwffu0wRWA631o3f2V0ghOHNmK6hCxC701
	3tH2QE2kqGj6C+zK7vqWfXTW4DPu2hra4zgT7XicuiQM8ud4s/NEr3bt6/55KyT2vM6CssjZr
	yddIJwYj87XC2fXzWY6hSaoOUs/Mz+OYR6GX+RbnPUP0r9c28Hu1KUZGMlo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [PATCH trivial] docs/devel/build-system: fix
 'softmu' typo
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
X-List-Received-Date: Tue, 11 Dec 2018 20:53:40 -0000

On 28/11/2018 16:34, Emilio G. Cota wrote:
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  docs/devel/build-system.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/devel/build-system.txt b/docs/devel/build-system.txt
> index 52501f2ad9..f9fd27fab0 100644
> --- a/docs/devel/build-system.txt
> +++ b/docs/devel/build-system.txt
> @@ -393,7 +393,7 @@ all use $(obj) as a prefix to the target, e.g.
>  This file provides the entry point used to build each individual system
>  or userspace emulator target. Each enabled target has its own
>  subdirectory. For example if configure is run with the argument
> -'--target-list=x86_64-softmmu', then a sub-directory 'x86_64-softmu'
> +'--target-list=x86_64-softmmu', then a sub-directory 'x86_64-softmmu'
>  will be created, containing a 'Makefile' which symlinks back to
>  Makefile.target
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

