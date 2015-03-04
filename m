Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YT3Vx-0003zv-RY
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 02:14:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YT3Vw-0003xv-1n
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 02:14:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YT3Vv-00018G-9B
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 02:14:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51508)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YT3Vq-00017Q-TC; Wed, 04 Mar 2015 02:14:35 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t247ETYR011570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Mar 2015 02:14:29 -0500
Received: from blackfin.pond.sub.org (ovpn-116-37.ams2.redhat.com
	[10.36.116.37])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t247ESFO028576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 4 Mar 2015 02:14:29 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 79AA3304300F; Wed,  4 Mar 2015 08:14:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <1425376508-12632-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<54F5ECE2.80603@redhat.com>
Date: Wed, 04 Mar 2015 08:14:27 +0100
In-Reply-To: <54F5ECE2.80603@redhat.com> (Eric Blake's message of "Tue, 03 Mar
	2015 10:18:26 -0700")
Message-ID: <874mq144ks.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] error: Replace
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
X-List-Received-Date: Wed, 04 Mar 2015 07:14:41 -0000

Eric Blake <eblake@redhat.com> writes:

> On 03/03/2015 02:55 AM, zhanghailiang wrote:
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> ---
>
> Might have been nice to mention this was a continuation of the work
> started in commit 565f65d27.

Yes.  Perhaps the -trivial maintainer can stick in a reference on
commit.

>>  hw/arm/virt.c | 2 +-
>>  savevm.c      | 3 +--
>>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

