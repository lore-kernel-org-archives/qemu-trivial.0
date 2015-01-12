Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YAazf-0008Ti-B6
	for mharc-qemu-trivial@gnu.org; Mon, 12 Jan 2015 04:09:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YAaze-0008SE-0k
	for qemu-trivial@nongnu.org; Mon, 12 Jan 2015 04:09:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YAazc-0004lz-Ty
	for qemu-trivial@nongnu.org; Mon, 12 Jan 2015 04:09:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60823)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YAazU-0004if-PO; Mon, 12 Jan 2015 04:08:52 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 349A2406C6;
	Mon, 12 Jan 2015 12:08:52 +0300 (MSK)
Message-ID: <54B38F24.9000605@msgid.tls.msk.ru>
Date: Mon, 12 Jan 2015 12:08:52 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: Marcel Apfelbaum <marcel@redhat.com>, qemu-trivial@nongnu.org
References: <1420973811-21710-1-git-send-email-marcel@redhat.com>
In-Reply-To: <1420973811-21710-1-git-send-email-marcel@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] vl.c: fix some alignment
 issues
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
X-List-Received-Date: Mon, 12 Jan 2015 09:09:02 -0000

11.01.2015 13:56, Marcel Apfelbaum wrote:
> The misalignment was caused by tabs which were used instead of spaces.

Applied to -trivial, thank you!

/mjt

