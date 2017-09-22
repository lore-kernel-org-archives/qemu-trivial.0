Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvUH5-0003ef-5u
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 16:10:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1dvUGz-0003ZW-LC
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 16:10:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1dvUGu-0003z3-PL
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 16:10:05 -0400
Received: from iserv.reactos.org ([2a01:4f8:221:4c5::3]:47007)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hpoussin@reactos.org>)
	id 1dvUGo-0003ur-H5; Fri, 22 Sep 2017 16:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org;
	s=25047; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=AF5rK8LikEq6mPcMEVwUSCRmx2LDu828AOweqp00IYM=; 
	b=nI+HJw9qBYOPNSMSHz7X0nqDlYEqWNteKCR5U1tzJBeweG5kIj7MTXqxkaWZ7IR8eQkWBl5xmJ/sYRzLoHVYD9vtxil/ey9BIyWHMbArR5ZRG87zqYnPu7dpQfzGmtWsFZ9jVjEhX91EOaP/HFwepPrDpPfTCOlunUOBwTSsrPk=;
Received: from rob92-5-82-227-227-196.fbx.proxad.net ([82.227.227.196]
	helo=[192.168.0.35]) by iserv.reactos.org with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <hpoussin@reactos.org>)
	id 1dvUGn-0005CT-2r; Fri, 22 Sep 2017 20:09:53 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, 
	Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-21-f4bug@amsat.org>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Message-ID: <6f112b32-0089-b098-069c-17078d49e7b6@reactos.org>
Date: Fri, 22 Sep 2017 22:09:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170922154014.29350-21-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a01:4f8:221:4c5::3
Subject: Re: [Qemu-trivial] [PATCH 20/34] hw/timer/i8254: rename pit_init()
 -> i8254_pit_init()
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
X-List-Received-Date: Fri, 22 Sep 2017 20:10:10 -0000

Le 22/09/2017 à 17:40, Philippe Mathieu-Daudé a écrit :
> - add entry for i82378 in MAINTAINERS
> - remove the old i386/pc dependency
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/timer/i8254.h          | 5 +++--
>   include/hw/timer/i8254_internal.h | 2 +-
>   hw/alpha/dp264.c                  | 2 +-
>   hw/i386/pc.c                      | 2 +-
>   hw/isa/i82378.c                   | 2 +-
>   hw/mips/mips_fulong2e.c           | 2 +-
>   hw/mips/mips_jazz.c               | 2 +-
>   hw/mips/mips_malta.c              | 2 +-
>   hw/mips/mips_r4k.c                | 2 +-
>   hw/timer/i8254.c                  | 1 -
>   hw/timer/i8254_common.c           | 1 -
>   MAINTAINERS                       | 1 +
>   12 files changed, 12 insertions(+), 12 deletions(-)
> 

Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>

