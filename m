Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQS9-0001Mg-NA
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:05:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1dvQS6-0001JE-3l
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:05:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1dvQS2-0002LI-AG
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:05:18 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34318
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanb@linux.vnet.ibm.com>)
	id 1dvQS2-0002KV-5E
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:05:14 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v8MG4MwY009742
	for <qemu-trivial@nongnu.org>; Fri, 22 Sep 2017 12:05:10 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2d53j0rk0w-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Fri, 22 Sep 2017 12:05:10 -0400
Received: from localhost
	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Fri, 22 Sep 2017 10:05:09 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
	by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 22 Sep 2017 10:05:06 -0600
Received: from b03ledav002.gho.boulder.ibm.com
	(b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id v8MG51h39568754; Fri, 22 Sep 2017 09:05:05 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AFF2136043;
	Fri, 22 Sep 2017 10:05:05 -0600 (MDT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id E0A33136040; 
	Fri, 22 Sep 2017 10:05:04 -0600 (MDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Amarnath Valluri <amarnath.valluri@intel.com>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-17-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
Date: Fri, 22 Sep 2017 12:05:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20170922154014.29350-17-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
x-cbid: 17092216-8235-0000-0000-00000C4F3486
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007778; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000231; SDB=6.00920776; UDB=6.00462704;
	IPR=6.00700997; 
	BA=6.00005601; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017249;
	XFM=3.00000015; UTC=2017-09-22 16:05:08
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17092216-8236-0000-0000-00003DC14B88
Message-Id: <c7f95a1e-3153-9ecb-b6a7-f88f391980e6@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-09-22_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1709220227
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0b-001b2d01.pphosted.com id v8MG4MwY009742
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-trivial] [PATCH 16/34] hw/tpm: remove old i386 dependency
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
X-List-Received-Date: Fri, 22 Sep 2017 16:05:19 -0000

On 09/22/2017 11:39 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

> ---
>   hw/tpm/tpm_passthrough.c | 1 -
>   hw/tpm/tpm_tis.c         | 1 -
>   2 files changed, 2 deletions(-)
>
> diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
> index 9234eb3459..461f551a0c 100644
> --- a/hw/tpm/tpm_passthrough.c
> +++ b/hw/tpm/tpm_passthrough.c
> @@ -29,7 +29,6 @@
>   #include "sysemu/tpm_backend.h"
>   #include "tpm_int.h"
>   #include "hw/hw.h"
> -#include "hw/i386/pc.h"
>   #include "sysemu/tpm_backend_int.h"
>   #include "tpm_tis.h"
>   #include "tpm_util.h"
> diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
> index a6440fef91..a3a93f7229 100644
> --- a/hw/tpm/tpm_tis.c
> +++ b/hw/tpm/tpm_tis.c
> @@ -28,7 +28,6 @@
>   #include "sysemu/block-backend.h"
>   #include "exec/address-spaces.h"
>   #include "hw/hw.h"
> -#include "hw/i386/pc.h"
>   #include "hw/pci/pci_ids.h"
>   #include "tpm_tis.h"
>   #include "qapi/error.h"



