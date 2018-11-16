Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNb9G-0000mc-SA
	for mharc-qemu-trivial@gnu.org; Fri, 16 Nov 2018 05:14:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gNb9E-0000l4-Mt
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2018 05:14:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gNb9D-0005tI-US
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2018 05:14:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60230)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gNb8x-0005cP-IM; Fri, 16 Nov 2018 05:14:33 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D3A84E928;
	Fri, 16 Nov 2018 10:14:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-34.ams2.redhat.com
	[10.36.117.34])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 283DD17533;
	Fri, 16 Nov 2018 10:14:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9203C11385F2; Fri, 16 Nov 2018 11:14:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org
References: <20181115211752.1295571-1-eblake@redhat.com>
Date: Fri, 16 Nov 2018 11:14:16 +0100
In-Reply-To: <20181115211752.1295571-1-eblake@redhat.com> (Eric Blake's
	message of "Thu, 15 Nov 2018 15:17:50 -0600")
Message-ID: <87in0x72iv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 16 Nov 2018 10:14:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] typedefs.h cleanup
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
X-List-Received-Date: Fri, 16 Nov 2018 10:14:49 -0000

Eric Blake <eblake@redhat.com> writes:

> Prompted by my review of xiezhide's work.  No semantic change, but
> not technically a bug fix, so I don't care if it goes in 3.1 or
> waits for 4.0.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

