Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlC72-0005GL-Ub
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 02:31:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XlC6x-0005Ap-Kg
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 02:31:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XlC6t-0003BI-1c
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 02:31:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39951)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XlC6f-00039s-OI; Mon, 03 Nov 2014 02:31:17 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sA37VE29000630
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 3 Nov 2014 02:31:14 -0500
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sA37VCYO009963
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 3 Nov 2014 02:31:13 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id CBA0230403B1; Mon,  3 Nov 2014 08:31:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhu Guihua <zhugh.fnst@cn.fujitsu.com>
References: <1414993894-17539-1-git-send-email-zhugh.fnst@cn.fujitsu.com>
Date: Mon, 03 Nov 2014 08:31:11 +0100
In-Reply-To: <1414993894-17539-1-git-send-email-zhugh.fnst@cn.fujitsu.com>
	(Zhu Guihua's message of "Mon, 3 Nov 2014 13:51:34 +0800")
Message-ID: <87k33c3fls.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, imammedo@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] icc_bus: rename ICC_BRIGDE
	to ICC_BRIDGE
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
X-List-Received-Date: Mon, 03 Nov 2014 07:31:40 -0000

Cc: qemu-trivial

Zhu Guihua <zhugh.fnst@cn.fujitsu.com> writes:

> Rename ICC_BRIGDE for better readability.
>
> Signed-off-by: Zhu Guihua <zhugh.fnst@cn.fujitsu.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

