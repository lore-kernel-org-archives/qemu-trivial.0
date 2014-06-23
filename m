Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wz2m4-0000AX-RB
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jun 2014 07:51:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Wz2lw-0008PI-P1
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 07:50:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Wz2lq-0006Ay-He
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 07:50:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:5963)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Wz2lc-00068I-JA; Mon, 23 Jun 2014 07:50:32 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5NBoVg9018832
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 23 Jun 2014 07:50:31 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-50.ams2.redhat.com
	[10.36.112.50])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5NBoS7h030783; Mon, 23 Jun 2014 07:50:29 -0400
Message-ID: <53A81484.7020708@redhat.com>
Date: Mon, 23 Jun 2014 13:50:28 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1402063613-12400-1-git-send-email-pbonzini@redhat.com>	<1402063613-12400-2-git-send-email-pbonzini@redhat.com>
	<539461DE.5050700@msgid.tls.msk.ru>
	<53A5A0D5.9020904@msgid.tls.msk.ru>
In-Reply-To: <53A5A0D5.9020904@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] x86: correctly implement soft reset
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
X-List-Received-Date: Mon, 23 Jun 2014 11:50:59 -0000

Il 21/06/2014 17:12, Michael Tokarev ha scritto:
>>> >> Do not do a hard reset for port 92h, keyboard controller, or cf9h soft reset.
>>> >> These only reset the CPU.
>> >
>> > I'm not sure how this is -trivial material? :)
> Ping?
> This patch hasn't been applied so far, do you want to actually push it?

No, I submitted this by mistake.  This version of the patch had review 
comments that I haven't had time to address yet.

Paolo

