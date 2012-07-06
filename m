Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sn31Z-0001Gu-5e
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jul 2012 03:32:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Sn31S-0000wu-Fu
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2012 03:32:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Sn31M-0002ml-FK
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2012 03:32:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64384)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Sn31E-0002lN-My; Fri, 06 Jul 2012 03:32:00 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q667VkMP000526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 6 Jul 2012 03:31:46 -0400
Received: from blackfin.pond.sub.org (ovpn-116-75.ams2.redhat.com
	[10.36.116.75])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q667Vk3d026871; Fri, 6 Jul 2012 03:31:46 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 93CEC6009D; Fri,  6 Jul 2012 09:31:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1341021237-11293-1-git-send-email-akong@redhat.com>
	<1341021740-11426-1-git-send-email-akong@redhat.com>
	<4FF65090.3040402@redhat.com> <4FF6896D.4070305@msgid.tls.msk.ru>
Date: Fri, 06 Jul 2012 09:31:45 +0200
In-Reply-To: <4FF6896D.4070305@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Fri, 06 Jul 2012 10:45:01 +0400")
Message-ID: <m3txxlpcpq.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Fri, 06 Jul 2012 07:32:19 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> On 06.07.2012 06:42, Amos Kong wrote:
>> On 30/06/12 10:02, akong@redhat.com wrote:
>>> From: Amos Kong<akong@redhat.com>
>>>
>>> Currently qemu outputs some low-level error in qemu-sockets.c
>>> when failed to start vnc server.
>>> eg. 'getaddrinfo(127.0.0.1,5902): Name or service not known'
>>>
>>> Some libvirt users could not know what's happened with this
>>> unclear error message. This patch added a more descriptive
>>> error message.

Only libvirt users?  Really?

> Gyus, please, pretty PLEASE stop doing things like this.
>
> Amos, your patch does TWO things.  One is to clarify error
> message as correctly stated in your description, and second
> is to change the code to do exit(1) if this message is
> generated.  So, please, a) add the second fact to the
> description, and b) mention why it is needed.

Seconded.

