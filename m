Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axFxC-00043B-E5
	for mharc-qemu-trivial@gnu.org; Mon, 02 May 2016 11:40:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1axFx1-0003cs-Ve
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 11:40:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1axFwq-0002O8-B2
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 11:39:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55144)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1axFtE-0001SU-Ja; Mon, 02 May 2016 11:36:04 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5D457F6A5;
	Mon,  2 May 2016 15:35:42 +0000 (UTC)
Received: from noname.redhat.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	SMTP id u42FZeFH032518; Mon, 2 May 2016 11:35:40 -0400
Date: Mon, 2 May 2016 17:35:39 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, armbru@redhat.com,
	qemu-trivial@nongnu.org, qemu-block@nongnu.org
Message-ID: <20160502153539.GF4882@noname.redhat.com>
References: <1461665563-14831-1-git-send-email-weijg.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461665563-14831-1-git-send-email-weijg.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel][PATCH] block: Fix typo in comment
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
X-List-Received-Date: Mon, 02 May 2016 15:40:06 -0000

Am 26.04.2016 um 12:12 hat Wei Jiangang geschrieben:
> s/imlement/implement/
> 
> Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>

Thanks, applied to block-next.

Kevin

