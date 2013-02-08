Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3tRU-0007mz-Jm
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 14:17:00 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1U3tRO-0007UB-Bp
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 14:16:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1U3tRM-0003hW-OW
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 14:16:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:30460)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1U3tRH-0003fL-VA; Fri, 08 Feb 2013 14:16:48 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r18JGjgl029034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 8 Feb 2013 14:16:45 -0500
Received: from localhost (ovpn-113-129.phx2.redhat.com [10.3.113.129])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r18JGhAf025695; Fri, 8 Feb 2013 14:16:44 -0500
Date: Fri, 8 Feb 2013 17:16:43 -0200
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20130208171643.6c15fec9@redhat.com>
In-Reply-To: <87txpmbphw.fsf@blackfin.pond.sub.org>
References: <1360340232-4670-1-git-send-email-armbru@redhat.com>
	<87txpmbphw.fsf@blackfin.pond.sub.org>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.4 v2 0/6] Error reporting fixes
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
X-List-Received-Date: Fri, 08 Feb 2013 19:16:58 -0000

On Fri, 08 Feb 2013 19:59:55 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Luiz, would you like to take v3 through your tree?  In that case I'd
> drop qemu-trivial.

Yes, I can do it.

