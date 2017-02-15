Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdwxt-0004ix-U2
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2017 05:37:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdwxr-0004cc-3u
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:37:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdwxp-0006MV-Sy
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:37:35 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49228)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cdwxl-0006Ln-7N; Wed, 15 Feb 2017 05:37:29 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F25AD4217C;
	Wed, 15 Feb 2017 13:37:27 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 3B39C264;
	Wed, 15 Feb 2017 13:37:27 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1484309555-1935-1-git-send-email-thuth@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <879e9f0f-9f95-e018-7b42-794f42c1dda4@msgid.tls.msk.ru>
Date: Wed, 15 Feb 2017 13:37:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1484309555-1935-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v4] monitor: Fix crashes when using HMP
 commands without CPU
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
X-List-Received-Date: Wed, 15 Feb 2017 10:37:36 -0000

13.01.2017 15:12, Thomas Huth wrote:
> When running certain HMP commands ("info registers", "info cpustats",
> "info tlb", "nmi", "memsave" or dumping virtual memory) with the "none"
> machine, QEMU crashes with a segmentation fault. This happens because the
> "none" machine does not have any CPUs by default, but these HMP commands
> did not check for a valid CPU pointer yet. Add such checks now, so we get
> an error message about the missing CPU instead.

(finally) applied to -trivial, thank you!

/mjt

