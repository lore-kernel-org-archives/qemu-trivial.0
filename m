Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d85ty-00087P-Ca
	for mharc-qemu-trivial@gnu.org; Tue, 09 May 2017 10:14:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1d85tw-00085X-8k
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 10:14:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1d85tv-0002dJ-GU
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 10:14:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58538)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1d85tr-0002Vw-09; Tue, 09 May 2017 10:14:03 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3F9C57027;
	Tue,  9 May 2017 14:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com F3F9C57027
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=jsnow@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com F3F9C57027
Received: from scv.usersys.redhat.com (dhcp-17-221.bos.redhat.com
	[10.18.17.221])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53FBA87FBD;
	Tue,  9 May 2017 14:14:00 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <1494322876-28843-1-git-send-email-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <ea74cfd3-9009-e99d-8f18-8edc9c0441c2@redhat.com>
Date: Tue, 9 May 2017 10:14:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1494322876-28843-1-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 09 May 2017 14:14:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] docs: Minor updates
 around ide-drive
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
X-List-Received-Date: Tue, 09 May 2017 14:14:09 -0000



On 05/09/2017 05:41 AM, Markus Armbruster wrote:
> Markus Armbruster (2):
>   docs qemu-doc: Avoid ide-drive, it's deprecated
>   docs/qdev-device-use.txt: update section Default Devices
> 
>  docs/bootindex.txt       |  2 +-
>  docs/qdev-device-use.txt | 13 +++++++------
>  qemu-options.hx          |  2 +-
>  3 files changed, 9 insertions(+), 8 deletions(-)
> 

Shame on me for not noticing, but thank you.

Acked-by: John Snow <jsnow@redhat.com>

