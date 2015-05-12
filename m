Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YsB5B-0005oN-OI
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2015 10:22:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1Ys4jV-00035U-5O
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 03:36:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1Ys4jP-0005xF-RY
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 03:36:05 -0400
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:42700)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1Ys4jP-0005ws-Gm
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 03:35:59 -0400
Received: from /spool/local
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Tue, 12 May 2015 08:35:57 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 12 May 2015 08:35:54 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0ECAA2190067; 
	Tue, 12 May 2015 08:35:36 +0100 (BST)
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t4C7Zslb54132976; Tue, 12 May 2015 07:35:54 GMT
Received: from d06av03.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t4C7Zrku014532; Tue, 12 May 2015 01:35:54 -0600
Received: from gondolin (dyn-9-152-224-143.boeblingen.de.ibm.com
	[9.152.224.143])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t4C7Zq9K014514; Tue, 12 May 2015 01:35:53 -0600
Date: Tue, 12 May 2015 09:35:51 +0200
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: shannon.zhao@linaro.org
Message-ID: <20150512093551.3156908f.cornelia.huck@de.ibm.com>
In-Reply-To: <1431397521-2316-2-git-send-email-shannon.zhao@linaro.org>
References: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
	<1431397521-2316-2-git-send-email-shannon.zhao@linaro.org>
Organization: IBM Deutschland Research & Development GmbH Vorsitzende des
	Aufsichtsrats: Martina Koederitz
	=?UTF-8?B?R2VzY2jDpGZ0c2bDvGhydW5nOg==?=
	Dirk Wittkopp Sitz der Gesellschaft: =?UTF-8?B?QsO2Ymxpbmdlbg==?=
	Registergericht: Amtsgericht Stuttgart, HRB 243294
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; i686-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15051207-0041-0000-0000-00000434E53F
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.106
X-Mailman-Approved-At: Tue, 12 May 2015 10:22:51 -0400
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, zhaoshenglong@huawei.com,
	christoffer.dall@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/6]
 hw/s390x/s390-virtio-bus: Remove meaningless blank Property
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 May 2015 07:36:06 -0000

On Tue, 12 May 2015 10:25:16 +0800
shannon.zhao@linaro.org wrote:

> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/s390x/s390-virtio-bus.c | 15 ---------------
>  1 file changed, 15 deletions(-)
> 

Acked-by: Cornelia Huck <cornelia.huck@de.ibm.com>


