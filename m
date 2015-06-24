Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7kDv-0000OW-AD
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2015 08:56:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1Z7kDt-0000O0-DS
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 08:56:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1Z7kDo-0005KU-1A
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 08:56:13 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:57085)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1Z7kDn-0005KH-O1; Wed, 24 Jun 2015 08:56:07 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue003) with ESMTPSA (Nemesis) id 0M4mmf-1YtfHo3KyT-00yzXX;
	Wed, 24 Jun 2015 14:56:01 +0200
Message-ID: <558AA8DF.4050708@vivier.eu>
Date: Wed, 24 Jun 2015 14:55:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1435146991-305-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1435146991-305-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:TkfXX2ADoCk7Tf8se3wCmLwPXZGUH+od4YE2QxRKODMZGVz+BNM
	YGT/67CJXu8zxRYmpZ0G0KTscF02FFVCxrvglzE2BFvogiJ57RK3LWZH87i3q+quOpZyj7t
	uYt/Kd2klbvkd+RSJmQCQHoGOfLGuncIrlUi1ZrlGi2Q2edQWYLSvS4M2IOBb+OyLdL0XbX
	MvNwYIjc24Hx7yhQslztQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:rygIBXT0IUI=:kVmTuC3/xOAbaYlbhw9j3w
	woG1Lca3UlT4/InzcrQpXhpG+eYrIQeEf9BEAw7amP3Rcy8t+bY8rr0ZtyHxP5BoqgKS5LQ6O
	xqcip2IWCA9jpWiE5MpvGCJBb9IrlBaavxXVC9eEyesC8h8yqtRn63gCNJ2hbHby6lpRpoBb3
	n//cPD/iYKHQll7OR9PRr/wrV68NeCP8CUunVb0mdj4eck0OcID3ZHu+WPJlIxu5TN3KrGaUK
	1iI4TysOLKWIJA9gZQ1E13nDc87xUlubPabkiCvP0qZOV42o3Z07crfdZYmKrCA/CkeD+dZVp
	Io7TF/smos1j8+R6ZMwl465ccHBqL8aTxTJkMbEjt537ZdqvOKly75J+/E3inUQuPNNewq0Yn
	rZfSDm29cgTRJVXHXpuuODnjBe72iaoDEy/pThO66tDiXunT00efF7fG9rfkz6ScjQs9c5ywt
	h3Jxgd1E2EYcHj2P+jaw0idzWrD619Qij8iGiGZdhBNI2H5s95ti6cyry9ODeLs3Oh7bllC0n
	WpDUBOOVxi1rE2dplnZLdXbmhK30tqDc7bYz+dEHs1eHUEkxpciFE0ZftvjHUgBb/tGajxFEA
	LmCRHCdZalKXQRTph9w5sRaBQHtib1XY/tbUXRVU32GIpXoLKdaO5kWj6CtKojL8SGtvzOUpt
	lOtNevSKvqD3iOG9JbGQq9BWT0MrSsDjh+kXVqsyJ+MEc7w==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 212.227.126.187
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw: fix mask for ColdFire
	UART command register
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jun 2015 12:56:14 -0000



Le 24/06/2015 13:56, Paolo Bonzini a écrit :
> The "miscellaneous commands" part of the register is 3 bits wide.
> Spotted by Coverity and confirmed in the datasheet, downloadable from
> http://cache.freescale.com/files/32bit/doc/ref_manual/MCF5307BUM.pdf
> (figure 14-6).
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

