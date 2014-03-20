Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQfNR-0002DG-Rs
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2014 11:59:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WQfNK-00025G-7e
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 11:59:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WQfNE-0004l7-7T
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 11:59:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33476)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WQfN1-0004hg-Qf; Thu, 20 Mar 2014 11:59:03 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 18AEC42A21;
	Thu, 20 Mar 2014 19:59:03 +0400 (MSK)
Message-ID: <532B1047.3010506@msgid.tls.msk.ru>
Date: Thu, 20 Mar 2014 19:59:03 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1395080791-18640-1-git-send-email-ehabkost@redhat.com>
In-Reply-To: <1395080791-18640-1-git-send-email-ehabkost@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH v3] CODING_STYLE: Section about mixed
	declarations
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
X-List-Received-Date: Thu, 20 Mar 2014 15:59:28 -0000

17.03.2014 22:26, Eduardo Habkost wrote:
> We had an unwritten rule about declarations having to be at beginning of
> blocks. Make it a written rule.

Thanks, applied to -trivial.

/mjt

