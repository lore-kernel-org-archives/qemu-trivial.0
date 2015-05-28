Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxw2t-0006g4-KF
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 07:32:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yxw2q-0006bp-J7
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:32:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yxw2p-0007AV-O2
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:32:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42898)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yxw2l-00077w-Dl; Thu, 28 May 2015 07:32:11 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7D7E6426CE;
	Thu, 28 May 2015 14:32:10 +0300 (MSK)
Message-ID: <5566FCBA.2000500@msgid.tls.msk.ru>
Date: Thu, 28 May 2015 14:32:10 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Chen Hanxiao <chenhanxiao@cn.fujitsu.com>, 
	Markus Armbruster <armbru@redhat.com>
References: <1432632341-5201-1-git-send-email-chenhanxiao@cn.fujitsu.com>
In-Reply-To: <1432632341-5201-1-git-send-email-chenhanxiao@cn.fujitsu.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] docs/writing-qmp-commands: fix a typo
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
X-List-Received-Date: Thu, 28 May 2015 11:32:17 -0000

26.05.2015 12:25, Chen Hanxiao wrote:
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
> @@ -598,7 +598,7 @@ stored in its "value" member. In our example, the "value" member is a pointer
>  to an TimerAlarmMethod instance.
>  
>  Notice that the "current" variable is used as "true" only in the first
> -interation of the loop. That's because the alarm timer method in use is the
> +iteration of the loop. That's because the alarm timer method in use is the
>  first element of the alarm_timers array. Also notice that QAPI lists are handled
>  by hand and we return the head of the list.

Applied to -trivial, thank you!

Marcus: I don't think such obvious and trivial changes needs to be re-sent
to -devel. Ofcourse it is better to send things to -devel rigth away, but
requiring to resent is a bit over the top.  I think anyway :)

/mjt

