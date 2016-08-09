Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bXFLK-0001Rb-7R
	for mharc-qemu-trivial@gnu.org; Tue, 09 Aug 2016 18:17:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <opensource.dxs@aliyun.com>) id 1bX7wS-0003ME-Su
	for qemu-trivial@nongnu.org; Tue, 09 Aug 2016 10:23:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <opensource.dxs@aliyun.com>) id 1bX7wS-0003mk-15
	for qemu-trivial@nongnu.org; Tue, 09 Aug 2016 10:23:40 -0400
Received: from smtpcm9-311.freemail.mail.aliyun.com ([110.75.46.11]:34317)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <opensource.dxs@aliyun.com>)
	id 1bX7wN-0003iY-4H; Tue, 09 Aug 2016 10:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliyun.com; s=s1024;
	t=1470752599;
	h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type; 
	bh=DBmRq+5kuy1zsiIytHgrtkxALv3z+tZETyB+W+oENGI=;
	b=SPxk0DvVWzvw9Bf89ly7/C8pHNEPTo5LfsHisvcFQti03S5wQ/F6uTIt6o06c9ilIT+5qAvy8QIt93ynHIWCnA5IUQBzbH3NJhGT/RsaoBbl+eE2RHdkzmlNmX/gy83c9iHCCqvburyQKhv6iwvs3SzHGwAPxkoHxbcyGFEHKko=
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1222694|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r75b17221; MF=opensource.dxs@aliyun.com; NM=1; PH=DS; RN=6;
	RT=6; SR=0; TI=SMTPD_----DqJ4ydD_1470752595; 
Received: from 192.168.1.33(mailfrom:opensource.dxs@aliyun.com ip:27.38.41.38)
	by smtp.aliyun-inc.com(127.0.0.1); Tue, 09 Aug 2016 22:23:16 +0800
To: Markus Armbruster <armbru@redhat.com>
References: <1470564546-8008-1-git-send-email-opensource.dxs@aliyun.com>
	<87r39zh9zg.fsf@dusky.pond.sub.org>
Cc: mst@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, opensource.dxs@aliyun.com
From: =?UTF-8?B?U3RlZmFubyBEb25nICjokaPlhbTmsLQp?= <opensource.dxs@aliyun.com>
Message-ID: <d4fb6d2a-7126-5577-583b-998218c9ee67@aliyun.com>
Date: Wed, 10 Aug 2016 06:23:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <87r39zh9zg.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 110.75.46.11
X-Mailman-Approved-At: Tue, 09 Aug 2016 18:17:48 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ivshmem: Delete duplicate
 debug message
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
X-List-Received-Date: Tue, 09 Aug 2016 14:23:41 -0000



On 2016年08月08日 17:43, Markus Armbruster wrote:
> This could go in via qemu-trivial.
>
> Stefano Dong (董兴水) <opensource.dxs@aliyun.com> writes:
>
>> When Debug switch is open, this debug message will print again in
>> function 'process_msg'. Delete it.
>
> Suggest to say "Duplicated in commit ca0b756.  Delete it."

Ok, i'll update the log message and send the patch to qemu-trivial.
Thanks!

>
>> Signed-off-by: Stefano Dong (董兴水) <opensource.dxs@aliyun.com>
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>

