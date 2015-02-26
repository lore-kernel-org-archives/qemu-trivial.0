Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQxMb-0005iv-FR
	for mharc-qemu-trivial@gnu.org; Thu, 26 Feb 2015 07:16:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1YQxMX-0005cB-Id
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 07:16:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1YQxMW-0006Em-Tw
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 07:16:17 -0500
Received: from cantor2.suse.de ([195.135.220.15]:58148 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1YQxMS-00064v-FI; Thu, 26 Feb 2015 07:16:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E6558AB09;
	Thu, 26 Feb 2015 12:16:11 +0000 (UTC)
Message-ID: <54EF0E8A.8060701@suse.de>
Date: Thu, 26 Feb 2015 13:16:10 +0100
From: Alexander Graf <agraf@suse.de>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Fabien Chouteau <chouteau@adacore.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1424857828-4411-1-git-send-email-chouteau@adacore.com>
In-Reply-To: <1424857828-4411-1-git-send-email-chouteau@adacore.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Subject: Re: [Qemu-trivial] [PATCH] Openpic: check that cpu id is within the
	number of cpus
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
X-List-Received-Date: Thu, 26 Feb 2015 12:16:18 -0000



On 25.02.15 10:50, Fabien Chouteau wrote:
> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>

Thanks, applied to ppc-next. Next time please include a commit message
though ;).


Alex

