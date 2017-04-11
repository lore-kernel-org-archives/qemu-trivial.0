Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cxkUK-0007ze-54
	for mharc-qemu-trivial@gnu.org; Mon, 10 Apr 2017 21:20:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1cxkUF-0007uu-Dy
	for qemu-trivial@nongnu.org; Mon, 10 Apr 2017 21:20:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1cxkUC-0006jx-8M
	for qemu-trivial@nongnu.org; Mon, 10 Apr 2017 21:20:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58023)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1cxkUB-0006ih-Vx
	for qemu-trivial@nongnu.org; Mon, 10 Apr 2017 21:20:48 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v3B1IlhD131058
	for <qemu-trivial@nongnu.org>; Mon, 10 Apr 2017 21:20:45 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
	by mx0a-001b2d01.pphosted.com with ESMTP id 29rjgq67gw-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Mon, 10 Apr 2017 21:20:45 -0400
Received: from localhost
	by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Mon, 10 Apr 2017 21:20:44 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
	by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 10 Apr 2017 21:20:40 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
	[9.57.199.106])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	v3B1Khdv44564482; Tue, 11 Apr 2017 01:20:43 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B58F128041;
	Mon, 10 Apr 2017 21:20:35 -0400 (EDT)
Received: from localhost (unknown [9.80.111.220])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 65AEB2803E;
	Mon, 10 Apr 2017 21:20:35 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <20170407222016.15308-4-f4bug@amsat.org>
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170407222016.15308-1-f4bug@amsat.org>
	<20170407222016.15308-4-f4bug@amsat.org>
User-Agent: alot/0.5.1
Date: Mon, 10 Apr 2017 20:01:49 -0500
X-TM-AS-GCONF: 00
x-cbid: 17041101-2213-0000-0000-0000018AC30E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006914; HX=3.00000240; KW=3.00000007;
	PH=3.00000004; SC=3.00000208; SDB=6.00845801; UDB=6.00417124;
	IPR=6.00624235; 
	BA=6.00005281; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014999;
	XFM=3.00000013; UTC=2017-04-11 01:20:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17041101-2214-0000-0000-000055619C7A
Message-Id: <149187250944.15312.1935478125335549576@loki>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-04-10_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
	definitions=main-1704110010
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-trivial] [PATCH v2 3/4] qga: fix compiler warnings (clang
 5)
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
X-List-Received-Date: Tue, 11 Apr 2017 01:20:52 -0000

Quoting Philippe Mathieu-Daud=C3=A9 (2017-04-07 17:20:15)
> static code analyzer complain:
> =

> qga/commands-posix.c:2127:9: warning: Null pointer passed as an argument =
to a 'nonnull' parameter
>         closedir(dp);
>         ^~~~~~~~~~~~
> =

> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Michael Roth <mdroth@linux.vnet.ibm.com>

> ---
>  qga/commands-posix.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> =

> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 915df9ed90..fc45102a1e 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2124,9 +2124,11 @@ static void transfer_memory_block(GuestMemoryBlock=
 *mem_blk, bool sys2memblk,
>           * we think this VM does not support online/offline memory block,
>           * any other solution?
>           */
> -        if (!dp && errno =3D=3D ENOENT) {
> -            result->response =3D
> -                GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
> +        if (!dp) {
> +            if (errno =3D=3D ENOENT) {
> +                result->response =3D
> +                    GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPO=
RTED;
> +            }
>              goto out1;
>          }
>          closedir(dp);
> -- =

> 2.11.0
>=20


