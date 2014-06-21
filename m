Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WyKZo-0005js-Oe
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jun 2014 08:39:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WyKZg-0005b5-DX
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 08:39:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WyKZa-0000Eo-6z
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 08:39:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46971)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WyKZN-0000BS-H4; Sat, 21 Jun 2014 08:38:57 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CDF6C43761;
	Sat, 21 Jun 2014 16:38:56 +0400 (MSK)
Message-ID: <53A57CE0.4070300@msgid.tls.msk.ru>
Date: Sat, 21 Jun 2014 16:38:56 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Cole Robinson <crobinso@redhat.com>, qemu-devel@nongnu.org
References: <92778d44f2f6c055c6caec15c83edc1c3723c272.1402946999.git.crobinso@redhat.com>
In-Reply-To: <92778d44f2f6c055c6caec15c83edc1c3723c272.1402946999.git.crobinso@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v4] configure: Enable TPM by default,
 add --disable-tpm
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
X-List-Received-Date: Sat, 21 Jun 2014 12:39:22 -0000

16.06.2014 23:32, Cole Robinson wrote:
> I don't see why tpm is disabled by default: it doesn't have any
> external dependencies, or change default behavior. Leaving it disabled
> is just going to cause it to bit rot.
> 
> Enable it by default, and add a --disable-tpm option.

Applied to -trivial, thank you!

/mjt

