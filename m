Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNcms-00034M-5s
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 07:27:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fNcmp-00032U-SK
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 07:27:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fNcmp-0003Fw-40
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 07:27:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44536 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fNcmj-0003BD-2z; Tue, 29 May 2018 07:27:25 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C9A27C6C4;
	Tue, 29 May 2018 11:27:24 +0000 (UTC)
Received: from [10.36.116.97] (ovpn-116-97.ams2.redhat.com [10.36.116.97])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C4925032D;
	Tue, 29 May 2018 11:27:20 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-19-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8b209771-baf4-fdbb-082f-8dbb979eae9e@redhat.com>
Date: Tue, 29 May 2018 13:27:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180528232719.4721-19-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 29 May 2018 11:27:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 29 May 2018 11:27:24 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v4 18/21] hw/hppa: Remove unused include
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
X-List-Received-Date: Tue, 29 May 2018 11:27:33 -0000

On 29.05.2018 01:27, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/hppa/hppa_sys.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/hppa/hppa_sys.h b/hw/hppa/hppa_sys.h
> index a182d1f34e..3f6c145120 100644
> --- a/hw/hppa/hppa_sys.h
> +++ b/hw/hppa/hppa_sys.h
> @@ -3,7 +3,6 @@
>  #ifndef HW_HPPA_SYS_H
>  #define HW_HPPA_SYS_H
> =20
> -#include "target/hppa/cpu-qom.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_host.h"
>  #include "hw/ide.h"
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>

