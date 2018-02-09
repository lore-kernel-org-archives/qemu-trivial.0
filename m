Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekGgH-0006g3-Sk
	for mharc-qemu-trivial@gnu.org; Fri, 09 Feb 2018 16:58:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <danielhb@linux.vnet.ibm.com>) id 1ekFLH-0004nF-Em
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 15:32:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <danielhb@linux.vnet.ibm.com>) id 1ekFLE-0004LI-8N
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 15:32:19 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44722
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <danielhb@linux.vnet.ibm.com>)
	id 1ekFLE-0004L4-37
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 15:32:16 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w19KOGcL150018
	for <qemu-trivial@nongnu.org>; Fri, 9 Feb 2018 15:32:14 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2g1exr8wu6-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Fri, 09 Feb 2018 15:32:13 -0500
Received: from localhost
	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <danielhb@linux.vnet.ibm.com>;
	Fri, 9 Feb 2018 15:32:13 -0500
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
	by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 9 Feb 2018 15:32:10 -0500
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
	[9.57.199.111])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	w19KW9Sp41550022; Fri, 9 Feb 2018 20:32:09 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 22FABAC040;
	Fri,  9 Feb 2018 15:33:31 -0500 (EST)
Received: from [9.85.155.97] (unknown [9.85.155.97])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id D411FAC03F;
	Fri,  9 Feb 2018 15:33:29 -0500 (EST)
To: Yasmin Beatriz <yasmins@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org, joserz@linux.vnet.ibm.com
References: <20180209202621.97852-1-yasmins@linux.vnet.ibm.com>
From: Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>
Date: Fri, 9 Feb 2018 18:32:07 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180209202621.97852-1-yasmins@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18020920-0044-0000-0000-000003DE4D74
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008505; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000251; SDB=6.00987351; UDB=6.00501157;
	IPR=6.00766709; 
	BA=6.00005821; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019466;
	XFM=3.00000015; UTC=2018-02-09 20:32:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18020920-0045-0000-0000-0000080DC059
Message-Id: <cbcdcbc8-5ea2-5be3-c965-dfad99dfcd6f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-02-09_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
	definitions=main-1802090258
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
X-Mailman-Approved-At: Fri, 09 Feb 2018 16:58:03 -0500
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] dump: Show custom
 message for ENOSPC
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
X-List-Received-Date: Fri, 09 Feb 2018 20:32:20 -0000



On 02/09/2018 06:26 PM, Yasmin Beatriz wrote:
> This patch intends to make a more specific message for when
> the system has not enough space to save guest memory.
>
> Reported-by: yilzhang@redhat.com
> Cc: Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>
> Signed-off-by: Yasmin Beatriz <yasmins@linux.vnet.ibm.com>
> ---
>   dump.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>

> diff --git a/dump.c b/dump.c
> index e9dfed060a..12e0c779ee 100644
> --- a/dump.c
> +++ b/dump.c
> @@ -106,7 +106,7 @@ static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
>
>       written_size = qemu_write_full(s->fd, buf, size);
>       if (written_size != size) {
> -        return -1;
> +        return -errno;
>       }
>
>       return 0;
> @@ -364,7 +364,11 @@ static void write_data(DumpState *s, void *buf, int length, Error **errp)
>
>       ret = fd_write_vmcore(buf, length, s);
>       if (ret < 0) {
> -        error_setg(errp, "dump: failed to save memory");
> +        if (ret == -ENOSPC) {
> +            error_setg(errp, "dump: not enough space to save memory");
> +        } else {
> +            error_setg(errp, "dump: failed to save memory");
> +        }
>       } else {
>           s->written_size += length;
>       }


