Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grOPP-0007X2-5w
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2019 09:42:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grOPM-0007WU-Vd
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 09:42:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grOPI-00073I-26
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 09:42:32 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:44267)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1grOPH-00072t-HU
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 09:42:31 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MNKqC-1gSZ3e34ME-00OpG6; Wed, 06 Feb 2019 15:42:28 +0100
To: Kamil Rytarowski <n54@gmx.com>, qemu-trivial@nongnu.org
Cc: alexandro@phi.nz
References: <20190128210108.21318-1-n54@gmx.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <46891498-8f6d-a5d9-cd87-ee04862e88de@vivier.eu>
Date: Wed, 6 Feb 2019 15:42:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190128210108.21318-1-n54@gmx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:tQs0Jn17TxznVHF/0LX68aJ3PERR8Kse9IWZZEFkibe9neqJHNz
	cff1obVBbFzLEMWiNbBJL6wrKcZ602vkH4n1DHge9u5ERaYB+qhngo7IJw/RBsgqbd9QC4f
	T9/PJamcahuZ1QIbMJsCXFPZZ1IjoPQ8HnTnhi3UHKACykrrUfTGtFB0pnSJW6RowmrhwB0
	PcUl2xgisy1Z7beQDmzWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TxKl8Jy7kEs=:Ep2qKSb+R5v096zViY5/2d
	F0Q57J73MldSUhZpJPjm7Qyewld352hWCe20jD22m4cthbsbEuRt4WUwoE/gI9k/7IvoKRojO
	F9sTeu1aZy7K0uv3LGIJ6emaXLcl7DEr1+2t85VukdW4t3cWYV1dEmEh798yVkgC30cylRuVo
	xWaenA6IuD4V2RWYlnw5mlTCiI+U04F0I7ClGITvSdw8DNvtOI3gChH8y2qQTq2JB8LD7CDGn
	jErfjROQQ2AMJHIrV9EXkZcAmOy3zB1TqsiSfAcCSaqag5N9pqfTRSOLr65g+jF7JDkzzMzri
	tDXLtxJlr0xn8NtFdhMbIgXkxVtxMNwe17yMInPwzMFekSR5K1RKXW0J7W602xes5YZFOfzPB
	w9vC2fFJDzb/h79k2Ru1cG+MJdn0/8CfndT5za/oM92LVL3HMkQ+Xf6kkjP3668xPQFWwdwx6
	9yooXiqKScvEfgrs917sNWYxSa+G+JGII9A2opiyvXi+GZ+FoZCjTVv9tROIH2jvMcFI/968/
	EfMW5tUYgqgFiEwXqLGLSuLpxXjsXSc7VtXhtVXgIiWBgWTPo/q4o32PGHeHl59xW/uvhVHkI
	eyPE/O2wclcOTmU71a+pGfiNQM8ITl8n2F/ZWupAsA02KulI4GTTd07UHNb8WL2IWRBfJcLdK
	3oIPY64yWwmdyi52qt5jGBOOjrSkcsb+42cp4gLcCIK4i8qA3R1it0OO72plPl/Ea/LJr1gYQ
	w+4O3t5jIaZNjAG5AZ16F99MlvDFb6WinGd5J78hHrJ0UM8PYGwAHf5Glzk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-trivial] [PATCH] configure: Add HAX support in NetBSD
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
X-List-Received-Date: Wed, 06 Feb 2019 14:42:37 -0000

On 28/01/2019 22:01, Kamil Rytarowski wrote:
> The NetBSD support in Intel HAXM has beem merged upstream and is functional.
> 
> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
> ---
>  configure | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configure b/configure
> index b18281c61f..89b889072d 100755
> --- a/configure
> +++ b/configure
> @@ -819,6 +819,7 @@ DragonFly)
>  ;;
>  NetBSD)
>    bsd="yes"
> +  hax="yes"
>    make="${MAKE-gmake}"
>    audio_drv_list="oss try-sdl"
>    audio_possible_drivers="oss sdl"
> 

Please re-send you patch cc'ing qemu-devel@nongnu.org

Thanks,
Laurent

