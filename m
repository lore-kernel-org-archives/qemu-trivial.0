Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dGMeJ-0004ne-U1
	for mharc-qemu-trivial@gnu.org; Thu, 01 Jun 2017 05:44:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dGMeH-0004mJ-7F
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 05:44:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dGMeG-0007kb-GY
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 05:44:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dGMeC-0007bl-7g; Thu, 01 Jun 2017 05:44:04 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4DBA140122;
	Thu,  1 Jun 2017 12:43:53 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 2F6DA5DA;
	Thu,  1 Jun 2017 12:43:53 +0300 (MSK)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20170523174420.8903-1-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com, armbru@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <6879a8a1-cb9b-979f-4ea5-96d91820b68a@msgid.tls.msk.ru>
Date: Thu, 1 Jun 2017 12:43:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170523174420.8903-1-eblake@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2] qapi: Fix some QMP documentation
 regressions
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
X-List-Received-Date: Thu, 01 Jun 2017 09:44:10 -0000

23.05.2017 20:44, Eric Blake wrote:
> In the process of getting rid of docs/qmp-commands.txt, we managed
> to regress on some of the text that changed after the point where
> the move was first branched and when the move actually occurred.
> For example, commit 3282eca for blockdev-snapshot re-added the
> extra "options" layer which had been cleaned up in commit 0153d2f.
..
Applied to -trivial, thanks!

/mjt

