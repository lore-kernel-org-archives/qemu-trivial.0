Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1K6W-0004hb-DM
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jul 2013 13:41:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V1K6T-0004gg-En
	for qemu-trivial@nongnu.org; Mon, 22 Jul 2013 13:40:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V1K6S-0006ZH-GU
	for qemu-trivial@nongnu.org; Mon, 22 Jul 2013 13:40:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53402)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V1K6N-0006Y8-Ld; Mon, 22 Jul 2013 13:40:51 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BC6CC42821;
	Mon, 22 Jul 2013 21:40:49 +0400 (MSK)
Message-ID: <51ED6EA0.8070800@msgid.tls.msk.ru>
Date: Mon, 22 Jul 2013 21:40:48 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <1374396185-10870-1-git-send-email-pingfank@linux.vnet.ibm.com>
	<1374396185-10870-4-git-send-email-pingfank@linux.vnet.ibm.com>
	<51ECD2E2.2070000@siemens.com>
In-Reply-To: <51ECD2E2.2070000@siemens.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	Liu Ping Fan <qemulist@gmail.com>, qemu-devel@nongnu.org,
	Alex Bligh <alex@alex.org.uk>, Anthony Liguori <anthony@codemonkey.ws>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [RFC 3/8] timer: make timers_state static
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
X-List-Received-Date: Mon, 22 Jul 2013 17:40:58 -0000

22.07.2013 10:36, Jan Kiszka wrote:
> On 2013-07-21 10:43, Liu Ping Fan wrote:
>> -TimersState timers_state;
>> +static TimersState timers_state;

> Could go in directly via trivial IMHO.

It should not conflict with anything else.

Thanks, applied to the trivial patches queue.

/mjt

