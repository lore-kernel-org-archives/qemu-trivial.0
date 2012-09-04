Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8tqs-0001tI-Sm
	for mharc-qemu-trivial@gnu.org; Tue, 04 Sep 2012 10:11:38 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1T8tql-0001rQ-To
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2012 10:11:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1T8tqf-0005S5-MT
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2012 10:11:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1740)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1T8tqf-0005Ru-Dm; Tue, 04 Sep 2012 10:11:25 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q84EBOi9013304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 4 Sep 2012 10:11:24 -0400
Received: from dhcp-5-188.str.redhat.com (dhcp-5-175.str.redhat.com
	[10.32.5.175])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q84EBLaO017504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Tue, 4 Sep 2012 10:11:23 -0400
Message-ID: <50460C09.8010504@redhat.com>
Date: Tue, 04 Sep 2012 16:11:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1346490405-18889-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1346490405-18889-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/curl: Fix wrong free
	statement
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
X-List-Received-Date: Tue, 04 Sep 2012 14:11:37 -0000

Am 01.09.2012 11:06, schrieb Stefan Weil:
> Report from smatch:
> block/curl.c:546 curl_close(21) info: redundant null check on s->url calling free()
> 
> The check was redundant, and free was also wrong because the memory
> was allocated using g_strdup.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Thanks, applied to block-next.

Kevin

