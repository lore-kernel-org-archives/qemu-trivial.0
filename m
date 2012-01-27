Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rqn6I-0006gn-Af
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 09:48:26 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Rqn6C-0006HV-GX
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 09:48:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Rqn66-0007xv-U4
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 09:48:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:10243)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Rqn5v-0007x4-7P; Fri, 27 Jan 2012 09:48:03 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0REm2Lg013450
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 27 Jan 2012 09:48:02 -0500
Received: from blackfin.pond.sub.org (ovpn-116-61.ams2.redhat.com
	[10.36.116.61])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0REm1x5025500; Fri, 27 Jan 2012 09:48:01 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id C2E576006E; Fri, 27 Jan 2012 15:48:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
References: <m31uqluvwy.fsf@blackfin.pond.sub.org>
	<1327671245-5231-1-git-send-email-lersek@redhat.com>
Date: Fri, 27 Jan 2012 15:48:00 +0100
In-Reply-To: <1327671245-5231-1-git-send-email-lersek@redhat.com> (Laszlo
	Ersek's message of "Fri, 27 Jan 2012 14:34:05 +0100")
Message-ID: <m38vkti4m7.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] keep the PID file locked for the
	lifetime of the process
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
X-List-Received-Date: Fri, 27 Jan 2012 14:48:24 -0000

Laszlo Ersek <lersek@redhat.com> writes:

> The lockf() call in qemu_create_pidfile() aims at ensuring mutual
> exclusion. We shouldn't close the pidfile on success (as introduced by
> commit 1bbd1592), because that drops the lock as well [1]:
>
>     "File locks shall be released on first close by the locking process
>     of any file descriptor for the file."
>
> Coverity may complain again about the leaked file descriptor; let's
> worry about that later.
>
> v1->v2:
> - add reference to 1bbd1592
> - explain the intentional fd leak in the source
>
> [1] http://pubs.opengroup.org/onlinepubs/9699919799/functions/lockf.html
>
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>

Thanks for cleaning up the mess I made!

Reviewed-by: Markus Armbruster <armbru@redhat.com>

