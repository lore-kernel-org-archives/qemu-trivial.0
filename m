Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1rGv-0007BV-HG
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 04:51:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1c1rGs-0007A6-7S
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 04:51:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1c1rGo-0000gY-Bv
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 04:51:46 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:52938)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1c1rGo-0000g9-2I; Wed, 02 Nov 2016 04:51:42 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue101) with ESMTPSA (Nemesis) id 0MDxdP-1c5Pdu1nAN-00HRgs;
	Wed, 02 Nov 2016 09:51:37 +0100
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1478076128-11661-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <55723a41-3829-f461-7915-951b96ebaa1c@vivier.eu>
Date: Wed, 2 Nov 2016 09:51:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478076128-11661-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:IpxpsRs2XzxCGApyH++fHqknbsKvFnD99Ta8FAHpVdnqIM9R8In
	jcozv/8YSwRChK/P1k4+39SbT4W33KHLF5KnHAF6yi9VzmsYL1OkrtFYNE4wXyTElrfjp7o
	38j/RlP4k+TDT+H7HZ83Vdnj7Dp3vhrtMeN9zJwnk1BuwZlofGeT/aooTdlz7qafxZSKOWb
	Zsg6lExITJPviMDmn6Eng==
X-UI-Out-Filterresults: notjunk:1;V01:K0:cY4MNyUUTtk=:v7uYSWLrxREEishDxISmg7
	v7PaIQWIky84Lr/hBwwIc+j3da/oafKCUfneFB9HLHF3CLhCObb6R2+9F5D+y99LiRYc10uXL
	I52s2V3HMU8xA+UBxbRTQICs3Nd1mr1nxRbsA5L9Lx1LRzH4cLj04rGlENiCNrLWuUmMKlxZK
	36bM3PjTGJtGU6HQMZcX7XdE5mJkyez1PFRmhWmkxRoPbSyIvAfgOSg+Z5HGmXsEO34XsW1tz
	TvAtvnme8z7fG0GFkExcpycNXQO/a8qIxokXpyiCympEFjbIzM5DpuUxjXind0NYJz6ETNWop
	RI0512f6ZPI7/TlgNjS/5cUPb1E+28GijQpMoXxATMjDYxkcrJvi7hUJWUtpCcJzrnOeVmEj/
	HW2Yoy2WQ1gsiWXcUSiWEABdll5QlYm+dK+i+iSzfoMWj91s0u7LIDboaZvU/RVR/q/fi2OqM
	wKw7GT3G+6ZmdMpSoL8/dPuY7Io/oV5l/Bhjt61FRr+BsoRios6ErAeNtOE6exIFC689vARZw
	ERYo8S4WRuvhZTURDJhMMeG777Ded3Lq92tvK1rhTVA2T211hkA7WpXjtJQY6Z0lDRddJGoVp
	WHzD+yAMM9/35662Oo4SFmJExhdA6yyA7i+OeDo7r0PeOdD6ZBT21UAySNhOhX94ph+Dds71q
	EniAd8ptH96Q+S1e2RoSmg4tKGf8G/JBZeJhBAy1+H1wEXJAlVokLHMfBlWgmmwRMoHQ83tvZ
	6P0IkHaCzwvFzscc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-trivial] [PATCH] m68k: Add include/hw/m68k/ and
 disas/m68k.c to the MAINTAINERS file
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
X-List-Received-Date: Wed, 02 Nov 2016 08:51:47 -0000



Le 02/11/2016 à 09:42, Thomas Huth a écrit :
> The include/hw/m68k/ folder and disas/m68k.c obviously belong to
> the m68k section in the MAINTAINERS file.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 79484ed..5d45160 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -149,6 +149,8 @@ M: Laurent Vivier <laurent@vivier.eu>
>  S: Maintained
>  F: target-m68k/
>  F: hw/m68k/
> +F: include/hw/m68k/

Under this directory, we have only mcf.h, which is used by M68K
machines, not by TCG, so I think this include should be added to the
"M68K Machines" section. "hw/m68k" should also be moved to the machines
section too (hw/m68K/*.c in the machines section are overridden by this
entry).

> +F: disas/m68k.c
>  
>  MicroBlaze
>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> 

Thanks,
Laurent

