Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VG9KY-0000OT-Es
	for mharc-qemu-trivial@gnu.org; Sun, 01 Sep 2013 11:12:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9KQ-0000Dz-6w
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:12:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9KK-0003pm-8O
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:12:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36249)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VG9K8-0003oz-3J; Sun, 01 Sep 2013 11:12:20 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7D09C400BA;
	Sun,  1 Sep 2013 19:12:19 +0400 (MSK)
Message-ID: <52235953.7060804@msgid.tls.msk.ru>
Date: Sun, 01 Sep 2013 19:12:19 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <1377517130-12343-1-git-send-email-stefanha@redhat.com>
In-Reply-To: <1377517130-12343-1-git-send-email-stefanha@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] curl: qemu_bh_new() can never return NULL
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
X-List-Received-Date: Sun, 01 Sep 2013 15:12:44 -0000

26.08.2013 15:38, Stefan Hajnoczi wrote:
> Drop error code path which cannot be taken since qemu_bh_new() does not
> return NULL.

Thanks, applied to the trivial-patches queue.

/mjt

