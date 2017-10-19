Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e5BSo-0002gN-Ij
	for mharc-qemu-trivial@gnu.org; Thu, 19 Oct 2017 10:06:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1e5BSl-0002ff-GS
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 10:06:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1e5BSi-00014o-Nz
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 10:06:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45436
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanb@linux.vnet.ibm.com>)
	id 1e5BSi-00013K-Iz
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 10:06:16 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v9JDxFfC028180
	for <qemu-trivial@nongnu.org>; Thu, 19 Oct 2017 10:06:09 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2dpu42a8b1-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Thu, 19 Oct 2017 10:06:09 -0400
Received: from localhost
	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Thu, 19 Oct 2017 08:06:08 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
	by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 19 Oct 2017 08:06:06 -0600
Received: from b03ledav006.gho.boulder.ibm.com
	(b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id v9JE65m610289514; Thu, 19 Oct 2017 07:06:05 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 813FAC6042;
	Thu, 19 Oct 2017 08:06:05 -0600 (MDT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 009B5C6037; 
	Thu, 19 Oct 2017 08:06:04 -0600 (MDT)
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
References: <20171019075031.25507-1-rjones@redhat.com>
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, amarnath.valluri@intel.com, 
	marcandre.lureau@gmail.com
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
Date: Thu, 19 Oct 2017 10:06:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20171019075031.25507-1-rjones@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17101914-0004-0000-0000-00001316388D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007919; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000238; SDB=6.00933401; UDB=6.00470136;
	IPR=6.00713689; 
	BA=6.00005650; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017605;
	XFM=3.00000015; UTC=2017-10-19 14:06:08
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17101914-0005-0000-0000-0000848A2A78
Message-Id: <3edd9a86-24b4-c236-0153-899704336dde@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-10-19_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=2
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1710190193
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tpm: Don't call tpm_cleanup
 unless CONFIG_TPM.
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
X-List-Received-Date: Thu, 19 Oct 2017 14:06:20 -0000

On 10/19/2017 03:50 AM, Richard W.M. Jones wrote:
> When compiling with --disable-tpm:
>
>    ../vl.o: In function `main':
>    /home/rjones/d/qemu/vl.c:4908: undefined reference to `tpm_cleanup'
>
> This appears to have been introduced in commit c37cacabf228
> ("tpm: Move tpm_cleanup() to right place").
>
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>

Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>


> ---
>   vl.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/vl.c b/vl.c
> index 0723835bbf..dbfd06d4bc 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4905,7 +4905,9 @@ int main(int argc, char **argv, char **envp)
>       res_free();
>
>       /* vhost-user must be cleaned up before chardevs.  */
> +#ifdef CONFIG_TPM
>       tpm_cleanup();
> +#endif
>       net_cleanup();
>       audio_cleanup();
>       monitor_cleanup();



