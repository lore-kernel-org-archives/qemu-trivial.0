Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TXuKi-00025o-Fd
	for mharc-qemu-trivial@gnu.org; Mon, 12 Nov 2012 08:45:48 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TXuKc-0001pS-OR
	for qemu-trivial@nongnu.org; Mon, 12 Nov 2012 08:45:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TXuKZ-0001Pg-Jm
	for qemu-trivial@nongnu.org; Mon, 12 Nov 2012 08:45:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41763)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1TXuKT-0001OO-7e; Mon, 12 Nov 2012 08:45:33 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qACDjThE011735
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 12 Nov 2012 08:45:29 -0500
Received: from blackfin.pond.sub.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qACDjRKu012327; Mon, 12 Nov 2012 08:45:28 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E4C0C20098; Mon, 12 Nov 2012 14:45:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
References: <1352461854-18195-1-git-send-email-anthony.perard@citrix.com>
Date: Mon, 12 Nov 2012 14:45:26 +0100
In-Reply-To: <1352461854-18195-1-git-send-email-anthony.perard@citrix.com>
	(Anthony PERARD's message of "Fri, 9 Nov 2012 11:50:54 +0000")
Message-ID: <87txsv3pft.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU-devel <qemu-devel@nongnu.org>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH V2] qemu-sockets: Fix
	parsing of the inet option 'to'.
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
X-List-Received-Date: Mon, 12 Nov 2012 13:45:45 -0000

Anthony PERARD <anthony.perard@citrix.com> writes:

> Having a qemu command line argument like "-vnc 127.0.0.1:0,to=99" is broken.
> This have been break with commit 879e45c72da1569e07fbbc6a1aa2a708ea796044.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks for taking the time to identify the commit that broke it.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

