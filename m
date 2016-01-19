Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aLQot-0007XV-13
	for mharc-qemu-trivial@gnu.org; Tue, 19 Jan 2016 02:35:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aLQor-0007Vg-QR
	for qemu-trivial@nongnu.org; Tue, 19 Jan 2016 02:35:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aLQor-0002dz-1H
	for qemu-trivial@nongnu.org; Tue, 19 Jan 2016 02:35:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38319)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aLQom-0002XW-3r; Tue, 19 Jan 2016 02:35:08 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 0824C8D3B5;
	Tue, 19 Jan 2016 07:35:07 +0000 (UTC)
Received: from blackfin.pond.sub.org ([10.3.113.2])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0J7Z46f001658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 19 Jan 2016 02:35:06 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 2F7E9303F81B; Tue, 19 Jan 2016 08:35:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Greg Kurz <gkurz@linux.vnet.ibm.com>
References: <20160111173036.24764.59878.stgit@bahia.huguette.org>
Date: Tue, 19 Jan 2016 08:35:04 +0100
In-Reply-To: <20160111173036.24764.59878.stgit@bahia.huguette.org> (Greg
	Kurz's message of "Mon, 11 Jan 2016 18:30:36 +0100")
Message-ID: <87fuxudntj.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trace: drop trailing empty
	strings
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
X-List-Received-Date: Tue, 19 Jan 2016 07:35:14 -0000

Greg Kurz <gkurz@linux.vnet.ibm.com> writes:

> Also fix a typo in the virtio_balloon_handle_output() trace while here.
>
> Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

