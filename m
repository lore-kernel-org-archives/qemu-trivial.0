Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QRWRk-00024P-Rw
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2011 17:25:53 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QRWRg-00022e-Th
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 17:25:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QRWRf-0000Ic-Pr
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 17:25:48 -0400
Received: from fmmailgate01.web.de ([217.72.192.221]:45289)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1QRWRb-0000Hm-2E; Tue, 31 May 2011 17:25:43 -0400
Received: from smtp05.web.de  ( [172.20.4.166])
	by fmmailgate01.web.de (Postfix) with ESMTP id 3B14318FED528;
	Tue, 31 May 2011 23:24:44 +0200 (CEST)
Received: from [87.173.113.150] (helo=[10.0.1.1])
	by smtp05.web.de with asmtp (TLSv1:AES128-SHA:128) (WEB.DE 4.110 #2)
	id 1QRWQe-0007Wi-00; Tue, 31 May 2011 23:24:44 +0200
Message-Id: <C9435105-83D9-485D-A292-3FEC69DDF943@web.de>
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
To: Anthony Liguori <anthony@codemonkey.ws>
In-Reply-To: <4DE4F16D.6030009@codemonkey.ws>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed; delsp=yes
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Apple Message framework v936)
Date: Tue, 31 May 2011 23:24:42 +0200
References: <1306705831-59385-1-git-send-email-andreas.faerber@web.de>
	<4DE4F16D.6030009@codemonkey.ws>
X-Mailer: Apple Mail (2.936)
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX18KnrRwBsTABHLO2FAstO0i68TSpXrGlNnw5+fN
	3trx0zL/cCrWqs+n5XY0HYquOqxRuq/67JMMn/J4hO7tI6kFvR
	qCoxHvop90lgAJdWwU4Q==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.221
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
	Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use SIGIO with caution
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
X-List-Received-Date: Tue, 31 May 2011 21:25:51 -0000

Am 31.05.2011 um 15:47 schrieb Anthony Liguori:

> On 05/29/2011 04:50 PM, Andreas F=E4rber wrote:
>> BeOS and Haiku don't define SIGIO. When undefined, it won't arrive
>> and doesn't need to be blocked.
>>
>> Signed-off-by: Andreas F=E4rber<andreas.faerber@web.de>
>
> Anything to do with signal masks is never a trivial patch BTW...

The way I saw it, it didn't change signal behavior on Linux, Darwin, =20
BSD, etc. hosts (where SIGIO must've been defined) and trivially =20
unbroke not-yet-fully-supported Haiku host.

Andreas=

