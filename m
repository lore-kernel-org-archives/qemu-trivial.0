Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dDAxO-00080c-1T
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2017 10:38:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dDAxL-0007yc-Tw
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 10:38:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dDAxL-0002FU-7m
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 10:38:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52671)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dDAxF-00029r-SP; Tue, 23 May 2017 10:38:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 27C064196E;
	Tue, 23 May 2017 17:38:33 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 0C940437;
	Tue, 23 May 2017 17:38:33 +0300 (MSK)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1494322876-28843-1-git-send-email-armbru@redhat.com>
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <ae03d630-69a7-2a86-4fc4-ece2a82fc358@msgid.tls.msk.ru>
Date: Tue, 23 May 2017 17:38:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494322876-28843-1-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 0/2] docs: Minor updates around ide-drive
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
X-List-Received-Date: Tue, 23 May 2017 14:38:40 -0000

09.05.2017 12:41, Markus Armbruster wrote:
> Markus Armbruster (2):
>   docs qemu-doc: Avoid ide-drive, it's deprecated
>   docs/qdev-device-use.txt: update section Default Devices

Applied to -trivial, thanks!

/mjt

