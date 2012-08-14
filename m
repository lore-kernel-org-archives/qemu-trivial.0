Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1HuX-00017c-Cz
	for mharc-qemu-trivial@gnu.org; Tue, 14 Aug 2012 10:15:57 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agarcia@igalia.com>) id 1T1HuV-00017W-VV
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2012 10:15:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agarcia@igalia.com>) id 1T1HuU-0005Ca-K3
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2012 10:15:55 -0400
Received: from smtp4.mundo-r.com ([212.51.32.151]:53860)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agarcia@igalia.com>)
	id 1T1HuU-0004kQ-Cq; Tue, 14 Aug 2012 10:15:54 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AoMEAGNcKlBbdWObgWdsb2JhbABEuRYEBHIiAQEWJieCIAEBBAE6PwULCw44FCghiBoKuS+LBYVRYAOVSgGScQ
X-IronPort-AV: E=Sophos;i="4.77,767,1336341600"; d="scan'208";a="957207253"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 14 Aug 2012 16:15:37 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1T1HuD-0007KW-CP; Tue, 14 Aug 2012 16:15:37 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1T1HuD-00077y-7B; Tue, 14 Aug 2012 16:15:37 +0200
Date: Tue, 14 Aug 2012 16:15:37 +0200
From: Alberto Garcia <agarcia@igalia.com>
To: Luiz Capitulino <lcapitulino@redhat.com>
Message-ID: <20120814141537.GA27231@igalia.com>
References: <1344944488-27075-1-git-send-email-agarcia@igalia.com>
	<20120814104230.64aed4e3@doriath.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120814104230.64aed4e3@doriath.home>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.151
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] ivshmem,
	qdev-monitor: fix order of qerror parameters
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
X-List-Received-Date: Tue, 14 Aug 2012 14:15:56 -0000

On Tue, Aug 14, 2012 at 10:42:30AM -0300, Luiz Capitulino wrote:

> Additionally, we should check all old QERR_ macros to see if anyone
> else swaps parameters like this and change them too.

Yes, I also noticed the problem and checked all QERR_ macros, I only
found the two that I corrected in the patch, but double checking the
list won't hurt I guess :)

Berto

