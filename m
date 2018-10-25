Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFg1H-00006e-Ir
	for mharc-qemu-trivial@gnu.org; Thu, 25 Oct 2018 09:49:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFg1G-00004t-0U
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 09:49:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFg1F-00022r-8E
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 09:49:49 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:40587)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gFg18-0001t3-Ra; Thu, 25 Oct 2018 09:49:43 -0400
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1Mv3M8-1fOfmv0Rou-00r0a9; Thu, 25 Oct 2018 15:49:33 +0200
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1Mv3M8-1fOfmv0Rou-00r0a9; Thu, 25 Oct 2018 15:49:33 +0200
To: Thomas Huth <thuth@redhat.com>, Richard Henderson <rth@twiddle.net>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>
References: <1540376314-5727-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9c924931-beed-3a3b-d033-87a7fa4863f1@vivier.eu>
Date: Thu, 25 Oct 2018 14:49:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1540376314-5727-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:jel2tgTNLBm+TreIXRkpc31k2KitOMADg6YOkxaLj6kE4QQlL03
	sjGvT2wL0Ky3JapSUsBKwHV+yWtDk03qYMguYd+QEyC9htCmuUgD/pqgkl36kf/FJnCPeeA
	QmFFU09/bT56ylHQilgVZ3R1n6y8VCvHOpvb0chj1FRzo1ipVIX0bGriwf5iTFl4JgvqujI
	1uV79zbZxgt9pQYkttGYw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:6NMNTjO9JXw=:Ere77acjAkq0kgIkfGD7sk
	0caqkOo4JvKWBvDqlHiHvd9OMoT+4GJwwZLyNvEb2M7Q0ICTzksgtRLlmEJDuq5AN/wAEMVpO
	ZwRqUZWGwos92jUwJI/yef5WgyQciplE120iCICM93awsECV2fJSyZzj/ZIzk4XVYofBMWXJx
	JxQL2/bMEu2fttCdB9fbflRE/w2hRkyU7w9uOHSAod14q0vu1bwYqwcHtwGCIoxAlsjNqQcjq
	Hr2G3SuJhENzxNqlR4PHMAV1r/6khI0K/Y4j8n/v92so32A7pnVNig14PUh+Cz2lxcDt2KtJw
	OZTgzRY/HGCPlWqx0o10Nc1YNTzDxoaK79tr86HwEEyZBZsLiWleNesLmh9Ao77Szxwjneord
	FhsGK6sCs8UL2pquwKXBOZab1VpZM5bc0QvgIxOxxej/hf5rqaHFM5fX1oZo6A6yn/pwOF7C9
	G+bieFVnKUKMibWZmwVT3RD/G9mXSV9jaU/5Rd6P25zgatv6T3neKcdGEhYnUwhJei83y4XJz
	TO+8jIq/vqgxYhmfFqbhB/ikF5ThrNWB0lm7w4NqYmPc1y9R34OZh9S8tBjvIgpg+JS3EGUb7
	P0PfrGLEVv3Z0DOOSaz/CJB/bWLgOhHKp0y3FuwMRNdBIbW8svFYPI4EBHfICQBVa/sk/wZBo
	eYDHzYQWQTTLHh2HUyQXF70V3aFkzIpUNeSsyRcFFOi9Bi++9W3iN52p5OcroQOJTeMi7ARa7
	hqRvWPdxMcyvcf4R
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-trivial] [PATCH] configs/alpha: Remove unused
 CONFIG_PARALLEL_ISA switch
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
X-List-Received-Date: Thu, 25 Oct 2018 13:49:50 -0000

On 24/10/2018 11:18, Thomas Huth wrote:
> We don't use CONFIG_PARALLEL_ISA in any of our Makefiles, so this
> is just a dead config option which can be removed.
> 
> Fixes: a4cb773928e047b137c6998209cf2eec857fac6b
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/alpha-softmmu.mak | 1 -
>  1 file changed, 1 deletion(-)

Applied

Thanks,
Laurent


