Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRdQi-0004wA-Sp
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 04:11:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRdQf-0004nl-N3
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:11:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRdQe-0006YM-R2
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:11:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44601)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YRdQZ-0006Vy-MH; Sat, 28 Feb 2015 04:11:15 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1C4CE43EE1;
	Sat, 28 Feb 2015 12:11:15 +0300 (MSK)
Message-ID: <54F18633.7020703@msgid.tls.msk.ru>
Date: Sat, 28 Feb 2015 12:11:15 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v2 00/11] trivial: Remove superfluous
	'\n' around error_report/error_setg
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
X-List-Received-Date: Sat, 28 Feb 2015 09:11:22 -0000

25.02.2015 07:22, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> v2 -> v1:
>  - remove superfluous "" in patch 3. (Michael Tokarev)
>  - move qemu-img.c hunk from patch 5 to patch 1. (Markus)
>  - add 'R-by' tag for this patch series.
> 
> Yestoday, I found that some files have superflous '\n' charactor
> around error_report/error_setg when reviewed patches.
> 
> By a simply script, the below files were listed. Classify and fix
> them. It's suitable for appling via qemu-trivial IMHO.
> 
> 
> Gonglei (11):
>   block: remove superfluous '\n' around error_report/error_setg
>   a9gtimer: remove superfluous '\n' around error_setg
>   pl330.c: remove superfluous '\n' around error_setg
>   numa: remove superfluous '\n' around error_setg
>   Remove superfluous '\n' around error_report()
>   vhost-scsi: Remove superfluous '\n' around error_report()
>   vfio: Remove superfluous '\n' around error_report()
>   xtensa: Remove superfluous '\n' around error_report()
>   tpm: Remove superfluous '\n' around error_report()
>   arm/digic_boards: Remove superfluous '\n' around error_report()
>   vhost: Remove superfluous '\n' around error_report()

Applied series to -trivial.  I was tempted to combine whole thing
into one big patch, after trying to come up with a good prefix for 05/11 ;)

Thanks,

/mjt

