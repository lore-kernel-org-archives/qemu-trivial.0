Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6kj8-0007zR-RG
	for mharc-qemu-trivial@gnu.org; Mon, 23 Oct 2017 17:57:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1e6kj7-0007zL-BK
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 17:57:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1e6kj4-0004h2-9I
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 17:57:41 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47050)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanb@linux.vnet.ibm.com>)
	id 1e6kj4-0004ge-0w
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 17:57:38 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v9NLsTSF002023
	for <qemu-trivial@nongnu.org>; Mon, 23 Oct 2017 17:57:34 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2dsqdg33e2-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Mon, 23 Oct 2017 17:57:33 -0400
Received: from localhost
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Mon, 23 Oct 2017 15:47:29 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
	by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 23 Oct 2017 15:47:25 -0600
Received: from b03ledav004.gho.boulder.ibm.com
	(b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id v9NLlO2x32768210; Mon, 23 Oct 2017 14:47:24 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89D187803F;
	Mon, 23 Oct 2017 15:47:24 -0600 (MDT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id F1FCB78037; 
	Mon, 23 Oct 2017 15:47:23 -0600 (MDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20171023213359.23025-1-f4bug@amsat.org>
	<20171023213359.23025-4-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
Date: Mon, 23 Oct 2017 17:47:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20171023213359.23025-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
x-cbid: 17102321-0020-0000-0000-00000CE3B70C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007941; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000239; SDB=6.00935467; UDB=6.00471307;
	IPR=6.00715733; 
	BA=6.00005656; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017677;
	XFM=3.00000015; UTC=2017-10-23 21:47:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17102321-0021-0000-0000-00005EA0E4B0
Message-Id: <d72adc87-3cc6-a6cd-8fc8-50ba8e0fbe88@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-10-23_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1710230308
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id v9NLsTSF002023
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-trivial] [PATCH 3/3] vl: remove unnecessary #ifdef
 CONFIG_TPM
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
X-List-Received-Date: Mon, 23 Oct 2017 21:57:42 -0000

On 10/23/2017 05:33 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> a stub is now provided.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>   vl.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/vl.c b/vl.c
> index 0723835bbf..ec299099ff 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4624,11 +4624,9 @@ int main(int argc, char **argv, char **envp)
>           exit(1);
>       }
>
> -#ifdef CONFIG_TPM
>       if (tpm_init() < 0) {
>           exit(1);
>       }
> -#endif
>
>       /* init the bluetooth world */
>       if (foreach_device_config(DEV_BT, bt_parse))


Now you should be able to also remove the #ifdef CONFIG_TPM from ./tpm.c.

    Stefan



