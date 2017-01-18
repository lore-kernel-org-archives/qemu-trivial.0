Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTmut-0006W9-QQ
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jan 2017 04:52:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1cTmur-0006Ta-CQ
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 04:52:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1cTmuq-000310-O5
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 04:52:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54032)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1cTmuk-0002wx-Hg; Wed, 18 Jan 2017 04:52:22 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94D4085545;
	Wed, 18 Jan 2017 09:52:22 +0000 (UTC)
Received: from localhost (ovpn-8-17.pek2.redhat.com [10.72.8.17])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0I9qKOU002766; Wed, 18 Jan 2017 04:52:21 -0500
Date: Wed, 18 Jan 2017 17:52:18 +0800
From: Fam Zheng <famz@redhat.com>
To: Ziyue Yang <skiver.cloud.yzy@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Ziyue Yang <yzylivezh@hotmail.com>
Message-ID: <20170118095218.GE6199@lemon>
References: <1484726609-16537-1-git-send-email-skiver.cloud.yzy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484726609-16537-1-git-send-email-skiver.cloud.yzy@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 18 Jan 2017 09:52:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v5 2/2] gdbstub.c: update old error
 report statements
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
X-List-Received-Date: Wed, 18 Jan 2017 09:52:30 -0000

On Wed, 01/18 16:03, Ziyue Yang wrote:
> From: Ziyue Yang <yzylivezh@hotmail.com>
> 
> Some updates from fprintf(stderr, ...) to error_report.

In the future, please use "git format-patch --cover-letter" and "git send-email
--thread" to make sure the patches form a thread. See also:

http://wiki.qemu.org/Contribute/SubmitAPatch

Fam

