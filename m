Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RTXyb-0001Uu-3K
	for mharc-qemu-trivial@gnu.org; Thu, 24 Nov 2011 07:00:25 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RTXyT-00012M-9n
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 07:00:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RTXyP-0004mU-9u
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 07:00:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44119)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1RTXyD-0004gk-M0; Thu, 24 Nov 2011 07:00:02 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pAOBxw4e011650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 24 Nov 2011 06:59:59 -0500
Received: from blackfin.pond.sub.org (ovpn-116-25.ams2.redhat.com
	[10.36.116.25])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pAOBxv0j026930; Thu, 24 Nov 2011 06:59:58 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 2CD9F6006E; Thu, 24 Nov 2011 12:59:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhi Hui Li <zhihuili@linux.vnet.ibm.com>
References: <CAGtkxYxBfYxcVpQopgpkvf-POUf-uDEjjRht5sOye0REyFExAQ@mail.gmail.com>
Date: Thu, 24 Nov 2011 12:59:57 +0100
In-Reply-To: <CAGtkxYxBfYxcVpQopgpkvf-POUf-uDEjjRht5sOye0REyFExAQ@mail.gmail.com>
	(Zhi Hui Li's message of "Thu, 24 Nov 2011 16:23:00 +0800")
Message-ID: <m34nxtspc2.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net/socket.c : fix memory
	leak
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
X-List-Received-Date: Thu, 24 Nov 2011 12:00:22 -0000

Since you're fixing net/socket.c: would you be interested in adopting my
untested drive-by fix "[PATCH 0/2] net: socket backend uses
uninitialized variables"?

http://lists.nongnu.org/archive/html/qemu-devel/2011-10/msg03888.html

