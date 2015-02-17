Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNdwY-0007YN-RW
	for mharc-qemu-trivial@gnu.org; Tue, 17 Feb 2015 03:55:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YNdwW-0007TU-82
	for qemu-trivial@nongnu.org; Tue, 17 Feb 2015 03:55:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YNdwV-0006f3-3t
	for qemu-trivial@nongnu.org; Tue, 17 Feb 2015 03:55:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44902)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YNdwQ-0006bL-2Y; Tue, 17 Feb 2015 03:55:38 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1H8tZoM019029
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 17 Feb 2015 03:55:35 -0500
Received: from blackfin.pond.sub.org (ovpn-116-70.ams2.redhat.com
	[10.36.116.70])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1H8tXGn024087
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 17 Feb 2015 03:55:34 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 283CF303FEA0; Tue, 17 Feb 2015 09:55:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@linux.vnet.ibm.com>
References: <1424122891-9390-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1424122891-9390-4-git-send-email-thuth@linux.vnet.ibm.com>
Date: Tue, 17 Feb 2015 09:55:33 +0100
In-Reply-To: <1424122891-9390-4-git-send-email-thuth@linux.vnet.ibm.com>
	(Thomas Huth's message of "Mon, 16 Feb 2015 22:41:30 +0100")
Message-ID: <87twyknchm.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] util: Remove unused
	functions
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
X-List-Received-Date: Tue, 17 Feb 2015 08:55:45 -0000

Thomas Huth <thuth@linux.vnet.ibm.com> writes:

> Delete the unused functions qemu_opt_get_number_del(),
> qemu_signalfd_available(), qemu_send_full() and qemu_recv_full().
>
> Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>

qemu_opt_get_number_del() was added in commit 782730b along with
qemu_opt_get_del(), qemu_opt_get_bool_del() and qemu_opt_get_size_del().
It hasn't been used so far, but removing it makes the interface
irregular.  I'd rather not.  Covering all four in tests/test-qemu-opts.c
would be nice.

qemu_send_full() and qemu_recv_full() complement qemu_write_full().  On
the other hand, there's no qemu_read_full().  I don't think keeping the
two unused ones hurts, but I don't object to dropping them, either.

For what it's worth, glibc provides a macro to solve this problem once
and for all:

    /* Evaluate EXPRESSION, and repeat as long as it returns -1 with `errno'
       set to EINTR.  */

    # define TEMP_FAILURE_RETRY(expression) \
      (__extension__                                        \
        ({ long int __result;                               \
           do __result = (long int) (expression);           \
           while (__result == -1L && errno == EINTR);       \
           __result; }))
    #endif

More elegant than writing the same old boring wrapper around everything
that can fail with EINTR.

qemu_signalfd_available() is unused since commit 6d32717.  It's also the
only user of CONFIG_SIGNALFD.  If we want to drop it, I recommend
dropping CONFIG_SIGNALFD as well.

