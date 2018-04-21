Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f9wjH-0006Iv-AT
	for mharc-qemu-trivial@gnu.org; Sat, 21 Apr 2018 13:55:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1f9wjF-0006IW-Jb
	for qemu-trivial@nongnu.org; Sat, 21 Apr 2018 13:55:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1f9wjC-0007Wf-Ft
	for qemu-trivial@nongnu.org; Sat, 21 Apr 2018 13:55:17 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:51888)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yuval.shaia@oracle.com>)
	id 1f9wjC-0007UL-6i; Sat, 21 Apr 2018 13:55:14 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id
	w3LHpfcc069678; Sat, 21 Apr 2018 17:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	content-transfer-encoding : in-reply-to; s=corp-2017-10-26;
	bh=k62hHZxlh05zw+DLOXfKFzirWqkEo/E8KR5ILQJ0saw=;
	b=YLgyBNfym1fMqZn8YH59ouPOZK932fWgkRYRoE/7dwQrV/5/wB1p0FNBqJhitYK+flxH
	ILHMcAY28vvw0KnUkMcTRtA5oNkDUU/33bsGxvQTTVBW+bpzWR40BRLa0TVKAXEnuxPa
	RaMvSuymzL3FtbJ4LNG293Q7wDLxWYonv43kX63ieNk0vBVE8bUWdO0nQBs5rhUm8Dwd
	ZjCuV586/AKkHeWUZzS5RXDgcOZDnzObpo3Wp+L4jlQqoRlaHl/w/I5okRCEshQ1T5Xb
	zmSyCO2VwJ8i5/v0xx+Td3Mwq62iA3mJftgYzk5VOv+Ao7cvr++se/d1sXlUHYOpdJmP
	cw== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
	by aserp2120.oracle.com with ESMTP id 2hfw9a11ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Apr 2018 17:55:10 +0000
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w3LHt93F009058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sat, 21 Apr 2018 17:55:09 GMT
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w3LHt8tc011241;
	Sat, 21 Apr 2018 17:55:08 GMT
Received: from yuvallap (/77.138.186.148)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Sat, 21 Apr 2018 10:55:08 -0700
Date: Sat, 21 Apr 2018 20:55:03 +0300
From: Yuval Shaia <yuval.shaia@oracle.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <20180421175502.GB2711@yuvallap>
References: <20180415234307.28132-1-f4bug@amsat.org>
	<20180415234307.28132-39-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180415234307.28132-39-f4bug@amsat.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8870
	signatures=668698
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1711220000 definitions=main-1804210196
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by aserp2120.oracle.com id
	w3LHpfcc069678
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 141.146.126.78
Subject: Re: [Qemu-trivial] [PATCH v3 38/41] hw/rdma: Use the BYTE-based
 definitions
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
X-List-Received-Date: Sat, 21 Apr 2018 17:55:18 -0000

On Sun, Apr 15, 2018 at 08:43:04PM -0300, Philippe Mathieu-Daud=E9 wrote:
> It eases code review, unit is explicit.
>=20
> Patch generated using:
>=20
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include=
/hw/
>=20
> and modified manually.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  hw/rdma/vmw/pvrdma.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/rdma/vmw/pvrdma.h b/hw/rdma/vmw/pvrdma.h
> index 8c173cb824..f17143f0e6 100644
> --- a/hw/rdma/vmw/pvrdma.h
> +++ b/hw/rdma/vmw/pvrdma.h
> @@ -16,6 +16,7 @@
>  #ifndef PVRDMA_PVRDMA_H
>  #define PVRDMA_PVRDMA_H
> =20
> +#include "qemu/units.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/msix.h"
> =20
> @@ -30,7 +31,7 @@
>  #define RDMA_MSIX_BAR_IDX    0
>  #define RDMA_REG_BAR_IDX     1
>  #define RDMA_UAR_BAR_IDX     2
> -#define RDMA_BAR0_MSIX_SIZE  (16 * 1024)
> +#define RDMA_BAR0_MSIX_SIZE  (16 * K_BYTE)
>  #define RDMA_BAR1_REGS_SIZE  256
>  #define RDMA_BAR2_UAR_SIZE   (0x1000 * MAX_UCS) /* each uc gets page *=
/

Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>

> =20
> --=20
> 2.17.0
>=20

