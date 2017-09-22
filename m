Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvUK7-0005x4-7Z
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 16:13:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1dvUK4-0005uk-MB
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 16:13:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1dvUK3-0005uR-NH
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 16:13:16 -0400
Received: from iserv.reactos.org ([2a01:4f8:221:4c5::3]:47261)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hpoussin@reactos.org>)
	id 1dvUK3-0005u5-GA; Fri, 22 Sep 2017 16:13:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org;
	s=25047; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=KErYg449zFtsuUD+ButGmSUAyXe4nia2KYeoDifpqYs=; 
	b=DDBL2EsDhTcwulRhM1s75fzSnR3ReISU67PusHJ2TJxM7vKP4P+8SQzJDHAekfGComnt4g7HQ1iLWgtS7jpofZe+oFcZVaNWMHwc2YBO7Del0HmuH909gIz+b6KURK+tOvNdObpduQXqhq4M03SywBkViprObR1MS3KjhKRbMw0=;
Received: from rob92-5-82-227-227-196.fbx.proxad.net ([82.227.227.196]
	helo=[192.168.0.35]) by iserv.reactos.org with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <hpoussin@reactos.org>)
	id 1dvUK2-0005gC-G5; Fri, 22 Sep 2017 20:13:14 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Alexander Graf <agraf@suse.de>, Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922160111.31885-4-f4bug@amsat.org>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Message-ID: <97087b0e-6960-9429-fff5-97cfd75436bc@reactos.org>
Date: Fri, 22 Sep 2017 22:13:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170922160111.31885-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a01:4f8:221:4c5::3
Subject: Re: [Qemu-trivial] [PATCH 26/34] hw/net/ne2000: extract ne2k-isa
 code from i386/pc to ne2000-isa.c
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
X-List-Received-Date: Fri, 22 Sep 2017 20:13:17 -0000

Le 22/09/2017 à 18:01, Philippe Mathieu-Daudé a écrit :
> - add "hw/net/ne2000-isa.h" (and new entry in MAINTAINERS)
> - remove the old i386 dependency
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/net/ne2000.h             |  3 +++
>   include/hw/i386/pc.h        | 20 --------------------
>   include/hw/net/ne2000-isa.h | 33 +++++++++++++++++++++++++++++++++
>   hw/i386/pc.c                |  1 +
>   hw/mips/mips_r4k.c          |  1 +
>   hw/net/ne2000-isa.c         |  6 ++----
>   hw/net/ne2000.c             |  2 --
>   hw/ppc/prep.c               |  1 +
>   MAINTAINERS                 |  1 +
>   9 files changed, 42 insertions(+), 26 deletions(-)
>   create mode 100644 include/hw/net/ne2000-isa.h

Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>


