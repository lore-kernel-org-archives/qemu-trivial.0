Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYFtb-0004gp-FV
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2017 14:09:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1dYFtZ-0004gg-7C
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 14:09:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1dYFtW-0003je-1Y
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 14:09:53 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57517)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <borntraeger@de.ibm.com>)
	id 1dYFtV-0003j6-NP
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 14:09:49 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v6KI9j2S036233
	for <qemu-trivial@nongnu.org>; Thu, 20 Jul 2017 14:09:48 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2bu01a3yc0-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Thu, 20 Jul 2017 14:09:47 -0400
Received: from localhost
	by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <borntraeger@de.ibm.com>;
	Thu, 20 Jul 2017 14:08:44 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
	by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 20 Jul 2017 14:08:40 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
	[9.57.199.111])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	v6KI8e4J23920824; Thu, 20 Jul 2017 18:08:40 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C579AC03F;
	Thu, 20 Jul 2017 14:08:50 -0400 (EDT)
Received: from oc1450873852.ibm.com (unknown [9.145.154.62])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 18FAAAC03A;
	Thu, 20 Jul 2017 14:08:47 -0400 (EDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>,
	Alexander Graf <agraf@suse.de>, Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org
References: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Date: Thu, 20 Jul 2017 20:08:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-IE
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17072018-0008-0000-0000-0000026251B1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007394; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000214; SDB=6.00890390; UDB=6.00444847;
	IPR=6.00670557; 
	BA=6.00005482; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016299;
	XFM=3.00000015; UTC=2017-07-20 18:08:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072018-0009-0000-0000-00003618C26B
Message-Id: <a446cab4-a4f2-a20f-7a4b-122cb59166ef@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-07-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
	definitions=main-1707200279
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-trivial] [PATCH for-2.10] Use qemu_tolower() and
 qemu_toupper(), not tolower() and toupper()
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
X-List-Received-Date: Thu, 20 Jul 2017 18:09:54 -0000

On 07/20/2017 06:31 PM, Peter Maydell wrote:
> On NetBSD, where tolower() and toupper() are implemented using an
> array lookup, the compiler warns if you pass a plain 'char'
> to these functions:
> 
> gdbstub.c:914:13: warning: array subscript has type 'char'
> 
> This reflects the fact that toupper() and tolower() give
> undefined behaviour if they are passed a value that isn't
> a valid 'unsigned char' or EOF.
> 
> We have qemu_tolower() and qemu_toupper() to avoid this problem;
> use them.
> 
> (The use in scsi-generic.c does not trigger the warning because
> it passes a uint8_t; we switch it anyway, for consistency.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Christian Borntraeger <borntraeger@de.ibm.com> for the s390 part.
> ---
>  gdbstub.c                  | 2 +-
>  hw/s390x/s390-virtio-ccw.c | 2 +-
>  hw/scsi/scsi-generic.c     | 2 +-
>  target/ppc/monitor.c       | 4 ++--
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index f936ddd..2a94030 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -911,7 +911,7 @@ static int gdb_handle_vcont(GDBState *s, const char *p)
> 
>          cur_action = *p++;
>          if (cur_action == 'C' || cur_action == 'S') {
> -            cur_action = tolower(cur_action);
> +            cur_action = qemu_tolower(cur_action);
>              res = qemu_strtoul(p + 1, &p, 16, &tmp);
>              if (res) {
>                  goto out;
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index ce3921e..1c7af39 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -318,7 +318,7 @@ static void machine_set_loadparm(Object *obj, const char *val, Error **errp)
>      int i;
> 
>      for (i = 0; i < sizeof(ms->loadparm) && val[i]; i++) {
> -        uint8_t c = toupper(val[i]); /* mimic HMC */
> +        uint8_t c = qemu_toupper(val[i]); /* mimic HMC */
> 
>          if (('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || (c == '.') ||
>              (c == ' ')) {
> diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
> index a55ff87..7e1cbab 100644
> --- a/hw/scsi/scsi-generic.c
> +++ b/hw/scsi/scsi-generic.c
> @@ -406,7 +406,7 @@ static int read_naa_id(const uint8_t *p, uint64_t *p_wwn)
>          }
>          *p_wwn = 0;
>          for (i = 8; i < 24; i++) {
> -            char c = toupper(p[i]);
> +            char c = qemu_toupper(p[i]);
>              c -= (c >= '0' && c <= '9' ? '0' : 'A' - 10);
>              *p_wwn = (*p_wwn << 4) | c;
>          }
> diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
> index b8f30e9..1491511 100644
> --- a/target/ppc/monitor.c
> +++ b/target/ppc/monitor.c
> @@ -115,14 +115,14 @@ int target_get_monitor_def(CPUState *cs, const char *name, uint64_t *pval)
>      CPUPPCState *env = &cpu->env;
> 
>      /* General purpose registers */
> -    if ((tolower(name[0]) == 'r') &&
> +    if ((qemu_tolower(name[0]) == 'r') &&
>          ppc_cpu_get_reg_num(name + 1, ARRAY_SIZE(env->gpr), &regnum)) {
>          *pval = env->gpr[regnum];
>          return 0;
>      }
> 
>      /* Floating point registers */
> -    if ((tolower(name[0]) == 'f') &&
> +    if ((qemu_tolower(name[0]) == 'f') &&
>          ppc_cpu_get_reg_num(name + 1, ARRAY_SIZE(env->fpr), &regnum)) {
>          *pval = env->fpr[regnum];
>          return 0;
> 


