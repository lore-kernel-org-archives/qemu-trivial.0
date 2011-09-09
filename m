Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R1wDb-00036b-Av
	for mharc-qemu-trivial@gnu.org; Fri, 09 Sep 2011 04:13:47 -0400
Received: from eggs.gnu.org ([140.186.70.92]:34789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1R1wDY-0002xB-Pe
	for qemu-trivial@nongnu.org; Fri, 09 Sep 2011 04:13:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1R1wDW-0002hZ-Tu
	for qemu-trivial@nongnu.org; Fri, 09 Sep 2011 04:13:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:5427)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1R1wDU-0002h6-HD; Fri, 09 Sep 2011 04:13:40 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p898DSnB021049
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 9 Sep 2011 04:13:28 -0400
Received: from dhcp-5-188.str.redhat.com (vpn1-4-167.ams2.redhat.com
	[10.36.4.167])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p898DPUU031628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Fri, 9 Sep 2011 04:13:27 -0400
Message-ID: <4E69CB58.5020005@redhat.com>
Date: Fri, 09 Sep 2011 10:16:24 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110816 Thunderbird/6.0
MIME-Version: 1.0
To: Stefan Weil <weil@mail.berlios.de>
References: <1315497332-7258-1-git-send-email-weil@mail.berlios.de>
In-Reply-To: <1315497332-7258-1-git-send-email-weil@mail.berlios.de>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Fix include statements for qemu-common.h
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
X-List-Received-Date: Fri, 09 Sep 2011 08:13:45 -0000

Am 08.09.2011 17:55, schrieb Stefan Weil:
> * qemu-common.h is not a system include file, so it should be included
>   with "" instead of <>. Otherwise incremental builds might fail
>   because only local include files are checked for changes.
> 
> * linux-user/syscall.c included the file twice.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Riku Voipio <riku.voipio@iki.fi>
> Cc: Jan Kiszka <jan.kiszka@siemens.com>
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>

Acked-by: Kevin Wolf <kwolf@redhat.com>

