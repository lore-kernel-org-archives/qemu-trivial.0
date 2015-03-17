Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXmjy-0004rl-M0
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 04:20:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YXmju-0004oZ-4w
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 04:20:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YXmjt-0007bS-4n
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 04:20:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56212)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YXmjn-0007ZJ-5q; Tue, 17 Mar 2015 04:20:31 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id A686DC2E53;
	Tue, 17 Mar 2015 08:20:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2H8KSZ3023860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 17 Mar 2015 04:20:30 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0584D3042B6D; Tue, 17 Mar 2015 09:20:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
References: <1425990184-30913-1-git-send-email-armbru@redhat.com>
Date: Tue, 17 Mar 2015 09:20:27 +0100
In-Reply-To: <1425990184-30913-1-git-send-email-armbru@redhat.com> (Markus
	Armbruster's message of "Tue, 10 Mar 2015 13:23:04 +0100")
Message-ID: <87h9tkujas.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hmp: Fix texinfo documentation
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
X-List-Received-Date: Tue, 17 Mar 2015 08:20:39 -0000

Ping for 2.3

Markus Armbruster <armbru@redhat.com> writes:

> Several issues:
>
> * Commands i and o lack @item.  Their one-liner documentation gets
>   squashed into the preceding command print.  Add the obvious @item.
>
> * Commands i, o and cpu-add lack @findex.  The function index doesn't
>   have them.  Add the obvious @findex.
>
> * Commit 727f005 put block_set_io_throttle was added in the middle of
>   block_passwd.  Move it.
>
> * Correct spelling of commands chardev-add and chardev-remove in @item
>   and @findex.
>
> * Some commands have a blank line between @item/@findex and the text,
>   most don't.  Normalize to no blank line.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

