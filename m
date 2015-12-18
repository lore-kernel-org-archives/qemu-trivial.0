Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a9uWn-0004Um-2r
	for mharc-qemu-trivial@gnu.org; Fri, 18 Dec 2015 07:52:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a9uWk-0004RM-QA
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 07:52:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a9uWj-0004zz-Ue
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 07:52:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34831)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a9uWe-0004zL-4S; Fri, 18 Dec 2015 07:52:48 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 9DD87C0B9303;
	Fri, 18 Dec 2015 12:52:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-44.phx2.redhat.com
	[10.3.113.44])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBICqjsw014892
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 18 Dec 2015 07:52:47 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5509C303F81B; Fri, 18 Dec 2015 13:52:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
References: <1450428770-18215-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Date: Fri, 18 Dec 2015 13:52:45 +0100
In-Reply-To: <1450428770-18215-1-git-send-email-caoj.fnst@cn.fujitsu.com> (Cao
	jin's message of "Fri, 18 Dec 2015 16:52:50 +0800")
Message-ID: <87wpsbex5u.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, pbonzini@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Use macro instead of
	plain text
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
X-List-Received-Date: Fri, 18 Dec 2015 12:52:55 -0000

Cao jin <caoj.fnst@cn.fujitsu.com> writes:

> There is TYPE_ICH9_AHCI definition in ahci.h when QOMify it, seems it
> is missed.
>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  hw/i386/pc_q35.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 9a12068..aa34a07 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -249,7 +249,7 @@ static void pc_q35_init(MachineState *machine)
>      ahci = pci_create_simple_multifunction(host_bus,
>                                             PCI_DEVFN(ICH9_SATA1_DEV,
>                                                       ICH9_SATA1_FUNC),
> -                                           true, "ich9-ahci");
> +                                           true, TYPE_ICH9_AHCI);
>      idebus[0] = qdev_get_child_bus(&ahci->qdev, "ide.0");
>      idebus[1] = qdev_get_child_bus(&ahci->qdev, "ide.1");
>      g_assert(MAX_SATA_PORTS == ICH_AHCI(ahci)->ahci.ports);

I suspect there are more instances of the same problem.

To find all similar macro definitions:

    $ git-grep -Eh '^ *# *define +TYPE_[A-Za-z0-9_]+ +"'

Extract the strings:

    $ git-grep -Eh '^ *# *define +TYPE_[A-Za-z0-9_]+ +"' | sed 's/^[^"]*\("[^"]*"\).*/\1/'

Search the source for them:

    $ for i in `git-grep -Eh '^ *# *define +TYPE_[A-Za-z0-9_]+ +"' | sed 's/^[^"]*\("[^"]*"\).*/\1/'`; do echo "= $i ="; git-grep -F "$i"; done

Results in more than 1000 hits for me.  Names like "device" are of
course very prone to false positives.

Not sure how interested we are in consistent use of these macros...

