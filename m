Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XUt1I-0003W4-Ni
	for mharc-qemu-trivial@gnu.org; Fri, 19 Sep 2014 03:54:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XUt1D-0003Ox-4w
	for qemu-trivial@nongnu.org; Fri, 19 Sep 2014 03:54:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XUt18-0005bs-9l
	for qemu-trivial@nongnu.org; Fri, 19 Sep 2014 03:54:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37082)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XUt0y-0005Ql-4U; Fri, 19 Sep 2014 03:54:00 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8J6suo0013772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 19 Sep 2014 02:54:56 -0400
Received: from blackfin.pond.sub.org (ovpn-116-39.ams2.redhat.com
	[10.36.116.39])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8J6ss9p011496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 19 Sep 2014 02:54:55 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id DE0D0303E568; Fri, 19 Sep 2014 08:54:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1411097848-3900-1-git-send-email-zhang.zhanghailiang@huawei.com>
Date: Fri, 19 Sep 2014 08:54:53 +0200
In-Reply-To: <1411097848-3900-1-git-send-email-zhang.zhanghailiang@huawei.com>
	(zhanghailiang's message of "Fri, 19 Sep 2014 11:37:28 +0800")
Message-ID: <87wq90drr6.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, luonengjun@huawei.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] vl: Fix possible freed
	memory accessing
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
X-List-Received-Date: Fri, 19 Sep 2014 07:54:20 -0000

zhanghailiang <zhang.zhanghailiang@huawei.com> writes:

> The logic of pcmcia_socket_unregister is wrong,
> which will cause a freed memory accessing
>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
> Hi,
>
> The function pcmcia_socket_unregister seemes to be unused,
> Should it be removed? Thanks.

I think we should remove the whole thing: pcmcia_sockets,
pcmcia_socket_register(), pcmcia_socket_unregister, pcmcia_info().
Here's why.

It serves just one purpose: "info pcmcia".  HMP-only, therefore not a
stable interface.  But is it a useful one?

The only caller of pcmcia_socket_register() is pxa2xx_pcmcia_realize(),
of device model "pxa2xx-pcmcia".  As far as I can tell, used only by a
couple of ARM boards: "verdex", "mainstone", "akita", "spitz", "borzoi",
"terrier", "z2", "connex", "tosa".

Of these, only "akita", "spitz", "borzoi", "terrier" and "tosa" insert a
card into the slot, and they do so right on board initialization.
Nothing ever ejects a card from a slot.  Therefore, "info pcmcia"
effectively prints a fixed, machine-specific string so far.  Doesn't
sound useful to me.

If we acquire PCMCIA devices where querying status is interesting, we'll
want a QMP command, so this code will be pretty much useless.

Peter M., what do you think?

