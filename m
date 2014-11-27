Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XtyWK-0000eY-Pm
	for mharc-qemu-trivial@gnu.org; Thu, 27 Nov 2014 07:50:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XtyWE-0000Xo-EM
	for qemu-trivial@nongnu.org; Thu, 27 Nov 2014 07:50:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XtyW9-0004X9-Ky
	for qemu-trivial@nongnu.org; Thu, 27 Nov 2014 07:49:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42184)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XtyVz-0004VA-FP; Thu, 27 Nov 2014 07:49:43 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sARCnaTT024735
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 27 Nov 2014 07:49:36 -0500
Received: from blackfin.pond.sub.org (ovpn-116-65.ams2.redhat.com
	[10.36.116.65])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sARCnYrb009543
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 27 Nov 2014 07:49:35 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 31414303FEB1; Thu, 27 Nov 2014 13:49:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: <arei.gonglei@huawei.com>
References: <1415881027-8112-1-git-send-email-arei.gonglei@huawei.com>
	<1415881027-8112-2-git-send-email-arei.gonglei@huawei.com>
Date: Thu, 27 Nov 2014 13:49:34 +0100
In-Reply-To: <1415881027-8112-2-git-send-email-arei.gonglei@huawei.com> (arei
	gonglei's message of "Thu, 13 Nov 2014 20:17:06 +0800")
Message-ID: <87d288kdup.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	aneesh.kumar@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] virtfs-proxy-helper:
	Fix possible socket leak.
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
X-List-Received-Date: Thu, 27 Nov 2014 12:50:03 -0000

<arei.gonglei@huawei.com> writes:

> From: Gonglei <arei.gonglei@huawei.com>
>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

