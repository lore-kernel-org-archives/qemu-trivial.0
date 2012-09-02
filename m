Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8Gr4-0001El-4L
	for mharc-qemu-trivial@gnu.org; Sun, 02 Sep 2012 16:33:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1T8Gr1-0001D4-Fb
	for qemu-trivial@nongnu.org; Sun, 02 Sep 2012 16:33:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1T8Gr0-0005ZL-KN
	for qemu-trivial@nongnu.org; Sun, 02 Sep 2012 16:33:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>)
	id 1T8Gr0-0005ZF-Bk; Sun, 02 Sep 2012 16:33:10 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q82KX7WZ024384
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sun, 2 Sep 2012 16:33:08 -0400
Received: from localhost (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q82KX6FO031412; Sun, 2 Sep 2012 16:33:07 -0400
From: Juan Quintela <quintela@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <1346496963-27422-1-git-send-email-sw@weilnetz.de> (Stefan Weil's
	message of "Sat, 1 Sep 2012 12:56:03 +0200")
References: <1346496963-27422-1-git-send-email-sw@weilnetz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
Date: Sun, 02 Sep 2012 22:31:54 +0200
Message-ID: <87ehmkrwsl.fsf@elfo.mitica>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ioh3420: Remove unreachable code
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
X-List-Received-Date: Sun, 02 Sep 2012 20:33:12 -0000

Stefan Weil <sw@weilnetz.de> wrote:
> Report from smatch:
> hw/ioh3420.c:128 ioh3420_initfn(35) info: ignoring unreachable code.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Juan Quintela <quintela@redhat.com> 

