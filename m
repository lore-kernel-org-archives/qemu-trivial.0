Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUd9b-0003dM-QT
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 12:02:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ZUd9Z-0003ZB-DH
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 12:02:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ZUd9Y-00050M-Hg
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 12:02:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60651)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1ZUd9T-0004q8-5l; Wed, 26 Aug 2015 12:02:15 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 8882BA3045;
	Wed, 26 Aug 2015 16:02:14 +0000 (UTC)
Received: from localhost (ovpn-113-73.phx2.redhat.com [10.3.113.73])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QG2BFk027338; Wed, 26 Aug 2015 12:02:13 -0400
Date: Wed, 26 Aug 2015 13:02:09 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20150826160209.GA10988@thinpad.lan.raisama.net>
References: <1437573590-2801-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437573590-2801-1-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add another sanity check to
 smp_parse() function
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
X-List-Received-Date: Wed, 26 Aug 2015 16:02:22 -0000

On Wed, Jul 22, 2015 at 03:59:50PM +0200, Thomas Huth wrote:
> The code in smp_parse already checks the topology information for
> sockets * cores * threads < cpus and bails out with an error in
> that case. However, it is still possible to supply a bad configuration
> the other way round, e.g. with:
> 
>  qemu-system-xxx -smp 4,sockets=1,cores=4,threads=2
> 
> QEMU then still starts the guest, with topology configuration that
> is rather incomprehensible and likely not what the user wanted.
> So let's add another check to refuse such wrong configurations.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Applied to the x86 tree. Thanks!

-- 
Eduardo

