Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxDMf-0008E2-V0
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2016 09:26:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1bxDMY-0007yh-O8
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 09:26:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1bxDMU-00064a-Mv
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 09:26:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53661)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cornelia.huck@de.ibm.com>)
	id 1bxDMU-00064J-D1
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 09:26:22 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	u9KDOZJF146431
	for <qemu-trivial@nongnu.org>; Thu, 20 Oct 2016 09:26:21 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
	by mx0a-001b2d01.pphosted.com with ESMTP id 266u9pkat7-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Thu, 20 Oct 2016 09:26:21 -0400
Received: from localhost
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Thu, 20 Oct 2016 14:26:19 +0100
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 20 Oct 2016 14:26:16 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0839517D805A; 
	Thu, 20 Oct 2016 14:28:28 +0100 (BST)
Received: from d06av09.portsmouth.uk.ibm.com (d06av09.portsmouth.uk.ibm.com
	[9.149.37.250])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u9KDQFLJ62587034; Thu, 20 Oct 2016 13:26:15 GMT
Received: from d06av09.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u9KDQFIh022257; Thu, 20 Oct 2016 07:26:15 -0600
Received: from gondolin (dyn-9-152-224-124.boeblingen.de.ibm.com
	[9.152.224.124])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u9KDQFqJ022238; Thu, 20 Oct 2016 07:26:15 -0600
Date: Thu, 20 Oct 2016 15:26:12 +0200
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Richard Henderson
	<rth@twiddle.net>, Alexander Graf <agraf@suse.de>, Christian Borntraeger
	<borntraeger@de.ibm.com>
In-Reply-To: <1476968226-15918-1-git-send-email-peter.maydell@linaro.org>
References: <1476968226-15918-1-git-send-email-peter.maydell@linaro.org>
Organization: IBM Deutschland Research & Development GmbH Vorsitzende des
	Aufsichtsrats: Martina Koederitz
	=?UTF-8?B?R2VzY2jDpGZ0c2bDvGhydW5nOg==?=
	Dirk Wittkopp Sitz der Gesellschaft: =?UTF-8?B?QsO2Ymxpbmdlbg==?=
	Registergericht: Amtsgericht Stuttgart, HRB 243294
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102013-0008-0000-0000-000002E34537
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102013-0009-0000-0000-00001A6931DB
Message-Id: <20161020152612.7f7dadf6.cornelia.huck@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-10-20_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1610200240
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-trivial] [PATCH] s390: avoid always-true comparison in
 s390_pci_generate_fid()
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
X-List-Received-Date: Thu, 20 Oct 2016 13:26:32 -0000

On Thu, 20 Oct 2016 13:57:06 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> Coverity points out that the comparison "fid <= ZPCI_MAX_FID"
> in s390_pci_generate_fid() is always true (because fid
> is 32 bits and ZPCI_MAX_FID is 0xffffffff). This isn't a
> bug because the real loop termination condition is
> expressed later via an "if (...) break;" inside the loop,
> but it is a bit odd. Rephrase the loop to avoid the
> unnecessary duplicate-but-never-true conditional.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/s390x/s390-pci-bus.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Acked-by: Cornelia Huck <cornelia.huck@de.ibm.com>

I assume this will go via the trivial tree?


