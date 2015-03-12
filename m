Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YW02Y-0005cM-BX
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 06:08:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YW02V-0005cC-Kz
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 06:08:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YW02Q-0008I4-HQ
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 06:08:27 -0400
Received: from e23smtp03.au.ibm.com ([202.81.31.145]:36436)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YW02P-0008HM-Te
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 06:08:22 -0400
Received: from /spool/local
	by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Thu, 12 Mar 2015 20:08:15 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 12 Mar 2015 20:08:12 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id DE2A73578048;
	Thu, 12 Mar 2015 21:08:11 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	t2CA810Q55050322; Thu, 12 Mar 2015 21:08:11 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
	by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	t2CA7a9S001365; Thu, 12 Mar 2015 21:07:36 +1100
Received: from skywalker.linux.vnet.ibm.com (skywalker.in.ibm.com
	[9.193.66.152])
	by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2CA7Xaf000303
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Thu, 12 Mar 2015 21:07:35 +1100
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
In-Reply-To: <1426142172-30886-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1426142172-30886-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Notmuch/0.19+30~gd241a48 (http://notmuchmail.org) Emacs/24.3.1
	(x86_64-pc-linux-gnu)
Date: Thu, 12 Mar 2015 15:37:09 +0530
Message-ID: <87385abkc2.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031210-0009-0000-0000-0000010B89AA
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 202.81.31.145
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [Qemu-trivial] [PATCH v2] 9pfs-proxy: tiny cleanups in
	proxy_pwritev and proxy_preadv
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
X-List-Received-Date: Thu, 12 Mar 2015 10:08:28 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> Don't compare syscall return with -1, use "<0" condition.
> Don't introduce useless local variables when we already
> have similar variable
> Rename local variable to be consistent with other usages
> Finally make the two methods, read and write, to be similar to each other
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Applied.

Thanks
-aneesh


