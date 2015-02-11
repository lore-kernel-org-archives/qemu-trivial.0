Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLWih-0001RL-04
	for mharc-qemu-trivial@gnu.org; Wed, 11 Feb 2015 07:48:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YLWif-0001Pu-8B
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 07:48:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YLWie-0008F8-Cz
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 07:48:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YLWia-0008DU-4E; Wed, 11 Feb 2015 07:48:36 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1BCmZQF015574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 11 Feb 2015 07:48:35 -0500
Received: from blackfin.pond.sub.org (ovpn-116-65.ams2.redhat.com
	[10.36.116.65])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1BCmXdg032131
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 11 Feb 2015 07:48:34 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 44E30303D504; Wed, 11 Feb 2015 13:48:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <1423608030-20368-1-git-send-email-eblake@redhat.com>
Date: Wed, 11 Feb 2015 13:48:33 +0100
In-Reply-To: <1423608030-20368-1-git-send-email-eblake@redhat.com> (Eric
	Blake's message of "Tue, 10 Feb 2015 15:40:30 -0700")
Message-ID: <877fvo8vha.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] balloon: Fix typo
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
X-List-Received-Date: Wed, 11 Feb 2015 12:48:42 -0000

Eric Blake <eblake@redhat.com> writes:

> Commit 422e0501 introduced a typo (unless removing an 'o' from
> balloon is how you deflate it?)
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>
> I'm usually good at spotting typos when giving my R-b.  Oh well,
> Dave is doing well to make sure my ego doesn't get too inflated :)

You're human, after all :)

Reviewed-by: Markus Armbruster <armbru@redhat.com>

