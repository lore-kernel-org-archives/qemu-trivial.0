Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhC0O-00035i-Ka
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 02:36:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhC0G-0002vi-UH
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:36:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhC0A-0000Is-Me
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:36:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55784)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XhBzy-0000Gf-45; Thu, 23 Oct 2014 02:35:50 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 650DC45ABE;
	Thu, 23 Oct 2014 10:35:49 +0400 (MSK)
Message-ID: <5448A1C3.5030703@msgid.tls.msk.ru>
Date: Thu, 23 Oct 2014 10:35:47 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1411760764-18292-1-git-send-email-ehabkost@redhat.com>
In-Reply-To: <1411760764-18292-1-git-send-email-ehabkost@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 0/3] bitops: Header dependency fixes
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
X-List-Received-Date: Thu, 23 Oct 2014 06:36:15 -0000

On 09/26/2014 11:46 PM, Eduardo Habkost wrote:
> This series adds a missing include, kills a circular header dependency, and
> avoid including qemu-common.h from a header to avoid new circular dependencies.
> 
> Eduardo Habkost (3):
>   tests: Add missing include to test-bitops.c
>   bitops.h: Don't include qemu-common.h
>   bitmap.h: Don't include qemu-common.h

Applied all 3 to -trivial, _finally_ :)

Thank you!

/mjt

