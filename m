Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sn2Hz-0000bn-7m
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jul 2012 02:45:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Sn2Hv-0000Rx-Oq
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2012 02:45:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Sn2Hu-0000mx-5W
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2012 02:45:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55833)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Sn2Hn-0000an-TR; Fri, 06 Jul 2012 02:45:04 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BD72DA02F1;
	Fri,  6 Jul 2012 10:45:01 +0400 (MSK)
Message-ID: <4FF6896D.4070305@msgid.tls.msk.ru>
Date: Fri, 06 Jul 2012 10:45:01 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:10.0.4) Gecko/20120510 Icedove/10.0.4
MIME-Version: 1.0
To: Amos Kong <akong@redhat.com>
References: <1341021237-11293-1-git-send-email-akong@redhat.com>
	<1341021740-11426-1-git-send-email-akong@redhat.com>
	<4FF65090.3040402@redhat.com>
In-Reply-To: <4FF65090.3040402@redhat.com>
X-Enigmail-Version: 1.4.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, pkrempa@redhat.com,
	qemu-devel@nongnu.org
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
X-List-Received-Date: Fri, 06 Jul 2012 06:45:13 -0000

On 06.07.2012 06:42, Amos Kong wrote:
> On 30/06/12 10:02, akong@redhat.com wrote:
>> From: Amos Kong<akong@redhat.com>
>>
>> Currently qemu outputs some low-level error in qemu-sockets.c
>> when failed to start vnc server.
>> eg. 'getaddrinfo(127.0.0.1,5902): Name or service not known'
>>
>> Some libvirt users could not know what's happened with this
>> unclear error message. This patch added a more descriptive
>> error message.

Gyus, please, pretty PLEASE stop doing things like this.

Amos, your patch does TWO things.  One is to clarify error
message as correctly stated in your description, and second
is to change the code to do exit(1) if this message is
generated.  So, please, a) add the second fact to the
description, and b) mention why it is needed.

Thanks,

/mjt

