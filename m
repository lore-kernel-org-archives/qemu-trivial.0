Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XwX1q-0006o3-Nd
	for mharc-qemu-trivial@gnu.org; Thu, 04 Dec 2014 09:05:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XwX1j-0006Z9-3U
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 09:05:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XwX1c-00035a-VP
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 09:05:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43046)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XwX1Q-0002x9-0Z; Thu, 04 Dec 2014 09:04:44 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB4E4ej5019545
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 4 Dec 2014 09:04:40 -0500
Received: from blackfin.pond.sub.org (ovpn-116-62.ams2.redhat.com
	[10.36.116.62])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB4E4XuE024171
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 4 Dec 2014 09:04:37 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8D200303FEB1; Thu,  4 Dec 2014 15:04:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
References: <1417701603-26388-1-git-send-email-armbru@redhat.com>
	<1417701603-26388-3-git-send-email-armbru@redhat.com>
Date: Thu, 04 Dec 2014 15:04:32 +0100
In-Reply-To: <1417701603-26388-3-git-send-email-armbru@redhat.com> (Markus
	Armbruster's message of "Thu, 4 Dec 2014 15:00:02 +0100")
Message-ID: <87iohrh5ov.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/3] Fuse g_malloc();
	memset() into g_new0()
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
X-List-Received-Date: Thu, 04 Dec 2014 14:05:10 -0000

Oops, subject lacks "util: " prefix.  Perhaps it can be fixed up on
commit.

