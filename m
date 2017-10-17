Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4TJU-00029h-Ml
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 10:57:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1e4TJS-00027G-Ix
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 10:57:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1e4TJN-0008Pf-M3
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 10:57:46 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:61098)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1e4TJN-0008Oy-DV; Tue, 17 Oct 2017 10:57:41 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue003 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0Lj7Ag-1dVxJG1Y0E-00dJw3; Tue, 17 Oct 2017 16:57:36 +0200
To: Ladi Prosek <lprosek@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: lersek@redhat.com
References: <20171017144051.8452-1-lprosek@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7ac8f033-44e2-8955-9dd7-e11595081356@vivier.eu>
Date: Tue, 17 Oct 2017 16:57:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171017144051.8452-1-lprosek@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:9nK28gILP6cuhPmfWt+c2nMmBN6ESQwOe8JjMlbWHVG6Sn2olxD
	DNHdCzt3Bt0MjPpzonOBrmvinitFprHMkkV6UuKOL9woYHSUSBFEX4augY+0sxsm5ldQtPU
	n+r1aMqNGcUxSRmLsv3HJpuFuh7bY5vB9Q/OYXoY1h0qHBYmnTRf7n+LWc9z53iEH49AXdc
	yVmhxvNi1dfoAQQVPnUMw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:HonLgY06zO8=:CI2zi3Q1ifgJWHfBEXiMvu
	pPLVKcmZTrVoPCtjASouhh1r13oecbKmB8vcMQW/rDRZDwlrnBOnSumV5HfKOQ/lKs8vRwWCN
	vXncoTxCtQVlZdiLb6fsE4hbOZ3woeNsRpazf2VxZDattk5QUmX6QipzPDNKYagUFhp1K9NdK
	nES6BaHb0LzBp9exrrCpCnjDsrLq8jN3sFD3ZvOZCC++lFnGRrShkEUmERaUVVEXuBbDb69WC
	DEA6N7n+XpjtOVKzxr16nagzepvV1oGrHkTVNgbD1l5Iv5vOSlEQsHtscNBVgBCtG3mrVDDrZ
	3SL7IMHVRW4bpu4keeVoOgESTrPrHSZFbBK12HGaUKu0wpArlGCmzCNoCUcQohLNDX90sCtBk
	tkLjzey9mQs+tr1grJxK5b26yo3XcPn8uXdUfechH/srwwPPwo/Xf5gu1oTuHc/5TlUWTbuTw
	a3Uxb1GZkP56pK2+CEhGS4jFKSzvP6xvVhgfCdNIOCFETlDfI+zUyl6MyzVHBDAXP8Dvk0azC
	ePGbZ/Sc6h/2Lpn0+SuJVNrQGufzk7aa7VpEM3KjggkDgMgXv63OBh+wESKEca7w/AX5lWbX4
	H+xcSL4ToKJSLAWp2bf9X07P2JDqUdsC+uaWU24bQIc2Q4AmprODKDFH8Qc2UxmEMpB0fTfFG
	4v7kbCaCddYJIBZhV3JrN32zSmiuT3+CnDSDVBCNhCQfHhkG2lJFbv4/FNiAGWlxPb78xaFUM
	ZyTETnImVctc8BqQIQlb7aG1bEML8fLoxqnhne8Jayu6WQIYnAWpK8s0cao=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [PATCH trivial] Remove empty statements
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
X-List-Received-Date: Tue, 17 Oct 2017 14:57:47 -0000

Le 17/10/2017 à 16:40, Ladi Prosek a écrit :
> Thanks to Laszlo Ersek for spotting the double semicolon in target/i386/kvm.c
> 
> I have trivially grepped the tree for ';;' in C files.
> 
> Suggested-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Ladi Prosek <lprosek@redhat.com>
> ---
>  hw/misc/imx6_ccm.c     | 2 +-
>  hw/s390x/virtio-ccw.c  | 2 +-
>  linux-user/signal.c    | 2 +-
>  migration/block.c      | 2 +-
>  target/i386/cpu.c      | 2 +-
>  target/i386/kvm.c      | 2 +-
>  target/sh4/translate.c | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



