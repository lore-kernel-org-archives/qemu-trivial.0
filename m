Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvUJ8-00059f-T5
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 16:12:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1dvUJ6-00056U-6v
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 16:12:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1dvUJ5-000593-Af
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 16:12:16 -0400
Received: from iserv.reactos.org ([2a01:4f8:221:4c5::3]:47149)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hpoussin@reactos.org>)
	id 1dvUJ5-00058K-3v; Fri, 22 Sep 2017 16:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org;
	s=25047; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=c1SI5MCIHn1bGjKAVSR0CRRPsoj8wm5TCvg25L/9QnE=; 
	b=puwTfozVNZepahOm/9LSvq2o6dANZZpvcp3GM0nttQBfEEkyJloYRD/Kk6JgJNXY3rGL++Avagv6xVddIOJUpoZEci8E92LpeFQ8HxF3IvjWABGVJ8cI41aBrwDQt+bWQiFbm/ZreFzstGkxnL5fnTuSDX6/LMtx43j6QhjptMA=;
Received: from rob92-5-82-227-227-196.fbx.proxad.net ([82.227.227.196]
	helo=[192.168.0.35]) by iserv.reactos.org with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <hpoussin@reactos.org>)
	id 1dvUJ3-0005ZY-Vh; Fri, 22 Sep 2017 20:12:14 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922160111.31885-3-f4bug@amsat.org>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Message-ID: <0aa179bb-7d59-bd23-2969-34c42e3167bf@reactos.org>
Date: Fri, 22 Sep 2017 22:12:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170922160111.31885-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a01:4f8:221:4c5::3
Subject: Re: [Qemu-trivial] [PATCH 25/34] hw/timer/m48t59: use
 TYPE_M48T59_ISA, add entries to MAINTAINERS
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
X-List-Received-Date: Fri, 22 Sep 2017 20:12:17 -0000

Le 22/09/2017 à 18:01, Philippe Mathieu-Daudé a écrit :
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/timer/m48t59.h | 2 ++
>   hw/ppc/prep.c             | 2 +-
>   hw/timer/m48t59-isa.c     | 2 +-
>   MAINTAINERS               | 2 ++
>   4 files changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>


