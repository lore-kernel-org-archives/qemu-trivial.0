Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlInZ-0002GP-Ae
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 09:40:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XlInS-00026B-JS
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 09:39:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XlInN-0001e6-Ti
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 09:39:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47099)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XlInE-0001dF-Qg; Mon, 03 Nov 2014 09:39:41 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sA3EdXhF019793
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 3 Nov 2014 09:39:33 -0500
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sA3EdVWx000662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 3 Nov 2014 09:39:32 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B61BA3041186; Mon,  3 Nov 2014 15:39:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1413535838-11000-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<5440DB35.9020507@huawei.com> <54484C88.3070305@huawei.com>
	<544E12FB.6070904@huawei.com> <20141027084659.13cbdf8a@redhat.com>
	<5451F52A.7050305@huawei.com> <5455D735.2030202@msgid.tls.msk.ru>
	<8761ew3egf.fsf@blackfin.pond.sub.org>
	<54573796.1010909@msgid.tls.msk.ru>
Date: Mon, 03 Nov 2014 15:39:30 +0100
In-Reply-To: <54573796.1010909@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Mon, 03 Nov 2014 11:06:46 +0300")
Message-ID: <87oasouz4t.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, peter.huangpeng@huawei.com,
	qemu-devel@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	imammedo@redhat.com, pbonzini@redhat.com,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v6] numa: make 'info numa'
	take into account hotplugged memory
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
X-List-Received-Date: Mon, 03 Nov 2014 14:39:59 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 03.11.2014 10:56, Markus Armbruster wrote:
>> Michael Tokarev <mjt@tls.msk.ru> writes:
> []
>>> I'm not sure this qualifies as -trivial really.  Yes the change
>>> does not affect anything but the `info' command, and is rather
>>> simple, but... I'm not sure.
>> 
>> Fortunately, monitor.c got a maintainer.  Luiz, would you be willing to
>> shepherd this patch?
>
> He already replied to that, that's why the whole thing has been Cc'd
> to -trivial:
>
> """I can, but I don't have bandwidth for another pull request for v2.2 unless
> it's a fix for a blocker. This means you have two options, wait for v2.3
> or find another tree to merge this."""
>
> (http://patchwork.ozlabs.org/patch/400457/)

Right, I had already forgotten.

It's a bug fix for "info numa".  Whether the fix is important enough to
justify another pull for 2.2 is for Luiz to decide.  Whether it's
trivial enough for you to take it via -trivial is for you to decide.  If
you both say no, it goes into 2.3 via Luiz.  Not exactly terrible.

