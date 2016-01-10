Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIK78-0001py-5B
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jan 2016 12:49:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIK76-0001nS-EP
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 12:49:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIK75-0002WS-F3
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 12:49:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44695)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIK6z-0002UR-FT; Sun, 10 Jan 2016 12:49:05 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 101B24035B;
	Sun, 10 Jan 2016 20:49:06 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org
References: <1450362312-7228-1-git-send-email-thuth@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56929990.7090806@msgid.tls.msk.ru>
Date: Sun, 10 Jan 2016 20:49:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1450362312-7228-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add the correct
	device_tree.h file
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
X-List-Received-Date: Sun, 10 Jan 2016 17:49:13 -0000

17.12.2015 17:25, Thomas Huth wrote:
> device_tree.h is not in the main directory, but under
> include/sysemu/ nowadays.

Applied to -trivial, thanks!

/mjt

