Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gOsqg-0002fp-9P
	for mharc-qemu-trivial@gnu.org; Mon, 19 Nov 2018 18:20:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gOsqe-0002ZL-G9
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2018 18:20:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gOsqd-0005v9-TG
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2018 18:20:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35884)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gOsqY-0005o0-0T; Mon, 19 Nov 2018 18:20:50 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D72B30832EB;
	Mon, 19 Nov 2018 23:20:49 +0000 (UTC)
Received: from localhost (ovpn-116-21.gru2.redhat.com [10.97.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC3AF600D7;
	Mon, 19 Nov 2018 23:20:48 +0000 (UTC)
Date: Mon, 19 Nov 2018 21:20:47 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, armbru@redhat.com
Message-ID: <20181119232047.GN3807@habkost.net>
References: <20181115211752.1295571-1-eblake@redhat.com>
	<20181115211752.1295571-3-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181115211752.1295571-3-eblake@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 19 Nov 2018 23:20:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 2/2] numa: Match struct to typedef name
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2018 23:20:57 -0000

On Thu, Nov 15, 2018 at 03:17:52PM -0600, Eric Blake wrote:
> There's no reason to violate our naming conventions by having a
> struct with a different name than its typedef.  Messed up since
> its introduction in commit 8c85901e, but made more obvious when
> commit 3bfe5716 promoted it to typedefs.h.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Queued on numa-next, thanks.

-- 
Eduardo

