Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UiRQi-0005RE-2t
	for mharc-qemu-trivial@gnu.org; Fri, 31 May 2013 11:39:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UiRQf-0005Ol-FN
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 11:39:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UiRQe-0005LO-1M
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 11:39:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48725)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UiRQU-0005HU-PX; Fri, 31 May 2013 11:39:34 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D0E6E42B7C;
	Fri, 31 May 2013 19:39:25 +0400 (MSK)
Message-ID: <51A8C42B.6020502@msgid.tls.msk.ru>
Date: Fri, 31 May 2013 19:39:23 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1370001627-11830-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1370001627-11830-1-git-send-email-pbonzini@redhat.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] do not check pointers after
 dereferencing them
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
X-List-Received-Date: Fri, 31 May 2013 15:39:46 -0000

31.05.2013 16:00, Paolo Bonzini wrote:
> Two instances, both spotted by Coverity.  In one, two blocks were
> swapped.  In the other, the check is not needed anymore.

Thanks, applied to the trivial patches queue.

/mjt

