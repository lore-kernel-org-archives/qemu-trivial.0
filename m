Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekGgH-0006fr-Jz
	for mharc-qemu-trivial@gnu.org; Fri, 09 Feb 2018 16:58:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <danielhb@linux.vnet.ibm.com>) id 1ekExJ-0004B0-OC
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 15:07:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <danielhb@linux.vnet.ibm.com>) id 1ekExF-0004LY-Oc
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 15:07:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <danielhb@linux.vnet.ibm.com>)
	id 1ekExF-0004Kp-FX
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 15:07:29 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w19K3Vi9040657
	for <qemu-trivial@nongnu.org>; Fri, 9 Feb 2018 15:07:28 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2g1fq1e2dg-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Fri, 09 Feb 2018 15:07:27 -0500
Received: from localhost
	by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <danielhb@linux.vnet.ibm.com>;
	Fri, 9 Feb 2018 15:07:26 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
	by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 9 Feb 2018 15:07:23 -0500
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
	[9.57.199.111])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	w19K7N9K48824338; Fri, 9 Feb 2018 20:07:23 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4D9BAC03A;
	Fri,  9 Feb 2018 15:08:44 -0500 (EST)
Received: from [9.85.155.97] (unknown [9.85.155.97])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 96E86AC043;
	Fri,  9 Feb 2018 15:08:43 -0500 (EST)
To: Yasmin Beatriz <yasmins@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org, joserz@linux.vnet.ibm.com
References: <20180209193138.97198-1-yasmins@linux.vnet.ibm.com>
From: Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>
Date: Fri, 9 Feb 2018 18:07:21 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180209193138.97198-1-yasmins@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18020920-0008-0000-0000-000002CF59D2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008505; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000251; SDB=6.00987343; UDB=6.00501152;
	IPR=6.00766701; 
	BA=6.00005821; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019465;
	XFM=3.00000015; UTC=2018-02-09 20:07:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18020920-0009-0000-0000-00003834AEC8
Message-Id: <1f0c05ec-511a-374d-4be0-7a01a9630867@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-02-09_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
	definitions=main-1802090253
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
X-Mailman-Approved-At: Fri, 09 Feb 2018 16:58:03 -0500
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] dump: Show custom message
 for ENOSPC
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
X-List-Received-Date: Fri, 09 Feb 2018 20:07:34 -0000

Hi Yasmin,

On 02/09/2018 05:31 PM, Yasmin Beatriz wrote:
> This patch intends to make a more specific message for when
> the system has not enough space to save guest memory.
>
> Reported-by: yilzhang@redhat.com
> Cc: Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>
> Signed-off-by: Yasmin Beatriz <yasmins@linux.vnet.ibm.com>
> ---
>   dump.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/dump.c b/dump.c
> index e9dfed060a..eb56ff53f6 100644
> --- a/dump.c
> +++ b/dump.c
> @@ -106,6 +106,9 @@ static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
>
>       written_size = qemu_write_full(s->fd, buf, size);
>       if (written_size != size) {
> +        if (errno == ENOSPC) {
> +            return -ENOSPC;
> +        }
You can do like this:


      if (written_size != size) {
+        return -errno;
+     }


Everyone is checking for a negative "ret" to see if an error occurred in 
qemu_write_full.
There is no negative errno AFAIK, so you can spare one "if" clause there 
and still
check for -ENOSPC down there.

It might be worth checking if this code can't be baked into 
qemu_write_full too.



Thanks,


Daniel

>           return -1;
>       }
>
> @@ -364,7 +367,11 @@ static void write_data(DumpState *s, void *buf, int length, Error **errp)
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


