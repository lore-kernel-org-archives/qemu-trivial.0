Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aYVvt-00046S-8K
	for mharc-qemu-trivial@gnu.org; Wed, 24 Feb 2016 04:40:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1aYVvr-00046G-0T
	for qemu-trivial@nongnu.org; Wed, 24 Feb 2016 04:40:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1aYVvm-0000uP-3Z
	for qemu-trivial@nongnu.org; Wed, 24 Feb 2016 04:40:30 -0500
Received: from e06smtp08.uk.ibm.com ([195.75.94.104]:35406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1aYVvl-0000u0-Po
	for qemu-trivial@nongnu.org; Wed, 24 Feb 2016 04:40:26 -0500
Received: from localhost
	by e06smtp08.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Wed, 24 Feb 2016 09:40:22 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp08.uk.ibm.com (192.168.101.138) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 24 Feb 2016 09:40:18 -0000
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: cornelia.huck@de.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1627E17D805D; 
	Wed, 24 Feb 2016 09:40:39 +0000 (GMT)
Received: from d06av06.portsmouth.uk.ibm.com (d06av06.portsmouth.uk.ibm.com
	[9.149.37.217])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u1O9eHCe4784448; Wed, 24 Feb 2016 09:40:17 GMT
Received: from d06av06.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av06.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u1O9eHd7025961; Wed, 24 Feb 2016 04:40:17 -0500
Received: from gondolin (dyn-9-152-224-197.boeblingen.de.ibm.com
	[9.152.224.197])
	by d06av06.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u1O9eGVN025927; Wed, 24 Feb 2016 04:40:16 -0500
Date: Wed, 24 Feb 2016 10:40:15 +0100
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: Wei Yang <richard.weiyang@gmail.com>
Message-ID: <20160224104015.4d3430fc.cornelia.huck@de.ibm.com>
In-Reply-To: <1455895091-7589-3-git-send-email-richard.weiyang@gmail.com>
References: <1455895091-7589-1-git-send-email-richard.weiyang@gmail.com>
	<1455895091-7589-3-git-send-email-richard.weiyang@gmail.com>
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
x-cbid: 16022409-0033-0000-0000-000005E2E9F8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.104
Cc: qemu-trivial@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/2] s390x/pci: use PCI_MSIX_FLAGS on
 retrieving the MSIX entries
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
X-List-Received-Date: Wed, 24 Feb 2016 09:40:32 -0000

On Fri, 19 Feb 2016 15:18:11 +0000
Wei Yang <richard.weiyang@gmail.com> wrote:

> Even PCI_CAP_FLAGS has the same value as PCI_MSIX_FLAGS, the later one is
> the more proper on retrieving MSIX entries.
> 
> This patch uses PCI_MSIX_FLAGS to retrieve the MSIX entries.
> 
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> CC: Cornelia Huck <cornelia.huck@de.ibm.com>
> CC: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  hw/s390x/s390-pci-bus.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to s390-next.


