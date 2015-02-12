Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLiJO-0000C1-H2
	for mharc-qemu-trivial@gnu.org; Wed, 11 Feb 2015 20:11:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLiJM-0000Ap-FL
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 20:11:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLiJG-0001ZF-NM
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 20:11:20 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:37643)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YLiJG-0001Z0-4b; Wed, 11 Feb 2015 20:11:14 -0500
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BBV12695; Thu, 12 Feb 2015 09:11:06 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 12 Feb 2015 09:10:57 +0800
Message-ID: <54DBFD9E.8060808@huawei.com>
Date: Thu, 12 Feb 2015 09:10:54 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1423627934-11676-1-git-send-email-arei.gonglei@huawei.com>
	<87vbj87ehb.fsf@blackfin.pond.sub.org>
In-Reply-To: <87vbj87ehb.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.54DBFDAB.009D, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: a708147b4e34f8aa3f86b3f35295f0c2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/11] trivial: Remove
 superfluous '\n' around error_report/error_setg
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
X-List-Received-Date: Thu, 12 Feb 2015 01:11:21 -0000

On 2015/2/11 21:41, Markus Armbruster wrote:
> <arei.gonglei@huawei.com> writes:
> 
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Yesterday, I found that some files have superfluous '\n' character
>> around error_report/error_setg when reviewed patches.
>>
>> By a simply script, the below files were listed. Classify and fix
>> them. It's suitable for applying via qemu-trivial IMHO.
> 
> You can find my script in commit 312fd5f :)
> 
It's cool, I haven't noticed it before.  :)
>> Gonglei (11):
>>   block: remove superfluous '\n' around error_report/error_setg
>>   a9gtimer: remove superfluous '\n' around error_setg
>>   pl330.c: remove superfluous '\n' around error_setg
>>   numa: remove superfluous '\n' around error_setg
>>   Remove superfluous '\n' around error_report()
>>   vhost-scsi: Remove superfluous '\n' around error_report()
>>   vfio: Remove superfluous '\n' around error_report()
>>   xtensa: Remove superfluous '\n' around error_report()
>>   tpm: Remove superfluous '\n' around error_report()
>>   arm/digic_boards: Remove superfluous '\n' around error_report()
>>   vhost: Remove superfluous '\n' around error_report()
> 
> When I fixed this before, I didn't split it up (commits 312fd5f 6daf194
> be62a2eb).  Splitting it up is fine, of course.  Having the catch-all as
> PATCH 05/11 is a bit odd, though.  Its qemu-img.c hunk could go into
> PATCH 01, because qemu-img is part of the block subsystem.  Not worth a
> respin as far as I'm concerned.
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
Thanks.

Regards,
-Gonglei


