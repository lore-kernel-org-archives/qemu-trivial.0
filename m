Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZn7F-0004wV-Ni
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2020 22:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kZn7E-0004wH-62; Mon, 02 Nov 2020 22:36:12 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kZn79-00059B-A6; Mon, 02 Nov 2020 22:36:11 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQFmj6Gx8zLqgl;
 Tue,  3 Nov 2020 11:35:49 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Tue, 3 Nov 2020 11:35:51 +0800
Message-ID: <5FA0D017.4010305@huawei.com>
Date: Tue, 3 Nov 2020 11:35:51 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 <mdroth@linux.vnet.ibm.com>
CC: <qemu-trivial@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 0/4] qga: Fix some style problems
References: <5F96915D.2040102@huawei.com>
In-Reply-To: <5F96915D.2040102@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 20:52:53
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Nov 2020 03:36:12 -0000

Kindly ping.

On 2020/10/26 17:05, AlexChen wrote:
> Fix some error style problems found by checkpatch.pl.
> 
> alexchen (4):
>   qga: Add spaces around operator
>   qga: Delete redundant spaces
>   qga: Open brace '{' following struct go on the same
>   qga: switch and case should be at the same indent
> 
>  qga/channel-win32.c  |  6 ++---
>  qga/commands-posix.c |  4 +--
>  qga/commands-win32.c | 28 ++++++++++-----------
>  qga/commands.c       |  4 +--
>  qga/main.c           | 59 ++++++++++++++++++++++----------------------
>  5 files changed, 50 insertions(+), 51 deletions(-)
> 


