Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOVym-0001EF-CW
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 13:33:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOVyf-00011S-Ci
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 13:33:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOVyZ-0002yB-9K
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 13:33:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46375)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOVyN-0002vj-1o; Fri, 14 Mar 2014 13:32:43 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EC38341C8B;
	Fri, 14 Mar 2014 21:32:41 +0400 (MSK)
Message-ID: <53233D39.8050602@msgid.tls.msk.ru>
Date: Fri, 14 Mar 2014 21:32:41 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Cole Robinson <crobinso@redhat.com>
References: <1493d560c83eef5eefe313cb6b4a1d17985a2471.1394815720.git.crobinso@redhat.com>
In-Reply-To: <1493d560c83eef5eefe313cb6b4a1d17985a2471.1394815720.git.crobinso@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH v2 for-2.0] scripts/make-release: Don't
 distribute .git directories
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
X-List-Received-Date: Fri, 14 Mar 2014 17:33:07 -0000

14.03.2014 20:49, Cole Robinson wrote:
> [crobinso@localhost qemu-2.0.0-rc0]$ find . -name .git
> ./dtc/.git
> ./pixman/.git
> 
> This is already done for the rom submodules.

Thanks, applied to -trivial.

/mjt

