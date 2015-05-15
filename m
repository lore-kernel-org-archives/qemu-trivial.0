Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YtGxK-0006Z8-Ar
	for mharc-qemu-trivial@gnu.org; Fri, 15 May 2015 10:51:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liang.z.li@intel.com>) id 1YtBlo-00025K-E3
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 05:19:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liang.z.li@intel.com>) id 1YtBll-00019M-3B
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 05:19:04 -0400
Received: from mga11.intel.com ([192.55.52.93]:19770)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liang.z.li@intel.com>) id 1YtBlk-000196-VP
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 05:19:01 -0400
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 May 2015 02:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,433,1427785200"; d="scan'208";a="710613348"
Received: from kmsmsx152.gar.corp.intel.com ([172.21.73.87])
	by fmsmga001.fm.intel.com with ESMTP; 15 May 2015 02:18:55 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.110.14) by
	KMSMSX152.gar.corp.intel.com (172.21.73.87) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 15 May 2015 17:12:46 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.109]) by
	SHSMSX103.ccr.corp.intel.com ([169.254.4.23]) with mapi id
	14.03.0224.002; Fri, 15 May 2015 17:12:45 +0800
From: "Li, Liang Z" <liang.z.li@intel.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, "qemu-trivial@nongnu.org"
	<qemu-trivial@nongnu.org>
Thread-Topic: [PATCH] arch_init: Clean up the duplicate variable 'len'
	defining in ram_load()
Thread-Index: AQHQju3PqFkL0fjDSE2Ik397CH1Rgp18v6vA
Date: Fri, 15 May 2015 09:12:45 +0000
Message-ID: <F2CBF3009FA73547804AE4C663CAB28E524A32@shsmsx102.ccr.corp.intel.com>
References: <1431680403-5776-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1431680403-5776-1-git-send-email-zhang.zhanghailiang@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
X-Mailman-Approved-At: Fri, 15 May 2015 10:51:16 -0400
Cc: "qemu-devel@nongnu.or" <qemu-devel@nongnu.or>,
	"quintela@redhat.com" <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] arch_init: Clean up the duplicate
 variable 'len' defining in ram_load()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 May 2015 09:19:08 -0000

> Cc: quintela@redhat.com; Li, Liang Z; qemu-devel@nongnu.or; zhanghailiang
> Subject: [PATCH] arch_init: Clean up the duplicate variable 'len' definin=
g in
> ram_load()
>=20
> There are two places that define 'len' variable, It's OK for compiling, b=
ut
> makes it difficult for reading.
>=20
> Remove the local one which defined in the inside 'while' loop.
>=20
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  arch_init.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch_init.c b/arch_init.c
> index 23d3feb..8918f6c 100644
> --- a/arch_init.c
> +++ b/arch_init.c
> @@ -1593,7 +1593,6 @@ static int ram_load(QEMUFile *f, void *opaque, int
> version_id)
>              total_ram_bytes =3D addr;
>              while (!ret && total_ram_bytes) {
>                  RAMBlock *block;
> -                uint8_t len;
>                  char id[256];
>                  ram_addr_t length;
>=20
> --

Yes, It's true.

Liang

