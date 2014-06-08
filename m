Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtdQ7-0008Ev-2D
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jun 2014 09:45:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WtdPz-00088s-An
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 09:45:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WtdPt-0003XY-7z
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 09:45:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37966)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WtdPg-0003WP-Lo; Sun, 08 Jun 2014 09:45:32 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 112AF40DD7;
	Sun,  8 Jun 2014 17:45:32 +0400 (MSK)
Message-ID: <539468FB.7060300@msgid.tls.msk.ru>
Date: Sun, 08 Jun 2014 17:45:31 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1402072328-6871-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1402072328-6871-1-git-send-email-armbru@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, alevy@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] libcacard: Drop superfluous conditionals
 around g_free()
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
X-List-Received-Date: Sun, 08 Jun 2014 13:45:57 -0000

Applied both to -trivial, thank you!

/mjt

