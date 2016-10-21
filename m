Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxeIu-0006NA-6J
	for mharc-qemu-trivial@gnu.org; Fri, 21 Oct 2016 14:12:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bxeIs-0006MH-Po
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2016 14:12:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bxeIs-0005XX-1J
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2016 14:12:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44094)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1bxeIn-0005Wc-QF; Fri, 21 Oct 2016 14:12:21 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF956C04B926;
	Fri, 21 Oct 2016 18:12:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-73.ams2.redhat.com
	[10.36.116.73])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9LICIsc015614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 21 Oct 2016 14:12:20 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 789CA1138645; Fri, 21 Oct 2016 20:12:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, dave@natulte.net,
	quintela@redhat.com
References: <1476739794-19536-1-git-send-email-eblake@redhat.com>
Date: Fri, 21 Oct 2016 20:12:18 +0200
In-Reply-To: <1476739794-19536-1-git-send-email-eblake@redhat.com> (Eric
	Blake's message of "Mon, 17 Oct 2016 16:29:54 -0500")
Message-ID: <87insleflp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 21 Oct 2016 18:12:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trivial: Restore blank line
 in qapi-schema
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Oct 2016 18:12:27 -0000

Eric Blake <eblake@redhat.com> writes:

> Commit de63ab6 accidentally undid part of commit a43edcf,
> because the two patches were written in parallel, and the
> blank line was not noticed as a casualty of merge conflicts.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Applied to qapi-next, thanks!

