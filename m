Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIK6Q-0000sY-4f
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jan 2016 12:48:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIK6O-0000rF-7u
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 12:48:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIK6N-0002NX-FS
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 12:48:28 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIK67-0002Hr-EN; Sun, 10 Jan 2016 12:48:11 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0559C4035A;
	Sun, 10 Jan 2016 20:48:12 +0300 (MSK)
To: Zhu Lingshan <lszhu@suse.com>, qemu-block@nongnu.org
References: <1450240840-563-1-git-send-email-lszhu@suse.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <5692995A.9080103@msgid.tls.msk.ru>
Date: Sun, 10 Jan 2016 20:48:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1450240840-563-1-git-send-email-lszhu@suse.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, pl@kamp.de,
	qemu-devel@nongnu.org, ronniesahlberg@gmail.com
Subject: Re: [Qemu-trivial] [PATCH] iscsi: fix readcapacity error message
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
X-List-Received-Date: Sun, 10 Jan 2016 17:48:29 -0000

16.12.2015 07:40, Zhu Lingshan wrote:
> fix:The error message for readcapacity 16 incorrectly mentioned
> a readcapacity 10 failure, fixed the error message.

Applied to -trivial, thanks!

/mjt

