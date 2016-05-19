Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b3NFj-0007NA-QF
	for mharc-qemu-trivial@gnu.org; Thu, 19 May 2016 08:40:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1b3NFc-0007H1-OQ
	for qemu-trivial@nongnu.org; Thu, 19 May 2016 08:40:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1b3NFa-0008GU-SO
	for qemu-trivial@nongnu.org; Thu, 19 May 2016 08:40:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37164)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1b3NFU-0008Fe-He; Thu, 19 May 2016 08:40:20 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0791D6F670;
	Thu, 19 May 2016 12:40:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4JCeIis016188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 19 May 2016 08:40:19 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id AECDF11386CA; Thu, 19 May 2016 14:40:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Corey Minyard <cminyard@mvista.com>
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, kraxel@redhat.com, mst@redhat.com
References: <1463569176-32122-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<573C7DFF.1090504@mvista.com>
Date: Thu, 19 May 2016 14:40:17 +0200
In-Reply-To: <573C7DFF.1090504@mvista.com> (Corey Minyard's message of "Wed,
	18 May 2016 09:36:47 -0500")
Message-ID: <87wpmqi5la.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 19 May 2016 12:40:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fw_cfg: follow CODING_STYLE
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2016 12:40:34 -0000

Corey Minyard <cminyard@mvista.com> writes:

> On 05/18/2016 05:59 AM, Cao jin wrote:
>> Replace tab with 4 spaces; brace the indented statement.
>
> Thanks, I think I have my editor set up to avoid the tab/space issue from
> now on.  I'm going to have to handle kernel/qemu switching in my brain
> for the brace issue.

You can outsource some of it to scripts/checkpatch.pl :)

