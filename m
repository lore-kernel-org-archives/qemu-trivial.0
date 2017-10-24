Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e737O-0008QE-H9
	for mharc-qemu-trivial@gnu.org; Tue, 24 Oct 2017 13:35:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1e737L-0008PY-RE
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 13:35:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1e737I-0000nZ-Jx
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 13:35:55 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47878
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanb@linux.vnet.ibm.com>)
	id 1e737I-0000n2-Do
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 13:35:52 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v9OHUWZ1080595
	for <qemu-trivial@nongnu.org>; Tue, 24 Oct 2017 13:35:48 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2dt9s5sa0k-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Tue, 24 Oct 2017 13:35:48 -0400
Received: from localhost
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Tue, 24 Oct 2017 11:35:47 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
	by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 24 Oct 2017 11:35:43 -0600
Received: from b03ledav001.gho.boulder.ibm.com
	(b03ledav001.gho.boulder.ibm.com [9.17.130.232])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id v9OHZhQX9503210; Tue, 24 Oct 2017 10:35:43 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA96B6E035;
	Tue, 24 Oct 2017 11:35:42 -0600 (MDT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id C43EA6E040; 
	Tue, 24 Oct 2017 11:35:41 -0600 (MDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Amarnath Valluri <amarnath.valluri@intel.com>,
	Juan Quintela <quintela@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20171024122045.30072-1-f4bug@amsat.org>
	<20171024122045.30072-4-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@gmail.com>
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
Date: Tue, 24 Oct 2017 13:35:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20171024122045.30072-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
x-cbid: 17102417-0020-0000-0000-00000CE4E486
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007947; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000239; SDB=6.00935863; UDB=6.00471545;
	IPR=6.00716129; 
	BA=6.00005658; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017690;
	XFM=3.00000015; UTC=2017-10-24 17:35:46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17102417-0021-0000-0000-00005EA3B518
Message-Id: <0d7dd764-27e5-b7b7-de42-56e6e1b1cebd@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-10-24_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1710240240
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0b-001b2d01.pphosted.com id v9OHUWZ1080595
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 3/4] tpm: remove
 unnecessary #ifdef CONFIG_TPM
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
X-List-Received-Date: Tue, 24 Oct 2017 17:35:56 -0000

On 10/24/2017 08:20 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Makefile.objs now checks for $(CONFIG_TPM).
>
> Suggested-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

> ---
>   tpm.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/tpm.c b/tpm.c
> index 45520f555d..ab5d29e91e 100644
> --- a/tpm.c
> +++ b/tpm.c
> @@ -30,8 +30,6 @@ void tpm_register_model(enum TpmModel model)
>       tpm_models[model] =3D true;
>   }
>
> -#ifdef CONFIG_TPM
> -
>   static const TPMBackendClass *
>   tpm_be_find_by_type(enum TpmType type)
>   {
> @@ -192,8 +190,6 @@ int tpm_config_parse(QemuOptsList *opts_list, const=
 char *optarg)
>       return 0;
>   }
>
> -#endif /* CONFIG_TPM */
> -
>   /*
>    * Walk the list of active TPM backends and collect information about=
 them
>    * following the schema description in qapi-schema.json.



