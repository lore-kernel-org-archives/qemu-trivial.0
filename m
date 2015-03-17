Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXrGY-0006VF-Q1
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 09:10:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1YXrGQ-0006TI-Pk
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 09:10:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1YXrGN-00038w-8q
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 09:10:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60421)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>)
	id 1YXrGM-00038r-Vm; Tue, 17 Mar 2015 09:10:27 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2HDAQkQ031894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 17 Mar 2015 09:10:26 -0400
Received: from localhost (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2HDAPuP011174; Tue, 17 Mar 2015 09:10:25 -0400
From: Juan Quintela <quintela@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <1425146983-16015-3-git-send-email-sw@weilnetz.de> (Stefan Weil's
	message of "Sat, 28 Feb 2015 19:09:42 +0100")
References: <1425146983-16015-1-git-send-email-sw@weilnetz.de>
	<1425146983-16015-3-git-send-email-sw@weilnetz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
Date: Tue, 17 Mar 2015 14:10:24 +0100
Message-ID: <871tknkbwf.fsf@neno.neno>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Amit Shah <amit.shah@redhat.com>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 2/3] migration: Fix some 32 bit compiler
	errors
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: quintela@redhat.com
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Mar 2015 13:10:37 -0000

Stefan Weil <sw@weilnetz.de> wrote:
> The current code won't compile on 32 bit hosts because there are lots
> of type casts between pointers and 64 bit integers.
>
> Fix some of them.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Applied, thanks.

