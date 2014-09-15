Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XTWPt-0008BC-Q6
	for mharc-qemu-trivial@gnu.org; Mon, 15 Sep 2014 09:34:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XTWPn-000847-D7
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 09:34:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XTWPj-0002w9-0D
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 09:33:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:4043)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XTWPZ-0002v4-9G; Mon, 15 Sep 2014 09:33:45 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8FDXNG4006954
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 15 Sep 2014 09:33:24 -0400
Received: from blackfin.pond.sub.org (ovpn-116-56.ams2.redhat.com
	[10.36.116.56])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8FDXMmH032748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 15 Sep 2014 09:33:23 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9EB9730411BD; Mon, 15 Sep 2014 15:33:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1410261588-8360-1-git-send-email-john.liuli@huawei.com>
	<5416E094.9070500@msgid.tls.msk.ru>
	<5416E22B.9060002@msgid.tls.msk.ru>
Date: Mon, 15 Sep 2014 15:33:21 +0200
In-Reply-To: <5416E22B.9060002@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Mon, 15 Sep 2014 16:57:15 +0400")
Message-ID: <8738btdn4u.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "john.liuli" <john.liuli@huawei.com>,
	peter.huangpeng@huawei.com, kraxel@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qemu-char: fix terminal
	crash when using "-monitor stdio -nographic"
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
X-List-Received-Date: Mon, 15 Sep 2014 13:34:04 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 15.09.2014 16:50, Michael Tokarev =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 09.09.2014 15:19, john.liuli wrote:
>>> From: Li Liu <john.liuli@huawei.com>
>>>
>>> Eeay to reproduce, just try "qemu -monitor stdio -nographic"
>>> and type "quit", then the terminal will be crashed.
>>>
>>> There are two pathes try to call tcgetattr of stdio in vl.c:
>>=20
>> This looks reasonable.  Except of one thing -- how about renaming
>> stdio_is_ready to stdio_in_use?  (I can do that when applying, no
>> need to resend anythnig).  Because, well, stdio_is_ready is not
>> obvious at all, at least to me... :)
>
> And oh, the commit comment -- it is not 'terminal crash', it is
> 'terminal misbehavor' or something like that.  Terminal does not
> crash, it just does not have proper settings after qemu exits.

Maybe

    qemu-char: Permit only a single "stdio" character device

    When more than one is used, the terminal settings aren't restored
    correctly on exit.  Fixable.  However, such usage makes no sense,
    because the users race for input, so outlaw it instead.

    If you want to connect multiple things to stdio, use the mux
    chardev.

With the rename proposed by Michael:

Reviewed-by: Markus Armbruster <armbru@redhat.com>

