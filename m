Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XyHBr-0004RW-H6
	for mharc-qemu-trivial@gnu.org; Tue, 09 Dec 2014 04:34:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XyHBl-0004Kv-Mz
	for qemu-trivial@nongnu.org; Tue, 09 Dec 2014 04:34:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XyHBg-0002V6-KS
	for qemu-trivial@nongnu.org; Tue, 09 Dec 2014 04:34:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53903)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XyHBW-0002SU-PH; Tue, 09 Dec 2014 04:34:22 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB99YHB2023481
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 9 Dec 2014 04:34:18 -0500
Received: from blackfin.pond.sub.org (ovpn-116-18.ams2.redhat.com
	[10.36.116.18])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB99YGHR011705
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 9 Dec 2014 04:34:17 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6E879307D512; Tue,  9 Dec 2014 10:34:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: <arei.gonglei@huawei.com>
References: <1418090962-10720-1-git-send-email-arei.gonglei@huawei.com>
Date: Tue, 09 Dec 2014 10:34:15 +0100
In-Reply-To: <1418090962-10720-1-git-send-email-arei.gonglei@huawei.com> (arei
	gonglei's message of "Tue, 9 Dec 2014 10:09:22 +0800")
Message-ID: <87388p2mlk.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] virtio: remove useless
	declaration of virtio_net_init()
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
X-List-Received-Date: Tue, 09 Dec 2014 09:34:42 -0000

<arei.gonglei@huawei.com> writes:

> From: Gonglei <arei.gonglei@huawei.com>
>
> commit 1773d9ee (virtio-net: cleanup: init and exit function)
> removed the definition of virtio_net_init(), but didn't remove its
> declaration in the header.  Clean that up.
>
> Cc: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

