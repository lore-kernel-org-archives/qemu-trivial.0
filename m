Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YAawI-00066w-Um
	for mharc-qemu-trivial@gnu.org; Mon, 12 Jan 2015 04:05:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YAawG-00064H-36
	for qemu-trivial@nongnu.org; Mon, 12 Jan 2015 04:05:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YAawF-0003Hf-AQ
	for qemu-trivial@nongnu.org; Mon, 12 Jan 2015 04:05:31 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37222)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YAaw8-0003Fn-CX; Mon, 12 Jan 2015 04:05:24 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id F258C406C6;
	Mon, 12 Jan 2015 12:05:22 +0300 (MSK)
Message-ID: <54B38E52.6090603@msgid.tls.msk.ru>
Date: Mon, 12 Jan 2015 12:05:22 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1420797589-17049-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1420797589-17049-1-git-send-email-pbonzini@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] blizzard: do not depend on VGA internals
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
X-List-Received-Date: Mon, 12 Jan 2015 09:05:33 -0000

09.01.2015 12:59, Paolo Bonzini wrote:
> There is nothing that is used by this ARM-specific device.

Indeed.

Applied to -trivial, thank you!

/mjt

