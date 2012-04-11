Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SHxdj-0008QX-PE
	for mharc-qemu-trivial@gnu.org; Wed, 11 Apr 2012 09:31:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1SHxde-0008BA-JJ
	for qemu-trivial@nongnu.org; Wed, 11 Apr 2012 09:31:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1SHxdW-0007jC-Tt
	for qemu-trivial@nongnu.org; Wed, 11 Apr 2012 09:31:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38734)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>)
	id 1SHxdS-0007fi-8Y; Wed, 11 Apr 2012 09:30:58 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3BDUt32013526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 11 Apr 2012 09:30:55 -0400
Received: from localhost (ovpn-116-69.ams2.redhat.com [10.36.116.69])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q3BDUsPf020963; Wed, 11 Apr 2012 09:30:54 -0400
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <1333555395-12873-1-git-send-email-peter.maydell@linaro.org>
	(Peter Maydell's message of "Wed, 4 Apr 2012 17:03:15 +0100")
References: <1333555395-12873-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.0.93 (gnu/linux)
Date: Wed, 11 Apr 2012 15:30:53 +0200
Message-ID: <87k41ml7jm.fsf@elfo.elfo>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Remove useless uses of
	ARCH_CFLAGS
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
X-List-Received-Date: Wed, 11 Apr 2012 13:31:14 -0000

Peter Maydell <peter.maydell@linaro.org> wrote:
> Remove some useless uses of ARCH_CFLAGS -- this variable was never set
> so will always be empty. The uses were accidental: in commit 0c439cbf8
> Juan Quintela removed ARCH_CFLAGS in favour of CFLAGS (which in turn
> became QEMU_CFLAGS). However in commit be17dc90 a use of it was
> reintroduced (apparently accidentally) by Michael S. Tsirkin, and then
> I subsequently cut-n-pasted that into a number of other configure
> feature tests.

Reviewed-by: Juan Quintela <quintela@redhat.com>

