Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WdUsi-0007CV-1e
	for mharc-qemu-trivial@gnu.org; Thu, 24 Apr 2014 21:24:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WdUks-0006Is-OF
	for qemu-trivial@nongnu.org; Thu, 24 Apr 2014 21:17:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WdK53-0004Lb-9g
	for qemu-trivial@nongnu.org; Thu, 24 Apr 2014 09:52:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WdK4v-0004AJ-NV; Thu, 24 Apr 2014 09:52:41 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E3B0142CD7;
	Thu, 24 Apr 2014 17:52:40 +0400 (MSK)
Message-ID: <53591728.40709@msgid.tls.msk.ru>
Date: Thu, 24 Apr 2014 17:52:40 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1397804136-12919-1-git-send-email-famz@redhat.com>
In-Reply-To: <1397804136-12919-1-git-send-email-famz@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] configure: Improve help behavior
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
X-List-Received-Date: Fri, 25 Apr 2014 01:24:46 -0000

18.04.2014 10:55, Fam Zheng wrote:
> Old:
> There are two paths to show help and exit 1, one is with "-h" or
> "--help", one is with invalid options.
> 
> New:
> Show help and exit 0 for --help.
> On invalid option, don't show the long help and bury the early "ERROR:"
> line, just give a message pointing to --help.

Applied to -trivial, thanks!

/mjt

