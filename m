Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ztbxh-00068B-R6
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 08:49:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Ztbxf-00066S-1H
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 08:49:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Ztbxe-0000F8-3u
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 08:49:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50565)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZtbxY-0000ER-3E; Tue, 03 Nov 2015 08:49:12 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id ACE858F4E6;
	Tue,  3 Nov 2015 13:49:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA3Dn9b3017987
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 3 Nov 2015 08:49:11 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4BDCC300530B; Tue,  3 Nov 2015 14:49:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1446134122-32292-1-git-send-email-armbru@redhat.com>
	<1446134122-32292-2-git-send-email-armbru@redhat.com>
	<5638A32D.90907@msgid.tls.msk.ru>
Date: Tue, 03 Nov 2015 14:49:09 +0100
In-Reply-To: <5638A32D.90907@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Tue, 03 Nov 2015 15:06:05 +0300")
Message-ID: <87y4efchwq.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/4] ui: Use g_new() &
	friends where that makes obvious sense
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
X-List-Received-Date: Tue, 03 Nov 2015 13:49:20 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 29.10.2015 18:55, Markus Armbruster wrote:
>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>> for two reasons.  One, it catches multiplication overflowing size_t.
>> Two, it returns T * rather than void *, which lets the compiler catch
>> more type errors.
>> 
>> This commit only touches allocations with size arguments of the form
>> sizeof(T).  Same Coccinelle semantic patch as in commit b45c03f.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> ---
>>  ui/console.c      | 2 +-
>>  ui/curses.c       | 2 +-
>>  ui/input-legacy.c | 4 ++--
>>  ui/keymaps.c      | 2 +-
>>  ui/sdl.c          | 2 +-
>>  ui/vnc-jobs.c     | 6 +++---
>>  ui/vnc.c          | 6 +++---
>>  7 files changed, 12 insertions(+), 12 deletions(-)
>
> ui/vnc.c code has been modified by Eric Blake meanwhile,
> in 2d32addae70987521578d8bb27c6b3f52cdcbdcb "sockets:
> Convert to new qapi union layout".
>
> The patch applies for other files however.

I can regenerate this patch easily.  Would you be willing to replace it
in your tree by a v3?

