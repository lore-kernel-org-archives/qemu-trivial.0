Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekGgJ-0006i0-D7
	for mharc-qemu-trivial@gnu.org; Fri, 09 Feb 2018 16:58:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <muriloo@linux.vnet.ibm.com>) id 1ekFHB-0001Gm-2D
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 15:28:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <muriloo@linux.vnet.ibm.com>) id 1ekFH8-0001lH-SG
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 15:28:05 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43124)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <muriloo@linux.vnet.ibm.com>)
	id 1ekFH8-0001kD-KQ
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 15:28:02 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w19KRur1002356
	for <qemu-trivial@nongnu.org>; Fri, 9 Feb 2018 15:27:59 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2g1c3n9wye-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Fri, 09 Feb 2018 15:27:59 -0500
Received: from localhost
	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <muriloo@linux.vnet.ibm.com>;
	Fri, 9 Feb 2018 13:27:58 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
	by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 9 Feb 2018 13:27:56 -0700
Received: from b03ledav004.gho.boulder.ibm.com
	(b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id w19KRuDW12255666; Fri, 9 Feb 2018 13:27:56 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65EAA78038;
	Fri,  9 Feb 2018 13:27:56 -0700 (MST)
Received: from [9.85.131.250] (unknown [9.85.131.250])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id CFA1B78037; 
	Fri,  9 Feb 2018 13:27:54 -0700 (MST)
To: Yasmin Beatriz <yasmins@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org, joserz@linux.vnet.ibm.com
References: <20180209193138.97198-1-yasmins@linux.vnet.ibm.com>
From: Murilo Opsfelder Araujo <muriloo@linux.vnet.ibm.com>
Organization: IBM
Date: Fri, 9 Feb 2018 18:27:53 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180209193138.97198-1-yasmins@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18020920-0012-0000-0000-000015B954B3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008505; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000251; SDB=6.00987350; UDB=6.00501156;
	IPR=6.00766707; 
	BA=6.00005821; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019466;
	XFM=3.00000015; UTC=2018-02-09 20:27:57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18020920-0013-0000-0000-0000516BE04C
Message-Id: <a41b6688-7b61-c988-03fe-9d55f2e13d26@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-02-09_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
	definitions=main-1802090258
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
X-List-Received-Date: Fri, 09 Feb 2018 20:28:06 -0000

Hi, Yasmin.

Congratulations on your first patch!

On 02/09/2018 05:31 PM, Yasmin Beatriz wrote:
> This patch intends to make a more specific message for when
> the system has not enough space to save guest memory.
> 
> Reported-by: yilzhang@redhat.com
> Cc: Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>
> Signed-off-by: Yasmin Beatriz <yasmins@linux.vnet.ibm.com>
> ---
>  dump.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/dump.c b/dump.c
> index e9dfed060a..eb56ff53f6 100644
> --- a/dump.c
> +++ b/dump.c
> @@ -106,6 +106,9 @@ static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
> 
>      written_size = qemu_write_full(s->fd, buf, size);
>      if (written_size != size) {
> +        if (errno == ENOSPC) {
> +            return -ENOSPC;
> +        }
>          return -1;
>      }
> 
> @@ -364,7 +367,11 @@ static void write_data(DumpState *s, void *buf, int length, Error **errp)
> 
>      ret = fd_write_vmcore(buf, length, s);
>      if (ret < 0) {
> -        error_setg(errp, "dump: failed to save memory");
> +        if (ret == -ENOSPC) {
> +            error_setg(errp, "dump: not enough space to save memory");
> +        } else {
> +            error_setg(errp, "dump: failed to save memory");
> +        }

If fd_write_vmcore() returned -errno, as Daniel Barboza suggested, it
could be used in error_setg_errno(). Something like this:

diff --git a/dump.c b/dump.c
index e9dfed060a..313a7460a7 100644
--- a/dump.c
+++ b/dump.c
@@ -106,7 +106,7 @@ static int fd_write_vmcore(const void *buf, size_t
size, void *opaque)

     written_size = qemu_write_full(s->fd, buf, size);
     if (written_size != size) {
-        return -1;
+        return -errno;
     }

     return 0;
@@ -364,7 +364,7 @@ static void write_data(DumpState *s, void *buf, int
length, Error **errp)

     ret = fd_write_vmcore(buf, length, s);
     if (ret < 0) {
-        error_setg(errp, "dump: failed to save memory");
+        error_setg_errno(errp, ret, "dump: failed to save memory");
     } else {
         s->written_size += length;
     }

With this, other reasons of errno would also be considered, not only ENOSPC.

Cheers
Murilo


