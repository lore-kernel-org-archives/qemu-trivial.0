Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QorqL-0003H8-Sh
	for mharc-qemu-trivial@gnu.org; Thu, 04 Aug 2011 02:55:45 -0400
Received: from eggs.gnu.org ([140.186.70.92]:38378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1QorqI-000365-P1
	for qemu-trivial@nongnu.org; Thu, 04 Aug 2011 02:55:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1QorqH-0005Pf-Kr
	for qemu-trivial@nongnu.org; Thu, 04 Aug 2011 02:55:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50478)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1QorqF-0005OM-CX; Thu, 04 Aug 2011 02:55:39 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p746tbWN008811
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 4 Aug 2011 02:55:37 -0400
Received: from blackfin.pond.sub.org (ovpn-113-25.phx2.redhat.com
	[10.3.113.25])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p746tacx029953; Thu, 4 Aug 2011 02:55:36 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id BE92E6005D; Thu,  4 Aug 2011 08:55:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1312411744-9292-1-git-send-email-peter.maydell@linaro.org>
Date: Thu, 04 Aug 2011 08:55:34 +0200
In-Reply-To: <1312411744-9292-1-git-send-email-peter.maydell@linaro.org>
	(Peter Maydell's message of "Wed, 3 Aug 2011 23:49:04 +0100")
Message-ID: <m3d3glr7h5.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/qdev: Don't crash if
	qdev_create(NULL, ...) fails
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
X-List-Received-Date: Thu, 04 Aug 2011 06:55:43 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> If an attempt to create a qdev device on the default sysbus (by passing
> NULL as the bus to qdev_create) fails, print a useful error message
> rather than crashing trying to dereference a NULL pointer.

The special case bus == NULL is ugly, and should be removed.  But
rejecting simple bug fixes because we want some cleanup would be
blackmail, and only hurts users.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

