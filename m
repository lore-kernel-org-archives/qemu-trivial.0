Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YSNA6-0002yW-OY
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2015 05:01:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YSNA2-0002tu-VN
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 05:01:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YSNA2-0005E2-3B
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 05:01:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YSN9v-0005BA-5n; Mon, 02 Mar 2015 05:01:07 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t22A132C021838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 2 Mar 2015 05:01:03 -0500
Received: from blackfin.pond.sub.org (ovpn-116-68.ams2.redhat.com
	[10.36.116.68])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t22A11vI005051
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 2 Mar 2015 05:01:02 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E6EB23042B60; Mon,  2 Mar 2015 11:01:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1425114327-12136-1-git-send-email-zhang.zhanghailiang@huawei.com>
Date: Mon, 02 Mar 2015 11:01:00 +0100
In-Reply-To: <1425114327-12136-1-git-send-email-zhang.zhanghailiang@huawei.com>
	(zhanghailiang's message of "Sat, 28 Feb 2015 17:05:22 +0800")
Message-ID: <87pp8rhg6b.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RFC 0/5] Another patchset
	try to clean up around qerror_report_err()
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
X-List-Received-Date: Mon, 02 Mar 2015 10:01:16 -0000

zhanghailiang <zhang.zhanghailiang@huawei.com> writes:

> Hi,
>
> I have noticed Markus's previous patchset 
> "Clean up around error_get_pretty(), qerror_report_err()".
>
> This is another patch series trying to do the same thing.
> I'm not sure if he has missed this places or these modifies are false.
>
> So, please review... 
>
> Thanks.

Help with qerror elimination is of course appreciated!  However, there's
overlap with related patches in flight.  Easy to miss, because there are
so many of them.  I'll elaborate in replies to your patches.

