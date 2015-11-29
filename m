Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2zVf-0005VT-Ud
	for mharc-qemu-trivial@gnu.org; Sun, 29 Nov 2015 05:47:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a2zVZ-0005JR-LV
	for qemu-trivial@nongnu.org; Sun, 29 Nov 2015 05:47:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a2zVY-0001fV-N4
	for qemu-trivial@nongnu.org; Sun, 29 Nov 2015 05:47:05 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41516)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a2zVT-0001et-LF; Sun, 29 Nov 2015 05:46:59 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8458643237;
	Sun, 29 Nov 2015 13:46:58 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 38687A68;
	Sun, 29 Nov 2015 13:46:58 +0300 (MSK)
Message-ID: <565AD7A2.9080409@msgid.tls.msk.ru>
Date: Sun, 29 Nov 2015 13:46:58 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1446824046-4478-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1446824046-4478-1-git-send-email-pbonzini@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] gt64xxx: fix decoding of ISD register
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
X-List-Received-Date: Sun, 29 Nov 2015 10:47:10 -0000

06.11.2015 18:34, Paolo Bonzini wrote:
> The GT64xxx's internal registers can be placed above the first 4 GiB
> in the address space, but not above the first 64 GiB.  Correctly cast
> the register to a 64-bit integer, and mask away bits above bit 35.

Applied to -trivial, thank you!

/mjt

