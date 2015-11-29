Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2zaP-0000wP-2o
	for mharc-qemu-trivial@gnu.org; Sun, 29 Nov 2015 05:52:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a2zaM-0000sA-HY
	for qemu-trivial@nongnu.org; Sun, 29 Nov 2015 05:52:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a2zaL-0002gQ-KT
	for qemu-trivial@nongnu.org; Sun, 29 Nov 2015 05:52:02 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59371)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a2zaG-0002fx-93; Sun, 29 Nov 2015 05:51:56 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A72A543237;
	Sun, 29 Nov 2015 13:51:55 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 93077A68;
	Sun, 29 Nov 2015 13:51:55 +0300 (MSK)
Message-ID: <565AD8CB.7030305@msgid.tls.msk.ru>
Date: Sun, 29 Nov 2015 13:51:55 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1447936168-9808-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1447936168-9808-1-git-send-email-armbru@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] typedefs: Put them back into
	alphabetical order
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
X-List-Received-Date: Sun, 29 Nov 2015 10:52:03 -0000

19.11.2015 15:29, Markus Armbruster wrote:
> "Please keep this list in alphabetical order" has been more honoured
> in the breach than in the observance.  Clean up.
> 
> While there, drop a redundant struct declaration.

Applied to -trivial, thank you!

/mjt

