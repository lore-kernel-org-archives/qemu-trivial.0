Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzOUk-0001fn-MF
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 07:02:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1WzOUa-0001PW-Pw
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 07:02:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1WzOUS-0003jR-DO
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 07:02:24 -0400
Received: from oxygen.pond.sub.org ([144.76.244.19]:38753)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1WzOUA-0003c6-GF; Tue, 24 Jun 2014 07:01:58 -0400
Received: from blackfin.pond.sub.org (p5B3293E2.dip0.t-ipconnect.de
	[91.50.147.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by oxygen.pond.sub.org (Postfix) with ESMTPSA id 7C37820EAC;
	Tue, 24 Jun 2014 13:01:53 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id CECCE30403AF; Tue, 24 Jun 2014 13:01:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <53A84797.9040304@gmail.com>
	<20140624104614.GD3458@noname.redhat.com>
Date: Tue, 24 Jun 2014 13:01:52 +0200
In-Reply-To: <20140624104614.GD3458@noname.redhat.com> (Kevin Wolf's message
	of "Tue, 24 Jun 2014 12:46:14 +0200")
Message-ID: <87d2dywoyn.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 144.76.244.19
Cc: famz@redhat.com, Chen Gang <gang.chen.5i5j@gmail.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial v2] block.c: Add
	return value for bdrv_append_temp_snapshot() to avoid
	incorrect failure processing issue
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
X-List-Received-Date: Tue, 24 Jun 2014 11:02:33 -0000

Kevin Wolf <kwolf@redhat.com> writes:

> Am 23.06.2014 um 17:28 hat Chen Gang geschrieben:
>> When failure occurs, 'ret' need be set, or may return 0 to indicate success.
>> And error_propagate() also need be called only one time within a function.
>> 
>> It is abnormal to prevent bdrv_append_temp_snapshot() return value but still
>> set errp when error occurs -- although it contents return value internally.
>> 
>> So let bdrv_append_temp_snapshot() internal return value outside, and let
>> all things normal, then fix the issue too.
>> 
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>
> What does this fix?

It fixes the return value of bdrv_open() when
bdrv_append_temp_snapshot() fails.  Before this patch, it returns a
positive value, which is wrong.  After the patch, it returns the
negative error code bdrv_append_temp_snapshot() now returns.

> Having both a return value and an Error* object is duplication and
> only a sign that a function hasn't been fully converted to the Error
> framework yet. We shouldn't introduce new instances of this without a
> very good reason.

Maybe.  But I very much prefer

        ret = foo(arg, errp);
        if (ret < 0) {
            return ret;
        }

over

        Error *local_err = NULL;

        foo(arg, &local_err);
        if (local_err) {
            error_propagate(errp, local_err);
            return;
        }

