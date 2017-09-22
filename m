Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvUHO-0003s9-38
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 16:10:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1dvUHK-0003qU-II
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 16:10:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1dvUHF-0004Cc-V2
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 16:10:26 -0400
Received: from iserv.reactos.org ([2a01:4f8:221:4c5::3]:47019)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hpoussin@reactos.org>)
	id 1dvUHF-0004CG-OY; Fri, 22 Sep 2017 16:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org;
	s=25047; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=v94qt+MwnkG9nboNTgT4ASFGavvS0mAVJpGOe2Etld4=; 
	b=JKE2Hzsq+0YbLv/IH8twtrphqyI+aRj64uDzctwpIARgioy0nSDVnhrJs26B4y06jR1Wo9Ou5ME3UtJTgh3ZfRq+j1L/3RzW7u7hw8mcYrzZVKYnl5BvVZhg/6sQXyVS0ILBSTExdknnEGNYp2ZWTgDmbz8OG/0rdr4Bm6CLZJg=;
Received: from rob92-5-82-227-227-196.fbx.proxad.net ([82.227.227.196]
	helo=[192.168.0.35]) by iserv.reactos.org with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <hpoussin@reactos.org>)
	id 1dvUHE-0005SY-Ph; Fri, 22 Sep 2017 20:10:20 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@imgtec.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-22-f4bug@amsat.org>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Message-ID: <727bda28-88b9-5c14-3e62-cfbe0af265e4@reactos.org>
Date: Fri, 22 Sep 2017 22:10:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170922154014.29350-22-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a01:4f8:221:4c5::3
Subject: Re: [Qemu-trivial] [PATCH 21/34] hw/display/vga: remove the old
 i386/pc dependency
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
X-List-Received-Date: Fri, 22 Sep 2017 20:10:28 -0000

Le 22/09/2017 à 17:40, Philippe Mathieu-Daudé a écrit :
> move public API to "hw/display/vga.h" and private registers
> to "hw/display/vga_int_regs.h"
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> ./scripts/get_maintainer.pl -f hw/display/vga*
> get_maintainer.pl: No maintainers found...
> 
>   hw/display/vga_int.h                 |  3 ++-
>   hw/display/{vga.h => vga_int_regs.h} |  0
>   include/hw/display/vga.h             | 25 +++++++++++++++++++++++++
>   include/hw/i386/pc.h                 | 12 ------------
>   hw/display/vga-isa-mm.c              |  4 +---
>   hw/display/vga-isa.c                 |  2 +-
>   hw/display/vga.c                     |  4 ++--
>   hw/mips/mips_jazz.c                  |  1 +
>   vl.c                                 |  2 +-
>   9 files changed, 33 insertions(+), 20 deletions(-)
>   rename hw/display/{vga.h => vga_int_regs.h} (100%)
>   create mode 100644 include/hw/display/vga.h
> 

Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>


