Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxCeb-0001h9-0O
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2015 07:04:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YxCeY-0001h3-MH
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 07:04:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YxCeU-0008HF-Co
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 07:04:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YxCeU-0008H0-5O
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 07:04:06 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4QB3LM9007242
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 26 May 2015 07:03:22 -0400
Received: from blackfin.pond.sub.org (ovpn-116-38.ams2.redhat.com
	[10.36.116.38])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4QB3KmL022368
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 26 May 2015 07:03:21 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9F54F303F809; Tue, 26 May 2015 13:03:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Chen Hanxiao <chenhanxiao@cn.fujitsu.com>
References: <1432632341-5201-1-git-send-email-chenhanxiao@cn.fujitsu.com>
Date: Tue, 26 May 2015 13:03:19 +0200
In-Reply-To: <1432632341-5201-1-git-send-email-chenhanxiao@cn.fujitsu.com>
	(Chen Hanxiao's message of "Tue, 26 May 2015 05:25:41 -0400")
Message-ID: <87lhgb8utk.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel][PATCH] docs/writing-qmp-commands:
	fix a typo
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
X-List-Received-Date: Tue, 26 May 2015 11:04:12 -0000

Chen Hanxiao <chenhanxiao@cn.fujitsu.com> writes:

> s/interation/iteration
>
> Signed-off-by: Chen Hanxiao <chenhanxiao@cn.fujitsu.com>
> ---
>  docs/writing-qmp-commands.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/writing-qmp-commands.txt b/docs/writing-qmp-commands.txt
> index f3df206..ab1fdd3 100644
> --- a/docs/writing-qmp-commands.txt
> +++ b/docs/writing-qmp-commands.txt
> @@ -598,7 +598,7 @@ stored in its "value" member. In our example, the
> "value" member is a pointer
>  to an TimerAlarmMethod instance.
>  
>  Notice that the "current" variable is used as "true" only in the first
> -interation of the loop. That's because the alarm timer method in use is the
> +iteration of the loop. That's because the alarm timer method in use is the
>  first element of the alarm_timers array. Also notice that QAPI lists
> are handled
>  by hand and we return the head of the list.

I'm afraid you need to resend

    To: qemu-devel@nongnu.org
    Cc: qemu-trivial@nongnu.org, ...

