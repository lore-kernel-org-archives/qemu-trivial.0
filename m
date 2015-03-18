Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YY893-000167-S7
	for mharc-qemu-trivial@gnu.org; Wed, 18 Mar 2015 03:12:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YY891-00011a-8z
	for qemu-trivial@nongnu.org; Wed, 18 Mar 2015 03:11:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YY890-0005pA-FD
	for qemu-trivial@nongnu.org; Wed, 18 Mar 2015 03:11:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45930)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YY88t-0005o9-V3; Wed, 18 Mar 2015 03:11:52 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 55D202BA0E0;
	Wed, 18 Mar 2015 07:11:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-37.ams2.redhat.com
	[10.36.116.37])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2I7BnZ0023025
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 18 Mar 2015 03:11:50 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A405E3042B6E; Wed, 18 Mar 2015 08:11:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
References: <1426625899-25348-1-git-send-email-jsnow@redhat.com>
Date: Wed, 18 Mar 2015 08:11:48 +0100
In-Reply-To: <1426625899-25348-1-git-send-email-jsnow@redhat.com> (John Snow's
	message of "Tue, 17 Mar 2015 16:58:19 -0400")
Message-ID: <871tkmkcej.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] qtest/ahci: Fix clang 3.5.0
	error
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
X-List-Received-Date: Wed, 18 Mar 2015 07:12:00 -0000

John Snow <jsnow@redhat.com> writes:

> A thinko that clang 3.5.0 caught.
> Thankfully does not introduce any new failures.
>
> Signed-off-by: John Snow <jsnow@redhat.com>

How you caught the bug is interesting enough to be mentioned in the
commit message, but the nature of the bug surely is more interesting
than that.  Suggest to change the subject to

    qtest/ahci: Fix a bit mask expression

Perhaps it can be fixed up on commit.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

