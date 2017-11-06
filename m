Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eBp9V-0004ix-3z
	for mharc-qemu-trivial@gnu.org; Mon, 06 Nov 2017 16:41:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1eBp9S-0004hK-Aw
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 16:41:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1eBp9N-0003vu-Ie
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 16:41:50 -0500
Received: from iserv.reactos.org ([2a01:4f8:221:4c5::3]:36582)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hpoussin@reactos.org>)
	id 1eBp9M-0003v0-GP; Mon, 06 Nov 2017 16:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org;
	s=25047; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=UTJqc+Sr4fafVh8G3D1TMpKai0XI7a7MZIZqFFp3OUM=; 
	b=qsAsaYwELHVYINK+CJIHP8BGmqFx6zV1KLaDteVlY/XDw8ralOQI37AFddvSB3RIqjgyJIPld0cDnTOI270L9UXaXh5RJk6zbdbW9E0pEcN725YiZPsZmqIfROFLlVW0/LkuIV1bL/ynLH6TR1OPRAkXYHQL4QFz3FKlLL6hlbQ=;
Received: from rob92-5-82-227-227-196.fbx.proxad.net ([82.227.227.196]
	helo=[192.168.0.35]) by iserv.reactos.org with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <hpoussin@reactos.org>)
	id 1eBp9I-0002Ej-FD; Mon, 06 Nov 2017 21:41:40 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, 
	Michael Tokarev <mjt@tls.msk.ru>, Eduardo Otubo <otubo@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
References: <20171017164426.25277-1-f4bug@amsat.org>
	<20171017164426.25277-3-f4bug@amsat.org>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Message-ID: <62624405-626a-bcbb-d164-e34ef06c8a81@reactos.org>
Date: Mon, 6 Nov 2017 22:41:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171017164426.25277-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a01:4f8:221:4c5::3
Subject: Re: [Qemu-trivial] [PATCH v3 02/42] MAINTAINERS: add an entry for
 the i82374 (southbridge)
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
X-List-Received-Date: Mon, 06 Nov 2017 21:41:51 -0000

Le 17/10/2017 à 18:43, Philippe Mathieu-Daudé a écrit :
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6f56c1349b..331f7391c1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -713,6 +713,7 @@ F: hw/ppc/prep_systemio.c
>   F: hw/ppc/rs6000_mc.c
>   F: hw/pci-host/prep.[hc]
>   F: hw/isa/pc87312.[hc]
> +F: hw/dma/i82374.c
>   F: pc-bios/ppc_rom.bin
>   
>   sPAPR
> 

Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>

