Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a4Q6r-0008Iw-Qq
	for mharc-qemu-trivial@gnu.org; Thu, 03 Dec 2015 04:23:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4Q6p-0008Fg-Fg
	for qemu-trivial@nongnu.org; Thu, 03 Dec 2015 04:23:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4Q6o-0002hA-NX
	for qemu-trivial@nongnu.org; Thu, 03 Dec 2015 04:23:27 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49335)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a4Q6j-0002dp-BS; Thu, 03 Dec 2015 04:23:21 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9B53A40522;
	Thu,  3 Dec 2015 12:23:11 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 7A9D0A6C;
	Thu,  3 Dec 2015 12:23:11 +0300 (MSK)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1448877445-16981-1-git-send-email-pbonzini@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <566009FF.4060409@msgid.tls.msk.ru>
Date: Thu, 3 Dec 2015 12:23:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.4.0
MIME-Version: 1.0
In-Reply-To: <1448877445-16981-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v5] bt: check struct sizes
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
X-List-Received-Date: Thu, 03 Dec 2015 09:23:28 -0000

30.11.2015 12:57, Paolo Bonzini wrote:
> See http://permalink.gmane.org/gmane.linux.bluez.kernel/36505.  For historical
> reasons these do not use sizeof, and Coverity caught a mistake in
> EVT_ENCRYPT_CHANGE_SIZE.
...

Applied to -trivial.  Oh well!.. :)

Thanks,

/mjt

