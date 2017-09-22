Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvUL9-0006sD-Dj
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 16:14:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1dvUL7-0006qg-Od
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 16:14:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1dvUL6-0006SL-SK
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 16:14:21 -0400
Received: from iserv.reactos.org ([2a01:4f8:221:4c5::3]:47280)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hpoussin@reactos.org>)
	id 1dvUL6-0006Rv-LX; Fri, 22 Sep 2017 16:14:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org;
	s=25047; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=dMfaSw14t4+MRQupmEUZjff355c+jw/6L7nPd7XhZOg=; 
	b=X3Mb/iHvDsefpywTo9RULqVhSw8ur5qPSJCcfG8TWIEtJSM4n3I6Rf6tXhh30hyzMa3g3Upm3uMhQN6E6EWdcGV20WFjRb8rWEsBFBFH8jWcOKnNTICmLE7AKdO07JGNm3Yn6t22BpS452vqYFw+S6QKw2K0Ix9CO/gCGgcuW/4=;
Received: from rob92-5-82-227-227-196.fbx.proxad.net ([82.227.227.196]
	helo=[192.168.0.35]) by iserv.reactos.org with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <hpoussin@reactos.org>)
	id 1dvUL5-0005h6-2c; Fri, 22 Sep 2017 20:14:19 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, 
	Marcel Apfelbaum <marcel@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>, 
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922160111.31885-10-f4bug@amsat.org>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Message-ID: <812ae714-83b4-909e-544a-03844a33ddab@reactos.org>
Date: Fri, 22 Sep 2017 22:14:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170922160111.31885-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a01:4f8:221:4c5::3
Subject: Re: [Qemu-trivial] [PATCH 32/34] hw/net/ne2000: use TYPE_PCI_NE2000
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
X-List-Received-Date: Fri, 22 Sep 2017 20:14:22 -0000

Le 22/09/2017 à 18:01, Philippe Mathieu-Daudé a écrit :
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/net/pci.h  | 1 +
>   hw/net/ne2000.c       | 3 ++-
>   hw/ppc/mac_newworld.c | 3 ++-
>   hw/ppc/mac_oldworld.c | 3 ++-
>   hw/ppc/prep.c         | 2 +-
>   hw/sparc64/sun4u.c    | 3 ++-
>   6 files changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>


