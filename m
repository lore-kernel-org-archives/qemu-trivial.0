Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvGIq-0006sA-AP
	for mharc-qemu-trivial@gnu.org; Tue, 15 Jan 2013 18:52:24 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agarcia@igalia.com>) id 1TvGIn-0006rf-65
	for qemu-trivial@nongnu.org; Tue, 15 Jan 2013 18:52:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agarcia@igalia.com>) id 1TvGIm-00081J-9c
	for qemu-trivial@nongnu.org; Tue, 15 Jan 2013 18:52:21 -0500
Received: from smtp4.mundo-r.com ([212.51.32.151]:64417)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agarcia@igalia.com>)
	id 1TvGIm-000816-2o; Tue, 15 Jan 2013 18:52:20 -0500
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: At8HAJtkv1BbdWObgWdsb2JhbABEg0e5YQKBARYOAQEWJieCHgEBBAE6PwULCw4TJQ8FKA0BE4gdCrNljkSNGoJ9YQOWAgGTLA4
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 16 Jan 2013 00:52:17 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1TvGIj-0002TW-7Q; Wed, 16 Jan 2013 00:52:17 +0100
Received: from berto by mail.igalia.com with local (Exim)
	id 1TvGIj-0004Ad-1v; Wed, 16 Jan 2013 00:52:17 +0100
Date: Wed, 16 Jan 2013 00:52:17 +0100
From: Alberto Garcia <agarcia@igalia.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130115235216.GA15949@igalia.com>
References: <1358288603-28102-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1358288603-28102-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.151
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hw/tpci200: Fix compiler warning
 (redefined symbol with MinGW)
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
X-List-Received-Date: Tue, 15 Jan 2013 23:52:22 -0000

On Tue, Jan 15, 2013 at 11:23:23PM +0100, Stefan Weil wrote:

> STATUS_TIMEOUT is defined in winnt.h:

> Fix the compiler warning by adding a prefix.

Hey, thanks.

If it doesn't conflict with anything else in Windows we could also
replace it with STATUS_TIME, which is the actual name of the status
bit as it appears on the TPCI200 manual.

Berto

