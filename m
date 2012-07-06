Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sn3hB-0006GU-6I
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jul 2012 04:15:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Sn3h0-0005le-Sg
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2012 04:15:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Sn3gz-0004Rr-5N
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2012 04:15:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41473)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Sn3gv-0004Dw-76; Fri, 06 Jul 2012 04:15:05 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C4A98A02F1;
	Fri,  6 Jul 2012 12:14:56 +0400 (MSK)
Message-ID: <4FF69E7E.2090903@msgid.tls.msk.ru>
Date: Fri, 06 Jul 2012 12:14:54 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:10.0.4) Gecko/20120510 Icedove/10.0.4
MIME-Version: 1.0
To: Amos Kong <akong@redhat.com>
References: <a151a8b1-4cf2-4c11-8ce5-a91ebc03415e@zmail13.collab.prod.int.phx2.redhat.com>
In-Reply-To: <a151a8b1-4cf2-4c11-8ce5-a91ebc03415e@zmail13.collab.prod.int.phx2.redhat.com>
X-Enigmail-Version: 1.4.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, pkrempa@redhat.com,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] vnc: add a more
	descriptive error message
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
X-List-Received-Date: Fri, 06 Jul 2012 08:15:17 -0000

On 06.07.2012 12:09, Amos Kong wrote:
> ----- Original Message -----
>> Michael Tokarev <mjt@tls.msk.ru> writes:

>>> Gyus, please, pretty PLEASE stop doing things like this.
>>>
>>> Amos, your patch does TWO things.  One is to clarify error
>>> message as correctly stated in your description, and second
>>> is to change the code to do exit(1) if this message is
>>> generated.  So, please, a) add the second fact to the
>>> description, and b) mention why it is needed.
> 
> 
> 'exit(1)' is the original code, my patch just add an error message.

Amos, I'm sorry for that -- it is my ENOCOFFEE case of misreading
the patch.  I read it initially as you've added the "exit" line,
but you actually added the "}" line.  So indeed, this is the right
fix and the description matches what the patch does.

I've seen quite alot of cases when the description was like "clarifying
message" or "moving the code to a separate file", but at the same time
other things has changed, and often changed in a wrong way...

So, yes, it is a very good, and trivial, change, and you may use my

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

The more cases like this is fixed, the better!

Thank you!

/mjt

