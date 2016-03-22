Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aiOPV-00012L-04
	for mharc-qemu-trivial@gnu.org; Tue, 22 Mar 2016 11:39:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aiOPN-0000p9-RC
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 11:39:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aiOPM-0005AL-Re
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 11:39:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41046)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aiOPC-00058V-Vj; Tue, 22 Mar 2016 11:39:39 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 9B055C03BD4F;
	Tue, 22 Mar 2016 15:39:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-41.ams2.redhat.com
	[10.36.116.41])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2MFdaNf018797
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 22 Mar 2016 11:39:38 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6AB3F303F90D; Tue, 22 Mar 2016 16:39:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <1458614246-28528-1-git-send-email-peterx@redhat.com>
Date: Tue, 22 Mar 2016 16:39:36 +0100
In-Reply-To: <1458614246-28528-1-git-send-email-peterx@redhat.com> (Peter Xu's
	message of "Tue, 22 Mar 2016 10:37:26 +0800")
Message-ID: <87vb4eo72f.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, pbonzini@redhat.com,
	qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qdict: fix unbounded
	stack warning for qdict_array_entries
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
X-List-Received-Date: Tue, 22 Mar 2016 15:39:55 -0000

Peter Xu <peterx@redhat.com> writes:

> Here we use one g_strdup_printf() to replace the two stack allocated
> array, considering it's more convenient, safe, and as long as it's
> called rarely only when quorum device opens. This will remove the
> unbound stack warning when compiling with "-Wstack-usage=1000000".
>
> Reviewed-by:   Eric Blake <eblake@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

I lack the time to take this through my tree before my Easter vacation.
Nominating for qemu-trivial, assuming Luiz doesn't mind.

