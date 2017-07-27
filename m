Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dapkB-0003hE-Q2
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 16:50:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1dapkA-0003ge-4z
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 16:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1dapk6-0005Lp-8B
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 16:50:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47207
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1dapk6-0005LM-1n
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 16:50:46 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v6RKn7Q1066720
	for <qemu-trivial@nongnu.org>; Thu, 27 Jul 2017 16:50:45 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2bymp6yhf2-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Thu, 27 Jul 2017 16:50:45 -0400
Received: from localhost
	by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Thu, 27 Jul 2017 16:50:44 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
	by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 27 Jul 2017 16:50:42 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
	[9.57.199.108])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	v6RKoeIB24117496; Thu, 27 Jul 2017 20:50:41 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC766B2065;
	Thu, 27 Jul 2017 16:48:09 -0400 (EDT)
Received: from localhost (unknown [9.53.92.194])
	by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id A229AB205E;
	Thu, 27 Jul 2017 16:48:09 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <20170727154505.14838-1-marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org,
	=?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20170727154505.14838-1-marcandre.lureau@redhat.com>
User-Agent: alot/0.5.1
Date: Thu, 27 Jul 2017 15:22:26 -0500
X-TM-AS-GCONF: 00
x-cbid: 17072720-0008-0000-0000-00000265A676
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007437; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000214; SDB=6.00893794; UDB=6.00446874;
	IPR=6.00673954; 
	BA=6.00005495; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016413;
	XFM=3.00000015; UTC=2017-07-27 20:50:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072720-0009-0000-0000-0000362D42F0
Message-Id: <150118694640.22858.12035679972281344198@loki>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-07-27_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
	definitions=main-1707270323
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] build-sys: there is no
 qemu-ga.c
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
X-List-Received-Date: Thu, 27 Jul 2017 20:50:51 -0000

Quoting Marc-Andr=C3=A9 Lureau (2017-07-27 10:45:05)
> It got moved in qga/main.c from commit 2870dc3456c9c.
> =

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Michael Roth <mdroth@linux.vnet.ibm.com>

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/Makefile b/Makefile
> index ef721480eb..97a58a0f4e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -443,7 +443,7 @@ $(qapi-modules) $(SRC_PATH)/scripts/qapi-introspect.p=
y $(qapi-py)
>                 "GEN","$@")
>  =

>  QGALIB_GEN=3D$(addprefix qga/qapi-generated/, qga-qapi-types.h qga-qapi-=
visit.h qga-qmp-commands.h)
> -$(qga-obj-y) qemu-ga.o: $(QGALIB_GEN)
> +$(qga-obj-y): $(QGALIB_GEN)
>  =

>  qemu-ga$(EXESUF): $(qga-obj-y) $(COMMON_LDADDS)
>         $(call LINK, $^)
> -- =

> 2.14.0.rc0.1.g40ca67566
> =

>=20


