Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7KOB-00073m-JW
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 05:21:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z7KO9-00071W-1o
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 05:21:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z7KO7-0008S2-QN
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 05:21:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37310)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Z7KO3-0008QX-KK; Tue, 23 Jun 2015 05:20:59 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 9B4D1BE00A;
	Tue, 23 Jun 2015 09:20:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-62.ams2.redhat.com
	[10.36.116.62])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5N9KuFG028869
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 23 Jun 2015 05:20:57 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 128B7303E586; Tue, 23 Jun 2015 11:20:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: <arei.gonglei@huawei.com>
References: <1435021348-9156-1-git-send-email-arei.gonglei@huawei.com>
	<87oak6zxio.fsf@blackfin.pond.sub.org>
Date: Tue, 23 Jun 2015 11:20:56 +0200
In-Reply-To: <87oak6zxio.fsf@blackfin.pond.sub.org> (Markus Armbruster's
	message of "Tue, 23 Jun 2015 09:36:47 +0200")
Message-ID: <87h9py232f.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, amit.shah@redhat.com, quintela@redhat.com,
	qemu-devel@nongnu.org, mrhines@us.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] rdma: fix memory leak
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
X-List-Received-Date: Tue, 23 Jun 2015 09:21:06 -0000

Markus Armbruster <armbru@redhat.com> writes:

> <arei.gonglei@huawei.com> writes:
>
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Variable "r" going out of scope leaks the storage
>> it points to in line 3268.
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  migration/rdma.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index cf5de7e..de80860 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -3262,12 +3262,13 @@ static const QEMUFileOps rdma_write_ops = {
>>  
>>  static void *qemu_fopen_rdma(RDMAContext *rdma, const char *mode)
>>  {
>> -    QEMUFileRDMA *r = g_malloc0(sizeof(QEMUFileRDMA));
>> +    QEMUFileRDMA *r = NULL;
>
> Dead initialization, please drop.
>
>>  
>>      if (qemu_file_mode_is_not_valid(mode)) {
>>          return NULL;
>>      }
>>  
>> +    r = g_malloc0(sizeof(QEMUFileRDMA));
>>      r->rdma = rdma;
>>  
>>      if (mode[0] == 'w') {
>
> Looks good otherwise.

Since you're touching this, you could

    r = g_new0(QEMUFileRDMA, 1)

See commit 5839e53.

