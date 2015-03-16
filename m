Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXPTc-0000iY-7O
	for mharc-qemu-trivial@gnu.org; Mon, 16 Mar 2015 03:30:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YXPTV-0000YC-Vo
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 03:30:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YXPTP-0003ge-TO
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 03:30:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37893)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YXPTI-0003Vy-Bq; Mon, 16 Mar 2015 03:29:56 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 8FBF38EFE8;
	Mon, 16 Mar 2015 07:29:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-43.ams2.redhat.com
	[10.36.116.43])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2G7TrEh003392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 16 Mar 2015 03:29:54 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BCD8D303F19F; Mon, 16 Mar 2015 08:29:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1426326454-7216-1-git-send-email-zhaoshenglong@huawei.com>
	<55040865.8050908@weilnetz.de> <55054F1D.2080408@redhat.com>
	<55055DBA.9040804@msgid.tls.msk.ru> <55059324.8030202@redhat.com>
Date: Mon, 16 Mar 2015 08:29:52 +0100
In-Reply-To: <55059324.8030202@redhat.com> (Paolo Bonzini's message of "Sun,
	15 Mar 2015 15:11:48 +0100")
Message-ID: <87a8zd4cy7.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/bt/sdp: Fix resource
	leak detect by coverity
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
X-List-Received-Date: Mon, 16 Mar 2015 07:30:15 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 15/03/2015 11:23, Michael Tokarev wrote:
>> Or, alternatively, to keep this `data' pointer in sdp to use it in
>> bt_l2cap_sdp_close_ch().
>
> Yes.
>
>>> > In any case, it seems simpler to just leave this code aside.
>> How many times this code is called?
>> 
>> We have many many places in qemu where resources are allocated once
>> at startup and never freed just because there's no need to.
>
> Well, in this case the bug in bt_l2cap_sdp_close_ch is much worse than a
> resource leak.  But bluetooth is not the utmost priority in QEMU
> development...

To put it more bluntly: it's rotting in peace.

Occasional drive-by fixes won't stop the rot, a dedicated maintener
could.

