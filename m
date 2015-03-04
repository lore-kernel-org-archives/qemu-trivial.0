Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTCVD-0007SU-4i
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 11:50:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YTCVA-0007Pl-U4
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 11:50:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YTCV6-0007uL-47
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 11:50:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52304)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YTCUv-0007sX-Jj; Wed, 04 Mar 2015 11:50:13 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t24Go82s023374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Mar 2015 11:50:08 -0500
Received: from blackfin.pond.sub.org (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t24Go7N8023535
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 4 Mar 2015 11:50:08 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D5BF5305E2A3; Wed,  4 Mar 2015 17:50:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1425464754-8364-1-git-send-email-zhang.zhanghailiang@huawei.com>
Date: Wed, 04 Mar 2015 17:50:06 +0100
In-Reply-To: <1425464754-8364-1-git-send-email-zhang.zhanghailiang@huawei.com>
	(zhanghailiang's message of "Wed, 4 Mar 2015 18:25:54 +0800")
Message-ID: <87bnk8u2pt.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com, qemu-devel@nongnu.org
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
X-List-Received-Date: Wed, 04 Mar 2015 16:50:29 -0000

zhanghailiang <zhang.zhanghailiang@huawei.com> writes:

> This is a continuation of the work started in commit 565f65d27:
> "error: Use error_report_err() where appropriate"
>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

