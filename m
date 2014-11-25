Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XtHUs-00052X-Rl
	for mharc-qemu-trivial@gnu.org; Tue, 25 Nov 2014 09:53:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XtHUk-0004tj-V3
	for qemu-trivial@nongnu.org; Tue, 25 Nov 2014 09:53:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XtHUe-0000CU-Q7
	for qemu-trivial@nongnu.org; Tue, 25 Nov 2014 09:53:34 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41720)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XtHUS-00007V-9a; Tue, 25 Nov 2014 09:53:16 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id AFF23443B6;
	Tue, 25 Nov 2014 17:53:06 +0300 (MSK)
Message-ID: <547497D2.6040000@msgid.tls.msk.ru>
Date: Tue, 25 Nov 2014 17:53:06 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Amos Kong <akong@redhat.com>, qemu-devel@nongnu.org
References: <1416902756-26593-1-git-send-email-akong@redhat.com>
In-Reply-To: <1416902756-26593-1-git-send-email-akong@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qmp: fix typo in input-send-event
	examples
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
X-List-Received-Date: Tue, 25 Nov 2014 14:53:41 -0000

25.11.2014 11:05, Amos Kong wrote:
> Lack of two closed bracket in json commands.

Applied to -trivial, thank you!

/mjt

