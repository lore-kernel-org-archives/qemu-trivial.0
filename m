Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwLjy-0007jj-Rp
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 01:15:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwLjw-0007iX-QB
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 01:15:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwLjw-0003dZ-11
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 01:15:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34922)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dwLjr-0003cI-PA; Mon, 25 Sep 2017 01:15:27 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D02E185550;
	Mon, 25 Sep 2017 05:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D02E185550
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.76] (ovpn-116-76.ams2.redhat.com [10.36.116.76])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 410615C545;
	Mon, 25 Sep 2017 05:15:20 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	Anthony Perard <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-13-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4c218cec-26dc-4cc6-240a-347b2f5b973b@redhat.com>
Date: Mon, 25 Sep 2017 07:15:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170922154014.29350-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 25 Sep 2017 05:15:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 12/34] misc: remove old i386 dependency
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
X-List-Received-Date: Mon, 25 Sep 2017 05:15:33 -0000

On 22.09.2017 17:39, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/audio/pcspk.c                    | 1 -
>  hw/i386/kvm/pci-assign.c            | 1 -
>  hw/i386/pci-assign-load-rom.c       | 1 -
>  hw/i386/xen/xen_platform.c          | 1 -
>  hw/isa/vt82c686.c                   | 1 -
>  hw/misc/ivshmem.c                   | 1 -
>  hw/misc/sga.c                       | 1 -
>  hw/pci-bridge/pci_expander_bridge.c | 1 -
>  monitor.c                           | 1 -
>  9 files changed, 9 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



