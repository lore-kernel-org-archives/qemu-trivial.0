Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xy0Kp-0006M1-HR
	for mharc-qemu-trivial@gnu.org; Mon, 08 Dec 2014 10:34:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Xy0Ki-0006DW-Dz
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 10:34:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Xy0Kd-000671-8e
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 10:34:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37961)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Xy0KT-00065U-Bi; Mon, 08 Dec 2014 10:34:29 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB8FYPi6024919
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 8 Dec 2014 10:34:25 -0500
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB8FYNgL012330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 8 Dec 2014 10:34:25 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5FF31305B4FC; Mon,  8 Dec 2014 16:34:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: <arei.gonglei@huawei.com>
References: <1418039322-7892-1-git-send-email-arei.gonglei@huawei.com>
Date: Mon, 08 Dec 2014 16:34:23 +0100
In-Reply-To: <1418039322-7892-1-git-send-email-arei.gonglei@huawei.com> (arei
	gonglei's message of "Mon, 8 Dec 2014 19:48:42 +0800")
Message-ID: <87wq626tq8.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio: remove useless
	virtio_net_init define
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
X-List-Received-Date: Mon, 08 Dec 2014 15:34:49 -0000

<arei.gonglei@huawei.com> writes:

> From: Gonglei <arei.gonglei@huawei.com>
>
> commit 1773d9ee (virtio-net: cleanup: init and exit function)
> had removed realization of virtio_net_init(), but didn't remove
> the define of head file. Let's remove it.
>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>

I get what you mean by "realization", but the technical term is
definition, and the thing you remove is a declaration.

Suggest

    virtio: remove useless declaration of virtio_net_init()

    Commit 1773d9ee (virtio-net: cleanup: init and exit function)
    removed the definition of virtio_net_init(), but didn't remove its
    declaration in the header.  Clean that up.

