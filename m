Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwM4m-0006vo-Ql
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 01:37:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwM4l-0006tq-6C
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 01:37:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwM4k-0005NT-Fx
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 01:37:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47122)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dwM4d-0005Ej-0F; Mon, 25 Sep 2017 01:36:55 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 080045F7AC;
	Mon, 25 Sep 2017 05:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 080045F7AC
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.76] (ovpn-116-76.ams2.redhat.com [10.36.116.76])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D7495C545;
	Mon, 25 Sep 2017 05:36:47 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	Yongbok Kim <yongbok.kim@imgtec.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922160111.31885-9-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <caa7c8e1-586d-9d78-a69e-7e32ed2ab9fb@redhat.com>
Date: Mon, 25 Sep 2017 07:36:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170922160111.31885-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 25 Sep 2017 05:36:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 31/34] hw/net/rtl8139: use
 TYPE_PCI_RTL8139
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
X-List-Received-Date: Mon, 25 Sep 2017 05:37:04 -0000

On 22.09.2017 18:01, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/net/pci.h    | 1 +
>  hw/arm/realview.c       | 3 ++-
>  hw/arm/versatilepb.c    | 3 ++-
>  hw/mips/mips_fulong2e.c | 3 ++-
>  hw/net/rtl8139.c        | 7 +++----
>  hw/sh4/r2d.c            | 5 +++--
>  6 files changed, 13 insertions(+), 9 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



