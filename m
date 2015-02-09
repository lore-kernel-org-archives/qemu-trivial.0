Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YKkpI-0005eZ-GX
	for mharc-qemu-trivial@gnu.org; Mon, 09 Feb 2015 04:40:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YKkpF-0005aK-F9
	for qemu-trivial@nongnu.org; Mon, 09 Feb 2015 04:40:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YKkpE-0001H7-Jd
	for qemu-trivial@nongnu.org; Mon, 09 Feb 2015 04:40:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YKkp8-0001FR-5D; Mon, 09 Feb 2015 04:40:10 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t199e9kJ001057
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 9 Feb 2015 04:40:09 -0500
Received: from blackfin.pond.sub.org (ovpn-116-55.ams2.redhat.com
	[10.36.116.55])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t199e7HS003994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 9 Feb 2015 04:40:09 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3F950303F16C; Mon,  9 Feb 2015 10:40:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
References: <1423406448-31918-1-git-send-email-sw@weilnetz.de>
Date: Mon, 09 Feb 2015 10:40:07 +0100
In-Reply-To: <1423406448-31918-1-git-send-email-sw@weilnetz.de> (Stefan Weil's
	message of "Sun, 8 Feb 2015 15:40:48 +0100")
Message-ID: <87h9uvpgnc.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hmp: Fix warning from
	smatch (wrong argument in function call)
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
X-List-Received-Date: Mon, 09 Feb 2015 09:40:18 -0000

Stefan Weil <sw@weilnetz.de> writes:

> Fix this warning:
> hmp.c:414:38: warning: Using plain integer as NULL pointer
>
> qmp_query_block expects a pointer argument, so passing false is wrong.
>
> Cc: Luiz Capitulino <lcapitulino@redhat.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

