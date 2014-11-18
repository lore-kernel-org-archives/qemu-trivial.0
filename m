Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqdZB-0006Rb-Cw
	for mharc-qemu-trivial@gnu.org; Tue, 18 Nov 2014 02:51:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XqdZ4-0006Hm-EL
	for qemu-trivial@nongnu.org; Tue, 18 Nov 2014 02:51:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XqdYz-0008A7-U2
	for qemu-trivial@nongnu.org; Tue, 18 Nov 2014 02:51:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47060)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XqdYq-00085s-QQ; Tue, 18 Nov 2014 02:50:52 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAI7ojeV005309
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 18 Nov 2014 02:50:46 -0500
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAI7ohic016026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 18 Nov 2014 02:50:44 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4E824303FED1; Tue, 18 Nov 2014 08:50:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
	<1416046008-7880-2-git-send-email-arei.gonglei@huawei.com>
	<546A2931.20209@msgid.tls.msk.ru>
Date: Tue, 18 Nov 2014 08:50:42 +0100
In-Reply-To: <546A2931.20209@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Mon, 17 Nov 2014 19:58:25 +0300")
Message-ID: <87y4r9vtf1.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: weidong.huang@huawei.com, zhang.zhanghailiang@huawei.com,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, arei.gonglei@huawei.com, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/9] l2tpv3: fix fd leak
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
X-List-Received-Date: Tue, 18 Nov 2014 07:51:10 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 15.11.2014 13:06, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>> 
>> In this false branch, fd will leak when it is zero.
>> Change the testing condition.
>
> Why fd==0 is a concern here?  It is a very unlikely
> situation that fd0 will be picked - firstly because
> fd0 is almost always open, and second - even if it
> isn't open, it will be picked much earlier than this
> code path, ie, some other file will use fd0 before.
>
> But even if the concern is real (after all, better
> stay correct than spread bad code pattern, even if
> in reality we don't care as this can't happen), why
> not add 0 to the equality?
>
> Why people especially compare with -1?  Any negative
> value is illegal here and in lots of other places,
> and many software packages used to return -errno in
> error cases, which is definitely != -1.  I'm not
> saying that comparing with -1 is bad in _this_
> particular case, but why not do it generally in
> all cases?
>
> More, comparing with 0 is faster and shorter than
> comparing with -1...
>
> So if it were me, I'd change it to >= 0, not to
> == -1.  Here and in all other millions of places
> in qemu code where it compares with -1... ;)

Yup.

In the case of close(), I wouldn't even bother to check, except Coverity
gets excited when it sees an invalid fd flow into close().  Rightfully
so when the invalid fd is non-negative, overeager when it's negative.

