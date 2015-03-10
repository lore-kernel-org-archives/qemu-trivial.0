Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVDIx-0006dS-M1
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 02:06:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YVDIv-0006dI-NG
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:06:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YVDIr-0007zP-Kd
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:06:09 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:29553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1YVDIq-0007wJ-FE; Tue, 10 Mar 2015 02:06:05 -0400
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKP25893; Tue, 10 Mar 2015 14:05:51 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 10 Mar 2015 14:04:39 +0800
Message-ID: <54FE8972.6090200@huawei.com>
Date: Tue, 10 Mar 2015 14:04:34 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: <mjt@tls.msk.ru>
References: <1425464754-8364-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<87bnk8u2pt.fsf@blackfin.pond.sub.org>
In-Reply-To: <87bnk8u2pt.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	hangaohuai@huawei.com, peter.huangpeng@huawei.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] error: Replace
 error_report() & error_free() with error_report_err()
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
X-List-Received-Date: Tue, 10 Mar 2015 06:06:10 -0000

Hi Michael,

This patch has been reviewed, Please consider for merging.

Thanks,
zhanghailiang

On 2015/3/5 0:50, Markus Armbruster wrote:
> zhanghailiang <zhang.zhanghailiang@huawei.com> writes:
>
>> This is a continuation of the work started in commit 565f65d27:
>> "error: Use error_report_err() where appropriate"
>>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
>



