Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bSn7S-0006fE-EV
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jul 2016 11:21:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bSn7Q-0006cV-2a
	for qemu-trivial@nongnu.org; Thu, 28 Jul 2016 11:21:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bSn7O-0001PJ-A6
	for qemu-trivial@nongnu.org; Thu, 28 Jul 2016 11:21:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49876)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bSn7I-0001NG-00; Thu, 28 Jul 2016 11:20:56 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 50567429BB;
	Thu, 28 Jul 2016 18:20:45 +0300 (MSK)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1465417619-31639-1-git-send-email-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, famz@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <2db8a710-75d9-6fee-41d9-a17af2ff374b@msgid.tls.msk.ru>
Date: Thu, 28 Jul 2016 18:20:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1465417619-31639-1-git-send-email-eblake@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] maint: Ignore generated version file
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2016 15:21:05 -0000

08.06.2016 23:26, Eric Blake wrote:
> Commit 67a1de0d created a generated version file, and, in some
> circumstances, also a temporary file.  Make sure 'git add .'
> won't check them into the repository.

Applied to -trivial, thanks!

/mjt

