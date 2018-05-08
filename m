Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fG4Tw-0006eC-Ox
	for mharc-qemu-trivial@gnu.org; Tue, 08 May 2018 11:24:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fG4Tu-0006bt-Ap
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 11:24:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fG4Tt-0008D3-Ki
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 11:24:46 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57856 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fG4Tp-0008A7-6L; Tue, 08 May 2018 11:24:41 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3AAF04182D59;
	Tue,  8 May 2018 15:24:37 +0000 (UTC)
Received: from [10.36.116.77] (ovpn-116-77.ams2.redhat.com [10.36.116.77])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0599D2023227;
	Tue,  8 May 2018 15:24:31 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20180508151035.16774-1-f4bug@amsat.org>
	<20180508151035.16774-2-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0f2eb270-8541-05e3-bdba-4c294c057a39@redhat.com>
Date: Tue, 8 May 2018 17:24:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180508151035.16774-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 08 May 2018 15:24:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 08 May 2018 15:24:37 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [RFC PATCH 1/4] typedefs: Remove PcGuestInfo
 from qemu/typedefs.h
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
X-List-Received-Date: Tue, 08 May 2018 15:24:47 -0000

On 08.05.2018 17:10, Philippe Mathieu-Daud=C3=A9 wrote:
> It is long gone since e4e8ba04c2007 ...
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/qemu/typedefs.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> index a46b0b347b..325c72de33 100644
> --- a/include/qemu/typedefs.h
> +++ b/include/qemu/typedefs.h
> @@ -62,7 +62,6 @@ typedef struct NetClientState NetClientState;
>  typedef struct NetFilterState NetFilterState;
>  typedef struct NICInfo NICInfo;
>  typedef struct NumaNodeMem NumaNodeMem;
> -typedef struct PcGuestInfo PcGuestInfo;
>  typedef struct PCIBridge PCIBridge;
>  typedef struct PCIBus PCIBus;
>  typedef struct PCIDevice PCIDevice;
>=20

No need to mark this patch as RFC - this is certainly a good idea.

Reviewed-by: Thomas Huth <thuth@redhat.com>

