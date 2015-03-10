Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVDLw-0000NB-B1
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 02:09:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVDLu-0000LK-0G
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:09:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVDLt-00006T-6E
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:09:13 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41683)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVDLo-00005Q-1m; Tue, 10 Mar 2015 02:09:08 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7ACB441302;
	Tue, 10 Mar 2015 09:09:07 +0300 (MSK)
Message-ID: <54FE8A83.3030805@msgid.tls.msk.ru>
Date: Tue, 10 Mar 2015 09:09:07 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1425632998-616-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1425632998-616-1-git-send-email-armbru@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 0/2] monitor: Fix and clean up around
	.user_print
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
X-List-Received-Date: Tue, 10 Mar 2015 06:09:15 -0000

06.03.2015 12:09, Markus Armbruster wrote:
> A more thorough cleanup of the area is in the works, but I want to get
> this out quickly, so it makes 2.3.
> 
> I think it can go via -trivial, if Luiz doesn't mind.

Applied to -trivial for now, thank you!

/mjt

