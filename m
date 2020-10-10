Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRCgu-0004du-RT
	for mharc-qemu-trivial@gnu.org; Sat, 10 Oct 2020 07:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1kRCgs-0004dd-Rc; Sat, 10 Oct 2020 07:05:30 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:40536 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1kRCgq-0002tX-Lv; Sat, 10 Oct 2020 07:05:30 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EA0AC7A47D82B351C46D;
 Sat, 10 Oct 2020 19:05:19 +0800 (CST)
Received: from [10.174.178.98] (10.174.178.98) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Sat, 10 Oct 2020 19:05:09 +0800
Subject: Re: [PATCH v2 00/10] fix some error memleaks
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
CC: <zhang.zhanghailiang@huawei.com>, <kuhn.chenqun@huawei.com>,
 <euler.robot@huawei.com>, <qemu-trivial@nongnu.org>, Laurent Vivier
 <laurent@vivier.eu>
References: <20200831134315.1221-1-pannengyuan@huawei.com>
 <69c7b62c-7be6-be1f-0ad4-521720468570@huawei.com>
 <d741fd8c-0414-1087-f8f3-f08ac5b43b4f@huawei.com>
Message-ID: <40300430-c6c3-c531-34aa-55b754e8d145@huawei.com>
Date: Sat, 10 Oct 2020 19:05:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <d741fd8c-0414-1087-f8f3-f08ac5b43b4f@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.98]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=pannengyuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/10 06:54:40
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.208,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 10 Oct 2020 11:05:31 -0000

ping!

Hello,

Some patches have been reviewed a few weeks ago but missed to queue.

The rest patches are the following:
https://patchwork.kernel.org/patch/11745621/
https://patchwork.kernel.org/patch/11745633/
https://patchwork.kernel.org/patch/11745629/
https://patchwork.kernel.org/patch/11745625/
https://patchwork.kernel.org/patch/11745627/
https://patchwork.kernel.org/patch/11745635/

On 2020/9/21 10:12, Pan Nengyuan wrote:
> ping!
> 
> and cc: qemu-trivial@nongnu.org
> 
> On 2020/9/17 20:49, Pan Nengyuan wrote:
>> ping!
>>
>> Anyone queued the rest(patch 01/02/03/07/08/09)?
>>
>> On 2020/8/31 21:43, Pan Nengyuan wrote:
>>> This series fix some Error/GError memleaks.
>>>
>>> V2: 
>>>   1. remove two patches.(One has aleardy applied. The other has fixed.)
>>>   2. change patch 5/10 and 7/10.
>>>
>>> Pan Nengyuan (10):
>>>   qga/channel-posix: Plug memory leak in ga_channel_write_all()
>>>   elf2dmp/qemu_elf: Plug memleak in QEMU_Elf_init
>>>   elf2dmp/pdb: Plug memleak in pdb_init_from_file
>>>   target/i386/sev: Plug memleak in sev_read_file_base64
>>>   ui/gtk-gl-area: Plug memleak in gd_gl_area_create_context()
>>>   target/i386/cpu: Fix memleak in x86_cpu_class_check_missing_features
>>>   migration/colo: Plug memleaks in colo_process_incoming_thread
>>>   blockdev: Fix a memleak in drive_backup_prepare()
>>>   block/file-posix: fix a possible undefined behavior
>>>   vnc-auth-sasl: Plug memleak in vnc_socket_ip_addr_string
>>>
>>>  block/file-posix.c         |  2 +-
>>>  blockdev.c                 |  1 +
>>>  contrib/elf2dmp/pdb.c      |  1 +
>>>  contrib/elf2dmp/qemu_elf.c |  1 +
>>>  migration/colo.c           |  5 ++++-
>>>  qga/channel-posix.c        |  6 +++++-
>>>  target/i386/cpu.c          |  1 +
>>>  target/i386/sev.c          |  1 +
>>>  ui/gtk-gl-area.c           | 11 +++++++++++
>>>  ui/vnc-auth-sasl.c         |  1 +
>>>  10 files changed, 27 insertions(+), 3 deletions(-)
>>>

