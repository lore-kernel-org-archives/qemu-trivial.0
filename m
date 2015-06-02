Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yzelp-0000wg-60
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 01:29:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yzell-0000rK-PN
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 01:29:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yzelk-0004xV-8F
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 01:29:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43058)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yzelc-0004s4-K5; Tue, 02 Jun 2015 01:29:36 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6DB2540423;
	Tue,  2 Jun 2015 08:29:33 +0300 (MSK)
Message-ID: <556D3F3C.1090506@msgid.tls.msk.ru>
Date: Tue, 02 Jun 2015 08:29:32 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>, 
	qemu-devel@nongnu.org
References: <1432925572-487-1-git-send-email-dgilbert@redhat.com>
In-Reply-To: <1432925572-487-1-git-send-email-dgilbert@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, armbru@redhat.com, quintela@redhat.com--dry-run
Subject: Re: [Qemu-trivial] [PATCH 1/1] Add -incoming help text
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
X-List-Received-Date: Tue, 02 Jun 2015 05:29:47 -0000

29.05.2015 21:52, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The help/man text for
> 
> -incoming defer
> 
> didn't make it through the merge of the code that implemented it.

Applied to -trivial, with the more verbose text for the documentation.

Thank you very much!

/mjt

