Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XmQha-0003Nh-IF
	for mharc-qemu-trivial@gnu.org; Thu, 06 Nov 2014 12:18:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1XmQhT-0003Ec-8i
	for qemu-trivial@nongnu.org; Thu, 06 Nov 2014 12:18:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1XmQhN-0003Qr-Pc
	for qemu-trivial@nongnu.org; Thu, 06 Nov 2014 12:18:23 -0500
Received: from cantor2.suse.de ([195.135.220.15]:53927 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1XmQhC-0003Lh-Bs; Thu, 06 Nov 2014 12:18:06 -0500
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 983CAADA1;
	Thu,  6 Nov 2014 17:18:05 +0000 (UTC)
Message-ID: <545BAD4C.6090006@suse.de>
Date: Thu, 06 Nov 2014 18:18:04 +0100
From: Alexander Graf <agraf@suse.de>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Fabien Chouteau <chouteau@adacore.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1415291030-15485-1-git-send-email-chouteau@adacore.com>
In-Reply-To: <1415291030-15485-1-git-send-email-chouteau@adacore.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Subject: Re: [Qemu-trivial] [PATCH] target-ppc: Fix breakpoint registers for
	e300
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
X-List-Received-Date: Thu, 06 Nov 2014 17:18:29 -0000



On 06.11.14 17:23, Fabien Chouteau wrote:
> In the previous patch, the registers were added to init_proc_G2LE
> instead of init_proc_e300.
> 
> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>

Thanks, applied to ppc-next (for 2.2).


Alex

