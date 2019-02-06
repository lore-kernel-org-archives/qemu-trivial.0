Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grOcf-0005q6-7s
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2019 09:56:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grOcc-0005oP-AH
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 09:56:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grOcb-00079l-JT
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 09:56:18 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:41237)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grOcb-00079S-AC; Wed, 06 Feb 2019 09:56:17 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1M2fM1-1gq1hy2uLf-0049ST; Wed, 06 Feb 2019 15:56:05 +0100
To: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
	Luc Michel <luc.michel@greensocs.com>
References: <1549371525-29899-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <36af6cca-59aa-3c6d-3be9-71c2e26a2135@vivier.eu>
Date: Wed, 6 Feb 2019 15:56:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1549371525-29899-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Ub6EC2I0ilIyqAn0RUrNgpTb1z33ozW7IOIYALXEm0ZJThraLq/
	NRtd7oOATcJQ/iBcbQpIiE+MAJTChUWUEFZJ+7XU5QcjUGT6VFwZBvTxWhrbtSsYL/uI6Hg
	pw79LfQgKW+Icc/meV6BhFpSOPDQI9dbSZQ/v0tmW06PCVr8jTnqNPZ/KF1X5jrZojxbNuD
	h/XqLco+FGE5m5ZWth2Mg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mafpiJHBWSM=:L8YGbHs3e6GNVGM1SQG1Uw
	hRu05vBEi5fR2+aYMyWldY0XyUgqb+WYCHZE3RHPAVleDC4zdMinWNPVJ/oKaENR/s+qsnEyt
	c44YsXtgQl32FVjxYS5lNooIJ23E5fFLFwKrUWl4vhEn2iTlfVFrrX3UmuhmuaKYnJFzITIbp
	vTqFJ9xvZP5JYnou0276cRcgCDSn9tyRVWJkGPnRKRGM1LgOeAsd/eIAUScnpwplpmUrXF3pi
	KAOEZdZ2loNFNXeG3u5OGknnUN1LCYFxSLP0M/NPsuNSmbSQ5smrXhrfvb2H3Z1T8BlTOdUvg
	3o1N7fHeV93IcB4KTckm7oQ88AQG8ZCI42OZ9/GXe0e2yxxrt+g4//XdGTZemAUJeG/YYCxRZ
	RrtCWE+GfhvBR6sxMSRzNZpYfwrt34MxViCgA0E04aFa+VcsTbjh56Sl0GMujP0J4YekZxHrj
	lT2oOpYIDzPnOSJDTQNBVrQjBaM3SJ2t72R99t1V+K0aAMh3+englxcqBPABIEvCZdnxKobUe
	e4rAYsW3qV9mpIQ4cIT1Lf/9X54zgOEB4960RlM2Nug3DhGZosU3IhiKOpwvNiqF/gSCeL+1O
	MRpKflZIL1Jbki5/YVyzXqqAJD25Va8zkfL9uraDsxeBs+XrKWOQlvUpWXOPJwe62JLnu7gwy
	5V3Na9oM1oDI74gM2U/t5yu7p6T2yvTm1maqOSTTbB+L5i7JvURL/kpG6b3rAKwt0l+seIuzB
	lDhNHfQkKPe1tFHECkQJ52p6GMTJ0ETMT+GjQR4eYqdcYmdLE3cEbnJFKlY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-trivial] [PATCH] hw/cpu/cluster: Mark the cpu-cluster
 device with user_creatable = false
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
X-List-Received-Date: Wed, 06 Feb 2019 14:56:19 -0000

On 05/02/2019 13:58, Thomas Huth wrote:
> The device can not be instantiated by the user and QEMU currently
> aborts when you try to use it:
> 
> $ x86_64-softmmu/qemu-system-x86_64 -device cpu-cluster
> qemu-system-x86_64: hw/cpu/cluster.c:73: cpu_cluster_realize:
>  Assertion `cbdata.cpu_count > 0' failed.
> Aborted (core dumped)
> 
> Since this is an internal device only, mark it with user_creatable = false.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/cpu/cluster.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
> index 25f9070..6f5f037 100644
> --- a/hw/cpu/cluster.c
> +++ b/hw/cpu/cluster.c
> @@ -79,6 +79,9 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
>  
>      dc->props = cpu_cluster_properties;
>      dc->realize = cpu_cluster_realize;
> +
> +    /* This is not directly for users, CPU children must be attached by code */
> +    dc->user_creatable = false;
>  }
>  
>  static const TypeInfo cpu_cluster_type_info = {
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

