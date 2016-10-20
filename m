Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxJlS-0001lf-3Z
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2016 16:16:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1bxJlQ-0001l5-3T
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 16:16:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1bxJlM-00058E-TV
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 16:16:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35485)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1bxJlM-00056t-Kj
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 16:16:28 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	u9KKDwjO066503
	for <qemu-trivial@nongnu.org>; Thu, 20 Oct 2016 16:16:27 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
	by mx0a-001b2d01.pphosted.com with ESMTP id 266y2k3mgn-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Thu, 20 Oct 2016 16:16:26 -0400
Received: from localhost
	by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Thu, 20 Oct 2016 16:16:25 -0400
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
	by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 20 Oct 2016 16:16:22 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
	[9.57.198.25])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id A78A9C90041;
	Thu, 20 Oct 2016 16:16:07 -0400 (EDT)
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
	[9.57.199.111])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	u9KKGDdO52363394; Thu, 20 Oct 2016 20:16:21 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE251AC07C;
	Thu, 20 Oct 2016 16:16:21 -0400 (EDT)
Received: from localhost (unknown [9.80.98.141])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 9A3F9AC062;
	Thu, 20 Oct 2016 16:16:21 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Stefan Weil <sw@weilnetz.de>, "QEMU Developer" <qemu-devel@nongnu.org>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <20161020193632.18682-1-sw@weilnetz.de>
Cc: "QEMU Trivial" <qemu-trivial@nongnu.org>, "Stefan Weil" <sw@weilnetz.de>
References: <20161020193632.18682-1-sw@weilnetz.de>
User-Agent: alot/0.3.6
Date: Thu, 20 Oct 2016 15:16:12 -0500
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102020-0056-0000-0000-000001B138C6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005948; HX=3.00000240; KW=3.00000007;
	PH=3.00000004; SC=3.00000187; SDB=6.00770735; UDB=6.00369508;
	IPR=6.00547284; 
	BA=6.00004821; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013057;
	XFM=3.00000011; UTC=2016-10-20 20:16:24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102020-0057-0000-0000-000005E4434D
Message-Id: <20161020201612.19218.59536@loki>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-10-20_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1610200356
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-trivial] [PATCH] Makefile: Fix help text for target
 'installer'
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
X-List-Received-Date: Thu, 20 Oct 2016 20:16:32 -0000

Quoting Stefan Weil (2016-10-20 14:36:32)
> The NSIS based installer currently does not install qemu-ga.
> It installs the executables and other files for the QEMU system emulation.
> =

> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Michael Roth <mdroth@linux.vnet.ibm.com>

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/Makefile b/Makefile
> index 3bcb056..69595ad 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -695,7 +695,7 @@ help:
>         @echo  ''
>  ifdef CONFIG_WIN32
>         @echo  'Windows targets:'
> -       @echo  '  installer       - Build NSIS-based installer for qemu-g=
a'
> +       @echo  '  installer       - Build NSIS-based installer for QEMU'
>  ifdef QEMU_GA_MSI_ENABLED
>         @echo  '  msi             - Build MSI-based installer for qemu-ga'
>  endif
> -- =

> 2.9.3
>=20


