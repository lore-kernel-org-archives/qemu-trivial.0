Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WyKTI-0003KP-Lb
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jun 2014 08:32:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WyKTB-0003CY-DE
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 08:32:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WyKT5-0005xu-8I
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 08:32:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WyKSs-0005rg-Ph; Sat, 21 Jun 2014 08:32:14 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B76F141E41;
	Sat, 21 Jun 2014 16:32:04 +0400 (MSK)
Message-ID: <53A57B44.2090004@msgid.tls.msk.ru>
Date: Sat, 21 Jun 2014 16:32:04 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1402564853-20792-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1402564853-20792-1-git-send-email-pbonzini@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, amit.shah@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] virtio-serial: remove useless set_config
 function
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
X-List-Received-Date: Sat, 21 Jun 2014 12:32:39 -0000

12.06.2014 13:20, Paolo Bonzini wrote:
> Its only contents are a dead memcpy.  Since it is optional,
> drop the function altogether.

Applied to -trivial, thanks!

/mjt

