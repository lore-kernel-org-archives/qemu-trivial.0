Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VO67F-0006Xg-S9
	for mharc-qemu-trivial@gnu.org; Mon, 23 Sep 2013 09:23:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiawenc@linux.vnet.ibm.com>) id 1VNsp0-0005QQ-Dk
	for qemu-trivial@nongnu.org; Sun, 22 Sep 2013 19:12:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiawenc@linux.vnet.ibm.com>) id 1VNsol-0002jm-8J
	for qemu-trivial@nongnu.org; Sun, 22 Sep 2013 19:12:10 -0400
Received: from e28smtp02.in.ibm.com ([122.248.162.2]:43806)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiawenc@linux.vnet.ibm.com>) id 1VNsok-0002bQ-JU
	for qemu-trivial@nongnu.org; Sun, 22 Sep 2013 19:11:55 -0400
Received: from /spool/local
	by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <xiawenc@linux.vnet.ibm.com>;
	Mon, 23 Sep 2013 04:41:49 +0530
Received: from d28dlp01.in.ibm.com (9.184.220.126)
	by e28smtp02.in.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 23 Sep 2013 04:41:48 +0530
Received: from d28relay01.in.ibm.com (d28relay01.in.ibm.com [9.184.220.58])
	by d28dlp01.in.ibm.com (Postfix) with ESMTP id B0305E0056;
	Mon, 23 Sep 2013 04:42:49 +0530 (IST)
Received: from d28av02.in.ibm.com (d28av02.in.ibm.com [9.184.220.64])
	by d28relay01.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r8MNDxtu30539812; Mon, 23 Sep 2013 04:44:00 +0530
Received: from d28av02.in.ibm.com (localhost [127.0.0.1])
	by d28av02.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	r8MNBksj028333; Mon, 23 Sep 2013 04:41:46 +0530
Received: from [192.168.1.127] ([9.181.129.59])
	by d28av02.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	r8MNBjVG028258; Mon, 23 Sep 2013 04:41:45 +0530
Message-ID: <523F7931.3030404@linux.vnet.ibm.com>
Date: Mon, 23 Sep 2013 07:11:45 +0800
From: Wenchao Xia <xiawenc@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.12) Gecko/20130108 Thunderbird/10.0.12
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>
References: <1379854159-27734-1-git-send-email-famz@redhat.com>
In-Reply-To: <1379854159-27734-1-git-send-email-famz@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13092223-5816-0000-0000-00000A06697A
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 122.248.162.2
X-Mailman-Approved-At: Mon, 23 Sep 2013 09:23:51 -0400
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] .gitignore: ignore
	tests/qemu-iotests/socket_scm_helper
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
X-List-Received-Date: Sun, 22 Sep 2013 23:12:19 -0000

Reviewed-by: Wenchao Xia<xiawenc@linux.vnet.ibm.com>

> Signed-off-by: Fam Zheng<famz@redhat.com>
> ---
>   tests/qemu-iotests/.gitignore | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/qemu-iotests/.gitignore b/tests/qemu-iotests/.gitignore
> index 62b4002..0541f80 100644
> --- a/tests/qemu-iotests/.gitignore
> +++ b/tests/qemu-iotests/.gitignore
> @@ -2,6 +2,7 @@ check.log
>   check.time
>   *.out.bad
>   *.notrun
> +socket_scm_helper
>
>   # ignore everything in the scratch directory
>   scratch/


