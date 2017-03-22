Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqni9-00056a-7i
	for mharc-qemu-trivial@gnu.org; Wed, 22 Mar 2017 17:22:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1cqni6-000559-Qc
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 17:22:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1cqni2-0001sp-Tw
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 17:22:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37521
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1cqni2-0001rq-OC
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 17:22:22 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v2MLIUwr076742
	for <qemu-trivial@nongnu.org>; Wed, 22 Mar 2017 17:22:20 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
	by mx0b-001b2d01.pphosted.com with ESMTP id 29b9vnu347-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Wed, 22 Mar 2017 17:22:20 -0400
Received: from localhost
	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Wed, 22 Mar 2017 15:22:19 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
	by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 22 Mar 2017 15:22:16 -0600
Received: from b03ledav005.gho.boulder.ibm.com
	(b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id v2MLMFNc16515428; Wed, 22 Mar 2017 14:22:15 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62185BE042;
	Wed, 22 Mar 2017 15:22:15 -0600 (MDT)
Received: from localhost (unknown [9.53.92.194])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 4CA02BE03A; 
	Wed, 22 Mar 2017 15:22:15 -0600 (MDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"Peter Crosthwaite" <crosthwaite.peter@gmail.com>,
	"Alexander Graf" <agraf@suse.de>, "Gerd Hoffmann" <kraxel@redhat.com>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <20170322204844.446-4-f4bug@amsat.org>
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170322204844.446-1-f4bug@amsat.org>
	<20170322204844.446-4-f4bug@amsat.org>
User-Agent: alot/0.3.6
Date: Wed, 22 Mar 2017 16:22:10 -0500
X-TM-AS-GCONF: 00
x-cbid: 17032221-0028-0000-0000-000007446211
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006830; HX=3.00000240; KW=3.00000007;
	PH=3.00000004; SC=3.00000206; SDB=6.00837476; UDB=6.00411716;
	IPR=6.00615242; 
	BA=6.00005232; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014764;
	XFM=3.00000013; UTC=2017-03-22 21:22:17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032221-0029-0000-0000-00003480EE9B
Message-Id: <149021773050.3910.449421368071627004@loki>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-03-22_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
	definitions=main-1703220183
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-trivial] [PATCH RESEND 3/3] qga: fix compiler warnings
 (clang 5)
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
X-List-Received-Date: Wed, 22 Mar 2017 21:22:27 -0000

Quoting Philippe Mathieu-Daud=C3=A9 (2017-03-22 15:48:44)
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
> ---
>  qga/commands-posix.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> =

> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 73d93eb5ce..8028141534 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2122,9 +2122,11 @@ static void transfer_memory_block(GuestMemoryBlock=
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

I think this should be:

    if (!dp) {
        if (errno =3D=3D ENOENT) {
            result->response =3D
                GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
        } else {
            result->response =3D
                GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;
        }
        goto out1;
    }

otherwise we might set result->error_code while still indicating
success for the operation. That wasn't handled properly before your
patch either, it's just more apparent now.

>          closedir(dp);
> -- =

> 2.11.0
>=20


