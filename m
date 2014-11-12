Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoSQk-00069F-3U
	for mharc-qemu-trivial@gnu.org; Wed, 12 Nov 2014 02:33:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XoSQd-000612-QS
	for qemu-trivial@nongnu.org; Wed, 12 Nov 2014 02:33:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XoSQZ-0002uM-4L
	for qemu-trivial@nongnu.org; Wed, 12 Nov 2014 02:33:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49190)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XoSQP-0002qy-Nv; Wed, 12 Nov 2014 02:33:09 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAC7X790013301
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 12 Nov 2014 02:33:07 -0500
Received: from blackfin.pond.sub.org (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAC7X5EE032246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 12 Nov 2014 02:33:06 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7A84630403AF; Wed, 12 Nov 2014 08:33:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: SeokYeon Hwang <syeon.hwang@samsung.com>
References: <1415775949-4528-1-git-send-email-syeon.hwang@samsung.com>
Date: Wed, 12 Nov 2014 08:33:04 +0100
In-Reply-To: <1415775949-4528-1-git-send-email-syeon.hwang@samsung.com>
	(SeokYeon Hwang's message of "Wed, 12 Nov 2014 16:05:49 +0900")
Message-ID: <87egt8c1qn.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	kongjianjun@gmail.com, paolo.bonzini@gmail.com,
	qemu-devel@nongnu.org, mreitz@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.2] pci: Don't pass
	negative errno to 'error_set_errno()'
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
X-List-Received-Date: Wed, 12 Nov 2014 07:33:28 -0000

Copying maintainer and -trivial.

In the future, please copy maintainers.  You can use
"scripts/get_maintainer.pl --no-git-fallback" to find them.

SeokYeon Hwang <syeon.hwang@samsung.com> writes:

> Signed-off-by: SeokYeon Hwang <syeon.hwang@samsung.com>
> ---
>  hw/pci/pcie.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 58455bd..2902f7d 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -229,7 +229,7 @@ static void pcie_cap_slot_hotplug_common(PCIDevice *hotplug_dev,
>          /* the slot is electromechanically locked.
>           * This error is propagated up to qdev and then to HMP/QMP.
>           */
> -        error_setg_errno(errp, -EBUSY, "slot is electromechanically locked");
> +        error_setg_errno(errp, EBUSY, "slot is electromechanically locked");
>      }
>  }

Reviewed-by: Markus Armbruster <armbru@redhat.com>

